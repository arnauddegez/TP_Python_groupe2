#!/usr/bin/env bash

set -e #En cas de code de retour non zero, arrêter le script

# Alias jenkins

# Variable de mise en forme
RED='\033[0;31m'	# Red Color
YELLOW='\033[0;33m'	# Yellow Color
GREEN='\033[0;32m'	# Grean Color
NC='\033[0m' 		# No Color


##Fonction: 

#Installation des packages sous forme de fonction avec vérification si le package est installé
install_package() {
    PACKAGE="$1"
    if ! dpkg -l |grep --quiet "^ii.$PACKAGE"; then
        apt install -y "$PACKAGE"
    fi
}

# Main
apt-get update
install_package "openjdk-8-jdk"

##Main
useradd -M -d /opt/nexus -s /bin/bash -r nexus
echo "nexus   ALL=(ALL)       NOPASSWD: ALL" > /etc/sudoers.d/nexus

wget https://sonatype-download.global.ssl.fastly.net/repository/downloads-prod-group/3/nexus-3.29.2-02-unix.tar.gz

mkdir /opt/nexus

tar xzf nexus-3.29.2-02-unix.tar.gz -C /opt/nexus --strip-components=1

chown -R nexus: /opt/nexus

sed -i 's/#run_as_user=""/run_as_user="nexus"/' /opt/nexus/bin/nexus.rc

## On modifie la configuration pour qu'elle fonctionne
sudo sed -i 's/..\/sonatype-work/.\/sonatype-work/g' /opt/nexus/bin/nexus.vmoptions
sudo sed -i 's/2073/1024/g' /opt/nexus/bin/nexus.vmoptions

sudo -u nexus /opt/nexus/bin/nexus start

sleep 15s

cat >> /opt/nexus/sonatype-work/nexus3/etc/nexus.properties << 'EOL'
nexus.scripts.allowCreation=true
EOL

# Service

cat > /etc/systemd/system/nexus.service << 'EOL'
[Unit]
Description=nexus service
After=network.target
[Service]
Type=forking
LimitNOFILE=65536
ExecStart=/opt/nexus/bin/nexus start
ExecStop=/opt/nexus/bin/nexus stop
User=nexus
Restart=on-abort
[Install]
WantedBy=multi-user.target
EOL

/opt/nexus/bin/nexus stop

systemctl daemon-reload

systemctl enable --now nexus.service

ufw default allow outgoing

ufw allow 8081/tcp
ufw allow ssh

ufw --force enable

# Affiche le mot de passe

sleep 120s #il faut attendre que le fichier se crée.

echo 'Mot de passe admin \n'
cat /opt/nexus/sonatype-work/nexus3/admin.password
echo '\n\n'

export NEXUS_URL=http://localhost:8081

export NEXUS_URL_FILE=http://192.168.1.44:8081

export NEXUS_PASSWORD=$(xargs < /opt/nexus/sonatype-work/nexus3/admin.password)

[ ! -r /home/shared/gradle.properties ] && touch /home/shared/gradle.properties

cat <<EOF > /home/shared/gradle.properties
nexusRepo=${NEXUS_URL_FILE}/repository/tp-repository/
nexusUsername=admin
nexusPassword=${NEXUS_PASSWORD}
EOF

cat <<EOF > /home/shared/export.sh
#!/bin/bash
export NEXUS3_URL=${NEXUS_URL_FILE}
export NEXUS3_USERNAME=admin
export NEXUS3_PASSWORD=${NEXUS_PASSWORD}
EOF

sleep 60s

curl -u admin:${NEXUS_PASSWORD} -X POST -H 'Content-Type: application/json' ${NEXUS_URL}/service/rest/v1/script -d @/home/shared/rawHostedRepo.json 

curl -vvv -u admin:${NEXUS_PASSWORD} -X POST --header 'Content-Type: text/plain' ${NEXUS_URL}/service/rest/v1/script/rawHostedRepo/run

echo 'Mot de passe admin \n'
cat /opt/nexus/sonatype-work/nexus3/admin.password
echo '\n\n'