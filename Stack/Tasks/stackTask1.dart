import 'package:flutter/material.dart';

void main(){
  runApp(FirstTask());
}

class FirstTask extends StatelessWidget {
  const FirstTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(  //box-v1
                children: [
                  Container(  //bottom level
                    height: 300,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black,
                          Colors.yellow,
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(50),
                        bottomRight: Radius.circular(50),
                      )
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                      left: 600,
                      top: 250,
                    ),
                    child: CircleAvatar(
                      backgroundColor: Color.fromARGB(255, 97, 91, 50),
                      radius: 50,
                      child: Text("S-M", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),),
                    ),
                  ),
                  Positioned(
                    top: 150,
                    left: 500,
                    child: Text("Suraj Meena",
                      style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  )
                ],
              ),
              Container(  //box-v2
                child: ListTile(
                  title: Text("Subjects",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  leading: Icon(Icons.subject),
                  trailing: Icon(Icons.cast_for_education),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              Container(  //box-v3
                child: ListTile(
                  title: Text("Contact",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  trailing: Icon(Icons.contacts),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              Container(  //box-v4
                child: ListTile(
                  title: Text("Setting",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  trailing: Icon(Icons.settings),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
              Container(  //box-v5
                child: ListTile(
                  title: Text("Logout",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                  trailing: Icon(Icons.logout),
                ),
              ),
              Divider(
                color: Colors.black,
                thickness: 0.5,
              ),
            ],
          ),
        ),
      ),
    );
  }
}