import 'package:flutter/material.dart';
import 'package:myapp/ListView/user.dart';

void main(){
  runApp(MYListViewSeparated());
}

class MYListViewSeparated extends StatelessWidget {
  const MYListViewSeparated({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Image.asset('assets/images/logo.png', height: 75, width: 150,),
        ),
        body: ListView.separated(
          itemCount: users.length,
          // itemCount: 10,

          separatorBuilder: (BuildContext context, int index){
            return (index + 4) % 3 == 0
              ? ListTile(
                leading: CircleAvatar(
                  child: Text('A', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),),
                  backgroundColor: Colors.orange,
                ),
                title: Text('Advertiser'),
                subtitle: Text("Some information about add"),
                trailing: Container(
                  color: Colors.orange.shade400,
                  alignment: Alignment.center,
                  width: 30,
                  height: 20,
                  child: Text("Ad", style: TextStyle(fontSize: 12, color: Colors.white),),
                ),
              )
              : SizedBox(
                height: 0,
                width: 0,
              );
          },

          itemBuilder: (BuildContext context, int index){
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage(users[index].image),
              ),
              // title: Text("Item $index"),
              title: Text(users[index].name),
              subtitle: Text(users[index].profession),
            );
          },

          // separatorBuilder: (BuildContext context, int index) {
          //   return Divider(height: 1, color: Colors.red,);
          // },

        ),
      ),
    );
  }
}