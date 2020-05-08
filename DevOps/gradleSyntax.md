## Gradle Syntax

* Tips
    * Gradle has plugins
    * Each plugin has pre-build tasks
    * We can create our own tasks
    * Make the tasks run in a particular order

* Gradle syntax for jar file
```
//Apply the required plugins
apply plugin: 'java'

//Java Compatability Versions
sourceCompatibility = 1.8
targetCompatibility = 1.8

//External Folder Structure
ext.libDir = '<PATH>'

//Define the repositories to connect to
repositories { 
	maven {
		url "<URL>"
		metadataSources {
			artifact() //Look directly for artifact
		}
	}
	mavenCentral()
}

//Define the dependencies
dependencies {
}

//Date Time Variable
def date = new Date()
def formattedDate = date.format("yyyyMMdd-HHmmss")

//Default Tasks to run
defaultTasks 'jar'

//Build the jar file
jar {
	archiveFileName = '<JAR>.jar'
	manifest {
		attributes(
		   'Built-By'       : System.properties['user.name'],
			'Build-Timestamp': new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").format(new Date()),
			'Created-By'     : "Gradle ${gradle.gradleVersion}",
			'Main-Class'     : "patchXML.createXML",
			'Build-JDK'      : "${System.properties['java.version']} (${System.properties['java.vendor']} ${System.properties['java.vm.version']})",
			'Build-OS'       : "${System.properties['os.name']} ${System.properties['os.arch']} ${System.properties['os.version']}"
		)
	}
	
}

//Backup the exsisting jar file from library path - Optional
task backupArtifacts (type: Copy) {
   from ("${libDir}")
   include '<JAR>.jar'
   destinationDir file("${libDir}/archive")
   rename "<JAR>.jar", "<JAR>.safe.${formattedDate}.jar"
}

//Deploy the new jar file to library path - Optional
task deployArtifacts(type: Copy) {
    from file("${buildDir}/libs/createXMLForPatch.jar")
    into file("${libDir}/")
}
```

* Gradle syntax 2 for jar file
```
//Apply the required plugins
apply plugin: 'java'

//Java Compatability Versions
sourceCompatibility = 1.8
targetCompatibility = 1.8

//Default Tasks to run
defaultTasks 'copyDepJars'

//Define the repositories to connect to
repositories {
	maven {
		url 'http://abc/nexus/repository/PUBLIC_REPO/'
	}
	mavenCentral()
}

//Define the dependencies
dependencies {
	// https://mvnrepository.com/artifact/commons-codec/commons-codec
	compile group: 'commons-codec', name: 'commons-codec', version: '1.9'
}

//Build the jar file
jar {
	//Jar file Name
	archiveFileName = 'abc.jar'
	
	//Generate the manifest
	manifest {
		attributes(
		'Built-By'         : System.properties['user.name'],
		'Build-Timestamp'  : new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").format(new Date()),
		'Created-By'       : "Gradle ${gradle.gradleVersion}",
		'Build-JDK'        : "${System.properties['java.version']} (${System.properties['java.vendor']} ${System.properties['java.vm.version']})",
		'Build-OS'         : "${System.properties['os.name']} ${System.properties['os.arch']} ${System.properties['os.version']}",
		'Main-Class'       : "com.className",
		'Class-Path'       : configurations.compile.collect { "${it.name}" }.join(' ')
		)
	}
}

//Copy the dependent jar files to the build/libs folder. 
task copyDepJars(type: Copy) {
  dependsOn clean, jar
	from configurations.compile
	into 'build/libs'
}
```

* Gradle syntax for war file
```
//Apply the required plugins
apply plugin: 'java'
apply plugin: 'maven-publish'
apply plugin: 'war'

//Java Compatability Versions
sourceCompatibility = 1.8
targetCompatibility = 1.8

//Default Tasks to run
defaultTasks 'war'
war.dependsOn(jar)

//Define the repositories to connect to
repositories {
	maven {
		url 'http://XYZ/PUBLIC_REPO/'
	}
	mavenCentral()
}

//Define the dependencies
dependencies {
	// https://mvnrepository.com/artifact/javax.ws.rs/javax.ws.rs-api
	compile group: 'javax.ws.rs', name: 'javax.ws.rs-api', version: '2.0.1'
}

//Build the jar file
jar {
	archiveFileName = '<NAME>.jar'
	manifest {
		attributes(
			'Built-By'       : System.properties['user.name'],
			'Build-Timestamp': new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").format(new Date()),
			'Created-By'     : "Gradle ${gradle.gradleVersion}",
			'Build-JDK'      : "${System.properties['java.version']} (${System.properties['java.vendor']} ${System.properties['java.vm.version']})",
			'Build-OS'       : "${System.properties['os.name']} ${System.properties['os.arch']} ${System.properties['os.version']}"
		)
	}
}

//Build the war file
war {
	//Exclude individual classes
	rootSpec.exclude('**/com/ABC/**')
	
	//Archive name to be generated
	archiveFileName = '<NAME>.war'
	
	//Add jar file to lib
	webInf {
		from ("${buildDir}/libs"){
			include("*.jar") into "lib"
		}
	}

	//Generate MANIFEST.MF
	manifest {
		attributes(
			'Built-By'       : System.properties['user.name'],
			'Build-Timestamp': new java.text.SimpleDateFormat("yyyy-MM-dd'T'HH:mm:ss.SSSZ").format(new Date()),
			'Created-By'     : "Gradle ${gradle.gradleVersion}",
			'Build-JDK'      : "${System.properties['java.version']} (${System.properties['java.vendor']} ${System.properties['java.vm.version']})",
			'Build-OS'       : "${System.properties['os.name']} ${System.properties['os.arch']} ${System.properties['os.version']}"
		)
	}
}
```