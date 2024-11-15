import time
import argparse
from helpers.connection import conn
from helpers.utils import print_rows
from helpers.utils import print_rows_to_file
from helpers.utils import is_valid_genre
from helpers.utils import print_command_to_file
from helpers.utils import make_csv

def display_info(search_type, search_value):
    cur = None
    try:
        cur = conn.cursor()
        cur.execute("SET search_path to s_2021088304")

        base_sql = """
            SELECT cu.c_id,
                   cu.c_name,
                   cu.email,
                   cu.gender,
                   cu.phone,
                   STRING_AGG(DISTINCT gr.gr_name, ', ') AS preferred_genres  
            FROM customer cu
                JOIN prefer p ON cu.c_id = p.c_id
                JOIN genre gr ON p.gr_id = gr.gr_id
        """ # 공통적으로 사용되는 SQL문

        if search_type == 'id':
            sql = base_sql + """
            WHERE cu.c_id = %(id)s
            GROUP BY cu.c_id
            ORDER BY cu.c_id ASC;
            """
            cur.execute(sql, {"id": search_value})

        elif search_type == 'name':
            sql = base_sql + """
            WHERE cu.c_name ILIKE %(name)s
            GROUP BY cu.c_id
            ORDER BY cu.c_id ASC;
            """
            cur.execute(sql, {"name": search_value})

        elif search_type == 'genre':
            sql = base_sql + """
            GROUP BY cu.c_id
            HAVING STRING_AGG(DISTINCT gr.gr_name, ', ') ILIKE %(genre)s
            ORDER BY cu.c_id ASC;
            """
            cur.execute(sql, {"genre": f"%{search_value}%"})

        elif search_type == 'all':
            sql = base_sql + """
            GROUP BY cu.c_id
            ORDER BY cu.c_id ASC
            LIMIT %(all)s;
            """
            cur.execute(sql, {"all": search_value})

        else:
            print("can't search by", search_type)
            return False

        rows = cur.fetchall()
        if not rows:
            print("No results found.")
            return False
        else:
            column_names = [desc[0] for desc in cur.description]
            #
            # print_rows_to_file(column_names, rows)
            # make_csv(column_names, rows)
            #
            print(f"Total rows: {len(rows)}")
            print_rows(column_names, rows)
            return True
        
    except Exception as e:
        print(e)
        
    finally:
        cur.close()


def insert_customer(id, name, email, pwd, gender, phone, genres):
    cur = None
    try:
        cur = conn.cursor()
        cur.execute("SET search_path to s_2021088304")

        sql = """
        INSERT INTO customer (c_id, c_name, email, pwd, gender, phone)
        VALUES (%s, %s, %s, %s, %s, %s);
        """
        cur.execute(sql, (id, name, email, pwd, gender, phone))

        for genre in genres:
            genre = genre.strip()
            if not is_valid_genre(genre):
                print(f"Error: '{genre}' is not a valid genre.")
                conn.rollback()
                return False

            sql_genre = "SELECT gr_id FROM genre WHERE gr_name = %s;"
            cur.execute(sql_genre, (genre,))
            gr_id = cur.fetchone()

            if gr_id:
                sql_insert_prefer = """
                INSERT INTO prefer (c_id, gr_id)
                VALUES (%s, %s);
                """
                cur.execute(sql_insert_prefer, (id, gr_id[0]))
            else:
                print(f"Error: Genre '{genre}' not found in the database.")
                conn.rollback()
                return False

        conn.commit()
        display_info('id', id)

        return True

    except Exception as e:
        conn.rollback()
        print(f"Error inserting customer: {e}")
        return False
    finally:
        if cur:
            cur.close()
 
        
def update_customer(id, email=None, password=None, phone=None):
    cur = None
    try:
        cur = conn.cursor()
        cur.execute("SET search_path to s_2021088304")

        update_query = """
        SELECT cu.c_id, 
               cu.c_name, 
               cu.email, 
               cu.gender, 
               cu.phone, 
               STRING_AGG(DISTINCT gr.gr_name, ', ') AS preferred_genres
        FROM customer cu
        LEFT JOIN prefer p ON cu.c_id = p.c_id
        LEFT JOIN genre gr ON p.gr_id = gr.gr_id
        WHERE cu.c_id = %s
        GROUP BY cu.c_id;
        """
        cur.execute(update_query, (id,))
        before_update = cur.fetchall()
        
        if before_update:
            column_names = [desc[0] for desc in cur.description]
            print(f"Total rows: {len(before_update)}")
            print_rows(column_names, before_update)
        else:
            print(f"No customer found with id {id}")
            return False

        if email:
            target_field = 'email'
            target_value = email
        elif password:
            target_field = 'pwd'
            target_value = password
        elif phone:
            target_field = 'phone'
            target_value = phone
        else:
            print("Error: No valid target specified for update.")
            return False

        sql = f"UPDATE customer SET {target_field} = %s WHERE c_id = %s;"
        cur.execute(sql, (target_value, id))

        if cur.rowcount == 0:
            print(f"Error: No customer with id {id} found.")
            conn.rollback()
            return False

        conn.commit()
        print("\n")

        cur.execute(update_query, (id,))
        after_update = cur.fetchall()
        
        if after_update:
            column_names = [desc[0] for desc in cur.description]
            print(f"Total rows: {len(after_update)}")
            print_rows(column_names, after_update)
        else:
            print(f"No customer found with id {id}")
            return False

    except Exception as e:
        conn.rollback()
        print(f"Error updating customer: {e}")
        return False
    finally:
        if cur:
            cur.close()
    

def delete_customer(id):
    cur = None
    try:
        cur = conn.cursor()
        cur.execute("SET search_path TO s_2021088304")

        sql = """
        SELECT 
            cu.c_id,
            cu.c_name,
            cu.email,
            cu.gender,
            cu.phone,
            STRING_AGG(DISTINCT gr.gr_name, ', ') AS preferred_genres
        FROM customer cu
            LEFT JOIN prefer p ON cu.c_id = p.c_id
            LEFT JOIN genre gr ON p.gr_id = gr.gr_id
        WHERE cu.c_id = %s
        GROUP BY cu.c_id;
        """
        cur.execute(sql, (id,))
        customer_info = cur.fetchone()

        if not customer_info:
            print(f"Error: No customer with id {id} found.")
            return False

        column_names = [desc[0] for desc in cur.description]
        print(f"Total rows: {1}")
        print_rows(column_names, [customer_info])

        tables = ['prefer', 'watch', 'comment']
        for table in tables:
            cur.execute(f"""
                SELECT EXISTS (
                    SELECT 1
                    FROM information_schema.tables
                    WHERE table_name = '{table}'
                );
            """)
            table_exists = cur.fetchone()[0]

            if table_exists:
                cur.execute(f"DELETE FROM {table} WHERE c_id = %s;", (id,))

        cur.execute("DELETE FROM customer WHERE c_id = %s;", (id,))
        if cur.rowcount == 0:
            print(f"Error: No customer with id {id} found.")
            conn.rollback()
            return False

        conn.commit()
        return True

    except Exception as e:
        conn.rollback()
        print(f"Error deleting customer: {e}")
        return False

    finally:
        if cur:
            cur.close()

            

def main(args):
    if args.command == "info":
        if args.id:
            display_info('id',args.id)
        elif args.name:
            display_info('name', args.name)
        elif args.genre:
            if not is_valid_genre(args.genre):
                print(f"Error: '{args.genre}' is not a valid genre.")
            else:
                display_info('genre', args.genre)
        elif args.all:
            display_info('all', args.all)

    elif args.command == "insert":
        insert_customer(args.id, args.name, 
            args.email, args.pwd, args.gender, args.phone, args.genres)
    elif args.command == "update":
        if args.email:
            update_customer(args.id, email=args.email)
        elif args.password:
            update_customer(args.id, password=args.password)
        elif args.phone:
            update_customer(args.id, phone=args.phone)
        else:
            print("Error: No valid field specified for update.")
    elif args.command == "delete":
        delete_customer(args.id)
    else :
        print("Error: query command error.")


if __name__ == "__main__":
    #
    #print_command_to_file()
    #
    start = time.time()
    parser = argparse.ArgumentParser(description = """
    how to use
    1. info [-i(c_id) / -n(c_name) / -g(genre) / -a (all)] [value]
    2. insert c_id, c_name, email, pwd, gender, phone -g (genre1, genre2, genre3)
    3. update -i [c_id] [-m(e-mail) / -p(password) / -ph(phone)] [new_value]
    4. delete -i [c_id]
    """, formatter_class=argparse.RawTextHelpFormatter)
    
    subparsers = parser.add_subparsers(dest='command', 
        help='select one of query types [info, insert, update, delete]')

    # [1-1] info
    parser_info = subparsers.add_parser('info', help='Display target customers info')
    group_info = parser_info.add_mutually_exclusive_group(required=True)
    group_info.add_argument('-i', dest='id', type=int, help='c_id of customer entity')
    group_info.add_argument('-n', dest='name', type=str, help='c_name of customer entity')
    group_info.add_argument('-g', dest='genre', type=str, help='genre which customer prefer')
    group_info.add_argument('-a', dest='all', type=int, help='display rows with top [value]')

    # [1-2] insert
    parser_insert = subparsers.add_parser('insert', help='Insert new customer data')
    parser_insert.add_argument('id', type=int, help='c_id of customer entity')
    parser_insert.add_argument('name', type=str, help='c_name of customer entity')
    parser_insert.add_argument('email', type=str, help='email of customer entity')
    parser_insert.add_argument('pwd', type=str, help='password of customer entity')
    parser_insert.add_argument('gender', type=str, help='gender of customer entity')
    parser_insert.add_argument('phone', type=str, help='phone number of customer entity')
    parser_insert.add_argument('-g', dest='genres', type=str, nargs='+', help='preferred genres')

    # [1-3] update
    parser_update = subparsers.add_parser('update', help='Update customer data')
    parser_update.add_argument('-i', dest='id', type=int, required=True, help='Customer ID to update')
    parser_update.add_argument('-m', '--email', type=str, help='Update email')
    parser_update.add_argument('-p', '--password', type=str, nargs='+', help='Update password')
    parser_update.add_argument('-ph', '--phone', type=str, help='Update phone number')

    # [1-4] delete
    parser_delete = subparsers.add_parser('delete', help='Delete customer data with associated data')
    parser_delete.add_argument('-i', dest='id', type=int, required=True, help='c_id of customer entity')
    
    args = parser.parse_args()
    main(args)
    print("Running Time: ", end="")
    print(time.time() - start)