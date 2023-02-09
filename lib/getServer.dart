import 'dart:convert';

import 'package:get_data/model/users.dart';
import 'package:http/http.dart' as http;

class GetServer {
  
  static Future<Users> getDataApi() async{
    final response = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));

    if(response.statusCode == 200){
      var data = json.decode(response.body);
      
      return Users.fromJson(data);
    }
    else{
      return Users();
    }
  }
}