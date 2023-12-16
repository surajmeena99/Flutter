import 'package:flutter/material.dart';
import 'package:myapp/TextNavigation/Screens.dart';


void main(){
  runApp(TextFields());
}
class TextFields extends StatefulWidget {
  const TextFields({super.key});

  @override
  State<TextFields> createState() => _TextFieldsState();
}

class _TextFieldsState extends State<TextFields> {

  TextEditingController Textname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text("TextField Display"),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            TextField( 
              controller: Textname,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24)
                ),
                hintText: 'Enter your name'
                ),
              ),
            SizedBox(
              height: 24,
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, 
                  MaterialPageRoute(
                    builder: (BuildContext context) => ScreenDisplay(myName: Textname.text.toString()),
                  )
                );
              },            
              child: Text("Submit"),
            ),
          ],
        ),
      ),
      ),
    );
  }
}