import 'package:flutter/material.dart';

void main(){
  runApp(GridTask());
}

class GridTask extends StatefulWidget {
  const GridTask({super.key});

  @override
  State<GridTask> createState() => _GridTaskState();
}

class _GridTaskState extends State<GridTask> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Flutter GridView Demo"),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          children: [
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.home),
                  Text("Home"),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.contacts),
                  Text("Contacts"),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.map),
                  Text("Map"),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.phone),
                  Text("Phone"),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.camera_alt),
                  Text("Camera"),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.settings),
                  Text("Setting"),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.photo_album),
                  Text("Album"),
                ],
              ),
            ),
            Container(
              color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.wifi),
                  Text("Wi-Fi"),
                ],
              ),
            ),
          ],
          
        ),
      ),
    );
  }
}