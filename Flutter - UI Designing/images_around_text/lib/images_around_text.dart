import 'package:flutter/material.dart';

class MyImages extends StatelessWidget {
  const MyImages({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Images Around TextView"),
        backgroundColor: Colors.red,
      ),
      body: Stack(
        alignment: Alignment.center,
        // fit: StackFit.expand,
        children: [
           Positioned(
            top: 0,
            left: 0,
            child: Image.network("https://images.pexels.com/photos/159866/books-book-pages-read-literature-159866.jpeg?auto=compress&cs=tinysrgb&w=600",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/2,
            ),
          ),
          Positioned(
            top: 0,
            right: 0,
            child: Image.network("https://images.pexels.com/photos/355863/pexels-photo-355863.jpeg?auto=compress&cs=tinysrgb&w=600",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/2,
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            child: Image.network("https://images.pexels.com/photos/164652/pexels-photo-164652.jpeg?auto=compress&cs=tinysrgb&w=600",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/2,
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Image.network("https://images.pexels.com/photos/4009760/pexels-photo-4009760.jpeg?auto=compress&cs=tinysrgb&w=600",
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width/2,
              height: MediaQuery.of(context).size.height/2,
            ),
          ),
          const Center(
            child: Text("Hello Flutter!", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),)
          )
        ],
      ),
    );
  }
}