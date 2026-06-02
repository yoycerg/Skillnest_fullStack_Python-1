class Usuario:
    def __init__(self, id_usuario, nombre_usuario, correo):
        self.id_usuario = id_usuario
        self.nombre_usuario = nombre_usuario
        self.correo = correo

    def mostrar_datos(self):
        return f"ID: {self.id_usuario}, Usuario: {self.nombre_usuario}, Correo: {self.correo}"
