import 'package:flutter/material.dart';

List images = [
  "https://images.unsplash.com/photo-1531956759688-e71cc2586e34?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8c3RhY2t8ZW58MHx8MHx8fDA%3D",
  "https://plus.unsplash.com/premium_photo-1684534125372-10d4c47c825f?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NXx8c3RhY2t8ZW58MHx8MHx8fDA%3D",
  "https://images.unsplash.com/photo-1458501534264-7d326fa0ca04?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8OHx8c3RhY2t8ZW58MHx8MHx8fDA%3D",
  "https://plus.unsplash.com/premium_photo-1672846027109-e2c91500afef?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTd8fHN0YWNrfGVufDB8fDB8fHww"
];

List titles = [
  "Image1", 
  "Image2",
  "Image3",
  "Image4",
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              Navigator.push(context, 
                MaterialPageRoute(
                builder: (BuildContext context) => Details_Screen(title: titles[index], image: images[index],)
                )
              );
            },
            child: Card(
              elevation: 20,
              child: Column(
                children: [
                  Container(
                    child: Image.network(images[index]),
                  ),
                  Container(
                    child: Text(titles[index]),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class Details_Screen extends StatelessWidget {
  Details_Screen({super.key, required this.title, required this.image});

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Card(
        color: Colors.amber,
        elevation: 10,
        child: Container(
          margin: EdgeInsets.all(55),
          child: Column(
            children: [
              Image.network(image),
              Text(title),
            ],
          ),
        ),
      ),
    );
  }
}