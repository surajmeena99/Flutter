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
          title: Text("Containers"),
        ),
       
        body: Container(  //outer box
          decoration: BoxDecoration(
            border: Border.all(
              width: 2,
              color: Colors.red
            )
          ),

          child: Column(  //vertical box
            children: [
              Container(   //box-v1 start
                margin: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black
                  )
                ),
                child: Row(  //horizontal box
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(  //box-h1 
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue
                        )
                      ),
                      child: Column(
                        children: [
                          Text("Hello Suraj"),
                          Text("Hello Chetan"),
                        ],
                      ),
                    ),
                    Container(  //box-h2
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: Colors.blue
                        )
                      ),
                      child: Row(
                        children: [
                          Icon(Icons.star),
                          Text("Vansh")
                        ],
                      ),
                    )
                  ],
                ), 
              ), //box-v1 end

              Container(  //box-v2 start
                margin: EdgeInsets.all(8),
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.black
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Container(  //box1
                      margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.purple[500],
                        border: Border.all(
                          width: 2,
                          color: Colors.purple
                        )
                      ),
                    ),
                    Container(  //box2
                      margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.pink,
                        border: Border.all(
                          width: 2,
                          color: Colors.pink
                        )
                      ),
                    ),
                    Container(  //box3
                      margin: EdgeInsets.all(8),
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                        border: Border.all(
                          width: 2,
                          color: Colors.yellow
                        )
                      ),
                    )
                  ],
                ),
              ), //box-v2 end
            ],
          ),

        ),
      )
    );
  }
}