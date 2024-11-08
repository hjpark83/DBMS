import time
import argparse
from helpers.connection import conn
from helpers.utils import print_rows
from helpers.utils import print_rows_to_file
from helpers.utils import is_valid_genre
from helpers.utils import print_command_to_file
from helpers.utils import make_csv
from helpers.utils import is_valid_pro

def display_info(search_type, search_value):
    try:
        cur = conn.cursor()
        cur.execute("SET search_path to s_2021088304")
        
        if search_type == 'id':
            sql = """
            SELECT 
                p.p_id,
                p.p_name,
                p.pro_name,
                COUNT(DISTINCT c.m_id) as movie_count,
                STRING_AGG(DISTINCT r.role_name, ', ') as roles
            FROM participant p
            LEFT JOIN casting c ON p.p_id = c.p_id
            LEFT JOIN role r ON c.role_id = r.role_id
            WHERE p.p_id = %s
            GROUP BY p.p_id, p.p_name, p.pro_name
            ORDER BY p.p_id;
            """
            cur.execute(sql, (search_value,))
            
        elif search_type == 'name':
            sql = """
            SELECT 
                p.p_id,
                p.p_name,
                p.pro_name,
                COUNT(DISTINCT c.m_id) as movie_count,
                STRING_AGG(DISTINCT r.role_name, ', ') as roles
            FROM participant p
            LEFT JOIN casting c ON p.p_id = c.p_id
            LEFT JOIN role r ON c.role_id = r.role_id
            WHERE p.p_name ILIKE %s
            GROUP BY p.p_id, p.p_name, p.pro_name
            ORDER BY p.p_id;
            """
            cur.execute(sql, (f"%{search_value}%",))
            
        elif search_type == 'job':
            if not is_valid_pro(search_value):
                print(f"Error: '{search_value}' is not a valid profession.")
                return False
                
            sql = """
            SELECT 
                p.p_id,
                p.p_name,
                p.pro_name,
                COUNT(DISTINCT c.m_id) as movie_count,
                STRING_AGG(DISTINCT r.role_name, ', ') as roles
            FROM participant p
            LEFT JOIN casting c ON p.p_id = c.p_id
            LEFT JOIN role r ON c.role_id = r.role_id
            WHERE p.pro_name = %s
            GROUP BY p.p_id, p.p_name, p.pro_name
            ORDER BY p.p_id;
            """
            cur.execute(sql, (search_value,))
            
        elif search_type == 'all':
            sql = """
            SELECT 
                p.p_id,
                p.p_name,
                p.pro_name,
                COUNT(DISTINCT c.m_id) as movie_count,
                STRING_AGG(DISTINCT r.role_name, ', ') as roles
            FROM participant p
            LEFT JOIN casting c ON p.p_id = c.p_id
            LEFT JOIN role r ON c.role_id = r.role_id
            GROUP BY p.p_id, p.p_name, p.pro_name
            ORDER BY p.p_id
            LIMIT %s;
            """
            cur.execute(sql, (search_value,))
            
        else:
            print(f"Invalid search type: {search_type}")
            return False
            
        rows = cur.fetchall()
        if not rows:
            print("No results found.")
            return False
            
        column_names = [desc[0] for desc in cur.description]
        print_rows(column_names, rows)
        return True
        
    except Exception as err:
        print(f"Error: {err}")
        return False
    finally:
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

    pass


if __name__ == "__main__":
    #
    #print_command_to_file()
    #
    start = time.time()
    parser = argparse.ArgumentParser(description = """
    how to use
    1. info [-a(all) / -i(p_id) / -n(p_name) / -pr(profession name)] [value]
    2. ...
    3. ...
    """, formatter_class=argparse.RawTextHelpFormatter)
    subparsers = parser.add_subparsers(dest='command', 
        help='select one of query types [info, ...]')

    #info
    parser_info = subparsers.add_parser('info', help='Display target participant info')
    group_info = parser_info.add_mutually_exclusive_group(required=True)
    
    group_info.add_argument('-a', dest='all', action='store_true', help='Display all participants info')
    group_info.add_argument('-i', dest='id', type=int, help='p_id of participant entity')
    group_info.add_argument('-n', dest='name', help='p_name of participant entity')
    group_info.add_argument('-pr', dest='profession', help='profession name of participant')

    args = parser.parse_args()
    main(args)
    print("Running Time: ", end="")
    print(time.time() - start)
