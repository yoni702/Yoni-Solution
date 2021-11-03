---------------------------------------------------------------------------------------
                        CONFIGURATION OF  EC2 INSTANCES
---------------------------------------------------------------------------------------
Prerequsites
On Slave run (All the commandes are  in onSalve.sh)
    -Install Docker on linux ami
    -Install git
    -Install java 11
    -Docker Pull & Run Jenkins image with port forwarding to 11011(not need the port)
    -assert 'candidate-test.pem' is in  authorized_keys




On master run (All the commande are  in onMaster.sh)
    -Install Docker on linux ami
    -Install git
    -Docker Pull & Run Jenkins image with port fowarding to 11011
    -Copy the public key  to master node’s known_hosts file from slave

---------------------------------------------------------------------------------------
                        CONFIGURATION OF JENKINS MASTER AND SLAVE
---------------------------------------------------------------------------------------

1 - Manage Jenkins > Manage Nodes and Clouds > New node
    -name  the Node "SLAVE" 
    -check Permanent agent
    remote directory = /home/ec2-user/jenkins (please assert you do have this folder in the slave ec2)
    label =  on-slave
    Launch agent via ssh
    add credentials 
    ans save 


---------------------------------------------------------------------------------------
                        CONFIGURATION OF JENKINS PIPELINE
---------------------------------------------------------------------------------------

-new item enter the name: "yonipipeline" (Important it will be hardcoded in the Jenkinsfile)
-choose pipeline 

enter the configuration of the pipeline 
-Go Down to "Build Triggers" section and choose "Poll SCM" and paste "H/2 * * * *"
-Go Down to "Pipeline" section and choose "Pipeline script from SCM"
-Choose GIT and paste the link "https://github.com/yoni702/Yoni-Solution"
-Go Down to "Script Path" section and paste "Jenkinsfile"
-Click Apply


---------------------------------------------------------------------------------------
                        BUILD
---------------------------------------------------------------------------------------