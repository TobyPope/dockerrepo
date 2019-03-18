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
	   
	   sh 'aws ecr get-login --no-include-email --region eu-west-2'
	   sh 'docker build -t tp-docker-repo .'
	   sh 'docker tag tp-docker-repo:latest 009328848241.dkr.ecr.eu-west-2.amazonaws.com/tp-docker-repo:latest'
 	   sh 'docker push 009328848241.dkr.ecr.eu-west-2.amazonaws.com/tp-docker-repo:latest'
	}
    }
}
