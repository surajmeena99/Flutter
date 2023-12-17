import'package:flutter/material.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 200,
                width: double.infinity,
                color: Colors.red,
                margin: EdgeInsets.all(4),
              ),
              Expanded(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width/2,
                          color: Colors.blue,
                          margin: EdgeInsets.all(4),
                        
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width/2,
                          color: Colors.blue,
                          margin: EdgeInsets.all(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width/2,
                          color: Colors.blue,
                          margin: EdgeInsets.all(4),
                        
                        ),
                      ),
                      Flexible(
                        child: Container(
                          height: 200,
                          width: MediaQuery.of(context).size.width/2,
                          color: Colors.blue,
                          margin: EdgeInsets.all(4),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(4),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(4),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(4),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(4),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(4),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(4),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(4),
                      ),
                      Container(
                        height: 200,
                        width: 200,
                        color: Colors.yellow,
                        margin: EdgeInsets.all(4),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
    );
  }
}