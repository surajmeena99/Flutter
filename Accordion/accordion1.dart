import 'package:flutter/material.dart';
import 'package:getwidget/getwidget.dart';

void main(){
  runApp(MaterialApp(
    home: MyAccord(),
  ));
}

class MyAccord extends StatelessWidget {
  const MyAccord({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Accordion App"),
      ),
      body: Container(
        child: Column(
          children: [
            GFAccordion(
              collapsedIcon: Icon(Icons.add),
              expandedIcon: Icon(Icons.minimize),
              title: "Test1 Heading",
              content: "Description Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ante augue.",
            ),
            GFAccordion(
              collapsedIcon: Text("More"),
              expandedIcon: Text("Less"),
              title: "Test1 Heading",
              content: "Description Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ante augue.",
            ),
            GFAccordion(
              // collapsedIcon: Icon(Icons.add),
              // expandedIcon: Icon(Icons.minimize),
              title: "Test1 Heading",
              content: "Description Lorem ipsum dolor sit amet, consectetur adipiscing elit. Etiam eget ante augue.",
            ),
          ],
        ),
      ),
    );
  }
}