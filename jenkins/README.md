# Installation Jenkins

> Pour commencer l'installation lancer la commande
```
vagrant up
```
> A la fin de l'installation le mot de passe initial de Jenkins sera affiché. Copiez le.
> Se rendre à l'adresse http://192.168.1.3:8080/ et renseignez le mot de passe précédemment copié.

Une page s'affiche avec 2 options possibles.
- Choisir l'option 'Sélectionner les plugins à installer'.
- Sélectionner alors l'onglet recommandés et recherchez  et cochez les plugins suivants:
>  - Cobertura
>  - Warnings Next Generation

**Désactiver le plugin gradle**

Cliquez sur "Installer"

Arrive la page "Créer le 1er utilisateur"
Renseignez a minima les champs.
> - Nom d'utilisateur
> - Mot de passe
> - Confirmation du mot de passe

Cliquez sur "Continuez en tant qu'administrateur"
Cliquez sur "Sauver et terminer"
Cliquez sur "Commencer à utiliser Jenkins"

Vous arrivez sur la page principale
Sélectionner le menu "Administrer Jenkins" puis "Gestion des plugins". Placez vous sur l'onglet "Disponibles

Dans la barre de recherche, recherchez les plugins suivants
>  - AnsiColor
>  - Slack Notification

Pour chacun cochez la case et cliquez sur "Install without restart"

Sélectionnez "Tableau de bord" puis "Nouveau item"
Renseignez un nom de projet puis sélectionnez "Pipeline"
Cliquez sur "Ok"

Une nouvelle page apparait
ou Cliquez sur le projet puis "Configurer"
Sélectionnez la case à cocher "GitHub hook trigger for GITScm polling"
Copiez alors le contenu du fichier "pipeline.txt" du projet
Cliquez sur "Sauver"

Sur la page principale vous pouvez alors cliquer sur "Lancer un build"


======================================================

Attention au Relay && slack !!!

https://webhookrelay.com/v1/installation/cli.html#Registration-amp-Authentication

https://webhookrelay.com/blog/2017/11/23/github-jenkins-guide/#Step-6-Setting-up-Webhook-Relay-agent

La partie installation est faite

Slack

https://medium.com/appgambit/integrating-jenkins-with-slack-notifications-4f14d1ce9c7a

https://www.baeldung.com/ops/jenkins-slack-integration

Capture écran slack !

Pense bete...
> https://opensource.triology.de/jenkins/pipeline-syntax/globals
> https://webhookrelay.com/v1/installation/cli.html
> https://git-scm.com/docs/pretty-formats
