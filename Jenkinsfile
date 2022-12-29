
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
        stage('oush'){
            steps{
                sh '''
                docker image push praveenrajnikanth/workshop:shopizer
                '''
            }
        }
        stage('kubernetes'){
            steps{
                sh '''
                build 'terraform'.
                '''
            }
        }
    }    
}