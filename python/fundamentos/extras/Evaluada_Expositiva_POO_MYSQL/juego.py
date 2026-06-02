class Juego:
    def __init__(self, id_juego, titulo, precio, stock, plataforma, genero, formato):
        self.id_juego = id_juego
        self.titulo = titulo
        self.precio = precio
        self.stock = stock
        self.plataforma = plataforma
        self.genero = genero
        self.formato = formato

    def mostrar_informacion(self):
        return (
            f"ID: {self.id_juego}, Titulo: {self.titulo}, Precio: ${self.precio}, "
            f"Stock: {self.stock}, Plataforma: {self.plataforma.nombre}, "
            f"Genero: {self.genero.nombre}, Formato: {self.formato.nombre}"
        )

    def vender(self, cantidad):
        if self.stock >= cantidad:
            self.stock -= cantidad
            return True
        return False
