import 'package:flutter/material.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("SignIn"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 500,vertical: 50),
          color: Colors.pink.shade100,
          child: Container(
            padding: EdgeInsets.all(30),
            height: 1000,
            width: 500,
            color: Colors.purple.shade400,
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.phone_android, size: 25,),
                      Icon(Icons.phone_android, size: 50,),
                    ],
                  )
                ),
                SizedBox(
                  height: 30,
                ),
                Text("Welcome back!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),),
                SizedBox(
                  height: 40,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Username",
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Password",
                  ),
                  obscureText: true,
                ),
                SizedBox(
                  height: 75,
                ),
                ElevatedButton(onPressed: (){},
                  child: Text("Sign In"),
                ),
                SizedBox(
                  height: 50,
                ),
                Text("Don't have an account? SignUp")
              ],
            ),
          ),
        ),
      ),
    );
  }
}