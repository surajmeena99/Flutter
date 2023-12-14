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
          title: Text("Row and Column Task-3"),
        ),
        body: Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(  //Box-V1
                  width: 600,
                  child: Row(
                    children: [
                      Container(  //Box-H1
                        width: 300,
                        // margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container(  //box-v1
                              height: 165,
                              width: 300,
                              margin: EdgeInsets.all(5),
                              color: Colors.green,
                            ),
                            Container(  //box-v2
                              height: 165,
                              width: 300,
                              margin: EdgeInsets.all(5),
                              color: Colors.red,
                            ),
                          ],
                        ),
                      ),
                      Container(  //Box-H2
                        width: 300,
                        // margin: EdgeInsets.all(5),
                        child: Column(
                          children: [
                            Container( //box-v1
                              height: 80,
                              width: 300,
                              margin: EdgeInsets.all(5),
                              color: Colors.blue,
                            ),
                            Container(  //box-v2
                              child: Row(
                                children: [
                                  Container(  //box-h1
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 160,
                                          width: 140,
                                          margin: EdgeInsets.all(5),
                                          color: Colors.amber,
                                        ),
                                        Container(
                                          height: 80,
                                          width: 140,
                                          margin: EdgeInsets.all(5),
                                          color: Colors.red,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(  //box-h2
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 80,
                                          width: 140,
                                          margin: EdgeInsets.all(5),
                                          color: Colors.blueGrey,
                                        ),
                                        Container(
                                          height: 160,
                                          width: 140,
                                          margin: EdgeInsets.all(5),
                                          color: Colors.blue[800],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(  //Box-V2
                  width: 600,
                  child: Row(
                    children: [
                      Container(  //Box-H1
                        height: 80,
                        width: 440,
                        margin: EdgeInsets.all(5),
                        color: Colors.pink,
                      ),
                      Container(
                        height: 80,
                        width: 140,
                        margin: EdgeInsets.all(5),
                        color: Colors.purple,
                      ),
                    ],
                  ),
                ),
                Container(  //Box-V3
                  height: 80,
                  width: 590,
                  margin: EdgeInsets.all(5),
                  color: Colors.blue,
                ),
              ],
            ),
          ),
        ),
      ) ,
    );
  }
}