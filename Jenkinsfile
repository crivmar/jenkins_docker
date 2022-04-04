pipeline {
    environment {
        IMAGEN = "crivmar/django"
        LOGIN = 'USUARIO_DOCKERHUB'
    }
    agent none
    stages {
        stage("Desarrollo") {
            agent {
                docker { image "python:3"
                args '-u root:root'
                }
            }
            stages {
                stage('Clonar repositorio') {
                    steps {
                        git branch:'main',url:'https://github.com/crivmar/django_tutorial.git'
                    }
                }
                stage('Instalar requerimientos') {
                    steps {
                        sh 'pip install -r requirements.txt'
                    }
                }
                stage('Ejecutar tests')
                {
                    steps {
                        sh 'python3 manage.py test'
                    }
                }

            }
        }
        stage("Construcción") {
            agent any
            stages {
                stage('Clonado en anfitrión') {
                    steps {
                        git branch:'main',url:'https://github.com/crivmar/jenkins_docker.git'
                    }
                }
                stage('Crear imagen') {
                    steps {
                        script {
                            newApp = docker.build "$IMAGEN:latest"
                        }
                    }
                }
                stage('Subir imagen') {
                    steps {
                        script {
                            docker.withRegistry( '', LOGIN ) {
                                newApp.push()
                            }
                        }
                    }
                }
                stage('Limpieza') {
                    steps {
                        sh "docker rmi $IMAGEN:latest"
                    }
                }
            }
        }           
    }
    post {
        always {
            mail to: 'carlosrivero1988@gmail.com',
            subject: "Status of pipeline: ${currentBuild.fullDisplayName}",
            body: "${env.BUILD_URL} has result ${currentBuild.result}"
        }
    }
}