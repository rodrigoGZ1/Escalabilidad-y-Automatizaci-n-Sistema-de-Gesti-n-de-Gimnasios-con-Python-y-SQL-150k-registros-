import sqlite3
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

    cursor.execute("SELECT TOP 1 ID_PAGO as numero_pago, MONTO FROM PAGOS ORDER BY ID_PAGO DESC")
    columna = cursor.fetchone()
    
    if columna:
        print(f"Verificación: El último pago en la base es de ${columna}")
    else:
        print("La conexión funciona, pero la tabla está vacía.")

    mis_mensajes = Mensajeria("nombre_gimnasio", "wasap")

    consulta_deudores = """
    select
    s.nombre, s.telefono
    from 
    SOCIOS s
    join
    pagos p on s.ID_SOCIOS_AP = p.ID_SOCIOS_AP
    where
    mes_correspondiente = MONTH(GETDATE());  
    """
    cursor.execute(consulta_deudores)

    lista_deudores = cursor.fetchall()

    if lista_deudores:
        print(f"Se encontraron {len(lista_deudores)} socios con deudas")
        for socio in lista_deudores:
         nombre = socio[0]
         telefono_final = "+549" + str(socio[1])
         texto = mis_mensajes.recordatorio_deuda(nombre)
         
         mis_mensajes.wasap(telefono_final, texto)
   
    else:
      texto = mis_mensajes.socios_pagos()


except Exception as e: 

    print(f"Error al conectar: {e}")

  