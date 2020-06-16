import elementos.*

class Plaga {
	var property poblacion = 0
	var property nivelDeDanio = 0

	method transmiteEnfermedades(){
		return poblacion >= 10
	}
	
	method efecto(){
		poblacion += poblacion * 0.1
	}
	
	method atacar(elemento){
		self.efecto()
		elemento.efecto(self)
	}
}

class Cucarachas inherits Plaga {
	var property peso = 8
	
	
	override method poblacion(cantidad){
		super(cantidad)
		nivelDeDanio = cantidad / 2
	}
	
	override method transmiteEnfermedades() {
		return super() and peso >= 10
	}
	
	override method efecto(){
		super()
		peso += 2
	}
}

class Pulgas inherits Plaga {
	
	override method poblacion(cantidad){
		super(cantidad)
		nivelDeDanio = cantidad * 2
	}
	
}

class Garrapatas inherits Pulgas {
	override method efecto(){
		poblacion += poblacion * 0.2
	}
}

class Mosquitos inherits Plaga {
	
	override method poblacion(cantidad){
		super(cantidad)
		nivelDeDanio = cantidad
	}
	
	override method transmiteEnfermedades(){
		return super() and poblacion % 3 == 0
	}
}