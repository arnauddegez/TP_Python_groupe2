#!/bin/sh

# On installe l'utilitaire dos2unix
apt install dos2unix
# Installation des paquets necessaires
apt install -y apache2
apt install ufw

apt install -y python3 python3-pip python3-dev git 

pip3 install pymongo flask

# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/

apt-get install gnupg

wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -

echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

apt-get update

apt-get install -y mongodb-org

systemctl start mongod

# On force le pare feu a se mettre en route
ufw --force enable 

# On autorise les ports ssh, http et https
ufw allow ssh
ufw allow http
ufw allow https
ufw allow 5000

# On deplace le index.html partage vers le repertoire cible
cp /home/shared/index.html /var/www/html/

# On change le 'owner' sur le dossier 'html'
cd /var/www
chown -R www-data:www-data html/

