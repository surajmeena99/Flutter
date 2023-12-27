import 'package:flutter/material.dart';

class MyAudio extends StatelessWidget {
  const MyAudio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Audio"),
        backgroundColor: Colors.green,
      ),
      body: const Center(
        child: Text("Song"),
      ),
    );
  }
}