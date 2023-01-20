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
               sh 'mvn clean verify sonar:sonar \
  -Dsonar.projectKey=spring \
  -Dsonar.host.url=http://44.203.73.66:9000 \
  -Dsonar.login=sqp_408b47bd4385622e0961714478da04d0067f36ab'     
    }    }
}
}