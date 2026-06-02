class Cliente:
    def __init__(self, id_cliente, rut, nombre, telefono, correo):
        self.id_cliente = id_cliente
        self.rut = rut
        self.nombre = nombre
        self.telefono = telefono
        self.correo = correo

    def mostrar_datos(self):
        return (
            f"ID: {self.id_cliente}, RUT: {self.rut}, Nombre: {self.nombre}, "
            f"Telefono: {self.telefono}, Correo: {self.correo}"
        )
