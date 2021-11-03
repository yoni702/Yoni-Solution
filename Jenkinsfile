node (label: 'slave'){
    def commit_id
    //To be able to take the tag version
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
    //TO-DO :Need to add tag to image 
    stage('4 - Build new image based on nginx image') {
        try {
            sh 'docker container stop yoni_site'
            sh 'docker container rm yoni_site'
            sh 'docker volume rm hackeru_volume'
        } catch (Exception e) {
            echo 'Exception occurred: ' + e.toString()
        }
        try {
            sh 'docker volume rm hackeru_volume'
        } catch (Exception e) {
            echo 'Exception occurred: ' + e.toString()
        }
        //create a volume from 'text-files'
        sh 'docker volume create --name hackeru_volume --opt type=none --opt device=/text-files --opt o=bind'
        sh 'docker build -t yoni_site .'
    
    }  
    //TO-DO :Need to shutdown older images 
    stage('5 - Run container with files from Stage 3 on Monted Volume') {
        sh 'docker run -d -p 80:80 --name=yoni_site  --mount source=hackeru_volume,destination=/var/www/html,readonly  yoni_site'
   

    } 

}