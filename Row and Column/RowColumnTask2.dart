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
          title: Text("Row and Column Task-2"),
        ),
        body: Container(
          margin: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(  //Box-h1
                width: 400,
                margin: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      height: 75,
                      width: 400,
                      margin: EdgeInsets.all(5),
                      color: Colors.green,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 75,
                            width: 100,
                            margin: EdgeInsets.all(5),
                            color: Colors.blue,
                          ),
                          Container(
                            height: 75,
                            width: 280,
                            margin: EdgeInsets.all(5),
                            color: Colors.red,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 250,
                      width: 400,
                      margin: EdgeInsets.all(5),
                      color: Colors.purple,
                    ),
                    Container(
                      height: 75,
                      width: 400,
                      margin: EdgeInsets.all(5),
                      color: Colors.blue,
                    ),
                  ],
                ),
              ),
              Container(  //Box-h2
                width: 400,
                margin: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      height: 200,
                      width: 400,
                      margin: EdgeInsets.all(5),
                      color: Colors.purple,
                    ),
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 160,
                            width: 190,
                            margin: EdgeInsets.all(5),
                            color: Colors.green,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 75,
                                  width: 190,
                                  margin: EdgeInsets.all(5),
                                  color: Colors.blue,
                                ),
                                Container(
                                  height: 75,
                                  width: 190,
                                  margin: EdgeInsets.all(5),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 125,
                      width: 400,
                      margin: EdgeInsets.all(5),
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
              Container(  //Box-h3
                width: 400,
                margin: EdgeInsets.all(5),
                child: Column(
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Container(
                            height: 335,
                            width: 190,
                            margin: EdgeInsets.all(5),
                            color: Colors.green,
                          ),
                          Container(
                            child: Column(
                              children: [
                                Container(
                                  height: 125,
                                  width: 190,
                                  margin: EdgeInsets.all(5),
                                  color: Colors.blue,
                                ),
                                Container(
                                  height: 200,
                                  width: 190,
                                  margin: EdgeInsets.all(5),
                                  color: Colors.red,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 160,
                      width: 400,
                      margin: EdgeInsets.all(5),
                      color: Colors.purple,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}