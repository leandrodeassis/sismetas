package sismetas

class Turma {

	Curso curso
	Integer quantidadeDeAlunos
	Integer ano
	Integer periodo
	Integer numeroDeConcluintes
	
	static belongsTo = [curso:Curso]
	static hasMany = [semestre: Semestre]

    static constraints = {
		ano(inList:[2011,2012,2013,2014,2015,2016,2010,2009,2008,2007,2006,2005,2004,2003,2002,2001,2000])
		periodo(inList:[1,2,0])
		numeroDeConcluintes(nullable: false, blank:false)
    }
	
	String toString() {
		return "${curso} ${ano}.${periodo}"
	}
}
