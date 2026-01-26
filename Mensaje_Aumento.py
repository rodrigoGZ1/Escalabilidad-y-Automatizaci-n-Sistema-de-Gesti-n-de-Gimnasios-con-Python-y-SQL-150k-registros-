import pyodbc
import pywhatkit as whatsapp
import time
from mensajes import Mensajeria

config_conexion = (
    "Driver={SQL Server};"
    "Server=localhost;" 
    "Database=GIM;"            
    "Trusted_Connection=yes;"
)

try:
    conn = pyodbc.connect(config_conexion)
    cursor = conn.cursor()


    mis_mensajes = Mensajeria("nombre_gimnasio", "wasap")

    cursor.execute("SELECT VALOR  FROM PRECIOS")
    VALOR = cursor.fetchone()

    Aumento_Mensual= """
   select
   NOMBRE , TELEFONO 
   from
   socios
  
    """

    cursor.execute(Aumento_Mensual)

    lista_Precios_AC = cursor.fetchall()

    if lista_Precios_AC:
        print(f"Les informamos que este mes aumentara la cuota {len(lista_Precios_AC )} socios.")
        for socio in lista_Precios_AC:
         nombre = socio[0]
         telefono_final = "+549" + str(socio[1])
         texto = mis_mensajes.Aumento_mensual(nombre, VALOR[0])
         mis_mensajes.wasap(telefono_final, texto)
        
   
  
except Exception as e: 

    print(f"Error al conectar: {e}")

