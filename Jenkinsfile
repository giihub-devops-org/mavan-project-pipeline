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
            withMaven(globalMavenSettingsConfig: '77afc16e-1ca5-41ab-93a6-47ea073a450d', jdk: 'LOCALJDK', maven: 'LOCALMVN', mavenSettingsConfig: '5f2a1d5a-4bf5-4715-a92d-ef92850737e3', traceability: true) 
            {
                sh "mvn test"
            }
            }
            
        }
        stage("Execute Build")
        {
            steps
            {
            withMaven(globalMavenSettingsConfig: '77afc16e-1ca5-41ab-93a6-47ea073a450d', jdk: 'LOCALJDK', maven: 'LOCALMVN', mavenSettingsConfig: '5f2a1d5a-4bf5-4715-a92d-ef92850737e3', traceability: true) 
            {
                sh "mvn package"
            }

            }
        }
    }
    
}
