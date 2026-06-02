class Compra:
    def __init__(self, id_compra, cliente, juego, cantidad):
        self.id_compra = id_compra
        self.cliente = cliente
        self.juego = juego
        self.cantidad = cantidad
        self.precio_unitario = juego.precio
        self.pagada = False

    def registrar_compra(self):
        if self.pagada:
            return f"La compra {self.id_compra} ya fue registrada."

        if self.juego.vender(self.cantidad):
            self.pagada = True
            return (
                f"Compra registrada: {self.cliente.nombre} compro "
                f"{self.cantidad} unidad(es) de '{self.juego.titulo}'. "
                f"Total: ${self.total()}"
            )

        return f"No hay stock suficiente para '{self.juego.titulo}'."

    def total(self):
        return self.cantidad * self.precio_unitario

    def mostrar_informacion(self):
        estado = "Pagada" if self.pagada else "Pendiente"
        return (
            f"ID: {self.id_compra}, Cliente: {self.cliente.nombre}, "
            f"Juego: {self.juego.titulo}, Cantidad: {self.cantidad}, "
            f"Total: ${self.total()}, Estado: {estado}"
        )
