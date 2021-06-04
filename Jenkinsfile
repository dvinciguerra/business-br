pipeline {
  agent any
  stages {
    stage('Test') {
      steps {
        sh 'bundle install -j 4'
        sh 'bundle exec rspec'
      }
    }

  }
}