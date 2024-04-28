import 'package:flutter/material.dart';

void main(){
  runApp(MyListViewBuilder());
}

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List View Builder"),
        ),
        body: Scrollbar(
          trackVisibility: true,
          interactive: true,
          
          child: ListView.builder(
            itemCount: 20,
            itemBuilder: (BuildContext context, int index) {
              // return getItem(index);
        
              // return Card(
              //   child: ListTile(
              //     title: Text("Item $index"),
              //   ),
              // );
        
              return Container(
                alignment: Alignment.center,
                margin: EdgeInsets.all(8),
                height: 150,
                color: Colors.blue.shade100,
                child: Text("Item $index", style: TextStyle(fontSize: 22),),
              );
            },
          ),
        ),
      ),
    );
  }
}

// Widget getItem(int index){
//   print("getItem called $index"); //it will show in DEBUG CONSOLE only
//   return Container(
//     margin: EdgeInsets.all(16),
//     alignment: Alignment.center,
//     height: 200,
//     color: Colors.cyanAccent,
//     child: Text("Item $index", style: TextStyle(fontSize: 25),),
//   );
// }