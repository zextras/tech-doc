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
      stage('Building Sphinx using doker') {
        steps {
            sh 'docker build -f Dockerfile -t sphinx_builder .'
	    sh 'make -C source/suite html'

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
                    sh 'cat ${SPHINX_DIR}/sphinx-build.log'
                }
                success {
                     script {
                         notifications.emailNotification subject: "Sphinx documentation was released on $BUCKET_NAME", attachLog: true, rcpts: ['luca.arcara@zextras.com']
                     }
                 }
            }
        }
