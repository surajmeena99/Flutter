import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MyAppScreen(),
  ));
}

class MyAppScreen extends StatelessWidget {
  const MyAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fonts App",style: getMyFontStyle(),),
      ),
      body: Center(
        child: Text("Hello World!", style: getMyFontStyle(),),
      ),
    );
  }
}

TextStyle getMyFontStyle(){
  return TextStyle(
    fontFamily: 'Quicksand',fontSize: 50,
  );
}