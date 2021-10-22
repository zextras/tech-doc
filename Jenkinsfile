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
        stage('Install Dependencies') {
            steps {
                // virtualenv may not be necessary with root,
                // but I still think it's a good idea.
                sh '''
                   virtualenv pyenv
                   . pyenv/bin/activate
                   pip install -r ${SPHINX_DIR}/requirements.txt
                '''
            }
        }
        stage('Build') {
            steps {
                // clear out old files
                sh 'rm -rf ${BUILD_DIR}'
                sh 'rm -f ${SPHINX_DIR}/sphinx-build.log'

                sh '''
                   ${WORKSPACE}/pyenv/bin/sphinx-build \
                   -q -w ${SPHINX_DIR}/sphinx-build.log \
                   -b html \
                   -d ${BUILD_DIR} ${SOURCE_DIR} ${BUILD_DIR}
                '''

            withAWS(region: "eu-west-1", credentials: "doc-zextras-area51-s3-key") {
                 s3Upload(bucket: "zextrasdoc",
                 includePathPattern: '**',
                 workingDir: 'build'
                               )
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
