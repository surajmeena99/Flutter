import 'package:flutter/material.dart';
import 'package:myapp/bottom navbar/samplepages.dart';

void main(){
  runApp(
    MaterialApp(
      title: "bottom app menu",
      home: BottomMenu(),
    )
  );
}

class BottomMenu extends StatefulWidget {
  const BottomMenu({super.key});

  @override
  State<StatefulWidget> createState() {
    return _BottomMenuState();
  }
}

class _BottomMenuState extends State<BottomMenu> {
  var pageData = [HomePage(), AboutPage(), ServicesPage()];
  int selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(   //Comment appBar for different pages title
        title: Text("Bottom App Menu"),
      ),

      body: Center(
        // child: Text("Suraj Meena"),
        child: pageData[selectedItem],
      ),

      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.account_box_outlined), label: "About"),
          BottomNavigationBarItem(icon: Icon(Icons.local_laundry_service), label: "Services"),
        ],
        currentIndex: selectedItem,
        onTap: (setValue) {
          setState(() {
            selectedItem = setValue;
          });
        },
      ),

    );
  }
}