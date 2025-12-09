pipeline {
    agent any

    options {
        timestamps()
    }

    stages {
        stage('Checkout') {
            steps {
                echo "=== Checkout Stage ==="
                sh 'pwd && ls -la'
            }
        }

        stage('Build') {
            steps {
                echo "=== Build Stage (simulated) ==="
                sh '''
                    echo "Compiling project..."
                    sleep 1
                    echo "Build finished."
                '''
            }
        }

        stage('Test') {
            steps {
                echo "=== Test Stage (simulated) ==="
                sh '''
                    echo "Running unit tests..."
                    sleep 1
                    echo "All tests passed!"
                '''
            }
        }

        stage('Package') {
            steps {
                echo "=== Package Stage ==="
                sh '''
                    mkdir -p build
                    echo "This is a sample build artifact." > build/artifact.txt
                    ls -la build
                '''
            }
        }

        stage('Docker Build') {
            when {
                expression { fileExists('Dockerfile') }
            }
            steps {
                echo "=== Docker Build Stage ==="
                sh '''
                    echo "Current directory and files before docker build:"
                    pwd
                    ls -la

                    echo "Building Docker image..."
                    docker build -t jenkins-demo:${BUILD_NUMBER} .
                    echo "Docker images (top 5):"
                    docker images | head -n 5
                '''
            }
        }

        stage('Docker Run (Test image)') {
            when {
                expression { fileExists('Dockerfile') }
            }
            steps {
                echo "=== Docker Run Stage ==="
                sh '''
                    echo "Running container from image jenkins-demo:${BUILD_NUMBER}"
                    docker run --rm jenkins-demo:${BUILD_NUMBER}
                '''
            }
        }
    }

    post {
        success {
            echo "Pipeline completed successfully 🎉"
        }
        failure {
            echo "Pipeline failed ❌"
        }
        always {
            echo "Pipeline finished (success or fail)."
        }
    }
}
