import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(
    home: MySnackBar(),
  ));
}

class MySnackBar extends StatelessWidget {
  MySnackBar({super.key});

 void showMesnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('This is a Snackbar!'),
        duration: Duration(seconds: 3), 
        action: SnackBarAction(label: "Undo", onPressed: () {}),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My SnackBar App"),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text("Show Snack Bar"),
          onPressed: () {
            showMesnackbar(context);
          },
        ),
      ),
    );
  }
}