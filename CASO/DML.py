import pymysql


class DML:
	result= []
	__host=""
	__user=""
	__passwd=""
	__db=""
	def __init__(self,host,user,passwd,db):
		self.__host=host
		self.__user=user
		self.__passwd=passwd
		self.__db=db

	def conectar(self):
		self.db = pymysql.connect(host=self.__host,user=self.__user,passwd=self.__passwd,db=self.__db)
		cur = self.db.cursor()
		self.cursor = cur

	def consultar(self,query):
		self.result = []
		self.cursor.execute(query)
		#self.result = self.cursor.fetchall()
		for info in self.cursor.fetchall():
			self.result.append(info)
		self.imprimir()
		
		
	def insertar(self, query, data):
        	self.cursor.execute(query, data)
        	self.db.commit()
        	
	def actualizar(self, query, data):
		self.cursor.execute(query, data)
		self.db.commit()
	
	def eliminar(self, query, data):
        	self.cursor.execute(query, data)
        	self.db.commit()

        
	def imprimir(self):
		for filas in self.result:
			print(filas)
			
        
	def closed_connection(self):  
        	self.db.close()





