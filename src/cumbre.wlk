import conocimientos.*
import participantes.*

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

object cumbre{
	var paisesAuspiciantes = #{}
	var participantes = #{}
	var actividadesRealizadas = #{}
	var property commits = 300
	var horasDeActividades = 0
	
	method agregarPaises(unConjunto){
		paisesAuspiciantes.addAll(unConjunto)
	}

	method esAuspiciante(unPais){
		return paisesAuspiciantes.any({p => p == unPais})
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
	method validarPersona(persona){
		return not self.esConflictivo(persona.pais()) and
		(self.cantParticipantesDelPais(persona.pais()) > 2 or
		 self.esAuspiciante(persona.pais())
		)
	}
	method registrarPersona(unaPersona){
		if(not unaPersona.cumpleRequisitos() and not self.validarPersona(unaPersona)){
			self.error("No cumple los requisitos")
		}
		participantes.add(unaPersona)
	}
	method esSegura(){
		return participantes.all({p => p.cumpleRequisitos() and self.validarPersona(p)})
	}
}