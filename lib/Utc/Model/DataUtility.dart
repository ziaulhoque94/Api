import 'dart:convert';

import 'package:api/Utc/Model/UserModel.dart';
import 'package:http/http.dart' as http;
class DataUtility{


  Future<List<UserModel>> getAllUser() async{
    List<UserModel> userList=[];
    try{
      final request=http.Request('GET', Uri.parse('https://jsonplaceholder.typicode.com/users'));
      http.StreamedResponse response=await request.send();

      if(response.statusCode==200){
        var rowData=await response.stream.bytesToString();

        List<dynamic> data=jsonDecode(rowData);
        data.forEach((element) {
          UserModel userModel=UserModel.fromJson(element);
          userList.add(userModel);
        });

        return userList;

      }else{
        return userList;
      }


    }catch(e){
      throw e;
    }
  }
}