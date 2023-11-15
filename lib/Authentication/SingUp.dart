import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  var emailController=TextEditingController();
  var passwordController=TextEditingController();

  void login(String email, String password) async{
    try{
      
      Response response=await post(
        Uri.parse('https://reqres.in/api/register'),
            body: {
              'email' : email,
              'password' : password
            }
      );
      if(response.statusCode==200){
        var data=jsonDecode(response.body.toString());
        print(data['token']);

        print("create account successful");
      }else{
        print("Failed");
      }
      
    }catch(e){
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
        shadowColor: Colors.black,
        elevation: 10,
      ),

      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
              TextField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "Email",
                ),
              ),
            SizedBox(height: 10,),

            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                hintText: "Password",
              ),
            ),
            SizedBox(height: 20,),

            GestureDetector(
              onTap: (){
                login(emailController.text.toString(), passwordController.text.toString());
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.green
                ),
                child: Center(child: Text("Sign Up"),),
              ),
            )
          ],
        ),
      ),


    );
  }
}
