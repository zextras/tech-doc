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
        BUILD_DIR   = 'build'
        SOURCE_DIR  = 'source'
        WORKSPACE = pwd()
    }
    stages {               
      stage('Build Sphinx with Docker') {
        steps {
           sh 'docker build -f Dockerfile -t sphinx_builder .'
           sh 'docker rm -v zsphinx'
           sh 'docker run -d --name zsphinx  sphinx_builder'
           sh 'docker cp zsphinx:docs/build $(pwd)'
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

}
