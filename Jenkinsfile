pipeline {
    agent any
     stages {
        /*stage('clone the repo'){
            steps{
                
            }
        } */
        stage('Lint HTML'){
            steps {
               sh 'tidy -q -e *.html'
            }
        }
        stage('Build Docker image'){
            steps {
                
                sh 'echo "building docker image"'
                script{
                    sh 'echo "before docker.withRegistry"'
                    docker.withRegistry("https://520491554233.dkr.ecr.us-west-2.amazonaws.com", "ecr:us-west-2:jenkins") {
                    sh 'echo "after docker.withRegistry"'
                    def app = docker.build("520491554233.dkr.ecr.us-west-2.amazonaws.com/capstone:latest")
                    app.push()
                    }
                }
                
                sh 'echo "successfully built docker image!"'
                }
        }
        stage('Deploy to EKS'){
            steps{
                withAWS(region:'us-west-2', credentials:'eksUser') {
                    sh '''
                    aws --version
                    aws eks --region us-west-2 update-kubeconfig --name capstonekscluster
                    kubectl apply -f nginx-deployment.yaml
                    kubectl apply -f nginx-service.yaml
                    kubectl expose deployment nginx --type=LoadBalancer --name=nginx-service
                    '''                }
            }
        }
        
    }
}