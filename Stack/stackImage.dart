import 'package:flutter/material.dart';

void main(){
  runApp(Positions());
}

class Positions extends StatefulWidget {
  const Positions({super.key});

  @override
  State<Positions> createState() => _PositionsState();
}

class _PositionsState extends State<Positions> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack Positon "),
        ),
        body: Stack(  //"stack" is used to overlay multiple widgets on top of each other.
          children: [
            Container(  //Bottom widget
              width: 300,
              height: 350,
              color: Colors.amber,
            ),

            Positioned(
              left: 50,
              top: 100,
              child: Container( //Top widget with custom positioning
                child: Column(
                  children: [
                    Image.network('https://images.unsplash.com/photo-1598883784877-6a11ae954c09?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MjB8fHN0YWNrfGVufDB8fDB8fHww', height: 200, width: 150,),
                    Text("Data"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}