package sismetas

class Usuario {

	def senderService
	String nome
	String email
	private String senha
	boolean admin

    static constraints = {
		nome(blank:false, size:2..100)
		senha(blank:false, nullable:false, password:true, minSize:8)
		email(blank:false, email:true, unique:true)
    }
	
	private geraAutoSenha() {
		Random random = new Random()
		senhaPlana = (1..8).collect { random.nextInt(9) }.join()
		senha = new String(senhaPlana.encodeAsMD5Hex())
		return senhaPlana
	}
	
	public enviaEmailCadastro(senhaPlana) {
		String mensagem = "Olá ${nome},\n\nVocê foi cadastrado no Sistema de Metas do IFPB\n\nAbaixo segue suas informações de login:\nE-mail: ${email}\nSenha: ${senhaPlana}\n\nRecomendamos que altere a senha para uma de sua preferência."
		senderService.enviaEmail(email, "Bem-Vindo ao Sistema de Metas do IFPB", mensagem)	
	}
	
	public enviaEmailMudancaSenha(senhaPlana) {
		String mensagem = "Olá ${nome},\n\nVocê mudou sua senha no Sistema de Metas do IFPB\n\nAbaixo segue suas informações de login:\nE-mail: ${email}\nSenha: ${senhaPlana}"
		senderService.enviaEmail(email, "Mudança de Senha - Sistema de metas do IFPB", mensagem)	
	}

	String toString() {
		return nome
	}
}
