import 'package:flutter/material.dart';
import 'package:ui_designs/audio_screen.dart';
import 'package:ui_designs/gallery_screen.dart';
import 'package:ui_designs/video_screen.dart';

class BottomScreen extends StatefulWidget {
  const BottomScreen({super.key});

  @override
  State<BottomScreen> createState() => _BottomScreenState();
}

class _BottomScreenState extends State<BottomScreen> {

  int _selectedIndex =0;
  List screenList = [
    const MyGallery(),
    const MyAudio(),
    const MyVideo(),
  ];

  List<Color> itemColor = [
    Colors.amber,
    Colors.green,
    Colors.red,
  ];
  void _onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: screenList.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.image),
        label: "Gallery",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.audiotrack_outlined),
        label: "Audio",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.play_circle_outline),
        label: "Video",
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: _onTap,
      selectedItemColor: Colors.white,
      backgroundColor: itemColor[_selectedIndex],
      ),
    );
  }
}