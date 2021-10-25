pipeline {
    agent {
  		  node {
  			   label 'base-agent-v1'
  		       }
  	}
  	options {
  		buildDiscarder(logRotator(numToKeepStr: '2'))
  		timeout(time: 2, unit: 'HOURS')
  	}
    environment {
        SPHINX_DIR  = '.'
        BUILD_DIR   = './build'
        SOURCE_DIR  = './source'
        WORKSPACE = pwd()
    }
    stages {               
      stage('Build Sphinx with Docker') {
        steps {
           sh 'docker build -f Dockerfile -t sphinx_builder .'
           script {
              env.CONTAINER_ID = sh(returnStdout: true, script: 'docker run -dt -v ${WORKSPACE}:/docs sphinx_builder').trim()
            }
           sh "docker exec -t ${env.CONTAINER_ID} bash -c 'pwd;ls source/;sphinx-build /docs/source/suite /docs/build/suite/'"
                          }
               }

      stage('Upload to AWS') {
        steps {
            withAWS(region: "eu-west-1", credentials: "doc-zextras-area51-s3-key") {
                 s3Upload(bucket: "zextrasdoc",
                 includePathPattern: '**',
                 workingDir: 'build'
                               )
                           }
                }
        }
    }

            post {
                failure {
                     script {
                         notifications.emailNotification subject: "Sphinx documentation failed", attachLog: false, rcpts: ['fabio.francescone@zextras.com']
                     }
                 }
                success {
                     script {
                         notifications.emailNotification subject: "Sphinx documentation was released on $BUCKET_NAME", attachLog: false, rcpts: ['fabio.francescone@zextras.com']
                     }
                 }
            }
        }
