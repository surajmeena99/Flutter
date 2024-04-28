import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("BackGround Color"),
        ),
        body: Container( 
          // color: Colors.amber ,  //When BoxDecoration is not used
          decoration: BoxDecoration(
            // color: Colors.amber.shade400,
            gradient: LinearGradient(colors: [Colors.red, Colors.deepPurple, Colors.orange, Colors.blue],
              begin: Alignment.topLeft, 
              end: Alignment.bottomRight,
            ),
          ),
        ),
      ),
    );
  }
}