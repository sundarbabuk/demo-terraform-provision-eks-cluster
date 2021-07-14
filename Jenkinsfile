pipeline {
    agent any
    environment {
        AWS_DEFAULT_REGION="us-east-1"
        AWS_ACCESS_KEY_ID=credentials("AWS_ACCESS_KEY_ID")
        AWS_SECRET_ACCESS_KEY=credentials("AWS_SECRET_ACCESS_KEY")
        // PATH="$PATH:$HOME/dctlenv/bin/"
    }
    parameters {
        choice(
            choices: ['main' , 'master'],
            description: '',
            name: 'BRANCH_NAME')
    }
    
    stages {
      
        stage("IaC Initialize") {
            steps {
                sh "/var/jenkins_home/terraform init -upgrade"
            }
        }

        stage("IaC Config Validation") {
            steps {
                sh "/var/jenkins_home/terraform validate"
            }
        }
        
        stage("IaC Planning") {
            steps {
                // sh "/var/jenkins_home/terraform plan -out=plan.out"
                sh "/var/jenkins_home/terraform plan"
            }
        }

        stage("EKS Cluster Provisioning") {
            when {
                expression { params.BRANCH_NAME == 'main' }
                }
            steps {
                // sh "terraform apply -input=false plan.out"
                sh "/var/jenkins_homexx/terraform apply -auto-approve"
                }
        }

        stage("Display EKS Cluster Resources") {
            steps {
                sh "/var/jenkins_home/terraform show"
            }
        }

        stage("Sleep time") {
            steps {
                sh 'sleep 120'
            }
        }

        stage("EKS Cluster De-Provisioning") {
            steps {
                sh "/var/jenkins_home/terraform destroy -auto-approve"
            }
        }
    }
}