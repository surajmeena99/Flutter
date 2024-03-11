import 'package:flutter/material.dart';

void main(){
  runApp(GridScreen());
}

class GridScreen extends StatefulWidget {
  const GridScreen({super.key});

  @override
  State<GridScreen> createState() => _GridScreenState();
}

class _GridScreenState extends State<GridScreen> {
  List ColorChoice = [
    Colors.green[100],
    Colors.green[200],
    Colors.green[300],
    Colors.green[400],
    Colors.green[500],
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
            crossAxisCount: 2,
          ),
          itemCount: 5,
          itemBuilder: (context,index) {
            return Card(
              // color: Colors.green,
              // color: (index %2==0)? Colors.amber : Colors.green,
              color: ColorChoice[index],
              child: Center(
                child: Text("Item $index"),
                
              ),
            );
          },
        ),
      ),
    );
  }
}