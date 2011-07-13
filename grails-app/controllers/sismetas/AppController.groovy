package sismetas

import org.codehaus.groovy.grails.commons.ConfigurationHolder as CH

class AppController {

    def index = { }
	def trocarsenha = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
	}
	def prof = { 
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
	[profsDE: CH.config.profsDE, profsT20: CH.config.profsT20, profsT40: CH.config.profsT40, numAlunosCertific: CH.config.numAlunosCertific, chCertific: CH.config.chCertific]
	}
	
	def authenticate = {
		def usuario = Usuario.findByEmailAndSenha(params.email, params.senha)
		if (usuario) {
			session.user = usuario
			redirect(action:"index")
        } else {
			flash.message = "O endereço de email ou a senha estão incorretos."
			redirect(action:"index")
		}
	}

	def logout = {
		if (session.user)
			flash.message = "Usuário ${session.user} desconectado!"
		session.user = null
		redirect(action:"index")
	}
	
	def trocarSenhaUsuario = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
		def usuario = Usuario.findByEmailAndSenha(params.email, params.senha)
            
		if (params.senhanova1 != params.senhanova2) {
			flash.message = "Campos de nova senha não são iguais."
			redirect(controller:"app", action:"trocarsenha")
		}else if (usuario) {
			usuario.setSenha(params.senhanova1)
			if (usuario.save()) { 
				flash.message = "Senha atualizada com sucesso"
				usuario.enviaEmailMudancaSenha()
				redirect(controller:"app", action:"index")
			}
			else { 
				flash.message = "Senha deve conter mais de 7 caracteres."
				redirect(controller:"app", action:"trocarsenha")
			}
			
		}else {
			flash.message = "Campos senha ou login inválido."
			redirect(controller:"app", action:"trocarsenha")
		}
	}

	def configProf = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
		try {
			params.profsDE = new Integer(params.profsDE);
			params.profsT20 = new Integer(params.profsT20);
			params.profsT40 = new Integer(params.profsT40);
			params.chCertific = new Integer(params.chCertific);
			params.numAlunosCertific = new Integer(params.numAlunosCertific);
			CH.config.profsDE = params.profsDE
			CH.config.profsT20 = params.profsT20
			CH.config.profsT40 = params.profsT40
			CH.config.chCertific = params.chCertific
			CH.config.numAlunosCertific = params.numAlunosCertific
			flash.message = "Valores modificados com sucesso."			
			redirect(controller:"app", action:"prof")
		}
		catch(Throwable e) {
			flash.message = "Valores devem ser números."
			redirect(controller:"app", action:"prof")
		}
	}

	def relatorio = {
		//Indice de eficiencia da instituicao
		def turmas = [:]
		def indiceEficienciaTotal = 0
		def indiceEficaciaTotal = 0
		def total = 0
		for(turma in Turma.list()) {			
			total = (turma.semestre.size()) ? (turma.semestre.quantidadeDeAlunos.sum()/(turma.semestre.size()*turma.quantidadeDeAlunos))*100 : 0
			indiceEficienciaTotal += total
			turmas.put(turma,new BigDecimal(total, new java.math.MathContext(4)))			
		}
		indiceEficienciaTotal = (Turma.list()) ? new BigDecimal(indiceEficienciaTotal/Turma.list().size(), new java.math.MathContext(4)) : 0
		
		//Indice de eficacia da instituicao
		def eficacia = [:]
		for (turma in Turma.list()) {
			def eficaciaTurma = (turma.numeroDeConcluintes/turma.quantidadeDeAlunos)*100
			indiceEficaciaTotal += eficaciaTurma
			eficacia.put(turma, [turma.quantidadeDeAlunos, turma.numeroDeConcluintes, new BigDecimal(eficaciaTurma, new java.math.MathContext(4))])		
		}
		indiceEficaciaTotal = (Turma.list()) ? indiceEficaciaTotal/Turma.list().size() : 0
		
		//Alunos matriculados em relacao a forca de trabalho
		def curso = Curso.list()
		def totalAlunosMatriculados = (curso) ? curso.numeroDeAlunosMatriculados.sum() : 0
		def certific = [CH.config.numAlunosCertific, CH.config.chCertific]
		def profs = [CH.config.profsDE, CH.config.profsT20, CH.config.profsT40]
		def totalFT = (totalAlunosMatriculados + ((certific[0]*certific[1])/400))/((profs[0]+profs[1])+(profs[2]*0.5))
		
		//Vagas para os cursos técnicos
		def alunosMatriculadosEmTodosOsCursos = Curso.list()
		alunosMatriculadosEmTodosOsCursos = (alunosMatriculadosEmTodosOsCursos) ? alunosMatriculadosEmTodosOsCursos.numeroDeAlunosMatriculados.sum() : 0
		def alunosMatriculadosEmTecnico = Curso.findAllByTipoDeCurso("Técnico")
		alunosMatriculadosEmTecnico = (alunosMatriculadosEmTecnico) ? alunosMatriculadosEmTecnico.numeroDeAlunosMatriculados.sum() : 0
		alunosMatriculadosEmTecnico = alunosMatriculadosEmTecnico.numeroDeAlunosMatriculados.sum()
		def porcVCT = (alunosMatriculadosEmTodosOsCursos) ? new BigDecimal((alunosMatriculadosEmTecnico/alunosMatriculadosEmTodosOsCursos)*100, new java.math.MathContext(4)) : 0
		def totalVCT = [alunosMatriculadosEmTodosOsCursos, alunosMatriculadosEmTecnico, porcVCT]

		//Vagas para Licenciaturas
		def alunosMatriculadosEmLicenciatura = Curso.findAllByTipoDeCurso("Licenciatura")
		alunosMatriculadosEmLicenciatura = (alunosMatriculadosEmLicenciatura) ? alunosMatriculadosEmLicenciatura.numeroDeAlunosMatriculados.sum() : 0
		def porcVL = (alunosMatriculadosEmTodosOsCursos) ? new BigDecimal((alunosMatriculadosEmLicenciatura/alunosMatriculadosEmTodosOsCursos)*100, new java.math.MathContext(4)) : 0
		def totalVL = [alunosMatriculadosEmTodosOsCursos, alunosMatriculadosEmLicenciatura, porcVL]
		
		//Retorno ao relatorio.gsp
		[totalVL: totalVL, totalVCT:totalVCT, indiceEficaciaTotal:indiceEficaciaTotal, eficacia:eficacia, indiceEficienciaTotal:indiceEficienciaTotal, turmas:turmas, curso:curso, totalAlunosMatriculados:totalAlunosMatriculados, certific:certific, profs:profs, totalFT:totalFT]
	}
}
