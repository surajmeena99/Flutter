import 'package:flutter/material.dart';

import 'package:carousel_slider/carousel_slider.dart';

void main(){
  runApp(MaterialApp(
    home: MySlider(),
  ));
}

class MySlider extends StatelessWidget {
  MySlider({super.key});

  final List sliderColor = [Colors.red, Colors.green, Colors.yellow];
  final List<String> sliderImg = ['assets/images/image-1.jpeg', 'assets/images/image-2.jpg', 'assets/images/image-3.jpeg'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Slider App"),
      ),
      body: Center(
        child: CarouselSlider(
          options: CarouselOptions(
            height: 400,
            enlargeCenterPage: true,
            autoPlay: true,
          ),
          // items: sliderColor.map((colorPath){
          items: sliderImg.map((imagePath){
            return Builder(
              builder: (BuildContext context) {
                return Container(
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.symmetric(horizontal: 5.0),
                  decoration: BoxDecoration(
                    // color: colorPath,
                  ),
                  // child: Text("Hello"),
                  child: Image.asset(imagePath, fit: BoxFit.cover,),
                );
              },
            );
          }).toList(),
        ),
      ),  
    );
  }
}