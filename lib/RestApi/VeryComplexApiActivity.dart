import 'dart:convert';

import 'package:api/RestApi/Model/FakeApiModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class VeyComplexApiActivity extends StatefulWidget {
  const VeyComplexApiActivity({super.key});
  @override
  State<VeyComplexApiActivity> createState() => _VeyComplexApiActivityState();
}

class _VeyComplexApiActivityState extends State<VeyComplexApiActivity> {

    List<FakeApiModel> fakeUserList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getFakeUser(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Text("Loading...");
                  }else{
                    return ListView.builder(
                      itemCount: snapshot.data?.length,
                        itemBuilder: (context, index) {
                          return Text(index.toString());
                        },
                    );
                  }
  
                },
              )
          )
        ],
      ),

    );
  }

  Future<List<FakeApiModel>> getFakeUser() async{
    final response=await http.get(Uri.parse("https://webhook.site/cc0170e6-3e54-4d85-a121-e7350aa55582"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      fakeUserList.clear();
      for(Map i in data){
        fakeUserList.add(FakeApiModel.fromJson(i));
      }

      return fakeUserList;
    }else{
      return fakeUserList;
    }
  }
}
