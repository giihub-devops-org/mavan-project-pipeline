pipeline{
    agent any
    {
        stages("SCM Checkout")
        {
            steps
            {
                git branch: 'master', url: 'https://github.com/giihub-devops-org/mavan-project-pipeline'
            }
        }
    }
}