import pymongo
from bson.json_util import dumps, loads
import random
import json

class Service():

    def __init__(self):
        myclient = pymongo.MongoClient("mongodb://localhost:27017/")
        base_de_donnees = myclient["tp-python"]
        self.donnees_machines = base_de_donnees["machines"]
        
    # https://www.w3schools.com/python/python_mongodb_getstarted.asp

    def get_machines(self):
        # Returns a JSON of the machines defined above. jsonify is a Flask function that serializes the object for us.
        lst = list(self.donnees_machines.find({})) # Converts object to list
        return dumps(lst) # Converts to String

    def get_machine(self, hostname):
            
        myquery = { "hostname": hostname }
    
        l = list(self.donnees_machines.find(myquery, {"_id": 0})) # Converts object to list

        return dumps(l) # Converts to String
        
    def delete_machine(self, hostname):

        myquery = { "hostname": hostname }

        self.donnees_machines.delete_one(myquery)
        
        return "Deleted"
        
    def update_machine(self, hostname):

        myquery = { "hostname": hostname }
        newvalues = { "$set": { "hostname": random.randint(0,11) } }

        self.donnees_machines.update_one(myquery, newvalues)
        
        return "Updated"    

    def add_machine(self):
        x = self.donnees_machines.insert_one(request.json)
        
        return "Added"


