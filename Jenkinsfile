node {
    def app

    stage('Clone repository') {
        /* Let's make sure we have the repository cloned to our workspace */

        checkout scm
    }

    stage('Build image') {
        /* This builds the actual image; synonymous to
         * docker build on the command line */

        app = docker.build("tobypope/dockerapp")
    }

    stage('Push image to Docker Repo') {
        /* 
         * Push build to docker repo
	 * Why you may ask?
	 * Because when amazon takes over, I will still be able to access my other repo
 	*/
          
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials')
            { 
	    app.push("latest") 
	    }
	}

    stage('Push image to Amazon Repo') {
	/*
	 * Push build to amazon repo
	*/
	    docker.build('tp-docker-repo')
	    docker.withRegistry('https://009328848241.dkr.ecr.eu-west-2.amazonaws.com', 'ecr:eu-west-2:aws-credentials') 
	    {
            docker.image('tp-docker-repo').push('latest')
            }
	   
      }
   
    stage('Plan Terraform deployment') {
            steps {
		dir(terraform-configuration){
                	sh 'terraform init -input=false'
                	sh "terraform plan --var-file=./terraform-configurations/input.tfvars"
            		}
		}
        }

    stage('Apply Terraform') {
            steps {
		dir(terraform-configuration){
                	sh "terraform apply -input=false"
            		}
		}
        }
    
}
