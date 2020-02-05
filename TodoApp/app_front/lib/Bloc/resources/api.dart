import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' show Client;
import 'package:app_front/models/classes/users.dart';
import 'dart:io';

class ApiProvider {
  Client _client = Client();
  final _apiKey = "your_api_key";
  

   Future<User> registerUser(String username, String firstname, String lastname, String password, String email) async {
    final response = await _client.post("http://0.0.0.0:5000/api/register",
       //headers: "",
       body: jsonEncode(
          {
          	"email" : email,
	          "username" : username,
	          "password" : password,
	          "firstname" : firstname,
	          "lastname" : lastname
        }
        ) 
        );
     final Map result = jsonDecode(response.body);
    print(result["data"].toString());
    if (response.statusCode == 201) {
      return User.fromJsom(result["data"]);
    } else {
      throw Exception("Voce falhou");
    }
  }
}
