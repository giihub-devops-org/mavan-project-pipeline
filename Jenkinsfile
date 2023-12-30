pipeline{
    agent any
    stages
    {
        stage("SCM Checkout")
        {
            steps
            {
                git branch: 'master', url: 'https://github.com/giihub-devops-org/mavan-project-pipeline'
            }
        }
        stage("Execute Unit Test framework")
        {

            steps
            {

                withMaven(globalMavenSettingsConfig: '', jdk: 'LOCAL_JDK', maven: 'Local_MVN', mavenSettingsConfig: '', traceability: true) 
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
            withMaven(globalMavenSettingsConfig: '', jdk: 'LOCAL_JDK', maven: 'Local_MVN', mavenSettingsConfig: '', traceability: true) 
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
            sh 'docker build -t adait25197/tomcat:latest .'
            }
        }
        stage("Docker Push to Registry")
        {
            steps
            {

                withDockerRegistry(credentialsId: 'ecr:us-east-1:Aws', url: '020549807535.dkr.ecr.us-east-1.amazonaws.com') 
                {
                    sh 'docker push adait25197/tomcat:latest '
                }
                // withDockerRegistry(credentialsId: 'DockerID', url: 'https://index.docker.io/v1/') 
                // {
                    
                // }
            }
        }
    }
    
}
