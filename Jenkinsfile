pipeline {
    agent {
        label 'testintegration'
//        docker {
//            image 'docker.io/manics/omero-build-gradle:latest'
//        }
    }

    environment {
        // Needed for Gradle, not sure why the slave doesn't handle this
        JAVA_HOME = '/usr/lib/jvm/jre-1.8.0-openjdk'

        // Default credentials for testing on devspace
        MAVEN_SNAPSHOTS_REPO_URL = 'http://nexus:8081/nexus/repository/maven-internal/'
        MAVEN_USER = 'admin'
        MAVEN_PASSWORD = 'admin123'
    }

    stages {
        stage('Build') {
            steps {
                sh 'gradle --init-script init-ci.gradle publishToMavenLocal'
            }
        }
        stage('Deploy') {
            steps {
                sh 'gradle --init-script init-ci.gradle publish'
            }
        }
    }

    post {
        always {
            // Cleanup workspace
            deleteDir()
        }
    }
}
