pipeline {
    agent any

    environment {
        DOCKER_IMAGE = "samisundar/agile:latest"
    }

    stages {

        stage('Build Docker Image') {
            steps {
                bat 'docker build -t %DOCKER_IMAGE% .'
            }
        }

        stage('Login to Docker Hub') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'Docker-Credentials',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {
            bat '''
            echo|set /p="%DOCKER_PASS%" | docker login -u "%DOCKER_USER%" --password-stdin
            '''
        }
    }
}

        stage('Push to Docker Hub') {
            steps {
                bat 'docker push %DOCKER_IMAGE%'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                bat 'kubectl apply -f deployment.yaml'
                bat 'kubectl apply -f service.yaml'
                bat 'kubectl rollout restart deployment agile-lab-deployment'
            }
        }

        stage('Logout Docker') {
            steps {
                bat 'docker logout'
            }
        }
    }
}
