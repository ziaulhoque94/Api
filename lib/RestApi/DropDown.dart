import 'dart:convert';
import 'dart:io';

import 'package:api/RestApi/Model/DropDownModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class DropDownAp extends StatefulWidget {
  const DropDownAp({super.key});

  @override
  State<DropDownAp> createState() => _DropDownApState();
}

class _DropDownApState extends State<DropDownAp> {

  final List<DropDownModel> postList=[];
  var selectedValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(""),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),


      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            FutureBuilder<List<DropDownModel>>(
                future: getPost(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Text("Loading");
                  }else{
                    return DropdownButton(
                      value: selectedValue,
                        isExpanded: true,
                        icon: Icon(Icons.add_circle_outline),
                        hint: Text("Select value"),
                        items: snapshot.data!.map((e){
                          return DropdownMenuItem(
                            value: e.title.toString(),
                              child:Text(e.title.toString())
                          );
                        }).toList(),

                        onChanged: (value) {
                        selectedValue=value;
                        setState(() {

                        });
                        },
                    );
                  }
                },
            )

          ],
        ),
      ),


    );
  }




  /*Future<List<DropDownModel>> getPost() async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data=jsonDecode(response.body.toString());
    if(response.statusCode==200){
      for(Map i in data){
        postList.add(DropDownModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }
  }*/



  Future<List<DropDownModel>> getPost() async{
    try{

      final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
      final body=json.decode(response.body) as List;

      if(response.statusCode==200){
        return body.map((e) {
          final map=e as Map<String, dynamic>;
          return DropDownModel(
            userId: map['userId'],
            id: map['id'],
            title: map['title'],
            body: map['body'],
          );
        }).toList();
      }

    } on SocketException{
      throw Exception("No Internet");
    }
    throw Exception("Error fatching data");
  }

}
