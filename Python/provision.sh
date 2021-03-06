#!/bin/sh

set -e #arrête le script si code retour non 0

# Variable de mise en forme
RED='\033[0;31m'	# Red Color
YELLOW='\033[0;33m'	# Yellow Color
GREEN='\033[0;32m'	# Grean Color
NC='\033[0m' 		# No Color

#Fonction 
#Installation des packages sous forme de fonction avec vérification si le package est installé
install_package() {
    PACKAGE="$1"
    if ! dpkg -l |grep --quiet "^ii.$PACKAGE"; then
        apt install -y "$PACKAGE"
    fi
}

#source mongodb 

source_mongodb() {
        if ! test -f /etc/apt/sources.list.d/mongodb-org-4.4.list ; then
        wget -q -O - https://www.mongodb.org/static/pgp/server-4.4.asc | apt-key add -
        sh -c 'echo deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main \
            tee /etc/apt/sources.list.d/mongodb-org-4.4.list'
    fi
}

# On installe l'utilitaire dos2unix
echo "${GREEN}$(date +'%Y-%m-%d %H:%M:%S') [ INFO  ] : Démarrage installation dos2unix ... ${NC}"
install_package "dos2unix"

# Installation des paquets necessaires
echo "${GREEN}$(date +'%Y-%m-%d %H:%M:%S') [ INFO  ] : Démarrage installation des paquets necessaire ... ${NC}"
install_package "ufw"

install_package "python3" 
install_package "python3-pip" 
install_package "python3-dev"
install_package "git"

#installation des composants necessaires
echo "${GREEN}$(date +'%Y-%m-%d %H:%M:%S') [ INFO  ] : Démarrage installation composants ... ${NC}"
pip3 install pymongo flask nexus3-cli

# https://docs.mongodb.com/manual/tutorial/install-mongodb-on-debian/

install_package "gnupg"
apt remove mongodb

wget -qO - https://www.mongodb.org/static/pgp/server-4.4.asc | sudo apt-key add -
echo "deb http://repo.mongodb.org/apt/debian buster/mongodb-org/4.4 main" | sudo tee /etc/apt/sources.list.d/mongodb-org-4.4.list

#source_mongodb

apt-get update

#installation de mongodb
install_package "mongodb-org"

sleep 60s

systemctl start mongod.service

# On force le pare feu a se mettre en route
ufw --force enable 

# On autorise les ports ssh et 5000
ufw allow ssh
ufw allow 5000/tcp

echo "####### SUCCESS #######"

# On lance le peuplement dans la base de donnes
python3 /home/shared/insert-machines.py

echo "####### LANCEMENT API #######"

# On lance le serveur Flask et on presente notre API.
python3 /home/shared/api.py

