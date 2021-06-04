pipeline {
  agent {
    docker {
      image 'ruby:2.7.0'
    }

  }
  stages {
    stage('Test') {
      steps {
        sh 'bundle install -j 4'
        sh 'bundle exec rspec'
      }
    }

  }
}