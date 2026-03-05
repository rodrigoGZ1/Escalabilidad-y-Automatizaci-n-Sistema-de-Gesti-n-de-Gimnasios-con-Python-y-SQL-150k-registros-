import pandas as pd
import csv

# 1. Cargamos el archivo original
df = pd.read_csv('Datos.csv')

# --- LIMPIEZA DE DATOS ---
df['DNI'] = pd.to_numeric(df['DNI'], errors='coerce').fillna(0).astype('int64')
df['NOMBRE'] = df['NOMBRE'].astype(str).str.strip().str.title().str[:99]
df['APELLIDO'] = df['APELLIDO'].astype(str).str.strip().str.title().str[:99]

# --- FECHAS (El escudo total contra el NULL) ---
df['FECHA_ADMISION'] = pd.to_datetime(df['FECHA_ADMISION'], dayfirst=True, errors='coerce')
# Si la fecha es inválida, ponemos 2024-01-01. NO puede quedar vacía.
df['FECHA_ADMISION'] = df['FECHA_ADMISION'].fillna(pd.Timestamp('2024-01-01')).dt.strftime('%Y-%m-%d')

df['TELEFONO'] = pd.to_numeric(df['TELEFONO'], errors='coerce').fillna(0).astype('int64')
df['EMAIL'] = df['EMAIL'].astype(str).str.strip().str.lower().str[:99]

df.insert(0, 'ID_VACIO', '0')

columnas_ordenadas = ['ID_VACIO', 'DNI', 'NOMBRE', 'APELLIDO', 'FECHA_ADMISION', 'TELEFONO', 'EMAIL']
df = df[columnas_ordenadas]

ruta_final = r'C:\Users\rodri\Desktop\Gimnasio\DATA_LIMPIA_GIMNASIO1.csv'

df.to_csv(ruta_final, index=False, sep=',', header=False, quoting=csv.QUOTE_NONE, escapechar=' ')

print(f" Archivo generado con {len(df)} filas. Revisá que no haya errores de 'DNI' en la columna de fechas.")
