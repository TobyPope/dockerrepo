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

    stage('Apply Terraform') {
    	withCredentials(
	[[$class: 'AmazonWebServicesCredentialsBinding', 
	accessKeyVariable: 'AWS_ACCESS_KEY_ID',
	credentialsId: 'aws-credentials', 
	secretKeyVariable: 'AWS_SECRET_ACCESS_KEY']]) {
        sh 'sudo ./build.sh'
    }          	
    }
    
}
