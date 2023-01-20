
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
        stage('oush'){
            steps{
                sh '''
                echo ''
                '''
            }
        }
    }    
}