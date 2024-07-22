import mysql.connector as connector
 
from flask import Flask, request, jsonify from flask_mysqldb import MySQL
from flask_cors import cross_origin,CORS from decimal import Decimal
import json
'''mydb = connector.connect( host="localhost",
user="root", passwd="ajju", database="stationary", port=3006
)
cursor = mydb.cursor()''' app = Flask( name )
app.config['MYSQL_HOST']='localhost' app.config['MYSQL_USER']='****' app.config['MYSQL_PASSWORD']='****' app.config['MYSQL_DB']='stationary' app.config['MYSQL_PORT']=**** mysql=MySQL(app)
CORS(app,supports_credentials=True) @app.route('/get_data')
@cross_origin(origins="*") def get_data():
cur = mysql.connection.cursor()
cur.execute("SELECT * FROM stationary_items") row_headers = [x[0] for x in cur.description]
rv=cur.fetchall() json_data=[] '''for result in rv:
from decimal import Decimal
 
decimal_value = Decimal('123.4')
json_data = json.dumps(float(decimal_value)) json_data.append(dict(zip(row_headers,result)))
return json.dumps(json_data) #results = cursor.fetchall()''' for result in rv:
converted_result = list(result)
for i in range(len(converted_result)):
if isinstance(converted_result[i], Decimal):
converted_result[i] = float(converted_result[i]) json_data.append(dict(zip(row_headers, converted_result)))
return json.dumps(json_data) @app.route('/update_table',methods=['POST']) def update_table():
response = request.get_json()
cur = mysql.connection.cursor()
cur.execute("UPDATE stationary_items SET quantity = %s WHERE id =
%s",(response['quantity'],response['id'])) mysql.connection.commit()
print(response) return response
@app.route('/commit') def commit():
mysql.connection.commit() return "Done"
if     name 	== " main ": app.run('0.0.0.0',debug=True)
