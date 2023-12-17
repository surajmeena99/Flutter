import 'package:flutter/material.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      // ),
        body: Container(
          child: Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.black,
                  ),
                  borderRadius: BorderRadius.circular(12),
                  // image: DecorationImage(image: NetworkImage(""), fit: BoxFit.fill), //for background image
                ),
                child: Image.network("https://images.pexels.com/photos/1416900/pexels-photo-1416900.jpeg?auto=compress&cs=tinysrgb&w=600", fit: BoxFit.cover,),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: ListTile(
                  title: Text("Oeschinen Lake Campground"),
                  subtitle: Text("Kandarsteg, Switzerland"),
                  trailing: Container(
                    height: 50,
                    width: 50,
                    child: Row(
                      children: [
                        Icon(Icons.star, color: Colors.red,),
                        Text("41"),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.phone, color: Colors.blue,),
                          Text("CALL", style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.send,color: Colors.blue,),
                          Text("ROUTE",style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Container(
                      child: Column(
                        children: [
                          Icon(Icons.share,color: Colors.blue,),
                          Text("SHARE",style: TextStyle(color: Colors.blue),)
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                child: Text("Lake Oeschinen lies at the foot of the Billenlisalp in the Bernese Alps. Situated 1578 meters above sea level, it is one of the larger alpine Lakes. A foodole ride from Kandersteg. followed by a half-hour walk through pastures and pine forest, leads you to the lake,"),
              ),
            ],
          ),
        ),
    );
  }
}