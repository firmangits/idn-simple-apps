pipeline {
    agent {label 'devops-1-MFirmanA'}
    tools {nodejs 'nodejs-20.17.0'}

    stages {
        stage('checkout GIT project') {
            steps {
                git branch: 'main', url : 'https://github.com/firmangits/idn-simple-apps.git'
            }
        }

        stage('Run the NPM') {
            steps {
                sh '''npm install
                '''
            }
        }

        stage('Run the SonarQube') {
            steps {
                sh '''sonar-scanner \
                -Dsonar.projectKey=idn-simple-app \
                -Dsonar.sources=. \
                -Dsonar.host.url=http://172.23.1.31:9000 \
                -Dsonar.login=sqp_1e57deabbb5e9082d47fbf687c73ae97ae2444d7
                '''
            }
        }

        stage('Run the Docker Compose') {
            steps {
                sh '''docker compose build
                docker compose up -d
                '''
            }
        }
    }

}
