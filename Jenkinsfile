podTemplate(label: 'prometheus-operated-builder', containers: [
	containerTemplate(name: 'jnlp', image: 'jenkinsci/jnlp-slave:2.52', args: '${computer.jnlpmac} ${computer.name}', command: ''),
    containerTemplate(name: 'docker', image: 'docker:1.11.2', ttyEnabled: true, command: 'cat'),
  ],
  volumes: [hostPathVolume(mountPath: '/var/run/docker.sock', hostPath: '/var/run/docker.sock')]) {

    node ('prometheus-operated-builder') {

		stage 'Checkout'
    // 	checkout scm
        git 'https://github.com/enxebre/prometheus-operated-chart'
        
        container('docker') {

            stage 'Build Self Contained Helm Repo'
            sh 'docker build -t enxebre/prometheus-operated-chart .'
            
            stage 'Push Self Contained Helm Repo'
            sh "docker login -u enxebre -p ${dockerHubPass}"
            sh 'docker push enxebre/prometheus-operated-chart'
        }
    }
}