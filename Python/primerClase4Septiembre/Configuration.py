import pymssql
import psycopg2
import sqlite3
#CONNECTION TO POSTGRESQL
from sqlite3 import Error
def sql_connection():
    try:

        con = sqlite3.connect('Bitacora.db')

        return con

    except Error:

        print(Error)
#CONNECTION TO POSTGRESQL
_postgre_server = "163.178.107.7"
_postgre_database = "extractorProject"
_postgre_server_port = 5432
_postgre_user = "laboratorios"
_postgre_password = "saucr.120"

#CONNECTION TO SQL SERVER
_sql_server = '163.178.107.10'
_sql_database = 'extractorProject'
_sql_server_port = 1433
_sql_user = 'laboratorios'
_sql_password = 'KmZpo.2796'

#SQL SERVER CONNECTION FUNC
def mssql_connection():
    try:
        cnx = pymssql.connect(server=_sql_server, port=_sql_server_port,
                              user=_sql_user, password=_sql_password,
                              database=_sql_database)
        return cnx
    except:
        print('ERROR: MSSQL Connection')

#CALL STORED PROCEDURE FROM SQL SERVER
def get_date_from_sql(sp):
    try:
        con = mssql_connection()
        cur = con.cursor()
        cur.execute("{} ".format(sp))
        data_return = cur.fetchall()
        con.commit()

        return data_return
    except IOError as e:
        print("ERROR: {0} Getting data from MSSQL: {1}".format(e.erno, e.strerror))

#PostgreSQL Coneection
def postgresql_connection():
    try:

        cnx = psycopg2.connect("host="+_postgre_server+" dbname="+_postgre_database
                               +" user="+_postgre_user+" password="+_postgre_password)
        return cnx
    except:
        print('Error: PostgreSQL Connection Failed')