pipeline {
    agent any

    options {
        timestamps()        // show timestamps in log
    }

    stages {
        stage('Checkout') {
            steps {
                echo "Listing files in workspace after Git checkout:"
                sh 'pwd'
                sh 'ls -la'
            }
        }

        stage('Build') {
            steps {
                echo "Build step – simulate compilation"
                sh '''
                    echo "Compiling project..."
                    sleep 1
                    echo "Build finished."
                '''
            }
        }

        stage('Test') {
            steps {
                echo "Test step – simulate running tests"
                sh '''
                    echo "Running unit tests..."
                    sleep 1
                    echo "All tests passed ✅"
                '''
            }
        }

        stage('Package') {
            steps {
                echo "Packaging artifacts (demo)"
                sh '''
                    mkdir -p build
                    echo "This would be your build artifact." > build/artifact.txt
                    ls -la build
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
