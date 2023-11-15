import 'dart:convert';
import 'package:api/RestApi/Model/ComplexUserModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComplexJsonActivity extends StatefulWidget {
  const ComplexJsonActivity({super.key});

  @override
  State<ComplexJsonActivity> createState() => _ComplexJsonActivityState();
}

class _ComplexJsonActivityState extends State<ComplexJsonActivity> {

  List<ComplexUserModel> userList=[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Complex Json api"),
          backgroundColor: Colors.green,
        ),

      body: Column(
          children: [
            Expanded(
              child: FutureBuilder(
                  future: getUser(),
                  builder: (context,AsyncSnapshot<List<ComplexUserModel>> snapshot) {
                    if(!snapshot.hasData){
                      return CircularProgressIndicator();
                    }else{
                      return ListView.builder(
                        itemCount: userList.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Card(
                                margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 2.0),
                                 child: Padding(
                                   padding: const EdgeInsets.all(8.0),
                                   child: Column(
                                    children: [
                                      RowValue(title: "Id :", value: snapshot.data![index].id.toString()),
                                      RowValue(title: "Name :", value: snapshot.data![index].name.toString()),
                                      RowValue(title: "Username :", value: snapshot.data![index].username.toString()),
                                      RowValue(title: "Email :", value: snapshot.data![index].email.toString()),
                                      RowValue(title: "CityName :",
                                          value: "${snapshot.data![index].address!.city.toString()} ,"+
                                              "${snapshot.data![index].address!.street.toString()}"
                                      ),

                                      RowValue(title: "Phone :", value: snapshot.data![index].phone.toString()),
                                      RowValue(title: "Website :", value: snapshot.data![index].website.toString()),
                                      RowValue(title: "companyName :", value: snapshot.data![index].company!.name.toString()),
                                      RowValue(title: "company Bs :", value: snapshot.data![index].company!.bs.toString()),

                                    ],
                                ),
                                 ),
                              ),
                            );
                          },
                      );
                    };
                  },
              ),
            )
          ],
      ),

    );
  }

  Future<List<ComplexUserModel>> getUser() async{
    final respons=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/users"));
    var data=jsonDecode(respons.body.toString());
    if(respons.statusCode==200){
      userList.clear();
      for(Map i in data){
        userList.add(ComplexUserModel.fromJson(i));
      }
      return userList;
    }else{
      return userList;
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

