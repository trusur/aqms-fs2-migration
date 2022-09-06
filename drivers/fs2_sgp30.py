from __future__ import print_function
import sys
import serial
import time
import db_connect

is_SENSOR_connect = False
sensor_speed = 0
cur_sensor_state = 0

try:
    mydb = db_connect.connecting()
    mycursor = mydb.cursor()
    
    mycursor.execute("SELECT sensor_code,baud_rate FROM sensor_readers WHERE id = '"+ sys.argv[1] +"'")
    sensor_reader = mycursor.fetchone()
except Exception as e: 
    print("[X]  SENSOR Module ID: " + str(sys.argv[1]) + " " + e)
    
def update_sensor_value(sensor_reader_id,value):
    try:
        try:
            mycursor.execute("SELECT id FROM sensor_values WHERE sensor_reader_id = '"+ sensor_reader_id +"' AND pin = '0'")
            sensor_value_id = mycursor.fetchone()[0]
            mycursor.execute("UPDATE sensor_values SET value = '" + value + "' WHERE id = '" + str(sensor_value_id) + "'")
            mydb.commit()
        except Exception as e:
            mycursor.execute("INSERT INTO sensor_values (sensor_reader_id,pin,value) VALUES ('" + sensor_reader_id + "','0','" + value + "')")
            mydb.commit()
    except Exception as e2:
        return None
        
def connect_sensor():
    global is_SENSOR_connect
    try:
        mycursor.execute("SELECT sensor_code,baud_rate FROM sensor_readers WHERE id = '"+ sys.argv[1] +"'")
        sensor_reader = mycursor.fetchone()
        
        COM_SENSOR = serial.Serial(sensor_reader[0], sensor_reader[1])
        SENSOR = str(COM_SENSOR.readline())
        if(SENSOR.count("FS2_SGP30") > 0):
            is_SENSOR_connect = True
            print("[V] FS2 SGP30 Module " + sensor_reader[0] + " CONNECTED")
            returnval = COM_SENSOR
        else:
            is_SENSOR_connect = False
            returnval = None
        
        return returnval
            
    except Exception as e: 
        return None
    
connect_sensor()

try:
    while True :
        try:
            if(not is_SENSOR_connect):
                COM_SENSOR = connect_sensor()
                
            SENSOR = str(COM_SENSOR.readline())
            if(SENSOR.count("FS2_SGP30") <= 0):
                SENSOR = "FS2_SGP30;0;0;0;0;\\r\\n'"
                
            update_sensor_value(str(sys.argv[1]),SENSOR.replace("'","''"))
            
        except Exception as e2:
            print(e2)
            is_SENSOR_connect = False
            print("Reconnect FS2 SGP30 Module ID: " + str(sys.argv[1]));
            update_sensor_value(str(sys.argv[1]),0)
        
        time.sleep(1)
        
except Exception as e: 
    print(e)
