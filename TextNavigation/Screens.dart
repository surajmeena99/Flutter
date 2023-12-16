import 'package:flutter/material.dart';

class ScreenDisplay extends StatelessWidget {

  final myName;
  ScreenDisplay({required this.myName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Screen"),
      ),
      body: Center(
        child: Container(
          child: Text("Hello $myName Welcome to our app", 
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}