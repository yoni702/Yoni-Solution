#!/usr/bin/env groovy
node {
    def commit_id
    stage('Prepare') {
        git 'https://github.com/yoni702/Yoni-Solution.git'
        sh "git rev-parse --short HEAD > .git/commit-id"
        commit_id = readFile('.git/commit-id')
    
    
    stage('1 - create 10 files with text') {
        for (int i = 1; i < 11; i++) {
            writeFile file: "file${i}.txt", text: "Random sample text."
        }
    }
    
    stage('2 - insert time, date, time zone, to the files') {
        d = new Date()
        String stage2 = "\nTime: ${d.format("HH:mm:ss")} \nDate: ${d.format("dd/MM/yyy")}  \nTimeZone: ${d.format("zzz")}"
        for (int i = 1; i < 11; i++) {
            sh "echo '${stage2}' >> file${i}.txt"
        }
    }

    stage('3 - make those files read-only') {
        sh 'for f in *.txt;do chmod 444 ${f}; done'
    } 

    stage('4 - Build new image based on nginx image') {
        sh 'docker build -t yoni_site .'
    }  

    stage('5 - Run container with mounted directory with files from Stage 3') {
        sh 'docker run -- rm yoni_site'
    } 
}