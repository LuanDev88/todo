from flask_restful import Resource

class User(Resource):
    id = db.Column(db.Integer(), primary_key=True, unique=True)
    username = db.Column(db.String(), unique=True)
    firstname = db.Column(db.String())
    lastname = db.Column(db.String())
    password = db.Column(db.String())
    emailadress = db.Column(db.String())
    api_key = db.Column(db.String())

    def __init__(self, api_key, firstname, lastname, emailadress, password, username):
        self.api_key = api_key
        self.firstname = firstname
        self.lastname = lastname
        self.emailadress = emailadress
        self.password = password
        self.username = username

    def __repr__(self):
        return '<id {}>'.format(self.id)

    def serialize(self):
        return {
            'api_key' : self.api_key,
            'id' : self.id,
            'username' : self.username,
            'firstname' : self.firstname,
            'lastname' : self.lastname,
            'password' : self.password,
            'emailadress' : self.emailadress,
        }