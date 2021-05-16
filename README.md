# TP_Python_groupe2
Repo Tp Python de la semaine du 10/05 au 14/05


Prerequis : 

git bash installé

vagrant 

Lancer la commande suivant dans un dossier "lenomquevousvoulez"

```console
git clone https://github.com/arnauddegez/TP_Python_groupe2.git
```


vérifier le réseau dans lequel on est : ex :192.168.x.xx

x = reseau local 

ne pas hésiter à changer les adresses ip dans les vagrants file 

liste serveurs : 

- jenkins : 192.168.1.3
- nexus : 192.168.1.44
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

Commencer par la machine Nexus

Puis lancer les autres : 

```console
vagrant up
```

Voir le README.md présent dans chaque dossier. (Nexus, Jenkins, Python)



