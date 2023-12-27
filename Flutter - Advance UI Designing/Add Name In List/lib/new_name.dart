import 'package:flutter/material.dart';

class NewName extends StatefulWidget {
  const NewName({super.key});
  
  @override
  State<NewName> createState() => _NewNameState();
}

class _NewNameState extends State<NewName> {
  final TextEditingController _newNameController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add A Name"),
        backgroundColor: Colors.black26,
      ),
      body: Column(
        children: [
          TextField(
            controller: _newNameController,
            decoration: const InputDecoration(labelText: 'Enter Full Name'),
          ),
          const SizedBox(height: 30,),
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop(_newNameController.text);
              setState(() {
                // _nameList.add(_newNameController.text);
                _newNameController.clear();
              });
            },
            child: const Text('Add to ListView'),
          ),
        ],
      ),
    );
  }
}