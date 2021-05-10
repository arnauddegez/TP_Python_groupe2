import pymongo

myclient = pymongo.MongoClient("mongodb://localhost:27017/")
mydb = myclient["mydatabase"]
mycol = mydb["customers"]

for x in mycol.find({},{ "_id": 0, "name": 1, "address": 1 }):
  print(x)
  
print("##################")
  
myquery = { "address": "Park Lane 38" }

mydoc = mycol.find(myquery, {"_id": 0})

for x in mydoc:
  print(x)
  
print("##################")
  
myquery = { "address": { "$gt": "S" } }

mydoc = mycol.find(myquery, {"_id": 0})

for x in mydoc:
  print(x)