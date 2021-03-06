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
		self.elementosQueOcupanMasDe5Lugares().forEach({e => self.elementosDelArbol().remove(e)})
	}
	
	method elementosQueOcupanMasDe5Lugares() {
		return self.elementosDelArbol().filter({e => e.cantidadDeLugaresQueOcupa() > 5})	
	}
	
	method promedioDeImportancia() {
		return self.importancia() / self.elementosDelArbol().size()
	}
	
	method cantDeElementosMasImportantes() {
		return self.elementosDelArbol().filter({ele => ele.importancia() > ele.promedioDeImportancia()})
	}
	
	method destinatarios() {
		return self.elementosDelArbol().map({elem => elem.destinatario()}).asSet()
	}
	
	method regalosPara(persona) {
		return self.elementosDelArbol().filter({elem => elem.destinatario().contains(persona)})
	}
	
	
	method destinatariosOrdenados() {
		return self.destinatarios().sortBy({destA,destB => self.regalosPara(destA).size() > self.regalosPara(destB).size()})
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
	
	method destinatario() {
		return []
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

class Figura {
	var adornos = []
	
	method adornosFigura() {
		return adornos
	}
	
	method adornosFigura(unAdorno) {
		adornos.add(unAdorno)
	}
	
	method destinatario() {
		return []
	}
	
	method importancia() {
		return self.adornosFigura().max({e => e.importancia()})
	}
	
	method cantidadDeLugaresQueOcupa() {
		return (self.adornosFigura().sum({e => e.cantidadDeLugaresQueOcupa()})) + 1
	}
}

object estrellaDeBelen {
	var destinatarios = []
	
	method cantidadDeLugaresQueOcupa() {
		return 1
	}
	
	method importancia() {
		return 10
	}
	
	method agregarDestinatario(alguien) {
		destinatarios.add(alguien)
	}
	
	method destinatario() {
		return destinatarios
	}
}

class Persona {
	var nombre
	
	method nombre() {
		return nombre
	}
	
	method nombre(unNombre) {
		nombre = unNombre
	}
	
	
	
}