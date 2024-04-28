import 'package:flutter/material.dart';

class Back_Ground extends StatefulWidget {
  const Back_Ground({super.key});

  @override
  State<Back_Ground> createState() => __Back_GroundState();
}z

class __Back_GroundState extends State<Back_Ground> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BackGround Image"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          image: DecorationImage(image: NetworkImage("data:image/jpeg;base64,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"), fit: BoxFit.fill)
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              height: 350,
              width: 250,
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(24)
              ),
              child: Column(
                children: [
                  TextField(  //TF-1
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24)
                      ),
                      labelText: "Name",hintText: "Enter Name"
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  TextField(  //TF-2
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(24)
                      ),
                      labelText: "Password",
                      hintText: "Enter Password"
                    ),
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  ElevatedButton(onPressed: (){},
                    child: Text("login")
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