import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplexActivity_tow extends StatefulWidget {
  const ComplexActivity_tow({super.key});

  @override
  State<ComplexActivity_tow> createState() => _ComplexActivity_towState();
}

class _ComplexActivity_towState extends State<ComplexActivity_tow> {

  var data;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Complex Json api"),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Column(
        children: [
          Expanded(
              child: FutureBuilder(
                future: getUserApi(),
                builder: (context, snapshot) {
                  if(snapshot.connectionState==ConnectionState.waiting){
                    return CircularProgressIndicator();
                  }else{
                    return ListView.builder(
                      itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            child: Column(
                              children: [
                                RowValue(title: "Name", value: data[index]['name'].toString()),
                                RowValue(title: "Username", value: data[index]['username'].toString()),
                                RowValue(title: "Address", value: data[index]['address']['street'].toString()),
                                RowValue(title: "Geo", value: data[index]['address']['geo'].toString()),
                              ],
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

  Future<void> getUserApi() async{
    final response=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    if(response.statusCode==200){
      data=jsonDecode(response.body.toString());
    }else{
    data;
    }
  }
}

class RowValue extends StatelessWidget {
  String title , value;
  RowValue({Key? key, required this.title, required this.value}): super(key: key);
  // const RowValue(key? key {});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value)
        ],
      ),
    );
  }
}
