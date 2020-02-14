pipeline {
    agent any
    def app
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
                
                sh 'building docker image'
                docker.withRegistry("520491554233.dkr.ecr.us-west-2.amazonaws.com/capstone", "ecr:us-west-2:jenkins") {
                    app = docker.build("gadahoth/capstonecontainer:latest")
                    app.push()
                    }
                sh 'echo "successfully built docker image!"'
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