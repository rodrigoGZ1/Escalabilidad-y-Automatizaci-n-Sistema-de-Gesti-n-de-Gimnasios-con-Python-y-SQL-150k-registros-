
import pyodbc
import pywhatkit as whatsapp
import time

config_conexion = (
    "Driver={SQL Server};"
    "Server=localhost;" 
    "Database=GIM;"            
    "Trusted_Connection=yes;"
)




 


class Mensajeria:

    def __init__(self, nombre_gimnasio, wasap):
        self.gimnasio = nombre_gimnasio  
        self.metodo_envio = wasap

    def recordatorio_deuda(self, nombre_socio):
        return f"Hola {nombre_socio}, te recordamos que tu cuota esta por vencer"
    
    def wasap(self, telefono, texto):

        return whatsapp.sendwhatmsg_instantly(telefono, texto, 15, True, 3)


    def Aumento_mensual(self, nombre_socio, monto):

        return f"Hola {nombre_socio}, tu cuota aumentó a ${monto}."


    def bienvenida(self, nombre_socio):
        return f"¡Bienvenido {nombre_socio} a {self.gimnasio}! Gracias por sumarte."

            
      
  





        