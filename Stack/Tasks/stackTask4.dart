import 'package:flutter/material.dart';

void main(){
  runApp(FourthTask());
}
class FourthTask extends StatelessWidget {
  const FourthTask({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Stack(
          // alignment: Alignment.center,
          children: [
            Container(
              color: Colors.blue[100],
            ),
            Positioned(
              top: 100,
              left: 500,
              child: Column(
                children: [
                  Container(
                    child: Image.asset('assets/images/intro-1.png', height: 200, width: 200,),
                  ),
                  Text("Welcome to Rinzzo", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Text("Your Trusted Online Laundry Service in Ahmedabad")
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: Row(
                children: [
                  ElevatedButton(onPressed: (){},
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.white),
                    foregroundColor: MaterialStateProperty.all(Colors.blue),
                    elevation: MaterialStateProperty.all(10),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    )),
                  ),
                   child: Text('Skip')
                  ),
                  SizedBox(width: 1000,),
                  TextButton(onPressed: (){},
                   child: Text('Next', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),)
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}