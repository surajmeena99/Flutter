import 'package:flutter/material.dart';

class MyColor extends StatefulWidget {
  const MyColor({super.key});

  @override
  State<MyColor> createState() => _MyColorState();
}

class _MyColorState extends State<MyColor> {
  Color? selectedColor = Colors.white;

  void onColorSelected(Color? color){
    setState(() {
      selectedColor = color;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Color Seclection App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          RadioListTile(
            title: Text("Red"),
            value: Colors.red, 
            groupValue: selectedColor, 
            onChanged: onColorSelected,
          ),
          RadioListTile(
            title: Text("Blue"),
            value: Colors.blue, 
            groupValue: selectedColor, 
            onChanged: onColorSelected,
          ),
          RadioListTile(
            title: Text("Yellow"),
            value: Colors.yellow, 
            groupValue: selectedColor, 
            onChanged: onColorSelected,
          ),
          RadioListTile(
            title: Text("Green"),
            value: Colors.green, 
            groupValue: selectedColor, 
            onChanged: onColorSelected,
          ),
          SizedBox(height: 20,),
          Container(
            width: 200,
            height: 200,
            color: selectedColor,
          )
        ],
      ),
    );
  }
}