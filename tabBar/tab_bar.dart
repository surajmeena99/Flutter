import 'package:flutter/material.dart';
import 'package:myapp/Screens/home_screen.dart';
import 'package:myapp/screens/chat_screen.dart';
import 'package:myapp/screens/status_screen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});

  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}

class _TabBarScreenState extends State<TabBarScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(length: 3,  //...
      child: Scaffold(
        appBar: AppBar(
          title: Text("WhatsApp"),
          bottom: TabBar(
            tabs: [
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.home),
                    SizedBox(width: 5,), 
                    Text("Home"),
                  ],
                ),
              ),
              Tab(
                icon: Icon(Icons.chat),
                text: 'Chats',
              ),
              Tab(
                icon: Icon(Icons.settings_backup_restore_rounded),
                text: 'Status',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            HomeScreen(),
            ChatScreen(),
            StatusScreen(),
          ],
        ),
      ),
    );
  }
}