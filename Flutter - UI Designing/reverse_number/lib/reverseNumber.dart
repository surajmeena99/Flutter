import 'package:flutter/material.dart';

class ReverseNumber extends StatefulWidget {
  const ReverseNumber({super.key});

  @override
  State<ReverseNumber> createState() => _ReverseNumberState();
}

class _ReverseNumberState extends State<ReverseNumber> {
  TextEditingController _numberController = TextEditingController();
  String _reverseNumber = '';

  void reverseInput(){
    String input = _numberController.text;
    // String _reversed = input.runes.toList().reversed.map((e) => String.fromCharCode(e)).join();
    String _reversed = input.split('').reversed.join();

    setState(() {
      _reverseNumber = _reversed;
    });
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text("Reverse Number App"),
        ),
        body: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: _numberController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: "Enter a number"
                ),
              ),
              SizedBox(
                height: 16.0,
              ),
              ElevatedButton(
                onPressed: (){
                  reverseInput();
                },
                child: Text("Reverse"),
              ),
              SizedBox(
                height: 16,
              ),
              Text("Reversed Number: $_reverseNumber",style: TextStyle(fontSize: 18),)
            ],
          ),
        ),
      ),
    );
  }
}