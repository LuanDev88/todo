import 'package:app_front/UI/Login/loginscreen.dart';
import 'package:app_front/home_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/classes/users.dart';
import 'package:http/http.dart' as http;
import 'Bloc/blocs/user_bloc_provider.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage()
    );
  }

Future getUser() async{
  var result = await http.get('http://127.0.0.1:5000/api/register');
  print(result.body);
  return result;
  }


  asyncFunc() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
  }

  Future<String> getApiKey() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String apiKey;
   try{
     apiKey = prefs.getString('API_Token');
   } catch(Exception){
      apiKey = "";
   }
   return apiKey;
  }
  
}
