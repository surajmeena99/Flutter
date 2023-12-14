import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Row and Column"),
          backgroundColor: Colors.red,
        ),

        body: Container(
          margin: EdgeInsets.all(12),
          padding: EdgeInsets.all(12),
          color: Colors.amber,
          child: Center(
            child: Column(  //vertical line
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Col 1",style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),  //line-1
                Text("Col 2"),  //line-2
                Container(  //line-3
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Row 1"),
                      Text("Row 2", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),

      ),
    );
  }
} 


//Container --> Column or Row --> children: [] --> Text widgets, Container widgets, Icon widgets etc.