import 'package:flutter/material.dart';

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
          title: Text("Single Child Scroll View"),
        ),

        body: SingleChildScrollView(

          scrollDirection: Axis.vertical,
          reverse: false,
          padding: EdgeInsets.all(16),
          physics: ClampingScrollPhysics(),
          // physics:BouncingScrollPhysics(),
          // physics: NeverScrollableScrollPhysics(),

          // keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.manual,
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,


          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(16),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Enter Data",
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                color: Colors.green,
              ),
              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                color: Colors.orange,
              ),
              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                color: Colors.blue,
              ),
              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                color: Colors.red,
              ),
              Container(
                margin: EdgeInsets.all(16),
                width: double.infinity,
                height: 200,
                color: Colors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}