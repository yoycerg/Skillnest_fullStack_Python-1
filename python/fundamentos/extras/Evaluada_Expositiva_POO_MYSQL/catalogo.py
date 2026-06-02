class Plataforma:
    def __init__(self, id_plataforma, nombre):
        self.id_plataforma = id_plataforma
        self.nombre = nombre

    def mostrar_informacion(self):
        return f"ID: {self.id_plataforma}, Plataforma: {self.nombre}"


class Genero:
    def __init__(self, id_genero, nombre):
        self.id_genero = id_genero
        self.nombre = nombre

    def mostrar_informacion(self):
        return f"ID: {self.id_genero}, Genero: {self.nombre}"


class Formato:
    def __init__(self, id_formato, nombre):
        self.id_formato = id_formato
        self.nombre = nombre

    def mostrar_informacion(self):
        return f"ID: {self.id_formato}, Formato: {self.nombre}"
