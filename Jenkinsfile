pipeline {
  agent {label 'bin-node'}
  tools {
    jdk 'Java17'
    maven 'Maven3'
  }
  environment {
    APP_NAME = 'spring-explore'
    RELEASE = '1.0.0'
    DOCKER_USER='uzairk7886'
    DOCKER_PASS='dockerhub'
    IMAGE_NAME = "${DOCKER_USER}/${APP_NAME}:${RELEASE}"
    IMAGE_TAG = "${RELEASE}:${BUILD_NUMBER}"
  }
  stages{
    stage("Cleanup Workspace"){
    steps {
    cleanWs()
    }
    }
    stage("Checkout from SCM"){
    steps {
    git branch: 'main', credentials Id: 'github', url: 'https://github.com/uzair-7886/spring-explore'
    }
    }
    stage("Build"){
    steps {
    sh "mvn clean package"
    }
    }
    stage("Test"){
    steps {
    sh "mvn test"
    }
    }
    stage("Build and Push Docker Image"){
    steps {
    script {
      docker.withRegistry('', DOCKER_PASS) {
        docker-image = docker.build("${IMAGE_NAME}")
      }
      docker.withRegistry('', DOCKER_PASS) {
        docker-image.push("${IMAGE_TAG}")
      }
    }
    }
    }
  }
}
