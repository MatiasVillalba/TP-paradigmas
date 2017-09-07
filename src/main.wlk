class Arbol {
	var vejez
	var tamanioTronco
	var capacidadDisponible
	var elementosArbol = []
	
	method vejezArbol(vejezDelArbol) {
		vejez = vejezDelArbol
	}
	
	method vejezArbol() {
		return vejez
	}
	
	method tamanioDelTronco(tamanio) {
		tamanioTronco = tamanio	
	}
	
	method tamanioDelTronco() {
		return tamanioTronco
	}
	
	method capacidadDisponible() {
		if(self.elementosDelArbol().isEmpty()) {
			capacidadDisponible = self.vejezArbol() * self.tamanioDelTronco()
			}
			return capacidadDisponible
	}
	
	method capacidadDisponible(lugaresQueOcupaObjeto) {
		capacidadDisponible -= lugaresQueOcupaObjeto  
	}
	
	method elementosDelArbol() {
		return elementosArbol
	}
	
	method agregarElemento(elemento) {
		if(self.capacidadDisponible() < elemento.cantidadDeLugaresQueOcupa()) {
			error.throwWithMessage("No hay capacidad disponible en el arbol")
		}
		self.capacidadDisponible(elemento.cantidadDeLugaresQueOcupa())
		elementosArbol.add(elemento)
	}
	
	method importancia() {
		return self.elementosDelArbol().sum({e => e.importancia()})
	}
	
	method destinatarioElemento(alguien) { 
		return self.elementosDelArbol().forEach({e => e.destinatario(alguien)})
	}
	
	method eliminarCosasVoluminosas() {
		
	}


}

class Regalo {
	var destinatarios = []
	
	method destinatario() {
		return destinatarios
	}
	
	method destinatario(alguien) {
		destinatarios.add(alguien)
	}
	
	method cantidadDestinatarios() {
		return self.destinatario().size()
	}
	
	method importancia() {
		return self.cantidadDestinatarios() * 2
	}
	
	method cantidadDeLugaresQueOcupa() {
		return 1
	}
}

class Tarjeta {
	var destinatario
	var importancia
	
	method destinatario() {
		return destinatario
	}
	
	method destinatario(alguien) {
		destinatario = alguien
	}
	
	method importancia(valor) {
		importancia = valor
	}
	
	method importancia() {
		return importancia
	}
	
	method cantidadDeLugaresQueOcupa() {
		return 0
	}
}

class Adorno {
	var peso
	var coeficienteSuperioridad
	
	method pesoAdorno(pesoAdorno) {
		peso = pesoAdorno
	}
	
	method pesoAdorno() {
		return peso
	}
	
	method coeficiente(coeficienteS) {
		coeficienteSuperioridad = coeficienteS
	}
	
	method coeficiente() {
		return coeficienteSuperioridad
	}
	
	method importancia() {
		return self.pesoAdorno() * self.coeficiente()
	}
	
	method cantidadDeLugaresQueOcupa() {
		return self.pesoAdorno().min(3) 
	}
	
}

object figura {
	var adornos = []
	
	method adornosFigura() {
		return adornos
	}
	
	method importancia() {
		return self.adornosFigura().max({e => e.importancia()})
	}
	
	method cantidadDeLugaresQueOcupa() {
		return (self.adornosFigura().sum({e => e.cantidadDeLugaresQueOcupa()})) + 1
	}
}

object estrellaDeBelen {
	
	method cantidadDeLugaresQueOcupa() {
		return 1
	}
	
	method importancia() {
		return 10
	}
	
	method destinatario() {
		
	}
}

class Persona {
	
}