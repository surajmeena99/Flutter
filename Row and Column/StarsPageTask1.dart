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
            title: Text("Stars Task"),
            backgroundColor: Colors.orange,
          ),
        body: Container(
          color: Colors.orange,

          child: Column(
            children: [
              // Divider(color: Colors.black54,),
              Container( //Box-v1
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container( //Box-h1
                      child: Column(
                        children: [
                          Container(
                            child: Text("Layout", textAlign: TextAlign.center,),
                          ),
                          Container(
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.arrow_back),
                                Text("row", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black26),),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(  //Box-h2
                      child: Column(
                        children: [
                          Container(
                            child: Text("Main Axis Alignment", textAlign: TextAlign.center,),
                          ),
                          Container(
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.arrow_back),
                                Text("space around", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black26),),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Divider(color: Colors.black54,),
              SizedBox(
                height: 5,
              ),
              Container(  //Box-v2
                color: Colors.orange,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container( //Box-h1
                      child: Column(
                        children: [
                          Container(
                            child: Text("Main Axis Size", textAlign: TextAlign.center,),
                          ),
                          Container(
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Icon(Icons.arrow_back),
                                Text("max", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black26),),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(  //Box-h2
                      child: Column(
                        children: [
                          Container(
                            child: Text("Cross Axis Alignment", textAlign: TextAlign.center,),
                          ),
                          Container(
                            width: 500,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(Icons.arrow_back),
                                Text("stretch", style: TextStyle(fontWeight: FontWeight.w700, color: Colors.black26),),
                                Icon(Icons.arrow_forward),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(  //Box-v3
                color: Colors.yellow,
                height: 450,
                child:  Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.stars, size: 50),
                      Icon(Icons.stars, size: 100),
                      Icon(Icons.stars, size: 50),
                    ],
                  ),
                ),
              )
            ],
          )
        ),
      )
    );
  }
}