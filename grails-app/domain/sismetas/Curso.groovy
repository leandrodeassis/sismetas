package sismetas

class Curso {

	String nome
	String tipoDeCurso

	static hasMany = [turmas:Turma]

    static constraints = {
		nome(blank:false, size:2..100, unique:'tipoDeCurso')
		tipoDeCurso(nullable:false, blank:false, inList:["Técnico Subsequente","Técnico Integrado","Superior de Tecnologia","Superior Bacharelado","Superior Licenciatura","PROEJAFIC","PROEJA Qualificação","PROEJA Técnico","Certific", "Mulheres Mil", "FIC"])
    }

	String toString() {
		return "${tipoDeCurso} em ${nome}"
	}
}
