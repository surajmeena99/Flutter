import 'package:flutter/material.dart';
import 'dart:async';

import 'package:ui_designs/home_screen.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  
  @override
  void initState() { 
    super.initState();
    Timer(
      const Duration(seconds: 4), () {
        Navigator.of(context).pushReplacement(MaterialPageRoute(builder:  (context) => const HomeScreen()));
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      width: 850,
      color: Colors.black12,
      child: Image.network("https://media.istockphoto.com/id/1456566125/photo/money-stack-usa-dollar-banknotes.jpg?s=1024x1024&w=is&k=20&c=81daVVixV1L9v5Kvk-2NYaY7ukAJnITBPOGLIVbvpAM=", width: 850,),
        // child: Text("Welcome to Flutter"),
      // child: Image.asset("assets/images/suraj.jpg", width: 850,),
    );
  }
}