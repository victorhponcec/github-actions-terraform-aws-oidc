pipeline {
  agent any

  environment {
    TF_WORKDIR = "/workspace/${JOB_NAME}"
  }

  stages {

    stage('Verify Workspace') {
      steps {
        sh '''
          echo "Jenkins workspace:"
          pwd
          ls -la
        '''
      }
    }

    stage('Terraform Init') {
      steps {
        sh '''
          docker exec terraform sh -c "
            cd ${TF_WORKDIR} &&
            terraform init
          "
        '''
      }
    }

    stage('Terraform Plan') {
      steps {
        sh '''
          docker exec terraform sh -c "
            cd ${TF_WORKDIR} &&
            terraform plan
          "
        '''
      }
    }

    stage('Terraform Apply') {
      when { branch 'main' }
      steps {
        sh '''
          docker exec terraform sh -c "
            cd ${TF_WORKDIR} &&
            terraform apply -auto-approve
          "
        '''
      }
    }
  }
}
