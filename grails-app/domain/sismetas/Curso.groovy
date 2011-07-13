package sismetas

class Curso {

	String nome
	String tipoDeCurso

	static hasMany = [turmas:Turma]

    static constraints = {
		nome(blank:false, size:2..100, unique:'tipoDeCurso')
		tipoDeCurso(nullable:false, blank:false, inList:["Técnico","Certific","Superior","PROEJA"])
    }

	String toString() {
		return "${tipoDeCurso} em ${nome}"
	}
}
