sudo docker container stop yoni_site
sudo docker container rm yoni_site
sudo docker volume rm hackeru_volume


#sudo docker volume create --name hackeru_volume --opt type=none --opt device=/home/devops/docker/text-files/ --opt o=bind
sudo docker volume create --name volume --opt type=none --opt device=text-files/ --opt o=bind
sudo docker build -t yoni_site .

#sudo docker run -d -p 82:80 --name=yoni_site  --mount source=hackeru_volume,target=/var/www/html,readonly yoni_site
sudo docker run -d -p 80:80 --name yoni_site --mount --opt type=nfs source=hackeru_volume,target=/var/www/html yoni_site
sudo docker run -d -p 82:80 --name=yoni_site --mount source=hackeru_volume,target=/var/www/html yoni_site