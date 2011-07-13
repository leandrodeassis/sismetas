package sismetas

class Curso {

	String nome
	String tipoDeCurso
	Integer numeroDeAlunosMatriculados

	static hasMany = [turmas:Turma]

    static constraints = {
		nome(blank:false, size:2..100)
		tipoDeCurso(nullable:false, blank:false, inList:["Técnico","Certific","Superior","PROEJA"])
		numeroDeAlunosMatriculados(nullable:false, blank:false)
    }

	String toString() {
		return nome
	}
}
