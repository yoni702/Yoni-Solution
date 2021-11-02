#!/usr/bin/env groovy
node (label: 'slave'){
    def commit_id
    stage('Prepare') {
        git 'https://github.com/yoni702/Yoni-Solution.git'
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id')
    }
    
    stage('1 - create 10 files with text') {
        sh 'sudo rm -rf text-files/'
        sh 'sudo mkdir text-files'
        sh 'sudo chmod 777 text-files'
        for (int i = 1; i < 11; i++) {
            writeFile file: "text-files/file${i}.txt", text: "Random sample text."
        }
    }
    
    stage('2 - insert time, date, time zone, to the files') {
        d = new Date()
        String stage2 = "\nTime: ${d.format("HH:mm:ss")} \nDate: ${d.format("dd/MM/yyy")}  \nTimeZone: ${d.format("zzz")}"
        for (int i = 1; i < 11; i++) {
            sh "echo '${stage2}' >> text-files/file${i}.txt"
        }
    }

    stage('3 - make those files read-only') {
        sh 'for f in text-files/*.txt;do chmod 444 ${f}; done'
    } 

    stage('4 - Build new image based on nginx image') {
        # build the new image
        sh 'docker build -t yoni_site:"${commit_id}" .'
    
    }  

    stage('5 - Run container with mounted directory with files from Stage 3') {
        sh 'docker run -d -p 80:80  yoni_site:"${commit_id}"'
    } 

}