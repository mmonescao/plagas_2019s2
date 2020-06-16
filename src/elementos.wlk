import plagas.*

class Hogar  {
	var property nivelDeMugre = 0
	var property nivelDeConfort = 0
	
	method esBueno(){
		return nivelDeMugre <= nivelDeConfort / 2
	}
	
	method efecto(plaga){
		nivelDeMugre += plaga.nivelDeDanio()
	}
	
}

class Huerta {
	var property capacidadDeProduccion
	var property nivel = 10
	
	method esBueno(){
		return capacidadDeProduccion > nivel
	}
	
	method efecto(plaga){
		capacidadDeProduccion -= plaga.nivelDeDanio() * 0.1
		if(plaga.transmiteEnfermedades()){
			capacidadDeProduccion -= 10
		}
	}
}

class Mascota {
	var property nivelDeSalud
	
	method esBueno(){
		return nivelDeSalud > 250
	}
	
	method efecto(plaga){
		if(plaga.transmiteEnfermedades()){
			nivelDeSalud -= plaga.nivelDeDanio()
		}
	}
}

class Barrio {
	const elementos = []
	
	method agregarElemento(nuevoElemento){elementos.add(nuevoElemento)}
	method elementos(){return elementos}
	method esCopado(){return elementos.count({elemento => elemento.esBueno()}) > elementos.size() / 2}
}