pipeline {
	
    agent any
	tools{
		maven 'Maven 3.8.6'	
	}	
	
	stages {

        stage('init') {
            steps {
				script{
					sh 'java -version'						
					sh 'docker --version'						
					sh 'docker compose --version'						
				}
			}
        }


        stage('build') {
        	environment{
        		NEW_VERSION = '1.3.0'
        		//SERVER_CREDENTIALS = credentials('My-Git-Token')
        		//sh "mvn -version"
        	}
            steps {
/*            
            	 when {
            	 	expression {
            	 		BRANCH_NAME == 'dev' || BRANCH_NAME == 'master' 
            	 	}
            	 }
*/            	 
			     script {
					echo 'Building the application'
					echo "Building version ${NEW_VERSION}" 
                }
            }
        }
        
        stage('test') {

            steps {
			     script {
					echo 'Testing the application'
                }
            }
        }     
             
        stage('deploy') {

            steps {
			     script {
					echo 'Deploying the application'
					//echo "Deploying with ${SERVER_CREDENTIALS}"
					//sh "${SERVER_CREDENTIALS}"

					//withCredentials([ usernamePassword(credentials: 'server-credentials', usernameVariable: USER, passwordVariable: PWD)]){
						//sh "Some script ${USER} ${PWD}"											
					//}
                }
            }
        }
/*        
        post {
        	always {
        		//	
        	}
        	success {
        		//	
        	}        
        	failure {
        		//	
        	}        
        }     
*/
	 
	}
}