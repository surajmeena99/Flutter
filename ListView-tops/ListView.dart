import 'package:flutter/material.dart';

void main(){
  runApp(MyForm());
}
class MyForm extends StatefulWidget {
  const MyForm({super.key});

  @override
  State<MyForm> createState() => _MyFormState();
}

class _MyFormState extends State<MyForm> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List View"),
        ),
        body: ListView(
          children: [
            ListTile(
              title: Text("suraj Meena"),
              subtitle: Text("Flutter"),
              // leading: Icon(Icons.arrow_forward),
              leading: Image.asset('assets/images/suraj.jpg'),
            ),
            ListTile(
              title: Text("chetan"),
              subtitle: Text("Flutter"),
              leading: Icon(Icons.arrow_forward),
            ),
            InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Details()));
              },
              child: Container(
                child: Row(
                  children: [
                    Container(
                      child: Image.asset('assets/images/ocean.jpg', height: 200, width: 200,),
                    ),
                    Container(
                      child: Column(
                        children: [
                          Text("Ranthambhore National Park"),
                          Text("Sawai Madhopur"),
                          Text("Rajasthan")
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  const Details({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Details Page"),
      ),
      body: Center(
        child: Text("Dummy data is here"),
      ),
    );
  }
}