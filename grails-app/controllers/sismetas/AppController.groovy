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
	[profsDE: CH.config.profsDE, profsT20: CH.config.profsT20, profsT40: CH.config.profsT40, anoAtual: CH.config.anoAtual, periodoAtual: CH.config.periodoAtual, chCertific: CH.config.chCertific]
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
			params.anoAtual = new Integer(params.anoAtual);
			params.periodoAtual = new Integer(params.periodoAtual)
			CH.config.profsDE = params.profsDE
			CH.config.profsT20 = params.profsT20
			CH.config.profsT40 = params.profsT40
			CH.config.chCertific = params.chCertific
			CH.config.anoAtual = params.anoAtual
			CH.config.periodoAtual = params.periodoAtual
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
		def turmasMapMeta1 = [:]
		for(turma in Turma.list()) {
			for (sem in turma.semestre) {
				if (turmasMapMeta1.get("${sem.ano}.${sem.periodo}")) {
					turmasMapMeta1.put("${sem.ano}.${sem.periodo}", (turmasMapMeta1.get("${sem.ano}.${sem.periodo}")+(sem.quantidadeDeAlunos/turma.vagasEdital)))				
				}else{
					turmasMapMeta1.put("${sem.ano}.${sem.periodo}",[sem.quantidadeDeAlunos/turma.vagasEdital])
				}
			}					
		}		
		if (turmasMapMeta1) {
			for(m in turmasMapMeta1) {
				turmasMapMeta1.put(m.key, new BigDecimal((m.value.sum()/m.value.size())*100, new java.math.MathContext(4)))
			}
			turmasMapMeta1 = turmasMapMeta1.sort({a,b -> a.key <=> b.key})
			turmasMapMeta1.put("MÉDIA", turmasMapMeta1.collect{ key, value -> value}.sum()/turmasMapMeta1.size())
		}else{turmasMapMeta1.put("Não há cadastros", "")}
		
		//Indice de eficacia da instituicao
		def turmasMapMeta2 = [:]
		for(turma in Turma.list()) {
			for(sem in turma.semestre) {
				if (sem.semestreDeConcluintes) {
					if (turmasMapMeta2.get("${sem.ano}.${sem.periodo}")) {
						turmasMapMeta2.put("${sem.ano}.${sem.periodo}", (turmasMapMeta2.get("${sem.ano}.${sem.periodo}")+(sem.quantidadeDeAlunos/turma.vagasEdital)))				
					}else{
						turmasMapMeta2.put("${sem.ano}.${sem.periodo}",[sem.quantidadeDeAlunos/turma.vagasEdital])			
					}
				}
			}
		}
		if (turmasMapMeta2) {
			for(m in turmasMapMeta2) {
				turmasMapMeta2.put(m.key, new BigDecimal((m.value.sum()/m.value.size())*100, new java.math.MathContext(4)))
			}
			turmasMapMeta2 = turmasMapMeta2.sort({a,b -> a.key <=> b.key})
			turmasMapMeta2.put("MÉDIA", turmasMapMeta2.collect{ key, value -> value}.sum()/turmasMapMeta2.size())
		}else{turmasMapMeta2.put("Não há cadastros", "")}
		
		//Alunos matriculados em relacao a forca de trabalho
		def totalAlunos = Semestre.findAllByAnoAndPeriodo(CH.config.anoAtual, CH.config.periodoAtual)
		totalAlunos = totalAlunos.quantidadeDeAlunos.sum()
		def cursosCertific = Curso.findAllByTipoDeCurso("Certific")
		def totalAlunosCertific = 0
		for(curso in cursosCertific) {
			for(turma in curso.turmas) {
				for(sem in turma.semestre) {
					println sem.ano
					println sem.periodo
					println CH.config.anoAtual
					if(sem.ano == CH.config.anoAtual && sem.periodo == CH.config.periodoAtual) {
						totalAlunosCertific += sem.quantidadeDeAlunos
					}
				}
			}	 
		}
		def forcaDeTrabalho = ((totalAlunos-totalAlunosCertific) + ((totalAlunosCertific*CH.config.chCertific)/400)/((CH.config.profsDE+CH.config.profsT40)+(CH.config.profsT20*0.5)))
		def turmasListMeta3 = [totalAlunos, totalAlunosCertific, CH.config.chCertific, CH.config.profsDE, CH.config.profsT20, CH.config.profsT40,forcaDeTrabalho]
		
		/*
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
		//[totalVL: totalVL, totalVCT:totalVCT, indiceEficaciaTotal:indiceEficaciaTotal, eficacia:eficacia, indiceEficienciaTotal:indiceEficienciaTotal, turmas:turmas, curso:curso, totalAlunosMatriculados:totalAlunosMatriculados, certific:certific, profs:profs, totalFT:totalFT]
		*/
		[turmasMapMeta1:turmasMapMeta1, turmasMapMeta2:turmasMapMeta2, turmasListMeta3:turmasListMeta3]
	}
}
