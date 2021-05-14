# Installation Nexus

> Pour commencer l'installation lancer la commande
```
vagrant up
```
> A la fin de l'installation le mot de passe initial de Nexus sera affiché. Cela signifie que l'installation s'est correctement déroulée.

> /!\ A la fin de l'installation 2 fichiers seront générés dans le dossier "shared":
>  - **gradle.properties**: A copier dans le dossier "shared" de Jenkins. Il contient les variables nécessaires au "build" Jenkins pour pouvoir publier sur le Nexus. 
>  
>  - **export.sh**: A copier dans le dossier "shared" de Python. Cela permettra de placer les variables d'environnement pour la travailler sur Nexus.