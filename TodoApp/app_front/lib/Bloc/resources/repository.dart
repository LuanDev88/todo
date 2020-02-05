import 'dart:async';
import 'api.dart';
import 'package:app_front/models/classes/users.dart';

class Repository{
  final apiProvider = ApiProvider();
  Future<User> registerUser(String username, String firstname, String lastname, String password, String email) 
    => apiProvider.registerUser(username, firstname, lastname, password, email);
}