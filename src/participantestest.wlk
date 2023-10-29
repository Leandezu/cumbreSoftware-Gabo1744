import cumbre.*
import conocimientos.*

describe"Test de participantes"{
	const juana = new Programador(
		pais = "argentina",
		conocimientos = #{programacionBasica, css, html},
		commits = 600
	)
	const lucia = new Programador(
		pais = "brasil",
		conocimientos = #{programacionBasica, basesDeDatos},
		commits = 800
	)
	const mariana = new Especialista(
		pais = "argentina",
		conocimientos = #{programacionBasica, instalacionLinux, objetos, disenioConObjetos},
		commits = 200
	)
	const susana = new Especialista(
		pais = "colombia",
		conocimientos = #{programacionBasica, objetos},
		commits = 1500
	)
	
	method initialize(){
		cumbre.registrarPersona(juana)
		cumbre.registrarPersona(lucia)
		cumbre.registrarPersona(mariana)
	}
	
	test"Los paises de la cumbre son Argentina y brasil"{
		assert.equals(#{"argentina","brasil"}, cumbre.paisesDeParticipantes())
	}
}
