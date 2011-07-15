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
			//turmasMapMeta1.put("MÉDIA", turmasMapMeta1.collect{ key, value -> value}.sum()/turmasMapMeta1.size())
		}
		def numPontosQueVaiTer = 4+turmasMapMeta1.size()
		println numPontosQueVaiTer
		for(b in turmasMapMeta1) {
			if (b.key.toString() in ["2013.1","2013.2","2016.1","2016.2"]) {numPontosQueVaiTer -= 1}
		}
		println numPontosQueVaiTer
	
				
		
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
		totalAlunos = (totalAlunos) ? totalAlunos.quantidadeDeAlunos.sum() : 0
		def cursosCertific = (Curso.findAllByTipoDeCurso("Certific").turmas.semestre) ? Curso.findAllByTipoDeCurso("Certific").turmas.semestre[0][0] : null
		def totalAlunosCertific = 0
		for(sem in cursosCertific) {
			if(sem.ano == CH.config.anoAtual && sem.periodo == CH.config.periodoAtual) {
				totalAlunosCertific += sem.quantidadeDeAlunos
			}	 
		}
		def forcaDeTrabalho = ((totalAlunos-totalAlunosCertific) + ((totalAlunosCertific*CH.config.chCertific)/400)/((CH.config.profsDE+CH.config.profsT40)+(CH.config.profsT20*0.5)))
		def turmasListMeta3 = [totalAlunos, totalAlunosCertific, CH.config.chCertific, CH.config.profsDE, CH.config.profsT40, CH.config.profsT20,forcaDeTrabalho]
		
		//Vagas para os cursos técnicos
		def alunosTecnico = (Curso.findAllByTipoDeCurso("Técnico").turmas.semestre) ? Curso.findAllByTipoDeCurso("Técnico").turmas.semestre[0][0] : null
		def totalAlunosTecnico = 0
		for(sem in alunosTecnico) {
			if(sem.ano == CH.config.anoAtual && sem.periodo == CH.config.periodoAtual) {
				totalAlunosTecnico += sem.quantidadeDeAlunos
			}
		}
		def porcVCT = (totalAlunosTecnico) ? new BigDecimal((totalAlunos/totalAlunosTecnico)*100, new java.math.MathContext(4)) : 0
		def turmasListMeta4 = [totalAlunos, totalAlunosTecnico, porcVCT]
		
		//Vagas para Licenciaturas
		def alunosLicenciatura = (Curso.findAllByTipoDeCurso("Licenciatura").turmas.semestre) ? Curso.findAllByTipoDeCurso("Técnico").turmas.semestre[0][0] : null
		def totalAlunosLicenciatura = 0
		for(sem in alunosLicenciatura) {
			if (sem.ano == CH.config.anoAtual && sem.periodo == CH.config.periodoAtual) {
				totalAlunosLicenciatura = sem.quantidadeDeAlunos			
			}		
		}
		def porcVCL = (totalAlunosLicenciatura) ? new BigDecimal((totalAlunos/totalAlunosLicenciatura)*100, new java.math.MathContext(4)) : 0
		def turmasListMeta5 = [totalAlunos, totalAlunosTecnico, porcVCL]

		[turmasMapMeta1:turmasMapMeta1, numPontosQueVaiTer:numPontosQueVaiTer, turmasMapMeta2:turmasMapMeta2, turmasListMeta3:turmasListMeta3, turmasListMeta4:turmasListMeta4, turmasListMeta5: turmasListMeta5]
	}
}
