import 'package:flutter/material.dart';
import 'package:myapp/Drawer/drawer.dart';

void main(){
  runApp(
    MaterialApp(
      title: "drawer app",
      home: MyDrawer(),
    )
  );
}

class MyDrawer extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _MyDrawerState();
  }
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Drawer App"),
        backgroundColor:Colors.green
      ),

      drawer: MainDrawer(),
      
      body: Center(
        child: Text("Home Page"),
      )
    );
  }

}