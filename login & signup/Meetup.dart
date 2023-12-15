import 'package:flutter/material.dart';

void main(){
  runApp(MyMeetup());
}
class MyMeetup extends StatelessWidget {
  const MyMeetup({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Meetup Page"),
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: MediaQuery.of(context).size.width,
                child: Image.asset("assets/images/ocean.jpg", fit: BoxFit.fill,),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.calendar_today)),
                    Text("October 30, 2023"),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.apartment_rounded)),
                    Text("San Francisco"),
                  ],
                ),
              ),
              Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      ElevatedButton(onPressed: (){}, child: Text("Logout"),),
                      SizedBox(
                        width: 16,
                      ),
                      ElevatedButton(onPressed: (){}, child: Text("Profile"),),
                    ],
                  ),
                ),
              ),
              Divider(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Column(                   
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text from the left
                  children: [
                    Text("What we'll be doing", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold), ),
                    Text("Join us for a day full of Firebase Workshops and Pizza!"),
                    Text("2 people going"),
                  ],
                ),
              ),
              Container(
                child: Row(
                  children: [
                    // ElevatedButton(onPressed: (){}, child: Text("Yes"),),
                    // ElevatedButton(onPressed: (){}, child: Text("No"),),
                    Padding(
                      padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text("Yes"),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(8.0), // Adjust the padding as needed
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("No"),
                        ),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ),
                                    
                  ],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text("Discussion", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),),
                ),
              Container(
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Leave a message",
                          suffix: Text("Send"),                  
                        ),                
                      ),
                    ),
                    ElevatedButton(onPressed: (){},
                      child: Row(
                        children: [
                          Icon(Icons.send),
                          Text("SEND"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),          
            ],
          ),
        ),
      ),
    );
  }
}