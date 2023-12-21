import 'package:flutter/material.dart';

void main(){
  runApp(SimpleForm());
}

class SimpleForm extends StatefulWidget {
  const SimpleForm({super.key});

  @override
  State<SimpleForm> createState() => _SimpleFormState();
}

class _SimpleFormState extends State<SimpleForm> {
  String name = "";  //Declare a variable

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "simple form app",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Simple Form App"),
        ),
        body: Container(
          margin: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                onSubmitted: (String username){
                  setState(() {
                    name = username;
                  });
                },
              ),
              Padding(
                padding: EdgeInsets.all(100),
              ),
              Text("Name is $name", style: TextStyle(fontSize: 25,),),
            ],
          ),
        ),
      ),
    );
  }
}