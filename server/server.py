from flask import Flask, jsonify, request
from flask_cors import CORS
from pymongo import MongoClient
from bson.objectid import ObjectId
from bson.json_util import dumps, loads

app = Flask(__name__)
CORS(app)

client = MongoClient(
    "mongodb+srv://Olivia:Cheesy123@cheesy.1pp17n9.mongodb.net/?retryWrites=true&w=majority")
db = client.laughs
joke_collection = db.joke

def get_id(joke):
    joke['id'] = str(joke['_id'])
    return joke

@app.route('/jokes', methods=['GET'])
def get_jokes():
    jokes = joke_collection.find()
    joke_list = list(map(get_id, list(jokes)))
    return dumps({'results': joke_list}), 200

@app.route('/random_joke', methods=['GET'])
def get_random_joke():
    joke = joke_collection.aggregate([{'$sample':{'size':1}}])
    return dumps(joke), 200

@app.route('/add_joke', methods=['POST'])
def add_joke():
    body = request.json 
    joke = body['joke']
    res = joke_collection.insert_one(joke)
    return dumps({'message': 'Joke added successfully'}), 201

@app.route('/delete_joke/<id>', methods=['DELETE'])
def delete_joke(id):
    joke_collection.delete_one({'_id': ObjectId(id)})
    return dumps({'message': 'Joke deleted successfully'}), 201

@app.route('/update_rating/<id>', methods=['POST'])
def update_rating(id):
    body = request.json
    rating = body['rating']
    joke_collection.update_one({'_id': ObjectId(id)}, {'$set': {'rating': rating}})
    return dumps({'message': 'Rating updated successfully'}), 201

if __name__ == "__main__":
    app.run(host="0.0.0.0")