package sismetas

class CursoController {

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
        [cursoInstanceList: Curso.list(params), cursoInstanceTotal: Curso.count()]
    }

    def create = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def cursoInstance = new Curso()
        cursoInstance.properties = params
        return [cursoInstance: cursoInstance]
    }

    def save = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def cursoInstance = new Curso(params)
        if (cursoInstance.save(flush: true)) {
            flash.message = "${message(code: 'default.created.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])}"
            redirect(action: "show", id: cursoInstance.id)
        }
        else {
            render(view: "create", model: [cursoInstance: cursoInstance])
        }
    }

    def show = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def cursoInstance = Curso.get(params.id)
        if (!cursoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])}"
            redirect(action: "list")
        }
        else {
            [cursoInstance: cursoInstance]
        }
    }

    def edit = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def cursoInstance = Curso.get(params.id)
        if (!cursoInstance) {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])}"
            redirect(action: "list")
        }
        else {
            return [cursoInstance: cursoInstance]
        }
    }

    def update = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def cursoInstance = Curso.get(params.id)
        if (cursoInstance) {
            if (params.version) {
                def version = params.version.toLong()
                if (cursoInstance.version > version) {
                    
                    cursoInstance.errors.rejectValue("version", "default.optimistic.locking.failure", [message(code: 'curso.label', default: 'Curso')] as Object[], "Another user has updated this Curso while you were editing")
                    render(view: "edit", model: [cursoInstance: cursoInstance])
                    return
                }
            }
            cursoInstance.properties = params
            if (!cursoInstance.hasErrors() && cursoInstance.save(flush: true)) {
                flash.message = "${message(code: 'default.updated.message', args: [message(code: 'curso.label', default: 'Curso'), cursoInstance.id])}"
                redirect(action: "show", id: cursoInstance.id)
            }
            else {
                render(view: "edit", model: [cursoInstance: cursoInstance])
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])}"
            redirect(action: "list")
        }
    }

    def delete = {
		if (!session.user) {
			flash.message = "Permissão Negada"
			redirect(controller: 'app', action:'index')
			return
		}
        def cursoInstance = Curso.get(params.id)
        if (cursoInstance) {
            try {
                cursoInstance.delete(flush: true)
                flash.message = "${message(code: 'default.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])}"
                redirect(action: "list")
            }
            catch (org.springframework.dao.DataIntegrityViolationException e) {
                flash.message = "${message(code: 'default.not.deleted.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])}"
                redirect(action: "show", id: params.id)
            }
        }
        else {
            flash.message = "${message(code: 'default.not.found.message', args: [message(code: 'curso.label', default: 'Curso'), params.id])}"
            redirect(action: "list")
        }
    }
}
