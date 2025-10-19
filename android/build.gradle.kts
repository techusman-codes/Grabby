// Top-level build.gradle.kts



buildscript {
    repositories {
        google()
        mavenCentral()
    }
    dependencies {
        // ✅ Needed for Firebase and Google Services
        classpath("com.google.gms:google-services:4.4.2")
    }
}

plugins {
    // Use the same version Gradle already loaded (8.7.3)
    id("com.android.application") version "8.7.3" apply false
    id("org.jetbrains.kotlin.android") version "2.1.0" apply false
    id("com.google.gms.google-services") version "4.4.2" apply false
    
}

allprojects {
    repositories {
        google()
        mavenCentral()
    }
}



