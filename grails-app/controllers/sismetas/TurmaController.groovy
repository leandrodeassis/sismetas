package sismetas

class TurmaController {

    static allowedMethods = [save: "POST", update: "POST", delete: "POST"]

    def index = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        redirect(action: "list", params: params)
    }

    def list = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        params.max = Math.min(params.max ? params.int('max') : 10, 100)
        [turmaInstanceList: Turma.list(params), turmaInstanceTotal: Turma.count()]
    }

    def create = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def turmaInstance = new Turma()
        turmaInstance.properties = params
        return [turmaInstance: turmaInstance]
    }

    def save = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def turmaInstance = new Turma(params)
        if (turmaInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'turma.label', default: 'Turma'), turmaInstance.id])}"
            redirect(action: "show", id: turmaInstance.id)
        }
        else {
            render(view: "create", model: [turmaInstance: turmaInstance])
        }
    }

    def show = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def turmaInstance = Turma.get(params.id)
        if (!turmaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'turma.label', default: 'Turma'), params.id])}"
            redirect(action: "list")
        }
        else {
            [turmaInstance: turmaInstance]
        }
    }

    def edit = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def turmaInstance = Turma.get(params.id)
        if (!turmaInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'turma.label', default: 'Turma'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [turmaInstance: turmaInstance]
        }
    }

    def update = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def turmaInstance = Turma.get(params.id)
        if (turmaInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (turmaInstance.version > version) {
                    
                    turmaInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'turma.label', default: 'Turma')] as Object[], "Another user has updated this Turma while you were editing")
                    render(view: "edit", model: [turmaInstance: turmaInstance])
                    return
                }
            }
            turmaInstance.properties = params
            if (!turmaInstance.hasErrors() && turmaInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'turma.label', default: 'Turma'), turmaInstance.id])}"
                redirect(action: "show", id: turmaInstance.id)
            }
            else {
                render(view: "edit", model: [turmaInstance: turmaInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'turma.label', default: 'Turma'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def turmaInstance = Turma.get(params.id)
        if (turmaInstance) {
            try {
                turmaInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'turma.label', default: 'Turma'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'turma.label', default: 'Turma'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'turma.label', default: 'Turma'), params.id])}"
            redirect(action: "list")
        }
    }
}
