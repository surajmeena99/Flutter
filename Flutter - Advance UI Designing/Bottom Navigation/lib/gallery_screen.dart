import 'package:flutter/material.dart';

class MyGallery extends StatelessWidget {
  const MyGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Gallery"),
        backgroundColor: Colors.amber,
      ),
      body: const Center(
        child: Text("Photo"),
      ),
    );
  }
}