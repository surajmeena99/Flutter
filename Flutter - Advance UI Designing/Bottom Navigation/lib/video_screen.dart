import 'package:flutter/material.dart';

class MyVideo extends StatelessWidget {
  const MyVideo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Video"),
        backgroundColor: Colors.red,
      ),
      body: const Center(
        child: Text("Movie"),
      ),
    );
  }
}