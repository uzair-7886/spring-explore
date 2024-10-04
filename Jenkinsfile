pipeline {
    agent { label 'bin-node' }
    tools {
        jdk 'Java17'
        maven 'Maven3'
    }
    environment {
        APP_NAME = 'spring-explore'
        RELEASE = '1.0.0'
        DOCKER_USER = 'uzairk7886'
        DOCKER_PASS = 'dockerhub'  // Ensure this is stored securely in Jenkins
        IMAGE_NAME = "${DOCKER_USER}/${APP_NAME}:${RELEASE}"
    }
    stages {
        stage("Cleanup Workspace") {
            steps {
                cleanWs()
            }
        }
        stage("Checkout from SCM") {
            steps {
                git branch: 'main', credentialsId: 'github', url: 'https://github.com/uzair-7886/spring-explore'
            }
        }
        stage("Build Docker Image") {
            steps {
                script {
                    dockerImage = docker.build("${IMAGE_NAME}", ".")
                }
            }
        }
        stage("Push Docker Image") {
            steps {
                script {
                    docker.withRegistry('https://index.docker.io/v1/', "${DOCKER_PASS}") {
                        dockerImage.push()
                    }
                }
            }
        }
    }
}
