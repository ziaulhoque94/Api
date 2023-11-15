import 'package:api/Utc/Model/DataUtility.dart';
import 'package:flutter/material.dart';
import '../Model/UserModel.dart';

class ApiProvider extends ChangeNotifier{
  List<UserModel> userList=[];

  List<UserModel> get AlluserList=>userList;

  void fetchUser() async{
    try{

      DataUtility dataUtility=DataUtility();

      userList=await dataUtility.getAllUser();

    }catch(e){}
    notifyListeners();
  }
}