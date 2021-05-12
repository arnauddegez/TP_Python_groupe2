import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
base_de_donnees = myclient["tp-python"]
donnees_machines = base_de_donnees["machines"]

liste_machines = [
    {
        "hostname": "Web",
        "ip": "192.168.1.1",
        "cpus": 2,
        "ram": "42Go",
        "disque_dur": {
            "nb": 1,
            "taille": "2Go"
            },
        "os": {
            "nom": "Linux",
            "version": "1.0"
        }
    },
    {
       "hostname": "Nexus",
        "ip": "192.168.1.44",
        "cpus": 4,
        "ram": "24Go",
        "disque_dur": {
            "nb": 2,
            "taille": "4Go"
            },
        "os": {
            "nom": "Linux",
            "version": "1.0"
        }
    }
]

donnees_machines.insert_many(liste_machines)