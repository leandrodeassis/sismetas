import sismetas.Usuario

class BootStrap {

    def init = { servletContext ->
		println("Cadastrando admin")
		new Usuario(nome:"admin", senha:"admin123", email:"admin@admin.com", admin:true).save(failOnError: true)
    }
    def destroy = {
    }
}
