pipeline {
agent any

environment {
    SONAR_TOKEN = credentials('sonar-token')
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

    stage('SonarQube Analysis') {
        steps {
            withSonarQubeEnv('SonarTest') {
                // Pas besoin de -Dsonar.host.url, il est injecté par withSonarQubeEnv
                sh "mvn sonar:sonar -Dsonar.projectKey=ProjetStudentsManagement -Dsonar.login=${SONAR_TOKEN}"
            }
        }
    }

    stage('Quality Gate') {
        steps {
            timeout(time: 5, unit: 'MINUTES') {
                waitForQualityGate abortPipeline: true
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
