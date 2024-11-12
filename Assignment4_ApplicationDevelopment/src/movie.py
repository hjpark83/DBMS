import argparse
from helpers.connection import conn
from helpers.utils import print_rows
from helpers.utils import print_rows_to_file
from helpers.utils import is_valid_genre
from helpers.utils import print_command_to_file
from helpers.utils import make_csv


def display_info(search_type, search_value=None):
    try:
        cur = conn.cursor()
        cur.execute("SET search_path TO s_2021088304")
        
        base_sql = """
        SELECT
            m.m_id, m.m_name, m.m_type, m.start_year, m.end_year,
            m.is_adult, m.runtimes, m.m_rating AS imdb_rating,
            (m.m_rating * m.votes + COALESCE(SUM(ct.rating), 0)) / (m.votes + COUNT(ct.rating)) AS final_rating,
            STRING_AGG(DISTINCT gr.gr_name, ', ') AS genres
        FROM movie m
            LEFT JOIN classify c ON m.m_id = c.m_id
            LEFT JOIN genre gr ON c.gr_id = gr.gr_id    
            LEFT JOIN comment_to ct ON m.m_id = ct.m_id
        """ # 공통적으로 사용되는 SQL문
        
        if search_type == 'all':
            sql = base_sql + """
            GROUP BY m.m_id
            ORDER BY m.m_id ASC
            LIMIT %s;
            """
            cur.execute(sql, (search_value,))
        
        elif search_type == 'id':
            sql = base_sql +"""
            WHERE m.m_id = %(id)s
            GROUP BY m.m_id
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"id": search_value})

        elif search_type == 'name':
            sql = base_sql + """
            WHERE m.m_name ILIKE %(name)s
            GROUP BY m.m_id
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"name": f"%{search_value}%"})
            
        elif search_type == 'type':
            sql = base_sql + """
            WHERE m.m_type = %(type)s
            GROUP BY m.m_id
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"type": search_value})

        elif search_type == 'genre':
            sql = base_sql + """
            GROUP BY m.m_id
            HAVING STRING_AGG(DISTINCT gr.gr_name, ', ') ILIKE %(gr_name)s
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"gr_name": f"%{search_value}%"})

        elif search_type == 'start_year':
            sql = base_sql + """
            WHERE EXTRACT(YEAR FROM m.start_year) = %(sy)s
            GROUP BY m.m_id
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"sy": search_value})

        elif search_type == 'end_year':
            sql = base_sql + """
            WHERE EXTRACT(YEAR FROM m.end_year) = %(ey)s
            GROUP BY m.m_id
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"ey": search_value})

        elif search_type == 'is_adult':
            sql = base_sql + """
            WHERE m.is_adult = %(is_adult)s
            GROUP BY m.m_id
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"is_adult": search_value})

        elif search_type == 'rating':
            sql = base_sql + """
            WHERE m.m_rating >= %(rating)s
            GROUP BY m.m_id
            ORDER BY m.m_id ASC;
            """
            cur.execute(sql, {"rating": search_value})

        rows = cur.fetchall()
        if not rows:
            print("No results found.")
            return False

        column_names = [desc[0] for desc in cur.description]
        print(f"Total rows: {len(rows)}")
        print_rows(column_names, rows)
        return True

    except Exception as e:
        print(f"Error: {e}")
        return False

    finally:
        cur.close()

def main(args):
    if args.command == "info":
        if args.all:
            display_info('all', args.all)
        elif args.id:
            display_info('id', args.id)
        elif args.name:
            display_info('name', args.name)
        elif args.type:
            display_info('type', args.type)
        elif args.genre:
            display_info('genre', args.genre)
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
    parser = argparse.ArgumentParser(description="""how to use
    1-1. info [-a(all) / -i(m_id) / -n(m_name) / -t(type) /-g(gr_name)]
    1-2. info [-sy(start_year) / -ey(end_year) / -ad(is_adult) / -r(rating)]
    """, formatter_class=argparse.RawTextHelpFormatter)

    subparsers = parser.add_subparsers(dest='command', help='select one of query types [info, ...]')
    parser_info = subparsers.add_parser('info', help='Display target movie info')
    group_info = parser_info.add_mutually_exclusive_group(required=True)

    group_info.add_argument('-a', dest='all', type=int, help='Number of movies to display')
    group_info.add_argument('-i', dest='id', type=int, help='m_id of movie entity')
    group_info.add_argument('-n', dest='name', help='m_name of movie entity')
    group_info.add_argument('-t', dest='type', help='m_type of movie entity')
    group_info.add_argument('-g', dest='genre', help='gr_name of movie entity')
    group_info.add_argument('-sy', dest='start_year', type=int, help='start_year of movie entity')
    group_info.add_argument('-ey', dest='end_year', type=int, help='end_year of movie entity')
    group_info.add_argument('-ad', dest='is_adult', choices=['True', 'False'], help='is_adult of movie entity (True/False)')
    group_info.add_argument('-r', dest='rating', type=float, help='rating of movie entity')

    args = parser.parse_args()
    main(args)