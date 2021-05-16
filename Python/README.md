# Bienvenue sur la machine Python

## Prérequis : 

Voir les prérequis dans le Readme à la racine du dossier

S'assurer d'avoir récupérer tous les fichiers avec le git clone. 

Pour rappel : 

```console
git clone https://github.com/arnauddegez/TP_Python_groupe2.git
```

## Lancement de la machine :

Ouvrir le dossier python :

Lancer la commande : 
```console
vagrant up
```

Une fois l'installation terminé : 


## Connexion sur la machine :

```console
vagrant ssh
```
L'installation est terminé lorsque la ligne suivant apparé : 
```console
python: ####### LANCEMENT API #######
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




