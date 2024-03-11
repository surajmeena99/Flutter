import 'package:flutter/material.dart';

void main(){
  runApp(GridClass());
}

class GridClass extends StatefulWidget {
  const GridClass({super.key});

  @override
  State<GridClass> createState() => _GridClassState();
}

class _GridClassState extends State<GridClass> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Grid View app"),
        ),
        body: GridView(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 2,
            mainAxisSpacing: 2,
          ),
          children: [
            Container(
              color: Colors.green[100],
              child: Text("1"),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.green[200],
              child: Text("2"),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.green[300],
              child: Text("3"),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.green[400],
              child: Text("4"),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.green[500],
              child: Text("5"),
              alignment: Alignment.center,
            ),
            Container(
              color: Colors.green[600],
              child: Text("6"),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}