import time
import argparse
from helpers.connection import conn
from helpers.utils import print_rows

def display_info(search_type, search_value=None):
    cur = None
    try:
        if conn is None:
            print("Database connection is not established")
            return False

        cur = conn.cursor()
        cur.execute("SET search_path TO s_2021088304")

        if search_type == 'all':
            sql = """
            SELECT
                p.p_id,
                p.p_name,
                p.major_work,
                STRING_AGG(DISTINCT pa.role, ', ') AS roles
            FROM participant p
            JOIN participate pa ON p.p_id = pa.p_id
            GROUP BY p.p_id, p.p_name, p.major_work
            ORDER BY p.p_id
            LIMIT %s;
            """
            cur.execute(sql, (search_value,))

        elif search_type == 'id':
            sql = """
            SELECT
                p.p_id,
                p.p_name,
                p.major_work,
                STRING_AGG(DISTINCT pa.role, ', ') AS roles
            FROM participant p
            JOIN participate pa ON p.p_id = pa.p_id
            WHERE p.p_id = %s
            GROUP BY p.p_id, p.p_name, p.major_work;
            """
            cur.execute(sql, (search_value,))

        elif search_type == 'name':
            sql = """
            SELECT
                p.p_id,
                p.p_name,
                p.major_work,
                STRING_AGG(DISTINCT pa.role, ', ') AS roles
            FROM participant p
            JOIN participate pa ON p.p_id = pa.p_id
            WHERE LOWER(p.p_name) LIKE LOWER(%s)
            GROUP BY p.p_id, p.p_name, p.major_work;
            """
            cur.execute(sql, (f"%{search_value}%",))

        elif search_type == 'role':
            sql = """
            SELECT
                p.p_id,
                p.p_name,
                p.major_work,
                STRING_AGG(DISTINCT pa.role, ', ') AS roles
            FROM participant p
            JOIN participate pa ON p.p_id = pa.p_id
            WHERE pa.role = %s
            GROUP BY p.p_id, p.p_name, p.major_work
            ORDER BY p.p_id;
            """
            cur.execute(sql, (search_value,))

        rows = cur.fetchall()
        if not rows:
            print("No results found.")
            return False
        else:
            column_names = [desc[0] for desc in cur.description]
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
            display_info('id', args.id)
        elif args.name:
            display_info('name', args.name)
        elif args.role:
            display_info('role', args.role)
    else:
        print("Invalid command")

if __name__ == "__main__":
    #
    #print_command_to_file()
    #
    start = time.time()

    parser = argparse.ArgumentParser(description="""
    how to use
        1. info -a <limit>              : Display limited participants
        2. info -i <participant_id>     : Display a participant by ID
        3. info -n <participant_name>   : Display participants by name
        4. info -r <role>               : Display participants by role (e.g., actor, director)
    """, formatter_class=argparse.RawTextHelpFormatter)

    subparsers = parser.add_subparsers(dest='command', 
        help='Select one of the query types [info]')
    
    parser_info = subparsers.add_parser('info', help='Display participant information')

    group_info = parser_info.add_mutually_exclusive_group(required=True)
    group_info.add_argument('-a', dest='all', type=int, help='Display a limited number of participants')
    group_info.add_argument('-i', dest='id', type=int, help='Participant ID')
    group_info.add_argument('-n', dest='name', type=str, help='Participant name')
    group_info.add_argument('-pr', dest='role', type=str, help='Role (e.g., actor, director)')

    args = parser.parse_args()
    main(args)
    print("Running Time: ", end="")
    print(time.time() - start)
