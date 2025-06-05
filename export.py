import json
import sqlite3

# Configuración de la base de datos
db_path = "n8n_data/database.sqlite"
table_name = "workflow_entity"

# Conectar a la base de datos
conn = sqlite3.connect(db_path)
cursor = conn.cursor()

# Obtener todas las filas de la tabla
cursor.execute(f"SELECT name, nodes AS n_nodes, connections AS n_connections FROM {table_name}")
rows = cursor.fetchall()

print("Lista de workflows disponibles:")
for i, row in enumerate(rows):
    print(f"{i + 1}. {row[0]}")

# Obtener entrada del usuario
try:
    selection = int(input("\nIngrese el número de la fila a elegir: ")) - 1
    if selection < 0 or selection >= len(rows):
        print("Selección inválida. Por favor, ingrese un número entre 1 y", len(rows))
        exit(1)

    # Obtener la fila seleccionada
    selected_row = rows[selection]
    name, n_nodes_value, n_connections_value = selected_row

    # Sanitizar el nombre: convertir a minúsculas y reemplazar espacios por _
    filename = name.replace(" ", "_").lower()

    # Limpiar los caracteres de escape del JSON
    n_nodes_value = json.loads(n_nodes_value)
    n_connections_value = json.loads(n_connections_value)

    # Crear contenido JSON
    json_content = {
        "nodes": n_nodes_value,
        "connections": n_connections_value
    }

    # Guardar en archivo JSON
    with open(f"exports/{filename}.json", "w") as json_file:
        json.dump(json_content, json_file)

    print(f"\nArchivo generado: {filename}.json")

except Exception as e:
    print(f"Ocurrió un error: {str(e)}")

finally:
    conn.close()
