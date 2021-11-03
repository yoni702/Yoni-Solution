sudo docker container stop yoni_site
sudo docker container rm yoni_site
sudo docker volume rm hackeru_volume


sudo docker volume create --name hackeru_volume  --opt device=text-files 
sudo docker build -t yoni_site .

sudo docker run -d -p 82:80 --name=yoni_site  --mount --opt type=nfs source=hackeru_volume,destination=/var/www/html yoni_site
sudo docker run -d -p 80:80 --name yoni_site --mount source=hackeru_volume,target=/var/www/html yoni_site