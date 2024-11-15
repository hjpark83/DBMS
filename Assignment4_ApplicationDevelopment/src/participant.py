import time
import argparse
from helpers.connection import conn
from helpers.utils import print_rows
from helpers.utils import print_rows_to_file
from helpers.utils import is_valid_genre
from helpers.utils import print_command_to_file
from helpers.utils import make_csv
from helpers.utils import is_valid_pro

def display_info(search_type, search_value=None):
    cur = None
    try:
        if conn is None:
            print("Database connection is not established")
            return False

        cur = conn.cursor()
        cur.execute("SET search_path TO s_2021088304")
        
        base_sql = """
        SELECT 
            p.p_id,
            p.p_name,
            p.major_work,
            STRING_AGG(DISTINCT o.ocu_name, ', ' ORDER BY o.ocu_name ASC) AS profession
        FROM participant p
        JOIN profession pf ON pf.p_id = p.p_id
        JOIN occupation o ON o.ocu_id = pf.ocu_id
        """ # 공통적으로 사용되는 SQL문

        if search_type == 'all':
            sql = base_sql + """
            GROUP BY p.p_id, p.p_name, p.major_work
            ORDER BY p.p_id ASC
            LIMIT %s;
            """
            cur.execute(sql, (search_value,))

        elif search_type == 'id':
            sql = base_sql + """
            WHERE p.p_id = %s
            GROUP BY p.p_id, p.p_name, p.major_work;
            """
            cur.execute(sql, (search_value,))

        elif search_type == 'name':
            sql = base_sql + """
            WHERE LOWER(p.p_name) LIKE LOWER(%s)
            GROUP BY p.p_id, p.p_name, p.major_work;
            """
            cur.execute(sql, (f"%{search_value}%",))

        elif search_type == 'profession':
            sql = base_sql + """
            WHERE p.p_id IN (
                SELECT pf.p_id 
                FROM profession pf 
                JOIN occupation o ON o.ocu_id = pf.ocu_id 
                WHERE LOWER(o.ocu_name) LIKE LOWER(%s)
            )
            GROUP BY p.p_id, p.p_name, p.major_work
            ORDER BY p.p_id;
            """
            cur.execute(sql, (f"%{search_value}%",))

        rows = cur.fetchall()
        if not rows:
            print("No results found.")
            return False
        else:
            column_names = [desc[0] for desc in cur.description]        
            print(f"Total rows: {len(rows)}")
            print_rows(column_names, rows)
            return True

    except Exception as e:
        print(f"Error: {e}")
        return False

    finally:
        if cur is not None:
            cur.close()


def main(args):
    if args.command == "info":
        if args.all:
            display_info('all', args.all)
        elif args.id:
            display_info('id',args.id)
        elif args.name:
            display_info('name', args.name)
        elif args.profession:
            if not is_valid_pro(args.profession) :
                print(f"Error: {args.profession} is not valid profession.")
            else :
                display_info('profession', args.profession)
    else :
        print("Error: query command error.")


if __name__ == "__main__":
    #
    #print_command_to_file()
    #
    start = time.time()
    parser = argparse.ArgumentParser(description="""
    how to use
        1. info -a <limit>              : Display participants in ascending order by p_id
        2. info -i <participant_id>     : Display participants by p_id
        3. info -n <participant_name>   : Display participants by p_name
        4. info -pr <profession>        : Display participants by profession name
    """, formatter_class=argparse.RawTextHelpFormatter)

    subparsers = parser.add_subparsers(dest='command', 
        help='select one of the query types [info]')
    
    parser_info = subparsers.add_parser('info', help='Display participant information')
    group_info = parser_info.add_mutually_exclusive_group(required=True)

    group_info.add_argument('-a', dest='all', type=int, help='Display certain number of participants')
    group_info.add_argument('-i', dest='id', type=int, help='Participant ID')
    group_info.add_argument('-n', dest='name', type=str, help='Participant name')
    group_info.add_argument('-pr', dest='profession', type=str, help='Profession (e.g., actor, director)')

    args = parser.parse_args()
    main(args)
    print("Running Time: ", end="")
    print(time.time() - start)