import sys
import csv

def print_command_to_file() :
    script_name = sys.argv[0].split('/')[-1].replace('.py', '')
    log_filename = f"{script_name}.txt"
    with open(log_filename, 'a', encoding='utf-8') as f:
        print("Command : [", ' '.join(sys.argv), "]", file=f)

def print_rows_to_file(column_names, rows):
    script_name = sys.argv[0].split('/')[-1].replace('.py', '')
    log_filename = f"{script_name}.txt"
    with open(log_filename, 'a', encoding='utf-8') as f:
    
        print(f"Total rows: {len(rows)}", file=f)
        col_widths = [max(len(str(value)) for value in col) for col in zip(*rows, column_names)]
        
        header_row = " | ".join(f"{name:<{col_widths[i]}}" for i, name in enumerate(column_names))
        print(header_row, file=f)
        
        print("-" * len(header_row), file=f)
        
        for row in rows:
            row_str = " | ".join(f"{str(value):<{col_widths[i]}}" for i, value in enumerate(row))
            print(row_str, file=f)
        
        print("",file=f)


def print_rows(column_names, rows):
    col_widths = [max(len(str(value)) for value in col) for col in zip(*rows, column_names)]
    
    header_row = " | ".join(f"{name:<{col_widths[i]}}" for i, name in enumerate(column_names))
    print(header_row)
    
    print("-" * len(header_row))
    
    for row in rows:
        row_str = " | ".join(f"{str(value):<{col_widths[i]}}" for i, value in enumerate(row))
        print(row_str)

def make_csv(column_names, rows):
    script_name = sys.argv[0].split('/')[-1]
    arguments = sys.argv[1:]
    query_filename = f"{script_name}_{'_'.join(arguments)}.csv"
    query_filename = query_filename.replace('-', '_').replace(' ', '_')

    with open(query_filename, 'w', newline='', encoding='utf-8') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow(column_names)
            csvwriter.writerows(rows)

def is_valid_genre(genre):
    valid_genres = {
        "Game-Show", "Family", "Music", "Reality-TV", "Comedy", "Western",
        "Short", "Crime", "War", "Romance", "Biography", "Drama", "Mystery",
        "Sci-Fi", "Fantasy", "Adventure", "Documentary", "Action", "Animation",
        "Sport", "Horror", "Adult", "News", "Talk-Show", "Film-Noir",
        "Musical", "Thriller", "History"
    }
    
    return genre in valid_genres

    
def is_valid_pro(pro_name):
    valid_pro = {
        "accountant", "actor", "actress", "animation_department", "archive_footage", "archive_sound",
        "art_department", "art_director", "assistant", "assistant_director",
        "camera_department", "casting_department", "casting_director", "choreographer", "cinematographer",
        "composer", "costume_department", "costume_designer", "director",
        "editor", "editorial_department", "electrical_department", "executive", "legal", "location_management",
        "make_up_department", "manager", "miscellaneous", "music_artist", "music_department",
        "podcaster", "producer", "production_department", "production_designer", "production_manager", "publicist",
        "script_department", "set_decorator", "sound_department", "soundtrack", "special_effects", "stunts",
        "talent_agent", "transportation_department", "visual_effects", "writer"
        }
    
    return pro_name in valid_pro