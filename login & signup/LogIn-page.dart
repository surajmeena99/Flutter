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
          title: Text("LogIn"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 500,vertical: 50),
          color: Colors.black26,
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.all(15),
            // height: 1000,
            // width: 500,
            decoration: BoxDecoration(
              color: Colors.blue.shade800,
              borderRadius: BorderRadius.circular(24),
            ),
            child: Column(
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Dite", style: TextStyle(fontSize: 25, color: Colors.white),),
                      Icon(Icons.restaurant_menu, size: 25, color: Colors.white,),
                      Text("Guru", style: TextStyle(fontSize: 25, color: Colors.white),),
                    ],
                  )
                ),
                SizedBox(
                  height: 25,
                ),
                Text("Fill the below information to login", style: TextStyle(fontSize: 15, color: Colors.white),),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.all(15),
                  height: 300,
                  width: 250,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(24),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text("Login Account",style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Username or E-mail",
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      TextField(
                        decoration: InputDecoration(
                          hintText: "Password",
                        ),
                        obscureText: true,
                      ),
                      Container(
                        // margin: EdgeInsets.only(left: 10, bottom: 5, right: 5, top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            TextButton(onPressed: (){}, child: Text("Forgot Password?")),
                          ],
                        ),
                      ),
                      // Text("Forgot Password?",),
                      SizedBox(
                        height: 30,
                      ),
                      ElevatedButton(onPressed: (){},
                        child: Text("Log In"),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all(Colors.amber, ),                        
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.facebook, color: Colors.blue,),
                            Icon(Icons.email)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Text("Don't have an account?"),
                Text("REGISTER",style: TextStyle(fontSize: 15, color: Colors.white),),
              ],
            ),
          ),
        ),
      ),
    );
  }
}