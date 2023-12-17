import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen({super.key, required this.num1, required this.num2});

  final int num1;
  final int num2;


  @override
  Widget build(BuildContext context) {
List<int> numbers = List.generate((num2 - num1).abs() +1, (index) => num1 < num2 ? num1+index : num1-index);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Number Range Result"),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Text("Numbers between $num1 and $num2:"),
            SizedBox(height: 10,),
            for(int number in numbers)
            Text("$number"),
          ],
        ),
      ),
    );
  }
}