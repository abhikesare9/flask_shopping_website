node {
    stage("Checkout"){
        checkout([$class: 'GitSCM', branches: [[name: '*/master']],doGenerateSubmoduleConfigurations: false, extensions: [], submoduleCfg: [], userRemoteConfigs: [[ url: 'https://github.com/abhikesare9/flask_shopping_website.git']]])
    }
    stage('building')
    {
        sh script:'''
        #!/bin/bash
        docker build -t abhikesare9/flask_shopping_website:v2 .
        docker push abhikesare9/flask_shopping_website:v2
        '''
    }
    stage('deployment')
    {
        sh script:'''
        #!/bin/bash
        kubectl create deploy flaskshoppingwebsite  --image=abhikesare9/flask_shopping_website:v2 --replicas=3
        kubectl expose deploy flaskshoppingwebsite --type=NodePort --port=1111
        '''
    }
    stage('application verification'){
        sh script:'''
        #!/bin/bash
        rawport=`kubectl describe service | grep -i nodeport`
        portnumber=`echo $rawport | tr -dc '0-9'`
        minikubeip=`minikube ip`
        curl -I http://${minikubeip}:${portnumber}
        
        
        '''
    }
}
