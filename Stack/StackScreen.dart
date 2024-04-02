import 'package:flutter/material.dart';

// void main(){
//   runApp(Screen_Stack());
// }

class Screen_Stack extends StatelessWidget {
  const Screen_Stack({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                top: 200,
              ),
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  )
                ),
                child: Column(
                  children: [
                    Card(
                      child: Text("Suraj Meena"),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Card(
                      elevation: 5,
                      child: Container(
                        child: Text("Chetan chaudhary"),
                      ),
                    ),
                    Container(  //box-v2
                      child: ListTile(
                        title: Text("Subjects",
                          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
                        ),
                        leading: Icon(Icons.subject),
                        trailing: Icon(Icons.cast_for_education),
                      ),
                    ),
                    Divider(
                      color: Colors.black,
                      thickness: 0.5,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 150,
              left: 600,
              child: CircleAvatar(
                backgroundColor: Colors.blue,
                minRadius: 50,
              ),
            )
          ],
        ),
      ),
    );
  }
}