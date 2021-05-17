# Bienvenue sur la machine Python

## Prérequis : 

Voir les prérequis dans le Readme à la racine du dossier

S'assurer d'avoir récupérer tous les fichiers avec le git clone. 

Pour rappel : 

```console
git clone https://github.com/arnauddegez/TP_Python_groupe2.git
```

L'installation est terminé lorsque la ligne suivant apparé : 
```console
python: ####### LANCEMENT API #######
```

## Lancement de la machine :

Ouvrir le dossier python :

Lancer la commande : 
```console
vagrant up
```

Une fois l'installation terminé : 

Vous pouvez que vous avez un résultat JSON à cette adresse http://192.168.1.1:5000/boardmachine/v1.0/machines

## Connexion sur la machine :

```console
vagrant ssh
```
Si on est pas à la suite du vagrant up il faudra lancer le serveur flask avec l'API ainsi que le service MongoDB

```console
sudo systemctl start mongod.service

python3 /home/shared/api.py
```

### Vérifier également que Python soit bien installé : 

Se placer dans le dossier shared puis lancer les commandes suivantes :

```console
python3 --version
```

### API NEXUS

```
curl -u ${NEXUS3_USERNAME}:${NEXUS3_PASSWORD} -X GET http://192.168.1.44:8081/service/rest/v1/repositories

curl -u ${NEXUS3_USERNAME}:${NEXUS3_PASSWORD} -X GET 'http://192.168.1.44:8081/api/v2/organizations'

curl -u ${NEXUS3_USERNAME}:${NEXUS3_PASSWORD} -X POST -H "Content-Type: application/json" -d '{"publicId": "MyApplicationID","name": "MyFirstApplication","organizationId":"<MyApplicationID>","contactUserName":"AppContact","applicationTags": [{"tagId":"<TagsId>"}]}' 'http://192.168.1.44:8081/api/v2/applications'
```

A Noter que api.py situé dans le fichier /home/shared/ permet de lancer flask.

Ouvrir un autre terminal et se connecter encore une fois sur la machine python. 

Lancer le programme console.py

Suivre les instructions.




