# TP_Python_groupe2
Repo Tp Python de la semaine du 10/05 au 14/05


Prerequis : 

git bash
vagrant 
vérifier le réseau dans lequel on est : ex :192.168.x.xx

x = reseau local 

ne pas hésiter à changer les adresses ip dans les vagrants file 

liste serveurs : 

- jenkins : 192.168.1.3
- web : 192.168.1.44
- python : 192.168.1.1



installation du plugin vagrant-vbguest si problème de montage du partage "shared"
unknown filesystem type 'vboxsf'

executer la commande :
```console
vagrant plugin install vagrant-vbguest
```

Mettre à jour Vagrant box : 

```console
vagrant box update
```

lancer la commande pour chaque machine : 

```console
vagrant up
```


A la fin de l'installation, il faut récupérer le mode passe jenkins : 
```console
jenkins: 2021-05-10 09:19:21 [ INFO  ] : Mot de passe jenkins ...
jenkins: 8841043cc35f452c9973c08492152ef4
```

si le mot de passe jenkins s'affiche correctement, le serveur jenkins est installé.

