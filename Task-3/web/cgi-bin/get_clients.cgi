#!/usr/bin/python3
# -*- coding: UTF-8 -*-

import json
import psycopg2
import sys
sys.path.insert(0, '/afs/.ist.utl.pt/users/3/2/ist1103432/web/impossible/to/find/this')
import not_login

print("Content-type: application/json\n")

conn = psycopg2.connect(not_login.credentials)

cursor = conn.cursor()

cursor.execute('SELECT * FROM customer ORDER BY cust_no;')
rows = cursor.fetchall()

print(json.dumps(rows))