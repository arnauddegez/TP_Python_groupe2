# Import the Flask module that has been installed.
from flask import Flask, jsonify, request
import json
from service.service import Service

# Creating a new "app" by using the Flask constructor. Passes __name__ as a parameter.
app = Flask(__name__)
serv = Service()

# Annotation that allows the function to be hit at the specific URL.
@app.route("/")
# Generic Python functino that returns "Hello world!"
def index():
    return "Hello world!"
    
# Annotation that allows the function to be hit at the specific URL. Indicates a GET HTTP method.
@app.route("/bordgames/v1.0/games", methods=["GET"])
# Function that will run when the endpoint is hit.

# curl http://localhost:5000/bordgames/v1.0/games

def get_games():
    return serv.get_machines()
    
# Annotation that allows the function to be hit at the specific URL with a parameter. Indicates a GET HTTP method.
@app.route("/bordgames/v1.0/games/<int:game_id>", methods=["GET"])
# This function requires a parameter from the URL.

# curl http://localhost:5000/bordgames/v1.0/games/0

def get_game(game_id):
    return serv.get_machine(game_id)
    
@app.route("/bordgames/v1.0/games/<int:game_id>", methods=["DELETE"])
# This function requires a parameter from the URL.

# curl -X DELETE http://localhost:5000/bordgames/v1.0/games/0

def delete_game(game_id):
    return serv.delete_machine(game_id)
    
@app.route("/bordgames/v1.0/games/<int:game_id>", methods=["PUT"])
# This function requires a parameter from the URL.

# curl -X PUT http://localhost:5000/bordgames/v1.0/games/1 

def update_game(game_id):
    return serv.update_machine(game_id)
    
@app.route("/bordgames/v1.0/games", methods=["POST"])
# This function requires a parameter from the URL.
# $ curl -X POST -H "Content-Type: application/json" -d @json_create_game.txt http://localhost:5000/bordgames/v1.0/games
def add_game():
    return serv.add_machine()

# Checks to see if the name of the package is the run as the main package.
if __name__ == "__main__":
    # Runs the Flask application only if the main.py file is being run.
    app.run(host= '0.0.0.0')