import 'package:flutter/material.dart';

void main(){
  runApp(MyOverriden());
}

class MyOverriden extends StatelessWidget {
  const MyOverriden({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Positioned.fill(  //bottom level
              child: Image.network('https://images.unsplash.com/photo-1533630160910-65f5a1718c65?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Nnx8c3RhY2t8ZW58MHx8MHx8fDA%3D'),
            ),
            Positioned(
              top: 100,
              right: 600,
              child: Container(  //top level
                height: 100,
                width: 100,
                child: CircleAvatar(
                  backgroundColor: Colors.amber,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}