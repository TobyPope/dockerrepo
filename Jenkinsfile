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
          
            docker.withRegistry('https://registry.hub.docker.com', 'docker-hub-credentials') {
            app.push("latest")
        }

    stage('Push image to Amazon Repo') {
	/*
	 * Push build to amazon repo
	*/
	   
	    docker.withRegistry('009328848241.dkr.ecr.eu-west-2.amazonaws.com', 'ecr:eu-west-2:aws-credentials') {
            app.push("latest")
        }
	   
	  	}
    }
}
