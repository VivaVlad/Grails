package com.counter_value



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class CounterController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond Counter.list(params), model:[counterInstanceCount: Counter.count()]
    }

    def show(Counter counterInstance) {
        respond counterInstance
    }

    def create() {
        respond new Counter(params)
    }

    @Transactional
    def save(Counter counterInstance) {
        if (counterInstance == null) {
            notFound()
            return
        }

        if (counterInstance.hasErrors()) {
            respond counterInstance.errors, view:'create'
            return
        }

        counterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'counter.label', default: 'Counter'), counterInstance.id])
                redirect counterInstance
            }
            '*' { respond counterInstance, [status: CREATED] }
        }
    }

    def edit(Counter counterInstance) {
        respond counterInstance
    }

    @Transactional
    def update(Counter counterInstance) {
        if (counterInstance == null) {
            notFound()
            return
        }

        if (counterInstance.hasErrors()) {
            respond counterInstance.errors, view:'edit'
            return
        }

        counterInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'Counter.label', default: 'Counter'), counterInstance.id])
                redirect counterInstance
            }
            '*'{ respond counterInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(Counter counterInstance) {

        if (counterInstance == null) {
            notFound()
            return
        }

        counterInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'Counter.label', default: 'Counter'), counterInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'counter.label', default: 'Counter'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
