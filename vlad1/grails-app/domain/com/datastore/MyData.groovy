package com.datastore

class MyData {
    int id
    String data
    Date recordCreatedDate
    static constraints = {
        data(blank: false,maxSize: 255)
        id (blank: false)
        recordCreatedDate(blank: false,nullable: false)
    }
    static mapping = {
        table 'Data'
        version false

    }
}