import 'package:flutter/material.dart';

class MyCheckbox extends StatefulWidget {
  const MyCheckbox({super.key});

  @override
  State<MyCheckbox> createState() => _MyCheckboxState();
}

class _MyCheckboxState extends State<MyCheckbox> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Checkbox App"),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Click Checkbox to view Text."),
            SizedBox(height: 10,),
            Checkbox(
              value: isChecked, 
              onChanged: (value){
                setState(() {
                  isChecked = value!;
                });
              },
            ),
            Visibility(
              visible: isChecked,
              child: const Text("Welcome to Flutter!!!",style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}