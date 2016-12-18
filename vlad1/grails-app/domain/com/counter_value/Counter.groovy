package com.counter_value

import org.codehaus.jackson.map.util.ClassUtil

class Counter {

    String namePK
    int value
    static constraints = {
        value(nullable:false)
        namePK(maxSize: 15)

    }
    static mapping = {
        table 'Counter'
        version false
        value defaultValue: 0
        }
}
