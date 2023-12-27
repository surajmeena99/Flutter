import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.number1, required this.number2});

  final int number1;
  final int number2;

  @override
  Widget build(BuildContext context) {
    int sum = number1 + number2;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Result Screen'),
        backgroundColor: Colors.green,
      ),
      body: Center(
        child: Text('Sum: $sum',
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}