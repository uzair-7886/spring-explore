pipeline {
  agent {label 'Built-In Node'}
  tools {
    jdk 'Java17'
    maven 'Maven3'
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
  }
}
