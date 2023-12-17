import 'package:flutter/material.dart';
import 'package:ui_designs/result_screen.dart';

class InputScreen extends StatelessWidget {
  InputScreen({super.key});

  final TextEditingController _controller1 = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();

  void _showNumbers(BuildContext context){
    int number1 = int.tryParse(_controller1.text)!;
    int number2 = int.tryParse(_controller2.text)!;

    Navigator.push(context,
      MaterialPageRoute(builder: (context) => ResultScreen(num1: number1, num2: number2),),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Number Range between two numbers"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _controller1,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter number 1",
                ),
              ),
              SizedBox(
                height: 10,
              ),
              TextField(
                controller: _controller2,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter number 2",
                ),
              ),
              SizedBox(height: 10,),
              ElevatedButton(
                onPressed: (){
                  _showNumbers(context);
                },
                child: Text("Show Numbers"),
              )
            ],
          ),
        ),
    );
  }
}