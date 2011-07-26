import sismetas.Usuario

class BootStrap {

    def init = { servletContext ->
		if(!Usuario.findByNome("admin")) {
			println("Cadastrando admin")
			new Usuario(nome:"admin", senha:new String("admin123".encodeAsMD5Hex()), email:"admin@admin.com", admin:true).save(failOnError: true)
		}
    }
    def destroy = {
    }
}
