import 'dart:js';

import 'package:api/Authentication/Login.dart';
import 'package:api/Authentication/SingUp.dart';
import 'package:api/RestApi/ComplexActivity_two.dart';
import 'package:api/RestApi/ComplexJsonActitvity.dart';
import 'package:api/RestApi/DropDown.dart';
import 'package:api/RestApi/Home_screen.dart';
import 'package:api/RestApi/ImagActivity.dart';
import 'package:api/Utc/Provider/ApiProvider.dart';
import 'package:api/Utc/Provider/MyCountProvider.dart';
import 'package:api/Utc/UserActivity.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'RestApi/VeryComplexApiActivity.dart';
import 'RestApi/first.dart';
import 'Utc/ProviderFlutter.dart';

void main() {
  runApp(
      MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_)=>ApiProvider())
      ],
      child: const MyApp()
      )
  );
}




class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter api app',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const DropDownAp(),
    );
  }
}
