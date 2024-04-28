import 'package:flutter/material.dart';

void main(){
  runApp(MyListView());
}
class MyListView extends StatelessWidget {
  const MyListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          // title: Icon(Icons.facebook),
          title: Text("List view App"),
        ),
        body: ListView(
          // reverse: false,
          // scrollDirection: Axis.vertical,
          // physics: BouncingScrollPhysics(),
          padding: EdgeInsets.all(20),
          // itemExtent: 200,
          // prototypeItem: SizedBox(height: 300, width: 200,),
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,

          children: [
            Padding(
              padding: EdgeInsets.all(16), 
              child: TextField(),
            ),
            Container(height: 250,color: Colors.green,
              alignment: Alignment.center,
              margin: EdgeInsets.all(12),
              child: Text("Item 1", style: TextStyle(fontSize: 30),),
            ),
            Container(height: 300,color: Colors.blue,
              alignment: Alignment.center,
              margin: EdgeInsets.all(12),
              child: Text("Item 2", style: TextStyle(fontSize: 30),),
            ),
            Container(height: 200,color: Colors.red,
              alignment: Alignment.center,
              margin: EdgeInsets.all(12),
              child: Text("Item 3", style: TextStyle(fontSize: 30),),
            ),
            Container(height: 100,color: Colors.yellow,),
            Container(height: 350,color: Colors.purple,),
            Container(height: 250,color: Colors.cyan,),

            getItem(0),
            getItem(1),
            getItem(3),
            getItem(4),
            getItem(5),
          ],
        ),
      ),
    );
  }
}

Widget getItem(int index){
  print("getItem called $index"); //it will show in DEBUG CONSOLE only
  return Container(
    margin: EdgeInsets.all(16),
    alignment: Alignment.center,
    height: 200,
    color: Colors.cyanAccent,
    child: Text("GetItem $index", style: TextStyle(fontSize: 25),),
  );
}