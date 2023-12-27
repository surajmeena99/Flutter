import 'package:flutter/material.dart';
import 'package:ui_designs/email_detail_screen.dart';
import 'package:ui_designs/navigation_drawer.dart';


class InboxScreen extends StatelessWidget {
  const InboxScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gmail', style: TextStyle(fontSize: 24, color: Colors.white),),
        backgroundColor: Colors.black45,
      ),
      drawer: const MyNavigationDrawer(),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) => ListTile(
          title: Text('Email $index'),
          subtitle: const Text('Sender: user@example.com'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => EmailDetailScreen(index)),
            );
          },
        ),
      ),
    );
  }
}