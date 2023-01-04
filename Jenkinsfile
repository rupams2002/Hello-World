pipeline {
	
    agent { label 'agent_mohammed1' }
    
    environment{
        dockerhub = credentials('Docker-Hub')
    }    

	stages {

        stage('init') {
            steps {
				script{
					sh 'java -version'
					sh 'docker --version'
					sh 'docker compose version'
	       		    sh 'mvn -version'
				}
			}
        }


        stage('build') {
            steps {
                 
			    script {
					echo '********* Start Building Project *********'
					sh 'whoami'

                    if( fileExists ("${env.WORKSPACE}/Hello-World")  ){
					  sh 'rm -R *'
                      sh "pwd"
                    }


					echo 'Start Git Clone'
					sh 'git clone https://github.com/rupams2002/Hello-World.git'
					//sh 'git branch'
					
                    dir("${env.WORKSPACE}/Hello-World"){
                      sh "pwd"
  					  //sh 'mvn clean package'
  					  sh 'mvn clean flyway:migrate -Dflyway.configFiles=flyway.conf package'

					  sh 'docker container prune -f' //remove any stopped containers
  					  sh 'docker system prune -a -f' //remove any stopped containers and all unused images
                      //sh 'kill -9 `sudo lsof -t -i:9001`'
  					  
  					  sh 'docker rm -f $(docker ps -q) || true'
  					  sh 'docker build -t rupams2002/hello-world:1.0-SNAPSHOT .'
    				  sh 'docker run -d -p 9001:9001 --name helloworld  rupams2002/hello-world:1.0-SNAPSHOT'


                      withCredentials([string(credentialsId: 'DockerHub-PWD-SecretText', variable: 'dockerhubpwd')]) {
      					  sh 'docker login -u $dockerhub_USR -p ${dockerhubpwd}'
                      }

  					  //sh 'echo $dockerhub_PSW | docker login -u $dockerhub_USR --password-stdin'
  					  
  					  //sh 'docker tag mohammed/hello-world:1.0-SNAPSHOT rupams2002/hello-world:1.0-SNAPSHOT'  // If image and tag is different then match tag with docker hub. in my case rupams2002/xxxxxxxxx
  					  sh 'docker push rupams2002/hello-world:1.0-SNAPSHOT'
  					  
  					  
                      sh 'docker compose up -d'
                      sh 'docker compose ps'
                      
                      
  					  //sh 'mvn com.microsoft.azure:azure-spring-cloud-maven-plugin:1.3.0:config'
                    }					
                }
            }
        }
        

	}
}