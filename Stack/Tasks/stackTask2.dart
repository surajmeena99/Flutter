import 'package:flutter/material.dart';

void main(){
  runApp(SecondTask());
}
class SecondTask extends StatelessWidget {
  const SecondTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Stack Demo Page"),
        ),
        body: Center(
          child: Stack(
            // alignment: Alignment.center,
            alignment: Alignment(0.6, 0.6),
            children: [
              CircleAvatar(
                backgroundImage: NetworkImage("https://avatars3.githubusercontent.com/u/14101776?v=4"),
                maxRadius: 100,
              ),
              Positioned(
                // left: 125,
                // bottom: 30,
                child: Container(
                  color: Colors.black45,
                  child: Text("Flutter"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}