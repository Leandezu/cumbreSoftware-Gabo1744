import cumbre.*
import conocimientos.*

class Participante{
	var pais
	var conocimientos = #{}
	var commits
	
	method pais() = pais
	method esCapa()
	method cumpleRequisitos(){
		return conocimientos.contains(programacionBasica)
	}
	method agregarConocimiento(unConocimiento){
		conocimientos.add(unConocimiento)
	}
	method agregarCommits(cuanto){
		commits = commits + cuanto
	}
	method hacerActividad(unaActividad){
		unaActividad.aplicarEfectos(self)
	}
}

class Programador inherits Participante{
	var horasCapacitacion
	
	override method esCapa(){
		return commits > 500
	}
	override method cumpleRequisitos(){
		return super() and commits >= cumbre.commits()
	}
	override method hacerActividad(unaActividad){
		super(unaActividad)
		horasCapacitacion += unaActividad.horas()
	}
}

class Especialista inherits Participante{
	override method esCapa(){
		return conocimientos.size() > 2
	}
	override method cumpleRequisitos(){
		return super() and
		commits >= (cumbre.commits() - 100) and
		conocimientos.contains(objetos)
	}
}

class Empresa{
	var paises = #{}
	
	method esMultinacional(){
		return paises.size() > 3
	}
}
class Gerente inherits Participante{
	var empresa
	
	override method esCapa(){
		return empresa.esMultinacional()
	}
	
	override method cumpleRequisitos(){
		return super() and conocimientos.contains(manejoDeGrupos)
	}
}