pipeline {
  agent any

  parameters {
    booleanParam(
      name: 'APPLY',
      defaultValue: false,
      description: 'Run terraform apply'
    )
  }

  environment {
    TF_WORKDIR = "/workspace/${JOB_NAME}"
  }

  stages {

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
      when {
        expression { params.APPLY }
      }
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
