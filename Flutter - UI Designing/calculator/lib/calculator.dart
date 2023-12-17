import 'package:flutter/material.dart';

class MyCalculator extends StatefulWidget {
  const MyCalculator({super.key});

  @override
  State<MyCalculator> createState() => _MyCalculatorState();
}

class _MyCalculatorState extends State<MyCalculator> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  String result = "";
  String operation = "Add";  //default operation
  
  void selectedOperation(value){
    setState(() {
      operation = value.toString();
    });
  }

  void calculateResult(){
    double num1 = double.tryParse(controller1.text)!;
    double num2 = double.tryParse(controller2.text)!;

    setState(() {
      switch(operation){
        case "Add":
        result = (num1 + num2).toString();
        break;
        case "Subtract":
        result = (num1 - num2).toString();
        break;
        case "Multiply":
        result = (num1 * num2).toString();
        break;
        case "Divide":
        result = (num1 / num2).toString();
        break;
        default:
        result = "Error";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator App"),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Radio(value: "Add",
                  groupValue: operation,
                  onChanged: (value) {
                    setState(() {
                      operation = value.toString();
                    });
                  },
                ),
                Text("Addition"),
                Radio(value: "Subtract", groupValue: operation, onChanged: selectedOperation),
                Text("Subtraction"),
                Radio(value: "Multiply", groupValue: operation, onChanged: selectedOperation),
                Text("Multiplication"),
                Radio(value: "Divide", groupValue: operation, onChanged: selectedOperation),
                Text("Division"),
              ],
            ),
            TextField(
              controller: controller1,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Number1",
              ),
            ),
            TextField(
              controller: controller2,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: "Enter Number2",
              ),
            ),
            SizedBox(height: 16,),
            ElevatedButton(
              onPressed: calculateResult,
              child: Text("Calculate"),
            ),
            SizedBox(height: 16,),
            Text("Result: $result"),
          ],
        ),
      ),
    );
  }
}