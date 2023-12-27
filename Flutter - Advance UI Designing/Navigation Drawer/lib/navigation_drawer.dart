import 'package:flutter/material.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {

  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(
    fontSize: 24, fontWeight: FontWeight.bold
  );
  static const List<Widget> _myList = [
    Text("Suraj", style: optionStyle,),
    Text("Chetan", style: optionStyle,),
    Text("Vansh", style: optionStyle,),
  ];
  void onClick(index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My Drawer App"),
      ),
      body: Center(
        child: _myList[_selectedIndex],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.blue,
                ),
              ),
            ),
            ListTile(
              title: const Text("Home"),
              selected: _selectedIndex == 0,
              onTap: (){
                onClick(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Gallery"),
              selected: _selectedIndex == 1,
              onTap: (){
                onClick(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Setting"),
              selected: _selectedIndex == 2,
              onTap: (){
                onClick(2);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}