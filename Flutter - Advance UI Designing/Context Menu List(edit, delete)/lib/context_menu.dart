import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  List<String> items = ["Item 1", "Item 2", "Item 3", "Item 4"];

  void _editItem(int index) {
    // Implement your edit logic here
  }

  void _viewItem(int index) {
    // Implement your view logic here
  }

  void _deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
    // Implement your delete logic here
  }

  void _showContextMenu(BuildContext context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: Text("Edit"),
                trailing: Icon(Icons.edit),
                onTap: () {
                  Navigator.pop(context);
                  _editItem(index);
                },
              ),
              ListTile(
                title: Text("View"),
                trailing: Icon(Icons.view_list),
                onTap: () {
                  Navigator.pop(context);
                  _viewItem(index);
                },
              ),
              ListTile(
                title: Text("Delete"),
                trailing: Icon(Icons.delete),
                onTap: () {
                  Navigator.pop(context);
                  _deleteItem(index);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("ListView with Context Menu"),
        backgroundColor: Colors.amber,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(items[index]),
            onLongPress: () {
              _showContextMenu(context, index);
            },
          );
        },
      ),
    );
  }
}
