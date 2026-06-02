import os
from usuario import Usuario
from cliente import Cliente
from catalogo import Plataforma, Genero, Formato
from juego import Juego
from compra import Compra

def limpiar_consola():
    os.system('cls' if os.name == 'nt' else 'clear')

usuarios = []
clientes = []
plataformas = []
generos = []
formatos = []
juegos = []
compras = []

while True:
    limpiar_consola()
    print("\nMenu Tienda de Videojuegos")
    print("1. Mostrar usuarios")
    print("2. Mostrar clientes")
    print("3. Mostrar juegos")
    print("4. Registrar compras")
    print("5. Mostrar compras")
    print("6. Salir")

    opcion = input("Seleccione una opcion: ")

    if opcion == "1":
        if not usuarios:
            print("No hay usuarios registrados.")
        for u in usuarios:
            print(u.mostrar_datos())

    elif opcion == "2":
        if not clientes:
            print("No hay clientes registrados.")
        for c in clientes:
            print(c.mostrar_datos())

    elif opcion == "3":
        if not juegos:
            print("No hay juegos registrados.")
        for j in juegos:
            print(j.mostrar_informacion())

    elif opcion == "4":
        if not compras:
            print("No hay compras pendientes.")
        for c in compras:
            print(c.registrar_compra())

    elif opcion == "5":
        if not compras:
            print("No hay compras registradas.")
        for c in compras:
            print(c.mostrar_informacion())

    elif opcion == "6":
        print("Saliendo del programa...")
        break

    else:
        print("Opcion no valida, por favor intente de nuevo.")

    input("\nPresione Enter para continuar...")
