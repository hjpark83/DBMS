import time
import argparse
from helpers.connection import conn
from helpers.utils import print_rows
from helpers.utils import print_rows_to_file
from helpers.utils import print_command_to_file
from helpers.utils import make_csv


def display_info(search_type, search_value, search_role=None):
    """
    Display participant information based on the search criteria.
    """
    cur = None
    try:
        if conn is None:
            print("Database connection is not established")
            return False

        cur = conn.cursor()
        cur.execute("SET search_path TO s_2021088304")

        # Query for 'all' search type: fetching participants based on the role with a limit
        if search_type == 'all':
            sql = """
            SELECT 
                p.p_id, 
                p.p_name, 
                pa.role AS role,
                STRING_AGG(DISTINCT m.m_name, ', ') AS movies,
                STRING_AGG(DISTINCT pa.casting, ', ') AS characters
            FROM participant p
                JOIN Participate pa ON p.p_id = pa.p_id
                JOIN movie m ON pa.m_id = m.m_id
            WHERE pa.role = %s
            GROUP BY p.p_id, p.p_name, pa.role
            ORDER BY p.p_id
            LIMIT %s;
            """
            cur.execute(sql, (search_role, search_value))

        # Query for 'one' search type: fetching participants for a specific movie
        elif search_type == 'one':
            sql = """
            SELECT 
                p.p_id, 
                p.p_name, 
                pa.role AS role, 
                STRING_AGG(DISTINCT pa.casting, ', ') AS characters
            FROM participant p
                JOIN Participate pa ON p.p_id = pa.p_id
                JOIN movie m ON pa.m_id = m.m_id
            WHERE m.m_id = %s AND pa.role = %s
            GROUP BY p.p_id, p.p_name, pa.role
            ORDER BY p.p_id;
            """
            cur.execute(sql, (search_value, search_role))

        # New Query for 'movie_id' search type: fetching participants based on movie ID and role
        elif search_type == 'movie_id':
            sql = """
            SELECT 
                p.p_id, 
                p.p_name, 
                pa.role AS role, 
                STRING_AGG(DISTINCT pa.casting, ', ') AS characters
            FROM participant p
                JOIN Participate pa ON p.p_id = pa.p_id
            WHERE pa.m_id = %s AND pa.role = %s
            GROUP BY p.p_id, p.p_name, pa.role
            ORDER BY p.p_id;
            """
            cur.execute(sql, (search_value, search_role))

        rows = cur.fetchall()
        if not rows:
            print("No results found.")
            return False

        column_names = [desc[0] for desc in cur.description]
        print_rows(column_names, rows)
        return True

    except Exception as e:
        print(f"Error: {e}")
        return False

    finally:
        if cur:
            cur.close()


def main(args):
    if args.command == "info":
        if args.all:
            display_info('all', args.all, args.role)
        elif args.one is not None:
            display_info('one', args.one, args.role)
    else:
        print("Invalid command")
        

if __name__ == "__main__":
    #
    #print_command_to_file()
    #
    start = time.time()
    
    parser = argparse.ArgumentParser(description="""Usage:
    1. info -a <limit> <role>            : Display all participants with the given role, limited by the specified number
    2. info -o <movie_id> <role> : Display participants for a specific movie with the given role
    """, formatter_class=argparse.RawTextHelpFormatter)

    subparsers = parser.add_subparsers(dest='command', help='Select one of the query types [info, ...]')

    parser_info = subparsers.add_parser('info', help='Display participant associated with role info')
    group_info = parser_info.add_mutually_exclusive_group(required=True)

    group_info.add_argument('-a', dest='all', type=int, help='Limit the number of participants')
    group_info.add_argument('-i', dest='one', type=int, help='Display participants for a specific movie ID')
    parser_info.add_argument('role', type=str, help='Role of the participant (e.g., actor, director)')

    args = parser.parse_args()
    main(args) 
    
    print("Running Time: ", end="")
    print(time.time() - start)