package sismetas

class Campus {

    String nome
    Integer quantidadeDeProfessoresDE
    Integer quantidadeDeProfessoresT40
    Integer quantidadeDeProfessoresT20

    static hasMany = [cursos:Curso]

    static constraints = {
	nome(blank:false, size:2..100, unique:true)
    }

	String toString() {
		return "Campus ${nome}"	
	}
}
