import psycopg2 as pg

conn = None

try:
    conn = pg.connect(
        dbname="postgres" ,
        user="postgres",
        password="####",
        host="localhost",
        port="5432"
    )
except Exception as e:
    print("Cannot Create DB Connection :", e)
