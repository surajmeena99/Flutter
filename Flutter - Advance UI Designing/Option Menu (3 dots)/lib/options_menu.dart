import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Example'),
        backgroundColor: Colors.amber,
        actions: [
          PopupMenuButton<String>(  //three dots button
            onSelected: (value) {
              if (value == 'profile') {
                // Handle profile option
                print('Profile selected');
              } else if (value == 'logout') {
                // Handle logout option
                print('Logout selected');
              }
            },
            itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem<String>(
                  value: 'profile',
                  child: Text('Profile'),
                ),
                PopupMenuItem<String>(
                  value: 'logout',
                  child: Text('Logout'),
                ),
              ];
            },
          ),
        ],
      ),
      body: Center(
        child: Text('App Screen'),
      ),
    );
  }
}
