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
                    aws eks --region us-west-2 update-kubeconfig --name capstonekscluster
                    kubectl apply -f nginx-deployment.yaml
                    kubectl expose deployment nginx --type=LoadBalancer --name=nginx-service
                    '''                }
            }
        }
      /*   stage('Deploy image in EKS'){
            steps {
                withAWS(region:'us-west-2', credentials:'eksUser') {
                    sh "aws eks --us-west-2 update-kubeconfig --name capstonekscluster"
                    sh "kubectl apply -f aws/aws-auth-cm.yaml"
                    sh "kubectl set image deployments/capstone-app capstone-app=${registry}:latest"
                    sh "kubectl apply -f aws/capstone-app-deployment.yml"
                    sh "kubectl get nodes"
                    sh "kubectl get pods"
                    sh "aws cloudformation update-stack --stack-name udacity-capstone-nodes --template-body file://aws/worker_nodes.yml --parameters file://aws/worker_nodes_parameters.json --capabilities CAPABILITY_IAM"
               }
            }
        } */
        
    }
}