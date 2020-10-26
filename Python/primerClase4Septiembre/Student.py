import sys
import csv
import time

from Configuration import mssql_connection, get_date_from_sql, postgresql_connection

def extract_sqlserver(init_date = "1999/01/01", final_date = time.strftime("%Y/%m/%d")):
    data = [
        ['get_all_clients_by_date','CLIENT',                ['NAME','LAST_NAME','AGE', 'LAST_UPDATE']],
        ['get_all_sales_by_date','SALE',                    ['ID_CLIENT','DESCRIPTION','TOTAL','LAST_UPDATE']],
        ['get_all_address_clients_by_date','ADDRESS_CLIENT',['ID_CLIENT','ADDRESS','ADDRESS_NAME','LAST_UPDATE']],
        ['get_all_phone_clients_by_date','PHONE_CLIENT',    ['ID_CLIENT','NUMBER','LAST_UPDATE']],
        ['get_all_credit_cards_by_date', 'CREDIT_CARD',     ['CARD_NUMBER','CVV','ID_CLIENT','EXPIRATION','LAST_UPDATE']],
        ['get_all_email_clients_by_clients', 'EMAIL_CLIENT',['ID_CLIENT','EMAIL','LAST_UPDATE']]
    ]

    try:
        for procedure in data:

            query = procedure[0]
            table = procedure[1]
            cols = procedure[2]

            sp = "exec "+ query +" '" + init_date +"', '" + final_date + "';"
            print(sp)
            con_sql = mssql_connection()
            data = get_date_from_sql(sp)


            if len(data) <= 0:
                print('No data in '+ table)
            else:
                access = "w"
                newline = {"newline": ""}

                currenttime = time.strftime("%Y%m%d%H%M")
                name = currenttime +"_"+ table +".csv";
                with open(name, access, **newline) as outfile:
                    writer = csv.writer(outfile, quoting=csv.QUOTE_NONE)
                    writer.writerows(data)


                
    except IOError as e:
        print('Error {0} in the extract_sqlserver or func').format(
            e.erno, e.strerror)
    finally:
        con_sql.close()


def loader_csv_file_postgre(name, table):
    try:
        con_postgre = postgresql_connection()
        cur = con_postgre.cursor()
        with open(name +'.csv', 'r') as f:
            cur.copy_from(f, table, sep=',')
            con_postgre.commit()
    except IOError as e:
        print("Error: {0} Uploading data to PostgreSQL: {1}".format(
            e.erno, e.strerror))
    finally:
        con_postgre.close()


if __name__ == "__main__":
    #extract_sqlserver()
    # loader_csv_file_postgre('202010260915_CLIENT','client')
    # loader_csv_file_postgre('202010260915_EMAIL_CLIENT','email_client')
    # loader_csv_file_postgre('202010260915_ADDRESS_CLIENT','address_client')
    # loader_csv_file_postgre('202010260915_CREDIT_CARD','credit_card')
    # loader_csv_file_postgre('202010260915_PHONE_CLIENT','phone_client')
    loader_csv_file_postgre('202010260915_SALE','sale')

