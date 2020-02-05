import 'package:flutter/rendering.dart';
class User {
  String username;
  String firstname;
  String lastname;
  String email;
  String password;
  String api_key;
  int id;

  User({this.username, this.firstname, this.lastname, this.password, this.email,
      this.api_key, this.id});
  
  User.fromJsom(Map<String, dynamic> parsedJson){
    User user = User(
    username: parsedJson['username'] as String, 
    firstname: parsedJson['firstname'], 
    lastname: parsedJson['lastname'], 
    password: parsedJson['password'], 
    email: parsedJson['email'], 
    api_key: parsedJson['api_key'], 
    id: parsedJson['id'],
    );
  }
}
