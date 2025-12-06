pipeline {
    agent any

    environment {
        SONAR_TOKEN = credentials('sonar-token-id') 
    }

    stages {
        stage('Clone') {
            steps {
                checkout scm
            }
        }

        stage('Build') {
            steps {
                sh 'mvn -B clean package -DskipTests'
            }
        }

        stage('MVN SONARCUBE') {
            steps {
                withSonarQubeEnv('SonarTest') {
                    sh "mvn sonar:sonar -Dsonar.projectKey=ProjetStudentsManagement -Dsonar.host.url=http://localhost:9000 -Dsonar.login=${SONAR_TOKEN}"
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline terminé.'
        }
    }
}
