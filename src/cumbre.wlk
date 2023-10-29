import conocimientos.*

object cumbre{
	var paisesAuspiciantes = #{}
	var participantes = #{}
	var property commits = 300
	
	method agregarPaises(unConjunto){
		paisesAuspiciantes.addAll(unConjunto)
	}
	method registrarPersona(unaPersona){
		participantes.add(unaPersona)
	}
	method esIgualA(pais){
		return paisesAuspiciantes.any({p => p == pais})
	}
	method esConflictivo(unPais){
		return unPais.conflictos().any({p => self.esIgualA(p)})
	}
	method paisesDeParticipantes(){
		return participantes.map({p => p.pais()}).asSet()
	}
	method todosLosPaises(){
		return participantes.map({p => p.pais()})
	}
	method cantParticipantesDelPais(unPais){
		return participantes.filter({p => p.pais() == unPais}).size()
	}
	method paisConMasParticipantes(){
		return self.todosLosPaises().max({p => self.cantParticipantesDelPais(p)})
	}
	method noEsUnPaisAuspiciante(pais){
		return not paisesAuspiciantes.any({p => p == pais})
	}
	method participantesExtranjeros(){
		return participantes.filter({p => self.noEsUnPaisAuspiciante(p.pais())}).asSet()
	}
	method esRelevante(){
		return participantes.all({p => p.esCapa()})
	}
}

class Pais{
	var conflictos = #{}
	
	method conflictos() = conflictos
	method agregarConflicto(unPais){
		conflictos.add(unPais)
	}
	method registrarConflicto(unPais){
		return conflictos.contains(unPais)
	}
}

class Participante{
	var pais
	var conocimientos = #{}
	var commits
	
	method pais() = pais
	method esCapa()
	method cumpleRequisitos(){
		return conocimientos.contains(programacionBasica)
	}
}

class Programador inherits Participante{
	override method esCapa(){
		return commits > 500
	}
	override method cumpleRequisitos(){
		return super() and commits >= cumbre.commits()
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