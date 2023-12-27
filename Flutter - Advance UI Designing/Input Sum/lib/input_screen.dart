import 'package:flutter/material.dart';
import 'package:ui_designs/result_screen.dart';

class InputScreen extends StatefulWidget {
  const InputScreen({super.key});

  @override
  State<InputScreen>  createState() => _InputScreenState();
}

class _InputScreenState extends State<InputScreen> {
  TextEditingController number1Controller = TextEditingController();
  TextEditingController number2Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Screen'),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: number1Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Number 1'),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: number2Controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: 'Enter Number 2'),
            ),
            const SizedBox(height: 32),
            ElevatedButton(
              onPressed: () {
                // Navigate to the next screen and pass the values
                Navigator.push(context,
                  MaterialPageRoute(
                    builder: (context) => ResultScreen(
                      number1: int.parse(number1Controller.text),
                      number2: int.parse(number2Controller.text),
                    ),
                  ),
                );
              },
              child: const Text('Calculate Sum'),
            ),
          ],
        ),
      ),
    );
  }
}