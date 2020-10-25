import sys
import csv
import time

from Configuration import mssql_connection, get_date_from_sql, postgresql_connection

def hello_wordl():
    print("hello wordl")


def students_extract():
    try:
        query = 'APLICADA.SP_OBTENER_ESTUDIANTES'
        con_sql = mssql_connection()
        data = get_date_from_sql(query)
        if len(data) <= 0:
            print('No data')
            sys.exit(0)
        else:
            access = "w"
            newline = {"newline": ""}

            currenttime = time.strftime("%Y%m%d%H%M")
            print(currenttime)

            with open(currenttime+"_estudiantes.csv", access, **newline) as outfile:
                writer = csv.writer(outfile, quoting=csv.QUOTE_NONE)
                writer.writerow(
                    ["CARNET", "NOMBRE", "APELLIDOS", "CARRERA", "DIRECCION", "PROMEDIO"])
                for row in data:
                    print(row)
                    writer.writerow(row)
    except IOError as e:
        print('Error {0} in the students_extractor func').format(
            e.erno, e.strerror)
    finally:
        con_sql.close()

def loader_csv_file_postgre():
    try:
        con_postgre = postgresql_connection()
        cur = con_postgre.cursor()
        with open('202010141050_estudiantes.csv','r') as f:
            #salto de linea
            next(f)
            cur.copy_from(f, 'APLICADA.ESTUDIANTES_CURSO', sep=',')
            con_postgre.commit()
    except IOError as e:
        print("Error: {0} Uploading data to PostgreSQL: {1}".format(e.erno, e.strerror))
    finally:
        con_postgre.close()

#hello_wordl()
#students_extract()
loader_csv_file_postgre()