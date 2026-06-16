import mysql.connector


class Conexion:

    @staticmethod
    def conectar():
        conexion = mysql.connector.connect(
            host="localhost",
            user="root",
            password="123456",
            database="tienda_videojuegos"
        )

        return conexion
