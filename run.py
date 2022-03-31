#!/usr/bin/python

# https://www.postgresqltutorial.com/postgresql-python/connect/

from ast import arg
import csv
import threading
import cx_Oracle
import sys
from time import time
from os import listdir
from config import config
from natsort import natsorted


def execute(params, query):
    initial = 0
    final = 0
    # print(query)
    try:
        t = ""
        with cx_Oracle.connect(**params) as connection:
            t = threading.Timer(3600 * 4,connection.cancel)
            with connection.cursor() as cursor:
                initial = time()
                t.start()
                cursor.execute(query)
                # print(cursor.fetchone())
                final = time() - initial

        return final

    except Exception as error:
        print(error)
        return final
    finally:
        t.cancel()
        return time() - initial


def run_tests(n, filename):
    params = config()
    queries_path = 'sql/queries'
    queries = natsorted(listdir(queries_path))

    with open(filename, 'w', newline='') as csvfile:
        csvwriter = csv.writer(csvfile)
        csvwriter.writerow(
            ['Observation', 'Filename', 'With Keys', 'Execution Time'])

    for i in range(1, n + 1):
        # Drop Tables
        delta = execute(params, open('sql/drop_tables.sql').read())
        with open(filename, 'a', newline='') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow([i, 'drop_tables.sql', False, delta])
        print('Dropped all tables...')

        # Create Tables
        delta = execute(params, open('sql/create_tables.sql').read())
        with open(filename, 'a', newline='') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow([i, 'drop_tables.sql', False, delta])
        print('Created tables...')

        #Created Helper tables
        delta = execute(params, open('sql/create_ext_tables.sql','r').read())
        with open(filename, 'a', newline='') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow([i, 'create_ext_tables.sql', False, delta])
        print('Created Ext Tables data (without keys)...')

        # Load Data (without keys)
        delta = execute(params, open('sql/load.sql', 'r').read())
        with open(filename, 'a', newline='') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow([i, 'load.sql', False, delta])
        print('Loaded data (without keys)...')

        # Search (without keys)
        for query in queries:
            delta = execute(params, open(
                queries_path + '/' + query, 'r').read())

            with open(filename, 'a', newline='') as csvfile:
                csvwriter = csv.writer(csvfile)
                csvwriter.writerow([i, query, False, delta])

            print(f'Executed query {query} (without keys)...')

        # Create Keys
        delta = execute(params, open('sql/create_keys.sql', 'r').read())
        with open(filename, 'a', newline='') as csvfile:
            csvwriter = csv.writer(csvfile)
            csvwriter.writerow([i, 'create_keys.sql', True, delta])
        print('Created keys...')

        # Search (with keys)
        for query in queries:
            delta = execute(params, open(
                queries_path + '/' + query, 'r').read())

            with open(filename, 'a', newline='') as csvfile:
                csvwriter = csv.writer(csvfile)
                csvwriter.writerow([i, query, True, delta])

            print(f'Executed query {query} (with keys)...')

def main():
    # execute(config(),str(open(f"sql/queries/Q{sys.argv[3]}.sql").read()))
    # execute(config(), open('sql/create_tables.sql').read())
    # execute(config(),open('sql/queries/Q1.sql', 'r').read())
    if len(sys.argv) == 3:
        run_tests(int(sys.argv[1]), sys.argv[2])
    else:
        print(f'Usage: {sys.argv[0]} N FILENAME')


if __name__ == '__main__':
    main()
