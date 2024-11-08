import time
import argparse
from helpers.connection import conn
from helpers.utils import print_rows
from helpers.utils import print_rows_to_file
from helpers.utils import is_valid_genre
from helpers.utils import print_command_to_file
from helpers.utils import make_csv

def display_info(search_type, search_value):
    try:
        cur = conn.cursor()
        
        cur.execute("SET search_path to s_2021088304")
        
        if search_type == 'all':
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.m_type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.runtimes,
                m.m_rating,
                m.gr_name
            FROM movie m
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql)

        elif search_type == 'id':
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.m_type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.runtimes,
                m.m_rating,
                m.gr_name
            FROM movie m
            WHERE m.m_id = %(id)s;
            """
            cur.execute(sql, {"id": search_value})

        elif search_type == 'name':
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.m_type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.runtimes,
                m.m_rating,
                m.gr_name
            FROM movie m
            WHERE m.m_name ILIKE %(name)s;
            """
            cur.execute(sql, {"name": f"%{search_value}%"})

        elif search_type == 'gr_name':
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.m_type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.runtimes,
                m.m_rating,
                m.gr_name
            FROM movie m
            WHERE %(gr_name)s = ANY(m.gr_name);
            """
            cur.execute(sql, {"gr_name": search_value})

        elif search_type == 'type':
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.m_type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.runtimes,
                m.m_rating,
                m.gr_name
            FROM movie m
            WHERE lower(m.m_type) = lower(%(type)s);
            """
            cur.execute(sql, {"type": search_value})

        elif search_type == 'start_year':
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.m_type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.runtimes,
                m.m_rating,
                m.gr_name
            FROM movie m
            WHERE start_year = %(start_year)s;
            """
            cur.execute(sql, {"start_year": search_value})

            
        elif search_type == 'end_year' :
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.gr_name,
                m.type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.m_rating
            FROM movie m
            WHERE m.end_year = %(end_year)s
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"end_year": search_value})
            
        elif search_type == 'is_adult' :
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.gr_name,
                m.type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.m_rating
            FROM movie m
            WHERE m.is_adult = %(is_adult)s
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"is_adult": search_value})
            
        elif search_type == 'rating' :
            sql = """
            SELECT
                m.m_id,
                m.m_name,
                m.gr_name,
                m.type,
                m.start_year,
                m.end_year,
                m.is_adult,
                m.m_rating
            FROM movie m
            WHERE m.m_rating = %(rating)s
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"rating": search_value})
            
        rows = cur.fetchall()
        if not rows:
            print("No results found.")
            return False
        else:
            column_names = [desc[0] for desc in cur.description]
            print_rows(column_names, rows)
            return True
        
    except Exception as e:
        print(e)
        
    finally:
        cur.close()
    pass
            
def main(args):
    if args.command == "info":
        if args.all:
            display_info('all')
        elif args.id:
            display_info('id', args.id)
        elif args.name:
            display_info('name', args.name)
        elif args.genre:
            display_info('genre', args.genre)
        elif args.type:
            display_info('type', args.type)
        elif args.start_year:
            display_info('start_year', args.start_year)
        elif args.end_year:
            display_info('end_year', args.end_year)
        elif args.is_adult:
            display_info('is_adult', args.is_adult)
        elif args.rating:
            display_info('rating', args.rating)

if __name__ == "__main__":
    #
    #print_command_to_file()
    #
    start = time.time()
    parser = argparse.ArgumentParser(description = """
    how to use
    1-1. info [-a(all) / -i(m_id) / -n(m_name) / -g(gr_name)] [value]
    1-2. info [-sy(start_year) / -ey(end_year) / -ad(is_adult) / -r(rating)] [value]
    2. ...
    3. ...
    """, formatter_class=argparse.RawTextHelpFormatter)
    subparsers = parser.add_subparsers(dest='command', 
        help='select one of query types [info, ...]')

    #info
    parser_info = subparsers.add_parser('info', help='Display target movie info')
    group_info = parser_info.add_mutually_exclusive_group(required=True)

    group_info.add_argument('-a', dest='all', action='store_true', help='Display all movies info')
    group_info.add_argument('-i', dest='id', type=int, help='m_id of movie entity')
    group_info.add_argument('-n', dest='name', help='m_name of movie entity')
    group_info.add_argument('-g', dest='gr_name', help='gr_name of movie entity')
    group_info.add_argument('-t', dest='type', help='type of movie entity')
    group_info.add_argument('-sy', dest='start_year', type=int, help='start_year of movie entity')    
    group_info.add_argument('-ey', dest='end_year', type=int, help='end_year of movie entity')
    group_info.add_argument('-ad', dest='is_adult', type=bool, help='is_adult of movie entity')
    group_info.add_argument('-r', dest='rating', type=float, help='rating of movie entity')
    
    args = parser.parse_args()
    main(args)
    print("Running Time: ", end="")
    print(time.time() - start)
