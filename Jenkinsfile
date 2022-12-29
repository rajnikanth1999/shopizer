
pipeline{
    agent {
        label 'node'
    }
    stages{
        stage('build'){
            steps{
                sh '''
                docker image build -t praveenrajnikanth/workshop:shopizer .
                '''
            }
        }
    }    
}