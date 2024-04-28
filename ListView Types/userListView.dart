import 'package:flutter/material.dart';
import 'package:myapp/ListView/user.dart';

void main(){
  runApp(MyListViewBuilder());
}

class MyListViewBuilder extends StatelessWidget {
  const MyListViewBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List View Builder"),
        ),
        body: ListView.builder(
          itemCount: users.length,
          itemBuilder: (BuildContext context, int index) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(  //Use NetworkImage when working with firebase
                  users[index].image,
                ),
              ),
              title: Text(users[index].name),
              subtitle: Text(users[index].profession),
            );
          },
        ),
      ),
    );
  }
}

