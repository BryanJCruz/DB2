from flask import Flask, jsonify, request
from DML import DML

app = Flask(__name__)
instance = DML("localhost", "BRYAN", "CADETE4507", "taller_vistas")

@app.route("/")
def inicio():
    return jsonify({"API": "BIENVENIDOS !!"})


@app.route("/api/<nombre>")
def consultar(nombre):
    if nombre in ["proveedor", "Reporte_Proveedor", "partes", "proveedor_partes", "vListadoDeProvedores", "vPartes", "vReporteAlmacen"]:
        instance.conectar()
        instance.consultar("SELECT * FROM " + nombre)
        instance.closed_connection()
        return jsonify(instance.result)
    else:
        return jsonify({"mensaje": "Consulta no Disponible ! :"})

@app.route("/api/insertar/partes")
def insertar_partes():
    data = request.args.to_dict()
    query = "INSERT INTO partes (partes, color, peso, ciudad) VALUES (%s, %s, %s, %s)"
    instance.conectar()
    instance.insertar(query, (data['partes'], data['color'], data['peso'], data['ciudad']))
    instance.closed_connection()
    return jsonify({"message": "Datos insertados correctamente en la tabla partes"}), 200

@app.route("/api/insertar/proveedor")
def insertar_proveedor():
    data = request.args.to_dict()
    query = "INSERT INTO proveedor (proveedor, status, ciudad) VALUES (%s, %s, %s)"
    instance.conectar()
    instance.insertar(query, (data['proveedor'], data['status'], data['ciudad']))
    instance.closed_connection()
    return jsonify({"message": "Datos insertados correctamente en la tabla proveedor"}), 200

@app.route("/api/insertar/proveedor_partes")
def insertar_proveedor_partes():
    data = request.args.to_dict()
    query = "INSERT INTO proveedor_partes (code, proveedor_id, partes_id, cantidad) VALUES (%s, %s, %s, %s)"
    instance.conectar()
    instance.insertar(query, (data['code'], data['proveedor_id'], data['partes_id'], data['cantidad']))
    instance.closed_connection()
    return jsonify({"message": "Datos insertados correctamente en la tabla proveedor_partes"}), 200


@app.route("/api/actualizar/partes/<partes_id>")
def actualizar_partes(partes_id):
    data = request.args.to_dict() 
    query = "UPDATE partes SET "
    set_clause = ", ".join([f"{key} = %s" for key in data.keys()])
    query += set_clause + " WHERE id = %s"
    values = list(data.values())
    values.append(partes_id) 
    instance.conectar()
    instance.actualizar(query, tuple(values))
    instance.closed_connection()
    return jsonify({"message": "Datos actualizados correctamente en la tabla partes"}), 200


@app.route("/api/actualizar/proveedor/<proveedor_id>")
def actualizar_proveedor(proveedor_id):
    data = request.args.to_dict()  
    query = "UPDATE proveedor SET "

    set_clause = ", ".join([f"{key} = %s" for key in data.keys()])
    query += set_clause + " WHERE id = %s"
    
    values = list(data.values())
    values.append(proveedor_id) 
    instance.conectar()
    instance.actualizar(query, tuple(values))
    instance.closed_connection()

    return jsonify({"message": "Datos actualizados correctamente en la tabla proveedor"}), 200


@app.route("/api/actualizar/proveedor_partes/<code>")
def actualizar_proveedor_partes(code):
    data = request.args.to_dict()  # Obtener los datos enviados como parámetros en la URL

    # Construir la consulta de actualización
    query = "UPDATE proveedor_partes SET "

    # Construir la parte SET de la consulta dinámicamente
    set_clause = ", ".join([f"{key} = %s" for key in data.keys()])
    query += set_clause + " WHERE code = %s"
    
    # Crear una lista de valores para la consulta
    values = list(data.values())
    values.append(code)  # Agregar el code al final de la lista de valores

    instance.conectar()
    instance.actualizar(query, tuple(values))
    instance.closed_connection()

    return jsonify({"message": "Datos actualizados correctamente en la tabla proveedor_partes"}), 200


@app.route("/api/eliminar/partes/<partes_id>")
def eliminar_partes(partes_id):
    query = "DELETE FROM partes WHERE id = %s"

    instance.conectar()
    instance.eliminar(query, (partes_id,))
    instance.closed_connection()

    return jsonify({"message": f"Datos con ID {partes_id} eliminados correctamente de la tabla partes"}), 200


@app.route("/api/eliminar/proveedor/<proveedor_id>")
def eliminar_proveedor(proveedor_id):
    # Primero, elimina los registros asociados en la tabla proveedor_partes para poder eliminar partes
    query_eliminar_proveedor_partes = "DELETE FROM proveedor_partes WHERE proveedor_id = %s"
    values = (proveedor_id,)
    instance.conectar()
    instance.eliminar(query_eliminar_proveedor_partes, values)
    # Luego, elimina el proveedor
    query_eliminar_proveedor = "DELETE FROM proveedor WHERE id = %s"
    instance.eliminar(query_eliminar_proveedor, values)
    instance.closed_connection()
    return jsonify({"message": f"Datos con ID {proveedor_id} eliminados correctamente de la tabla proveedor"}), 200



if __name__ == '__main__':
    app.run(debug=True)

