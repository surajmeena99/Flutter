import 'package:flutter/material.dart';

class FontSizeChange extends StatefulWidget {
  const FontSizeChange({super.key});

  @override
  State<FontSizeChange> createState() => _FontSizeChangeState();
}

class _FontSizeChangeState extends State<FontSizeChange> {
  double changeSize = 16;

  void increaseSize(){
    setState(() {
      changeSize += 2; 
    });
  }

  void decreaseSize(){
    setState(() {
      changeSize -= 2;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Font Size Changer"),
        backgroundColor: Colors.amber,
      ),
      body: Center(
        child: Text("Hello World!", style: TextStyle(fontSize: changeSize),),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: increaseSize,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10,),
          FloatingActionButton(
            onPressed: decreaseSize,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}