import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main(){
  runApp(MaterialApp(
    home: MyBotNav(),
  ));
}

class MyBotNav extends StatefulWidget {
  const MyBotNav({super.key});

  @override
  State<MyBotNav> createState() => _MyBotNavState();
}

class _MyBotNavState extends State<MyBotNav> {

  Color bgColor = Colors.blueAccent;
  var txt = "Home Page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: Text("My Curved Bottom Nav"),
      ),
      body: Center(
        child: Text(txt, style: TextStyle(fontSize: 30,),),
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: bgColor,
        items: [
          Icon(Icons.home),
          Icon(Icons.explore),
          Icon(Icons.my_library_books),
          Icon(Icons.dashboard)
        ],
        onTap: (index){
          setState(() {
            if(index == 1){
              bgColor = Colors.redAccent;
              txt = "Explore Page";
            }
            if(index == 2){
              bgColor = Colors.greenAccent;
              txt = "Library Page";
            }
            if(index == 3){
              bgColor = Colors.yellowAccent;
              txt = "Dashboard Page";
            }
          });
        },
      ),
    );
  }
}