import 'package:flutter/material.dart';

void main(){
  runApp(SecondList());
}
class SecondList extends StatefulWidget {
  const SecondList({super.key});

  @override
  State<SecondList> createState() => _SecondListState();
}

class _SecondListState extends State<SecondList> {

  final List<String> items = List<String>.generate(10, (index) => '');

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("ListView Builder"),
        ),
        body: ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Text("${index + 1}"),
              title: Text("Item $index"),
            );
          },
        ),
      ),
    );
  }
}