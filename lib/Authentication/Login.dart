import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  var emaicontr=TextEditingController();
  var passcontr=TextEditingController();




  @override
  Widget build(BuildContext context){
    return Scaffold(

      body: Column(
        children: [
          TextField(
            controller: emaicontr,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
          SizedBox(height: 10,),

          TextField(
            controller: passcontr,
            decoration: InputDecoration(
              hintText: 'Password',
            ),
          ),
          SizedBox(height: 10,),

          GestureDetector (
            onTap: () async{

              try{
                Response response=await post(
                    Uri.parse('https://reqres.in/api/login'),
                    body: {
                      'email' : emaicontr.text.toString(),
                      'password' : passcontr.text.toString()
                    }
                );
                if(response.statusCode==200){
                  var data=jsonDecode(response.body.toString());
                  print("create succcess");
                }else{
                  print("Failed");
                }
              }catch(e){
                print(e);
              }


            },
            child: Container(
              height: 30,
              color: Colors.green,
              child: Center(child: Text("Login"),),
            ),
          )

        ],
      )
    );
  }
}
