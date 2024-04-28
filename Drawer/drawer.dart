import 'package:flutter/material.dart';
import 'package:myapp/Drawer/setting_page.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Drawer(
        child: Column(
          children: <Widget>[

            Container(  //Top-box-v1
              padding: EdgeInsets.all(10),
              color: Theme.of(context).primaryColor,
              width: double.infinity,
              child: Row(
                children: <Widget>[
                  Container(
                    // margin: EdgeInsets.only(top: 20, bottom: 20),
                    margin: EdgeInsets.only(right: 20),
                    width: 60,
                    height: 100,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage("https://images.pexels.com/photos/213780/pexels-photo-213780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500")
                      )
                    ),
                  ),
                  Text("Suraj Meena",style: TextStyle(fontSize: 25, color: Colors.white),),
                ],
              ),
            ),

            ListTile(  //Link-box-v2
              title: Text("Home", style: TextStyle(fontSize: 20),),
              leading: Icon(Icons.home),
              onTap: null,
            ),

            ListTile(  //Link-box-v3
              title: Text("Setting", style: TextStyle(fontSize: 20),),
              leading: Icon(Icons.settings),
              onTap: () {
                Navigator.of(context).pop();  //for back to home page
                Navigator.push(context, 
                  MaterialPageRoute(builder: (context) => SettingPage())
                );
              },
            ),

            ListTile(  //Link-box-v4
              title: Text("Logout", style: TextStyle(fontSize: 20),),
              leading: Icon(Icons.logout),
              onTap: null,
            )
            
          ],
        )
      ),
    );
  }

}