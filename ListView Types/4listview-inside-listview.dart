import 'package:flutter/material.dart';

void main(){
  runApp(InsideListView());
}
class InsideListView extends StatelessWidget {
  const InsideListView({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView Inside ListView"),
        ),
        body: ListView(
          children: [
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 1"),
            ),
            //Horizontal List
            SizedBox(
              height: 100,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    color: Colors.orange.shade400,
                    width: 100,
                    child: Text("${index + 1}"),
                  );
                },
              ),
            ),

            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 2"),
            ),
            //Vertical List
            SizedBox(
              height: 300,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    alignment: Alignment.center,
                    margin: EdgeInsets.all(8),
                    color: Colors.orange.shade400,
                    height: 100,
                    child: Text("${index + 1}"),
                  );
                },
              ),
            ),

            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 3"),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 4"),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 5"),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 6"),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 6"),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 7"),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 8"),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 9"),
            ),
            Container(
              height: 200,
              margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              alignment: Alignment.center,
              color: Colors.orange.shade200,
              child: Text("Item 10"),
            ),
          ],
        ),
      ),
    );
  }
}