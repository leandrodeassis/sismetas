package sismetas

class SenderService {

    static transactional = false

	def mailService

    def enviaEmail(emailDestinatario, assunto, mensagem) {
		mailService.sendMail {
			to emailDestinatario
			from "sismetasifpb@gmail.com"
			subject assunto
			body "${mensagem}\n---\n\nSistema de Metas do IFPB"
		}
    }
}
