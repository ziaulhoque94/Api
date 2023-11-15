import 'dart:convert';

import 'package:api/RestApi/Model/PostsModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Home_screen extends StatefulWidget {
  const Home_screen({super.key});

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen> {

  List<PostsModel> postList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Api course"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),

      body: Column(
        children: [
          Expanded(
            child: FutureBuilder(
                future: getPost(),
                builder: (context, snapshot) {
                  if(!snapshot.hasData){
                    return Text("Loading");
                  }else{
                    return ListView.builder(
                        itemCount: postList.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 10,
                            shadowColor: Colors.black,
                            margin: EdgeInsets.all(10.0),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Userid : ${postList[index].userId.toString()}",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),
                                  Text("Id : ${postList[index].id.toString()}",
                                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                                  ),

                                  Text("Title :",
                                    style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),
                                  Text(postList[index].title.toString(),
                                      style: TextStyle(fontSize: 15),
                                  ),

                                  Text("Description :", style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold, color: Colors.black),),
                                  Text(postList[index].body.toString(),
                                    style: TextStyle(fontSize: 15,),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                    );
                  }
                },
            ),
          )
        ],
      ),

    );
  }

  Future<List<PostsModel>> getPost() async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/posts"));
    var data=jsonDecode(response.body.toString());

    if(response.statusCode==200){
      postList.clear();
      for(Map i in data){
        postList.add(PostsModel.fromJson(i));
      }
      return postList;
    }else{
      return postList;
    }

  }

}
