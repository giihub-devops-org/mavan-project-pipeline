pipeline{
    agent any
    stages
    {
        stage("SCM Checkout")
        {
            steps
            {
                git branch: 'master', url: 'https://github.com/giihub-devops-org/mavan-project-pipeline.git'
            }
        }
        stage("Execute Unit Test framework")
        {

            steps
            {

                withMaven(globalMavenSettingsConfig: '4cdd837f-ff0c-491f-8412-199ba3bb7399', jdk: 'Local_jdk', maven: 'Local_MVN', mavenSettingsConfig: '1dcd3131-3b21-47da-9e2c-a0af93a8375d', traceability: true)
                {
                    sh "mvn test"
                }
            // withMaven(globalMavenSettingsConfig: '0c14f41b-b79f-4c1b-8225-4be63d44fc5f', jdk: 'Local_jdk', maven: 'Local_mvn', mavenSettingsConfig: 'cc9697ed-e30f-494d-856d-45f5b31b8bd3', traceability: true)
            // {
            //     sh "mvn test"
            // }
            }
            
        }
        stage("Execute Build")
        {
            steps
            {
            withMaven(globalMavenSettingsConfig: '4cdd837f-ff0c-491f-8412-199ba3bb7399', jdk: 'Local_jdk', maven: 'Local_MVN', mavenSettingsConfig: '1dcd3131-3b21-47da-9e2c-a0af93a8375d', traceability: true)
            {
                sh "mvn package"
            }

            }
        }
        stage("Docker Image Creation")
        {
            steps
            {
           // sshagent(['SCPSSH'])
            //{
            //    sh 'scp -o StrictHostKeyChecking=no webapp/target/webapp.war ec2-user@44.201.241.66:/usr/share/tomcat/webapps/'
           // }
            sh "docker build -t devops ."
            sh 'docker tag devops:latest 020549807535.dkr.ecr.us-east-1.amazonaws.com/devops:latest'

            }
        }
        stage("Docker Push to Registry")
        {
            steps
            {
                withDockerRegistry(credentialsId: 'ecr:us-east-1:AWS', url: 'https://020549807535.dkr.ecr.us-east-1.amazonaws.com/devops') 
                {
                    //sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 020549807535.dkr.ecr.us-east-1.amazonaws.com'
                    sh 'docker push 020549807535.dkr.ecr.us-east-1.amazonaws.com/devops:latest'
                }
                // withDockerRegistry(credentialsId: 'DockerID', url: 'https://index.docker.io/v1/') 
                // {
                    
                // }
            }
        }
        stage ('deploy to EKS kubernetes cluster')
        {
            steps { 
            withAWS(credentials: 'AWS', endpointUrl: '172.31.1.102', region: 'us-east-1') 
            {  
            sh 'aws eks --region us-east-1 update-kubeconfig --name EKS'
            sh 'kubectl apply -f deployment-service.yaml'

// sh 'helm install ./<chartname> '
            }    
        }
        }
    }
    
}