
Here is the Jenkinsfile:


// Define a pipeline with multiple stages
pipeline {
    // Use any available agent to run the pipeline
    agent any

    // Define the stages of the pipeline
    stages {
        // Stage 1: Build the Node.js service
        stage('Build') {
            // Install dependencies and build the service
            steps {
                sh 'npm install' // Install dependencies
                sh 'npm run build' // Build the service
            }
        }

        // Stage 2: Test the Node.js service
        stage('Test') {
            // Run tests for the service
            steps {
                sh 'npm run test' // Run tests
            }
        }

        // Stage 3: Build a Docker image for the service
        stage('Build Docker Image') {
            // Build a Docker image for the service
            steps {
                sh 'docker build -t my-nodejs-service .' // Build the Docker image
            }
        }

        // Stage 4: Push the Docker image to Docker Hub
        stage('Push Docker Image') {
            // Push the Docker image to Docker Hub
            steps {
                sh 'docker tag my-nodejs-service:latest <your-docker-hub-username>/my-nodejs-service:latest' // Tag the image
                sh 'docker push <your-docker-hub-username>/my-nodejs-service:latest' // Push the image
            }
        }

        // Stage 5: Deploy the service to a Kubernetes cluster
        stage('Deploy to Kubernetes') {
            // Deploy the service to a Kubernetes cluster
            steps {
                sh 'kubectl apply -f deployment.yaml' // Apply the deployment YAML file
            }
        }

        // Stage 6: Verify the deployment
        stage('Verify Deployment') {
            // Verify that the deployment was successful
            steps {
                sh 'kubectl get deployments' // Get the deployment status
                sh 'kubectl get pods' // Get the pod status
            }
        }
    }

    // Define post-pipeline actions
    post {
        // Action to take if the pipeline succeeds
        success {
            echo 'Deployment successful!' // Print a success message
        }

        // Action to take if the pipeline fails
        failure {
            echo 'Deployment failed!' // Print a failure message
        }
    }
}


