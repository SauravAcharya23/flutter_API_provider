

import 'package:flutter/cupertino.dart';
import 'package:get_data/getServer.dart';
import 'package:get_data/model/users.dart';

class DataProvider with ChangeNotifier{
  List<Data> userData = [];
  bool isLoading = false;

  fetchUsers() async{
    Users users = await GetServer.getDataApi();
    isLoading = true;

    if(users.data != null){
      isLoading = false;
      userData = users.data!;
      //print(userData[0].lastName);
      notifyListeners();
      
    }
    else{
      print('NO');
    }
  }

  getUsersData() => userData;
}