package com.datastore



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class MyDataController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]
def ValueService
    def getData(){
        def file = new URL("http://finance.yahoo.com/d/quotes.csv?s=AAPL+GOOG+MSFT&f=nab").getText()
        MyData myData=new MyData(id:0,data: file,recordCreatedDate: new Date()).save() }

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond MyData.list(params), model:[myDataInstanceCount: MyData.count()]
    }


    def show(MyData myDataInstance) {
        respond myDataInstance
    }

    def create() {
        respond new MyData(params)
    }

    @Transactional
    def save(MyData myDataInstance) {
        if (myDataInstance == null) {
            notFound()
            return
        }

        if (myDataInstance.hasErrors()) {
            respond myDataInstance.errors, view:'create'
            return
        }

        myDataInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'myData.label', default: 'MyData'), myDataInstance.id])
                redirect myDataInstance
            }
            '*' { respond myDataInstance, [status: CREATED] }
        }
    }

    def edit(MyData myDataInstance) {
        respond myDataInstance
    }

    @Transactional
    def update(MyData myDataInstance) {
        if (myDataInstance == null) {
            notFound()
            return
        }

        if (myDataInstance.hasErrors()) {
            respond myDataInstance.errors, view:'edit'
            return
        }

        myDataInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'MyData.label', default: 'MyData'), myDataInstance.id])
                redirect myDataInstance
            }
            '*'{ respond myDataInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(MyData myDataInstance) {

        if (myDataInstance == null) {
            notFound()
            return
        }

        myDataInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'MyData.label', default: 'MyData'), myDataInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'myData.label', default: 'MyData'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
