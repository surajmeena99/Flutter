import 'package:flutter/material.dart';

class EmailDetailScreen extends StatelessWidget {
  const EmailDetailScreen(this.emailIndex, {super.key});

  final int emailIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Email Detail'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Subject: Email $emailIndex'),
            const SizedBox(height: 8),
            const Text('Sender: user@example.com'),
            const SizedBox(height: 8),
            const Divider(height: 1,),
            const SizedBox(height: 16),
            const Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit.'),
          ],
        ),
      ),
    );
  }
}