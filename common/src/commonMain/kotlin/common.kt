package com.example.helloplatform

expect fun platformName(): String

fun createApplicationScreenMessage() : String {
    return "Kotlin rocks on ${platformName()}"
}
