import psycopg2 as pg

conn = None

try:
    conn = pg.connect(
        dbname="postgres" ,
        user="postgres",
        password="0803",
        host="localhost",
        port="5432"
    )
    print("DB Connection Established")
except Exception as e:
    print("Cannot Create DB Connection :", e)
