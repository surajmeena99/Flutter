import 'package:flutter/material.dart';
import 'package:myapp/ListView/user.dart';

void main(){
  runApp(MyListViewCustom());
}

class MyListViewCustom extends StatelessWidget {
  const MyListViewCustom({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("List View Custom"),
        ),
        body: ListView.custom(
          childrenDelegate: SliverChildBuilderDelegate(

            childCount: users.length,
            (BuildContext context, int index){
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: AssetImage(users[index].image),
                ),
                title: Text(users[index].name),
                subtitle: Text(users[index].profession),
              );
            },
          ),

          // childrenDelegate: SliverChildListDelegate([
          //   getItem(0),
          //   getItem(1),
          //   getItem(2),
          //   getItem(3),
          //   getItem(4),
          //   getItem(5),
          //   getItem(6),
          //   getItem(7),
          //   getItem(8),
          //   getItem(9),
          // ]),

        ),
      ),
    );
  }
}

// Widget getItem(int index){
//   return Container(
//     alignment: Alignment.center,
//     height: 120,
//     margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
//     color: Colors.blue.shade100,
//     child: Text("Item No $index", style: TextStyle(fontSize: 18),),
//   );
// }