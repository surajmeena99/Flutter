import 'package:flutter/material.dart';

void main(){
  runApp(ScreenCorner());
}
class ScreenCorner extends StatelessWidget {
  const ScreenCorner({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned(  //bottom level
              child: Container(
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    image: NetworkImage("https://images.unsplash.com/photo-1563192504-36ac622196dd?q=80&w=1374&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D"),fit: BoxFit.cover),
                ),
              ),
            ),
            Positioned(  //top level
              left: 170,
              bottom: 0,
              child: Container(
                height: 30,
                width: 30,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.yellow,
                ),
                child: Center(
                  child: Text("1", style: TextStyle(color: Colors.white),),
                ),
              )
            ),
          ],
        ),
      ),
    );
  }
}