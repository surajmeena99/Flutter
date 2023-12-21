import 'package:flutter/material.dart';
import 'package:myapp/Const/Color.dart';
import 'package:myapp/Const/String.dart';
import 'package:myapp/Const/images.dart';

void main(){
  runApp(Text_Field());
}
class Text_Field extends StatefulWidget {
  const Text_Field({super.key});

  @override
  State<Text_Field> createState() => _Text_FieldState();
}

class _Text_FieldState extends State<Text_Field> {
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
        title: Text("TextField Pro"),
      ),
      body: Container(
        color: yellow,  //call yellow value from Const/Color.dart
        margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Column(
          children: [
            TextField(  //TF-1
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.email),
                hintText: "Enter Email"
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextField(  //TF-2
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(24)
                ),
                hintText: name,  //call name value from Const/String.dart
                labelText: "name",
                prefixIcon: IconButton(onPressed: (){print("Button has been Clicked");},
                  icon: Icon(Icons.edit),
                ),
                suffixIcon: Icon(Icons.delete),
              ),
            ),
            SizedBox(
              height: 24,
            ),
            TextFormField(  //TF-3
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.zero,
                ),
                labelText: age,  //call age value from Const/String.dart
                hintText: "Enter age",
                suffixIcon: Icon(Icons.auto_fix_normal_outlined)
              ),
            ),
            SizedBox(
              height: 24,
            ),
            Image.network(img1),
            SizedBox(
              height: 24,
            ),
            Image.asset(img2)
          ],
        ),
      ),
      ),
    );
  }
}