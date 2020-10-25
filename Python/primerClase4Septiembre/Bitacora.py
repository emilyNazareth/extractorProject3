#INSERT BITACORA
from datetime import datetime
from Configuration import sql_connection


def sqlite_insert(conection, table, entities):
    cursorObj = conection.cursor()

    cursorObj.execute(
        'INSERT INTO Bitacora'+table+'(fileName, date, operation) VALUES(?, ?, ?)', entities)

    conection.commit()
    print("Guardado con exito en bitacora")

conection = sql_connection()
table = 'SQL'
entities = ('file6', datetime.now(), 'Extraccion de SQL')
sqlite_insert(conection,table,entities)