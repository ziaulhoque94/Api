import 'package:flutter/material.dart';
import 'package:http/http.dart';

class FirstApi extends StatefulWidget {
  const FirstApi({super.key});

  @override
  State<FirstApi> createState() => _FirstApiState();
}

class _FirstApiState extends State<FirstApi> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Hello, This is api app, hello"),
    );
  }
}
