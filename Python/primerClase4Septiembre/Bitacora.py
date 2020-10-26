#INSERT BITACORA
from datetime import datetime
from Configuration import sql_connection


def sqlite_insert(table, entities):
    conection = sql_connection()
    cursorObj = conection.cursor()

    cursorObj.execute(
        'INSERT INTO Bitacora'+table+'(fileName, date, operation) VALUES(?, ?, ?)', entities)

    conection.commit()
    print("Guardado con exito en bitacora")


