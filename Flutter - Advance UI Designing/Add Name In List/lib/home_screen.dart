import 'package:flutter/material.dart';
import 'package:ui_designs/new_name.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _nameController = TextEditingController();
  final List<String> _nameList = [];
  String _selectedName = "";

  void _addName() async {  
    final newName = await Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => const NewName(),),
    );

    if (newName == null) {
      return;
    }

    setState(() {
      _nameList.add(newName);
    });
  }

  void _showDialog(String name) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Selected Name'),
          content: Text(name),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('OK'),
            ),
          ],
        );
      },
    );
  }

    void _showContextMenu(String name) {
    _selectedName = name;
    showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(0, 0, 0, 0),
      items: [
        const PopupMenuItem(
          value: 'edit',
          child: Text('Edit Item'),
        ),
        const PopupMenuItem(
          value: 'delete',
          child: Text('Delete Item'),
        ),
      ],
    ).then((value) {
      if (value == 'edit') {
        _editItem();
      } else if (value == 'delete') {
        _confirmDelete();
      }
    });
  }

  void _editItem() {
    _nameController.text = _selectedName;
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Item'),
          content: TextField(controller: _nameController),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _nameList[_nameList.indexOf(_selectedName)] = _nameController.text;
                  _nameController.clear();
                });
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
  
    void _confirmDelete() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Confirm Delete'),
          content: Text('Are you sure want to delete $_selectedName?'),
          actions: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _nameList.remove(_selectedName);
                });
                Navigator.pop(context);
              },
              child: const Text('Yes'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact's List App"),
        backgroundColor: Colors.green,
        actions: [
          IconButton(
            onPressed: _addName,
            icon: const Icon(Icons.add,color: Colors.white,),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: _nameList.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    _showDialog(_nameList[index]);
                  },
                  onLongPress: () {
                    _showContextMenu(_nameList[index]);
                  },
                  child: ListTile(
                    title: Text(_nameList[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}