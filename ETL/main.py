import os
import pyodbc
import time
from colorama import init, Fore

# Inicializar colorama para dar formato a los mensajes en la terminal
init(autoreset=True)

def simulate_etl_process():
    print(Fore.CYAN + "Iniciando proceso ETL...\n")
    
    # Extracción de datos
    print(Fore.YELLOW + "Etapa 1: Extracción de datos")
    for i in range(1, 21):
        print(Fore.YELLOW + f"  Extrayendo datos: {i * 5}% completado", end='\r')
        time.sleep(0.8)  # Simular extracción
    print(Fore.GREEN + "  Datos extraídos correctamente.\n")
    
    # Transformación de datos
    print(Fore.YELLOW + "Etapa 2: Transformación de datos")
    for i in range(1, 11):
        print(Fore.YELLOW + f"  Aplicando transformaciones: {i * 10}% completado", end='\r')
        time.sleep(1)  # Simular transformación
    print(Fore.GREEN + "  Datos transformados correctamente.\n")
    
    # Carga de datos
    print(Fore.YELLOW + "Etapa 3: Carga de datos a la base de datos")
    for i in range(1, 11):
        print(Fore.YELLOW + f"  Cargando datos: {i * 10}% completado", end='\r')
        time.sleep(1.2)  # Simular carga
    print(Fore.GREEN + "  Datos cargados correctamente.\n")
    
    print(Fore.CYAN + "Proceso ETL completado")

# Resto del código...



# Configura los detalles de la conexión a la base de datos
server = 'HERICK\SQLEXPRESS'
database = 'warehouse'
conn_str = f'DRIVER={{SQL Server}};SERVER={server};DATABASE={database};Integrated Security=True'

# Establece la conexión
conn = pyodbc.connect(conn_str)
cursor = conn.cursor()

# Ruta al archivo JULIO.SQL
sql_file_path = os.path.join('python-etl', 'JULIO.SQL')

# Lee el contenido del archivo JULIO.SQL
with open(sql_file_path, 'r') as file:
    sql_script = file.read()

# Simula el proceso ETL
simulate_etl_process()


# Cierra la conexión
cursor.close()
conn.close()
