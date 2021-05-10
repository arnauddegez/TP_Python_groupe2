import pymongo
from bson.json_util import dumps, loads
import random
import json

class Service():

    def __init__(self):
        myclient = pymongo.MongoClient("mongodb://localhost:27017/")
        mydb = myclient["mydatabase-webservices"]
        self.mycol = mydb["games"]
        
    # https://www.w3schools.com/python/python_mongodb_getstarted.asp

    def get_games(self):
        # Returns a JSON of the games defined above. jsonify is a Flask function that serializes the object for us.
        lst = list(self.mycol.find({})) # Converts object to list
        return dumps(lst) # Converts to String

    def get_game(self, game_id):
            
        myquery = { "id": game_id }
    
        l = list(self.mycol.find(myquery, {"_id": 0})) # Converts object to list

        return dumps(l) # Converts to String
        
    def delete_game(self, game_id):

        myquery = { "id": game_id }

        self.mycol.delete_one(myquery)
        
        return "Efface"
        
    def update_game(self, game_id):

        myquery = { "id": game_id }
        newvalues = { "$set": { "id": random.randint(0,11) } }

        self.mycol.update_one(myquery, newvalues)
        
        return "Efface"    

    def add_game(self):
        x = self.mycol.insert_one(request.json)
        return "Add"


