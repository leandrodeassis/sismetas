package sismetas

class SemestreController {

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
        [semestreInstanceList: Semestre.list(params), semestreInstanceTotal: Semestre.count()]
    }

    def create = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def semestreInstance = new Semestre()
        semestreInstance.properties = params
        return [semestreInstance: semestreInstance]
    }

    def save = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def semestreInstance = new Semestre(params)
        if (semestreInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'semestre.label', default: 'Semestre'), semestreInstance.id])}"
            redirect(action: "show", id: semestreInstance.id)
        }
        else {
            render(view: "create", model: [semestreInstance: semestreInstance])
        }
    }

    def show = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def semestreInstance = Semestre.get(params.id)
        if (!semestreInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'semestre.label', default: 'Semestre'), params.id])}"
            redirect(action: "list")
        }
        else {
            [semestreInstance: semestreInstance]
        }
    }

    def edit = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def semestreInstance = Semestre.get(params.id)
        if (!semestreInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'semestre.label', default: 'Semestre'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [semestreInstance: semestreInstance]
        }
    }

    def update = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def semestreInstance = Semestre.get(params.id)
        if (semestreInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (semestreInstance.version > version) {
                    
                    semestreInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'semestre.label', default: 'Semestre')] as Object[], "Another user has updated this Semestre while you were editing")
                    render(view: "edit", model: [semestreInstance: semestreInstance])
                    return
                }
            }
            semestreInstance.properties = params
            if (!semestreInstance.hasErrors() && semestreInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'semestre.label', default: 'Semestre'), semestreInstance.id])}"
                redirect(action: "show", id: semestreInstance.id)
            }
            else {
                render(view: "edit", model: [semestreInstance: semestreInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'semestre.label', default: 'Semestre'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def semestreInstance = Semestre.get(params.id)
        if (semestreInstance) {
            try {
                semestreInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'semestre.label', default: 'Semestre'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'semestre.label', default: 'Semestre'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'semestre.label', default: 'Semestre'), params.id])}"
            redirect(action: "list")
        }
    }
}
