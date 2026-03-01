pipeline {
    agent any
    environment {
        DOCKER_USER = 'haridtvt'
        BUILD_TAG = "v${BUILD_NUMBER}"
        DOCKER_CREDS_ID = 'dockerhub-creds'
        JENKINS_NODE_COOKIE = 'dontKillMe'
        APPSERVER = '13.213.157.199'
    }
    stages {
        stage("Check out") {
            steps {
                checkout scm
            }
        }
        stage("Verify Path") {
            steps {
                script {
                    sh "pwd" 
                    sh "ls -la" 
                }
            }
        }
        stage("Build and Push") {
                    steps {
                        script {
                            dir("${WORKSPACE}") { 
                                withCredentials([usernamePassword(credentialsId:"${DOCKER_CREDS_ID}", passwordVariable: 'DOCKER_PASS', usernameVariable: 'DOCKER_USERNAME')]){
                                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USERNAME --password-stdin'
                                    sh "docker build -t ${DOCKER_USER}/app-backend:${BUILD_TAG} ./backend"
                                    sh "docker build -t ${DOCKER_USER}/app-frontend:${BUILD_TAG} ./frontend"
                                    sh "docker push ${DOCKER_USER}/app-backend:${BUILD_TAG}"
                                    sh "docker push ${DOCKER_USER}/app-frontend:${BUILD_TAG}"
                        }
                    }
                }
            }
        }
        stage("Deploy to Remote Server") {
            steps {
                sshagent(['deploy-server-ssh']) {
                    withCredentials([string(credentialsId: 'db-pass-secret', variable: 'DB_PASS')]) {
                        script {
                            def remoteHost = "ec2-user@${APPSERVER}"
                            sh "scp -o StrictHostKeyChecking=no docker-compose.yml ${remoteHost}:/home/ec2-user/"
                            sh """
                                ssh -o StrictHostKeyChecking=no ${remoteHost} "
                                    export DOCKER_USER=${DOCKER_USER}
                                    export BUILD_TAG=${BUILD_TAG}
                                    export DB_PASS=${DB_PASS}                          
                                    docker-compose down
                                    docker-compose up -d
                                "
                            """
                        }
                    }
                }
            }
        }
    }
}