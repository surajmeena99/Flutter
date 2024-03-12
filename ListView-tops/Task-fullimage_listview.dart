import 'package:flutter/material.dart';

void main(){
  runApp(FullImage());
}

  final List images = [
    'assets/images/suraj.jpg',
    'assets/images/ocean.jpg',
  ];

class FullImage extends StatefulWidget {
  const FullImage({super.key});

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Display Full Image"),
        ),
        body: ListView.builder(
          itemCount: images.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => Details(imageIndex: index)));
              },
              child: ListTile(
                leading: Image.asset(images[index]),
                title: Text("Image $index"),
              ),
            );
          },
        ),
      ),
    );
  }
}

class Details extends StatelessWidget {
  Details({required this.imageIndex, super.key});

  final int imageIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Display Full Image"),
      ),
      body: Center(
        child: Image.asset(images[imageIndex]),
      ),
    );
  }
}