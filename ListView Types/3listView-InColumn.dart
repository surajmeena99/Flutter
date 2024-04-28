import 'package:flutter/material.dart';

void main(){
  runApp(ListViewInColumn());
}
class ListViewInColumn extends StatelessWidget {
  const ListViewInColumn({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView in Column"),
        ),
        body: Column(
          children: [
            Image.asset("assets/images/image-4.jpg"),

            SizedBox(
              height: 100,
              width: double.infinity,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,

                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    width: 100,
                    color: Colors.blueGrey,
                    margin: EdgeInsets.symmetric(horizontal: 8),
                    child: Text("Item $index", style: TextStyle(fontSize: 22),),
                  );
                },
              ),
            ),

            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    height: 150,
                    color: Colors.blueGrey,
                    margin: EdgeInsets.symmetric(vertical: 8),
                    child: Text("Item $index", style: TextStyle(fontSize: 22),),
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}