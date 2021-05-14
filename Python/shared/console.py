from service.service import Service
import json





def action_api(service):
    #On affiche le menu du programme
    print("#####Menu##### \n"
        "Afficher la liste : 1 \n"
        "Afficher une machine : 2 \n"
        "Supprimer une machine : 3 \n"
        "Modifier une machine : 4 \n"
        "Ajouter une machine : 5 \n")

    #on insert une des valeur liste ci-dessus
    var1=int(input("Entrer la valeur :"))
    #Condition du programme en fonction du nb renseigner.
    if var1 == 1 :
        return service.get_machines()
    elif var1 == 2:
        hostname = input("Entrer le nom de la machine")
        return service.get_machine(hostname)
    elif var1 == 3 :
        hostname = input("Entrer le nom de la machine à supprimer : ")
        return service.delete_machine(hostname)
    elif var1 == 4 :
        hostname = input("Entrer le nom de la machine à modifier : ")
        with open('update-machine.json', 'r') as f: 
            machine = json.load(f)
        return service.update_machine(hostname, machine)
    elif var1 == 5 :
        with open('create_machine.json', 'r') as f: 
            machine = json.load(f)
        return service.add_machine(machine)
    else :
        print("Erreur merci de renseigner le paramètre (1,2,3,4,5)")

if __name__ == '__main__':
    
    serv = Service()
    #print(serv.get_machines())
print(action_api(serv))

