import requests
from flask import Flask, jsonify, render_template

app = Flask(__name__, static_url_path='/static')

def manejador(option):
    if option == 1:
        url = "http://0.0.0.0:8000"
        response = requests.get(url)
        response.raise_for_status()
        if response.status_code == 200:
            datos = response.json()
            return datos
        else:
            return {"0000": "ERROR"}
    elif option == 2:
        url = "http://0.0.0.0:8000/api/Reporte_Proveedor"
        response = requests.get(url)
        response.raise_for_status()
        if response.status_code == 200:
            datos = response.json()
            return datos
        else:
            return {"0000": "ERROR"}
    elif option == 3:
        url = "http://0.0.0.0:8000/api/partes"
        response = requests.get(url)
        response.raise_for_status()
        if response.status_code == 200:
            datos = response.json()
            return datos
        else:
            return {"0000": "ERROR"}
    elif option == 4:
        url = "http://0.0.0.0:8000/api/proveedor"
        response = requests.get(url)
        response.raise_for_status()
        if response.status_code == 200:
            datos = response.json()
            return datos
        else:
            return {"0000": "ERROR"}
    elif option == 5:
        url = "http://0.0.0.0:8000/api/proveedor_partes"
        response = requests.get(url)
        response.raise_for_status()
        if response.status_code == 200:
            datos = response.json()
            return datos
        else:
            return {"0000": "ERROR"}
    elif option == 6:
        url = "http://0.0.0.0:8000/api/vListadoDeProvedores"
        response = requests.get(url)
        response.raise_for_status()
        if response.status_code == 200:
            datos = response.json()
            return datos
        else:
            return {"0000": "ERROR"}
    elif option == 7:
        url = "http://0.0.0.0:8000/api/vPartes"
        response = requests.get(url)
        response.raise_for_status()
        if response.status_code == 200:
            datos = response.json()
            return datos
        else:
            return {"0000": "ERROR"}
    elif option == 8:
        url = "http://0.0.0.0:8000/api/vReporteAlmacen"
        response = requests.get(url)
        response.raise_for_status()
        if response.status_code == 200:
            datos = response.json()
            return datos
        else:
            return {"0000": "ERROR"}
    else:
        return {"1111": "ERROR"}

def manejador_2(URL):
	url = URL
	response = requests.get(url)
	response.raise_for_status()
	if response.status_code == 200:
		datos = response.json()
		return datos
	else:
		return {"ERROR": "DATOS NO INSERTADOS"}
	


@app.route('/')
def inicio():
    datos = manejador(1)
    return render_template('index.html', datos=datos)
    
    
@app.route('/consultas/<valor>')
def consultas(valor):
	if valor == '0':
		return render_template('consultas.html')
	elif valor == '1':
		datos = manejador(2)
		return render_template('consultas.html',datos=datos)
	elif valor == '2':
		datos = manejador(3)
		return render_template('consultas.html',datos=datos)
	elif valor == '3':
		datos = manejador(4)
		return render_template('consultas.html',datos=datos)
	elif valor == '4':
		datos = manejador(5)
		return render_template('consultas.html',datos=datos)
	elif valor == '5':
		datos = manejador(6)
		return render_template('consultas.html',datos=datos)
	elif valor == '6':
		datos = manejador(7)
		return render_template('consultas.html',datos=datos)
	elif valor == '7':
		datos = manejador(8)
		return render_template('consultas.html',datos=datos)
	else:
		return jsonify({"ERROR":"OPCION NO DISPONIBLE"})
		
#@app.route('/insertar', methods=['GET'])
#def mostrar_formulario():
 #   return render_template('insertar.html')

@app.route('/insertar/<path:URL>', methods=['GET'])
def insertar(URL):
    manejador_2(URL)
    return jsonify({"mensaje":"insertada correctamente"})
    
    
 

if __name__ == "__main__":
    app.run(host='0.0.0.0', port=5000)


