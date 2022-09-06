from mysql.connector.constants import ClientFlag
import mysql.connector

def connecting():
    try:
        return mysql.connector.connect(host="localhost",user="root",passwd="root",database="aqms_fs2")
    except Exception as e: 
        return false