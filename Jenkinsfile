pipeline{
    agent any
    stages{
        stage('build'){
            steps{
                sh '''
                docker image build -t praveenrajnikanth/workshop:shopizer .
                '''
            }
        }
        stage('push'){
            steps{
                sh '''
                aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 358434574350.dkr.ecr.us-east-1.amazonaws.com
                docker build -t test .
                docker tag test:latest 358434574350.dkr.ecr.us-east-1.amazonaws.com/test:${BUILD_NUMBER}
                docker push 358434574350.dkr.ecr.us-east-1.amazonaws.com/test:${BUILD_NUMBER}
                docker container run -d -P 358434574350.dkr.ecr.us-east-1.amazonaws.com/test:${BUILD_NUMBER}
                docker ps
                '''
            }
        }
        stage('SonarQube Analysis') {
            steps{
                sh 'docker run --rm -e SONAR_HOST_URL="http://${SONARQUBE_URL}" -e SONAR_SCANNER_OPTS="-Dsonar.projectKey=${YOUR_PROJECT_KEY}" -e SONAR_LOGIN="sqa_31172b444768524438cfee0b78e1fa1dbe597928" -v "${YOUR_REPO}:/usr/src" sonarsource/sonar-scanner-c'
    }    }
}
}