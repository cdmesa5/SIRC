import web
import mysql.connector

db_connection = mysql.connector.connect(
  host="localhost",
  user="root",
  passwd="Spv20531.",
  database="sirc"
)
# creating database_cursor to perform SQL operation

db_cursor = db_connection.cursor()

class Model:

    def get_users(self):
      sql_select = "SELECT * FROM usuario"
      db_cursor.execute(sql_select)
      records = db_cursor.fetchall()
      return records

    def insert_user(self, var):
        sql_insert = "INSERT INTO usuario (idUsuario, Nombre, Apellido, Email) VALUES (%s, %s, %s, %s)" 
        db_cursor.execute(sql_insert, var)
        db_connection.commit()