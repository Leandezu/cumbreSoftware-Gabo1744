import conocimientos.*

class Actividad{
	var tema
	var horas
	
	method horas() = horas
	method aplicarEfectosA(unParticipante){
		unParticipante.agregarConocimiento(tema)
		unParticipante.agregarCommits(tema.commitsPorHora() * horas)
	}
}
