  > On commence par déployer la VM

```
vagrant up
```

> Si elle est correctement provisionnée on doit pouvoir exécuter la commande
```
python3 /home/shared/insert-games.py
```
> Si elle est correctement provisionnée on doit pouvoir voir la page à l'adresse suivante http://192.168.1.1:80/

> Lancer le serveur python
```
python3 /home/shared/api.py
```
> On doit pouvoir voir les jeux ainsi insérés à l'adresse
http://192.168.1.1:5000/bordgames/v1.0/games

> On vérifie à l'aide de curl également

```
curl -i http://192.168.1.1:5000/bordgames/v1.0/games
```
> On peut également vérifier en console les appels au service
```
python3 /home/shared/console.py
```