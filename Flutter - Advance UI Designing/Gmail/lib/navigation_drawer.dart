import 'package:flutter/material.dart';
import 'package:ui_designs/inbox_screen.dart';

class MyNavigationDrawer extends StatefulWidget {
  const MyNavigationDrawer({super.key});

  @override
  State<MyNavigationDrawer> createState() => _MyNavigationDrawerState();
}

class _MyNavigationDrawerState extends State<MyNavigationDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(left: 12),
                decoration: const BoxDecoration(
                  color: Colors.black45,
                ),
                child: const Text("Gmail", style: TextStyle(fontSize: 24, color: Colors.white),),
              ),
            ),
            ListTile(
              title: const Text("All inboxes"),
              leading: const Icon(Icons.all_inbox),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const InboxScreen()));
              },
            ),
            ListTile(
              title: const Text("Primary"),
              leading: const Icon(Icons.inbox),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const InboxScreen()));
              },
            ),
            const Divider(height: 1,),
            ListTile(
              title: const Text("Sent"),
              leading: const Icon(Icons.send_outlined),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const InboxScreen()));
              },
            ),
            ListTile(
              title: const Text("Starred"),
              leading: const Icon(Icons.star_border),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const InboxScreen()));
              },
            ),
            ListTile(
              title: const Text("Spam"),
              leading: const Icon(Icons.info_outline),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> const InboxScreen()));
              },
            ),
            const Divider(height: 1,),
            ListTile(
              title: const Text("Settings"),
              leading: const Icon(Icons.settings),
              onTap: (){
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Help and feedback"),
              leading: const Icon(Icons.help_outline),
              onTap: (){
                Navigator.pop(context);
              },
            ),
          ],
        ),
    );
  }
}