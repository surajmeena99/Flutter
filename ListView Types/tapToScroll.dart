import 'package:flutter/material.dart';

void main(){
  runApp(TapToScroll());
}
class TapToScroll extends StatefulWidget {
  TapToScroll({super.key});

  @override
  State<TapToScroll> createState() => _TapToScrollState();
}

class _TapToScrollState extends State<TapToScroll> {
  final List<Color> _colors = [
    Color(0xff1abc9c),
    Color(0xff2ecc71),
    Color(0xff3498db),
    Color(0xff9859b6),
    Color(0xff34495e),
    Color(0xfffac40f),
    Color(0xffe67e22),
    Color(0xffe74c3c),
    Color(0xffd894d4),
    Color(0xff95a5a6),
  ];

  final _containerHieght = 300.0;  

  final ScrollController _scrollController = ScrollController();  //This line creates an instance(object) of a ScrollController named _scrollController. 

  void _scrollToTap(int index){
    _scrollController.animateTo(index * _containerHieght,
      duration: Duration(microseconds: 500),
      curve: Curves.easeIn
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: _colors[5],
          title: Text("Tap Number to scroll"),
        ),
        body: Column(
          children: [
            //Horizontal List with numbers
            Container(
              height: 50,
              margin: EdgeInsets.symmetric(vertical: 16),

              child: ListView.builder(
                scrollDirection: Axis.horizontal,

                itemCount: _colors.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      _scrollToTap(index);
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 50,
                      width: 50,
                      color: _colors[index],
                      child: Text('${index + 1}',style: TextStyle(fontSize: 22, color: Colors.white),),
                      margin: EdgeInsets.symmetric(horizontal: 16),
                    ),
                  );
                },
              ),
            ),

            //Vertical list containers
            Expanded(child: ListView.builder(
              controller: _scrollController,

              itemCount: _colors.length,
              itemBuilder: (context, index) {
                return Container(
                  alignment: Alignment.center,
                  height: _containerHieght,
                  color: _colors[index],
                  child: Text("${index + 1}",style: TextStyle(fontSize: 100, color: Colors.black45),),
                );
              },
            ))
          ],
        ),
      ),
    );
  }
}