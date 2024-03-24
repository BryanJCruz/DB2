from flask import Flask, jsonify, request
from DML import DML

app = Flask(__name__)
instance = DML("localhost", "BRYAN", "CADETE4507", "TALLER")


#---------------------------------------VALIDACIONES------------------------------------------
def validar_perfil(data):
    required_fields = ['ID', 'NOM', 'FECHA_VIGENCIA', 'DESCRIPTION', 'ENCARGADO']
    for field in required_fields:
        if field not in data:
            return False
    return True

def validar_usuario(data):
    required_fields = ['ID', 'NOM', 'APE', 'ESTADO', 'PASSWORD', 'CARGO', 'SALARIO', 'FECHA_INGRESO', 'PREFIL_ID']
    for field in required_fields:
        if field not in data:
            return False
    return True

def validar_login(data):
    required_fields = ['ID', 'USUARIO_ID', 'FECHA_HORA']
    for field in required_fields:
        if field not in data:
            return False
    return True

def validar_actividad(data):
    required_fields = ['ID', 'AC_NAME', 'FECHA']
    for field in required_fields:
        if field not in data:
            return False
    return True
    
def validar_fidelizacion(data):
    required_fields = ['ID', 'USUARIO_ID', 'ACTIVIDAD_ID', 'FECHA']
    for field in required_fields:
        if field not in data:
            return False
    return True
    
def validar_usuario_actividad(data):
    required_fields = ['USUARIO_ID', 'ACTIVIDADES_ID']
    for field in required_fields:
        if field not in data:
            return False
    return True
    
def validar_puntos(data):
    required_fields = ['ID', 'USUARIO_ID', 'AC_ID', 'PUNTOS']
    for field in required_fields:
        if field not in data:
            return False
    return True
    

def usuario_existe(usuario_id):
    query = "SELECT * FROM USUARIOS WHERE ID = %s"
    conectar_bd()
    instance.consultar_por_id(query, usuario_id)
    usuario = instance.result
    cerrar_bd()
    return True if usuario else False

def perfil_existe(perfil_id):
    query = "SELECT * FROM PERFILES WHERE ID = %s"
    conectar_bd()
    instance.consultar_por_id(query, perfil_id)
    usuario = instance.result
    cerrar_bd()
    return True if usuario else False
    
def actividades_existe(actividades_id):
    query = "SELECT * FROM ACTIVIDADES WHERE ID = %s"
    conectar_bd()
    instance.consultar_por_id(query, actividades_id)
    usuario = instance.result
    cerrar_bd()
    return True if usuario else False

def fidelizacion_existe(fidelizacion_id):
    query = "SELECT * FROM FIDELIZACION WHERE ID = %s"
    conectar_bd()
    instance.consultar_por_id(query, fidelizacion_id)
    usuario = instance.result
    cerrar_bd()
    return True if usuario else False
    
def UA_existe(UA_id):
    query = "SELECT * FROM USUARIO_ACTIVIDAD WHERE ID = %s"
    conectar_bd()
    instance.consultar_por_id(query, UA_id)
    usuario = instance.result
    cerrar_bd()
    return True if usuario else False

def puntos_existe(puntos_id):
    query = "SELECT * FROM PUNTOS WHERE ID = %s"
    conectar_bd()
    instance.consultar_por_id(query, puntos_id)
    usuario = instance.result
    cerrar_bd()
    return True if usuario else False
    
def login_existe(login_id):
    query = "SELECT * FROM LOGIN WHERE ID = %s"
    conectar_bd()
    instance.consultar_por_id(query, login_id)
    usuario = instance.result
    cerrar_bd()
    return True if usuario else False
        
    
    
    


def eliminar_fidelizacion(fidelizacion_id):
    # Verificar si la fidelización existe antes de intentar eliminarla
    if not fidelizacion_existe(fidelizacion_id):
        return jsonify({"error": "La fidelización no existe"}), 404
    
    try:
        # Eliminar la fidelización de la base de datos
        query = "DELETE FROM FIDELIZACION WHERE ID = %s"
        conectar_bd()
        instance.eliminar(query, (fidelizacion_id,))
        cerrar_bd()
        return jsonify({"message": "Fidelización eliminada correctamente"}), 200
    except Exception as e:
        # Manejar cualquier error que pueda ocurrir durante la eliminación
        return jsonify({"error": "Error al eliminar la fidelización", "details": str(e)}), 500


    
    
    
#-----------------------------------conexiones--------------------------------------------------
def conectar_bd():
    instance.conectar()

def cerrar_bd():
    instance.closed_connection()




#----------------------------------------funciones de la api-----------------------------------------
@app.route("/")
def inicio():
    return jsonify({"API": "BIENVENIDOS !!"})

@app.route("/taller/<nombre>")  # <-- realiza todas las consultas disponibles en la api retorna datos en JSON
def consultar(nombre):
    tablas_disponibles = ["ACTIVIDADES", "FIDELIZACION", "FIDELIZACION_ANUAL", "LOGIN", "PERFILES", "PUNTOS", "REGISTRO_ACTIVIDADES_ANUALES", "REGISTRO_DE_USUARIO", "USUARIOS", "USUARIO_ACTIVIDAD","TOP_PUNTOS"]

    if nombre in tablas_disponibles:
        conectar_bd()
        instance.consultar("SELECT * FROM " + nombre)
        cerrar_bd()
        return jsonify(instance.result)
    else:
        return jsonify({"mensaje": "Consulta no Disponible ! :"}) 

@app.route("/taller/insertar/perfiles", methods=['GET', 'POST'])   #   <-- inserta datos en la tabla de perfiles metodo POST y datos en json
def insertar_perfiles():
    if request.method == 'POST':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not validar_perfil(data):
            return jsonify({"error": "Datos incompletos"}), 400

        query = "INSERT INTO PERFILES (ID, NOM, FECHA_VIGENCIA, DESCRIPTION, ENCARGADO) VALUES (%s, %s, %s, %s, %s)"
        conectar_bd()
        instance.insertar(query, (data['ID'], data['NOM'], data['FECHA_VIGENCIA'], data['DESCRIPTION'], data['ENCARGADO']))
        cerrar_bd()
        return jsonify({"message": "Datos insertados correctamente en la tabla perfiles"}), 200
    else:
        return jsonify({"message": "Esta ruta acepta solicitudes POST para insertar perfiles"}), 405


@app.route("/taller/insertar/usuarios", methods=['POST'])  #   <-- inserta datos en la tabla de usuarios metodo POST y datos en json
def insertar_usuarios():
    if request.method == 'POST':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not validar_usuario(data):
            return jsonify({"error": "Datos de usuario incompletos"}), 400

        query = "INSERT INTO USUARIOS (ID, NOM, APE, ESTADO, PASSWORD, CARGO, SALARIO, FECHA_INGRESO, PREFIL_ID) VALUES (%s, %s, %s, %s, %s, %s, %s, %s, %s)"
        conectar_bd()
        instance.insertar(query, (data['ID'], data['NOM'], data['APE'], data['ESTADO'], data['PASSWORD'], data['CARGO'], data['SALARIO'], data['FECHA_INGRESO'], data['PREFIL_ID']))
        cerrar_bd()
        return jsonify({"message": "Datos insertados correctamente en la tabla usuarios"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes POST para insertar usuarios"}), 405



@app.route("/taller/insertar/login", methods=['POST'])   #   <-- inserta datos en la tabla de login para llevar el registro de autenticaciones "acceso"
def insertar_login():
    if request.method == 'POST':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not validar_login(data):
            return jsonify({"error": "Datos de login incompletos"}), 400

        query = "INSERT INTO LOGIN (ID, USUARIO_ID, FECHA_HORA) VALUES (%s, %s, %s)"
        conectar_bd()
        instance.insertar(query, (data['ID'], data['USUARIO_ID'], data['FECHA_HORA']))
        cerrar_bd()
        return jsonify({"message": "Datos insertados correctamente en la tabla login"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes POST para insertar datos en login"}), 405


@app.route("/taller/insertar/actividades", methods=['POST'])   #<-- inserta datos en la tabla de ACTIVIDADES metodo POST y datos en json
def insertar_actividades():
    if request.method == 'POST':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not validar_actividad(data):
            return jsonify({"error": "Datos de actividad incompletos"}), 400

        query = "INSERT INTO ACTIVIDADES (ID, AC_NAME, FECHA) VALUES (%s, %s, %s)"
        conectar_bd()
        instance.insertar(query, (data['ID'], data['AC_NAME'], data['FECHA']))
        cerrar_bd()
        return jsonify({"message": "Datos insertados correctamente en la tabla actividades"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes POST para insertar datos en actividades"}), 405



@app.route("/taller/insertar/fidelizacion", methods=['POST']) #<-- inserta datos en la tabla de FIDELIZACION metodo POST y datos en json
def insertar_fidelizacion():
    if request.method == 'POST':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not validar_fidelizacion(data):
            return jsonify({"error": "Datos de fidelización incompletos"}), 400

        query = "INSERT INTO FIDELIZACION (ID, USUARIO_ID, ACTIVIDAD_ID, FECHA) VALUES (%s, %s, %s, %s)"
        conectar_bd()
        instance.insertar(query, (data['ID'], data['USUARIO_ID'], data['ACTIVIDAD_ID'], data['FECHA']))
        cerrar_bd()
        return jsonify({"message": "Datos insertados correctamente en la tabla fidelización"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes POST para insertar datos en fidelización"}), 405
        
@app.route("/taller/insertar/usuario_actividad", methods=['POST'])  #<-- inserta datos en la tabla intermedia entre usuarios y actividades metodo POST y datos en json
def insertar_usuario_actividad():
    if request.method == 'POST':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not validar_usuario_actividad(data):
            return jsonify({"error": "Datos de usuario_actividad incompletos"}), 400

        query = "INSERT INTO USUARIO_ACTIVIDAD (USUARIO_ID, ACTIVIDADES_ID) VALUES (%s, %s)"
        conectar_bd()
        instance.insertar(query, (data['USUARIO_ID'], data['ACTIVIDADES_ID']))
        cerrar_bd()
        return jsonify({"message": "Datos insertados correctamente en la tabla usuario_actividad"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes POST para insertar datos en usuario_actividad"}), 405

@app.route("/taller/insertar/puntos", methods=['POST'])  #<-- inserta datos en la tabla puntos metodo POST y datos en json
def insertar_puntos():
    if request.method == 'POST':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not validar_puntos(data):
            return jsonify({"error": "Datos de puntos incompletos"}), 400

        query = "INSERT INTO PUNTOS (ID, USUARIO_ID, AC_ID, PUNTOS) VALUES (%s, %s, %s, %s)"
        conectar_bd()
        instance.insertar(query, (data['ID'], data['USUARIO_ID'], data['AC_ID'], data['PUNTOS']))
        cerrar_bd()
        return jsonify({"message": "Datos insertados correctamente en la tabla puntos"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes POST para insertar datos en puntos"}), 405

#<!--------------------------------------------------------------------------------------------------------------------------------->


@app.route("/taller/actualizar/usuarios/<usuario_id>", methods=['PUT'])  # <-- actualiza datos de la tabla USUARIOS búsqueda por ID
def actualizar_usuario(usuario_id):
    if request.method == 'PUT':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not usuario_existe(usuario_id):
            return jsonify({"error": "El usuario no existe"}), 404

        query = "UPDATE USUARIOS SET NOM = %s, APE = %s, ESTADO = %s, PASSWORD = %s, CARGO = %s, SALARIO = %s, FECHA_INGRESO = %s, PREFIL_ID = %s WHERE ID = %s"
        conectar_bd()
        instance.actualizar(query, (data['NOM'], data['APE'], data['ESTADO'], data['PASSWORD'], data['CARGO'], data['SALARIO'], data['FECHA_INGRESO'], data['PREFIL_ID'], usuario_id))
        cerrar_bd()
        return jsonify({"message": "Datos actualizados correctamente para el usuario"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes PUT para actualizar datos de usuarios"}), 405


@app.route("/taller/actualizar/perfiles/<perfil_id>", methods=['PUT']) # <-- actualiza los datos de la tabla de perfiles primero consulta la id y si existe se pueden editar los datos 
def actualizar_perfil(perfil_id):
    if request.method == 'PUT':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not perfil_existe(perfil_id):
            return jsonify({"error": "El perfil no existe"}), 404

        query = "UPDATE PERFILES SET NOM = %s, FECHA_VIGENCIA = %s, DESCRIPTION = %s, ENCARGADO = %s WHERE ID = %s"
        conectar_bd()
        instance.actualizar(query, (data['NOM'], data['FECHA_VIGENCIA'], data['DESCRIPTION'], data['ENCARGADO'], perfil_id))
        cerrar_bd()
        return jsonify({"message": "Datos actualizados correctamente para el perfil"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes PUT para actualizar datos de perfiles"}), 405


@app.route("/taller/actualizar/actividades/<actividades_id>", methods=['PUT'])  # <-- actualiza datos de la tabla de actividades realiza una consilta por id , si existe la id realiza la actualizacion  metodo PUT y datos JSON
def actualizar_actividades(actividades_id):
    if request.method == 'PUT':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not actividades_existe(actividades_id):
            return jsonify({"error": "La actividad no existe"}), 404

        query = "UPDATE ACTIVIDADES SET AC_NAME = %s, FECHA = %s WHERE ID = %s"
        conectar_bd()
        instance.actualizar(query, (data['AC_NAME'], data['FECHA'], actividades_id))
        cerrar_bd()
        return jsonify({"message": "Datos de la actividad actualizados correctamente"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes PUT para actualizar datos de actividades"}), 405


@app.route("/taller/actualizar/fidelizacion/<fidelizacion_id>", methods=['PUT']) #<-- actualiza datos en la tabla de FIDELIZACION
def actualizar_fidelizacion(fidelizacion_id):
    if request.method == 'PUT':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not fidelizacion_existe(fidelizacion_id):
            return jsonify({"error": "La fidelización no existe"}), 404

        query = "UPDATE FIDELIZACION SET USUARIO_ID = %s, ACTIVIDAD_ID = %s, FECHA = %s WHERE ID = %s"
        conectar_bd()
        instance.actualizar(query, (data['USUARIO_ID'], data['ACTIVIDAD_ID'], data['FECHA'], fidelizacion_id))
        cerrar_bd()
        return jsonify({"message": "Datos de fidelización actualizados correctamente"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes PUT para actualizar datos de fidelización"}), 405



@app.route("/taller/actualizar/usuario_actividad/<ua_id>", methods=['PUT'])  # <-- actualiza datos de la tabla intermedia de actividades y usuarios
def actualizar_usuario_actividad(ua_id):
    if request.method == 'PUT':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not UA_existe(ua_id):
            return jsonify({"error": "La relación Usuario-Actividad no existe"}), 404

        query = "UPDATE USUARIO_ACTIVIDAD SET USUARIO_ID = %s, ACTIVIDADES_ID = %s WHERE ID = %s"
        conectar_bd()
        instance.actualizar(query, (data['USUARIO_ID'], data['ACTIVIDADES_ID'], ua_id))
        cerrar_bd()
        return jsonify({"message": "Datos actualizados correctamente para la relación Usuario-Actividad"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes PUT para actualizar datos de la relación Usuario-Actividad"}), 405



@app.route("/taller/actualizar/puntos/<puntos_id>", methods=['PUT'])  # <-- actualiza datos de la tabla de puntos
def actualizar_puntos(puntos_id):
    if request.method == 'PUT':
        data = request.json
        if not data:
            return jsonify({"error": "Datos no proporcionados en formato JSON"}), 400

        if not puntos_existe(puntos_id):
            return jsonify({"error": "El registro de puntos no existe"}), 404

        query = "UPDATE PUNTOS SET USUARIO_ID = %s, AC_ID = %s, PUNTOS = %s WHERE ID = %s"
        conectar_bd()
        instance.actualizar(query, (data['USUARIO_ID'], data['AC_ID'], data['PUNTOS'], puntos_id))
        cerrar_bd()
        return jsonify({"message": "Datos actualizados correctamente para el registro de puntos"}), 200
    else:
        return jsonify({"message": "Esta ruta solo acepta solicitudes PUT para actualizar datos de puntos"}), 405


@app.route("/eliminar_fidelizacion/<fidelizacion_id>", methods=['DELETE'])  # <-- elimina registros de la tabla de fidelizacion
def eliminar_fidelizacion_route(fidelizacion_id):
    return eliminar_fidelizacion(fidelizacion_id)


from flask import jsonify

@app.route('/eliminar_puntos/<string:puntos_id>', methods=['DELETE'])  # <-- elimina datos de la tabla de puntos
def eliminar_puntos(puntos_id):
    if not puntos_existe(puntos_id):
        return jsonify({"error": "El registro de puntos no existe"}), 404
    
    try:
        query = "DELETE FROM PUNTOS WHERE ID = %s"
        conectar_bd()
        instance.eliminar(query, (puntos_id,))
        cerrar_bd()
        return jsonify({"message": "Registro de puntos eliminado correctamente"}), 200
    except Exception as e:
        return jsonify({"error": "Error al eliminar el registro de puntos", "details": str(e)}), 500


@app.route('/eliminar_usuario_actividad/<string:UA_id>', methods=['DELETE'])  # <-- elimina datos de la tabla intermedia entre usuarios y actividad
def eliminar_usuario_actividad(UA_id):
    if not UA_existe(UA_id):
        return jsonify({"error": "El registro de usuario_actividad no existe"}), 404
    
    try:
        query = "DELETE FROM USUARIO_ACTIVIDAD WHERE ID = %s"
        conectar_bd()
        instance.eliminar(query, (UA_id,))
        cerrar_bd()
        return jsonify({"message": "Registro de usuario_actividad eliminado correctamente"}), 200
    except Exception as e:
        return jsonify({"error": "Error al eliminar el registro de usuario_actividad", "details": str(e)}), 500


@app.route('/eliminar_actividades/<string:actividades_id>', methods=['DELETE'])   # <-- elimina datos de la tabla de ACTIVIDADES
def eliminar_actividades(actividades_id):
    if not actividades_existe(actividades_id):
        return jsonify({"error": "El registro de actividades no existe"}), 404
    
    try:
        query = "DELETE FROM ACTIVIDADES WHERE ID = %s"
        conectar_bd()
        instance.eliminar(query, (actividades_id,))
        cerrar_bd()
        return jsonify({"message": "Registro de actividades eliminado correctamente"}), 200
    except Exception as e:
        return jsonify({"error": "Error al eliminar el registro de actividades", "details": str(e)}), 500

@app.route('/eliminar_usuario/<string:usuario_id>', methods=['DELETE'])  # <-- elimina usuarios !! para eliminar 1 usuario debe eliminar primero todas sus relaciones o tablas donde aparece la id de el usuario a eliminar es mas recomendable cambiar el estado del usuario a INACTIVO
def eliminar_usuario(usuario_id):
    if not usuario_existe(usuario_id):
        return jsonify({"error": "El usuario no existe"}), 404
    
    try:
        query = "DELETE FROM USUARIOS WHERE ID = %s"
        conectar_bd()
        instance.eliminar(query, (usuario_id,))
        cerrar_bd()
        return jsonify({"message": "Usuario eliminado correctamente"}), 200
    except Exception as e:
        return jsonify({"error": "Error al eliminar el usuario", "details": str(e)}), 500

@app.route('/eliminar_perfil/<string:perfil_id>', methods=['DELETE']) #<-- elimina registros de los perfiles
def eliminar_perfil(perfil_id):
    if not perfil_existe(perfil_id):
        return jsonify({"error": "El perfil no existe"}), 404
    
    try:
        query = "DELETE FROM PERFILES WHERE ID = %s"
        conectar_bd()
        instance.eliminar(query, (perfil_id,))
        cerrar_bd()
        return jsonify({"message": "Perfil eliminado correctamente"}), 200
    except Exception as e:
        return jsonify({"error": "Error al eliminar el perfil", "details": str(e)}), 500


@app.route('/eliminar_login/<string:login_id>', methods=['DELETE'])  #<-- si bien no es recomendable eliminar el registro de los login por seguridad se agrega la funcion si y solo si se debe eliminar el usuario de la base de datos!
def eliminar_login(login_id):
    if not login_existe(login_id):
        return jsonify({"error": "El registro de login no existe"}), 404
    
    try:
        query = "DELETE FROM LOGIN WHERE ID = %s"
        conectar_bd()
        instance.eliminar(query, (login_id,))
        cerrar_bd()
        return jsonify({"message": "Registro de login eliminado correctamente"}), 200
    except Exception as e:
        return jsonify({"error": "Error al eliminar el registro de login", "details": str(e)}), 500
if __name__ == '__main__':
    app.run(debug=True)

