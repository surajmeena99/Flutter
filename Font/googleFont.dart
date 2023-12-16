import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Welcome to Flutter"),
        ),
        body: Center(
          // child: Text("Hello World", style: TextStyle(fontSize: 50, fontFamily: 'Quicksand'),),
          child: Text("Hello Suraj Meena", style: GoogleFonts.quicksand(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.red, backgroundColor: Colors.amber)),
        ),
      ),
    );
  }
}