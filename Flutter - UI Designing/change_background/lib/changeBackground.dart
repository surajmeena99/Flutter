import 'dart:math';

import 'package:flutter/material.dart';

class ChangeColor extends StatefulWidget {
  const ChangeColor({super.key});

  @override
  State<ChangeColor> createState() => _ChangeColorState();
}

class _ChangeColorState extends State<ChangeColor> {
  Color _backgroundColor = Colors.blue;

  final Random random = Random();  //create object 

  Color _getrandomColor (){
    return Color.fromARGB(255,
    random.nextInt(256),
    random.nextInt(256),
    random.nextInt(256)
    );
  }

  void _changeBackground(){
    setState(() {
      _backgroundColor = _getrandomColor();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Change Background"),
      ),
      body: Container(
        color: _backgroundColor,
        child: Center(
          child: ElevatedButton(
            onPressed: _changeBackground,
            child: Text("Change Background"),
          ),
        ),
      ),
    );
  }
}