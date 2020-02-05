from flask import request
from flask_restful import Resource
from Models import db, User
import random
import string

class Register(Resource):
    def get(self):
        users = User.query.all()
        users_list = []
        for i in range(0, len(users)):
            users_list.append(users[i].serialize())
            
        return {"status" : str(users_list)}, 200
    
    def post(self):
        json_data = request.get_json(force=True)

        if not json_data:
            return{'message' : 'No input data provider'}, 400

        user = User.query.filter_by(username=json_data['username']).first()
        if user:
            return{'message': 'User already exists'}, 400

        user = User.query.filter_by(email=json_data['email']).first()
        if user:
            return{'message': 'email already exists'}, 400

        api_key = self.generate_key()

        user = User.query.filter_by(api_key=api_key).first()
        if user:
            return {'message': 'API key already exists'}, 400


        user = User(
            api_key = api_key,
            username = json_data['username'],
            firstname = json_data['firstname'],
            lastname = json_data['lastname'],
            password = json_data['password'],
            email = json_data['email']
            
        )

        db.session.add(user)
        db.session.commit()
        
        result = User.serialize(user)

        return {"data": result, "status": "success"  } , 201
    
    def generate_key(self):
        return ''.join(random.choice(string.ascii_letters + string.digits) for _ in range(50))