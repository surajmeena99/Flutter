import 'package:flutter/material.dart';

void main(){
  runApp(ThirdTask());
}

class ThirdTask extends StatelessWidget {
  const ThirdTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kindacode.com',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Kindacode.com'),
        ),
        body: Padding(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Container(
                  width: 250,
                  height: 250,
                  color: Colors.amber,
                ),
                Container(
                  width: 100,
                  height: 400,
                  color: Colors.purple,
                ),
                Container(
                  width: 400,
                  height: 100,
                  color: Colors.red,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}