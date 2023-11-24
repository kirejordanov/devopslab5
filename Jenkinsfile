pipeline {
	agent any
	parameters {
		string(name: 'IMAGE-NAME', defaultValue: 'lab5', description: 'the name of docker image')
	}
	
	stages {
		stage('Setup') {
			steps {
				sh 'ansible-playbook ansibleplaybook.yml'
			}
		}
		stage('Build and push docker image') {
			steps {
				withCredentials([usernamePassword(credentialsId: 'dockerhubkire', passwordVariable: 'DOCKERHUB_PASSWORD', usernameVariable: 'DOCKERHUB_USERNAME')]){
					sh "docker login -u ${DOCKERHUB_USERNAME} -p ${DOCKERHUB_PASSWORD}"
					sh "docker build -t ${DOCKERHUB_USERNAME}/${params.IMAGE_NAME} ."
					sh "docker push ${DOCKERHUB_USERNAME}/${params.IMAGE_NAME}"
					sh "docker logout"
				}
			}
		}
		stage('Deploy') {
			steps {
				sh 'ansible-playbook ansible_deploy.yml'
			}
		}
	}
}
