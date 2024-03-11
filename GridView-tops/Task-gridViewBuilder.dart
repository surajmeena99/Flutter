import 'package:flutter/material.dart';

void main(){
  runApp(GridScreen());
}

class GridScreen extends StatefulWidget {
  GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  
  List ColorChoice = [
    Colors.amber[100],
    Colors.amber[200],
    Colors.amber[300],
    Colors.amber[400],
    Colors.amber[500],
    Colors.amber[600],
    Colors.amber[700],
    Colors.amber[800],
  ];

  List<MyChoice> myChoices = [
    MyChoice(Icons.home, 'Home'),
    MyChoice(Icons.contacts, 'Contacts'),
    MyChoice(Icons.map, 'Map'),
    MyChoice(Icons.phone, 'Phone'),
    MyChoice(Icons.camera_alt, 'Camera'),
    MyChoice(Icons.settings, 'Settings'),
    MyChoice(Icons.photo_album, 'Album'),
    MyChoice(Icons.wifi, 'Wi-fi'),
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid View Builder App"),
        ),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 5,
            mainAxisSpacing: 10,
          ),
          itemCount: 8,
          itemBuilder: (context,index) {
            return Card(
              color: ColorChoice[index],
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(myChoices[index].myIcon, size: 50,),
                  Text(myChoices[index].myText, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class MyChoice{
  MyChoice(this.myIcon, this.myText);
  final IconData myIcon;
  final String myText;
}

