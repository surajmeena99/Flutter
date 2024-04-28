import 'package:flutter/material.dart';

void main(){
  runApp(ScrollControllerTest());
}
class ScrollControllerTest extends StatefulWidget {
  ScrollControllerTest({super.key});

  @override
  State<ScrollControllerTest> createState() => _ScrollControllerTestState();
}

class _ScrollControllerTestState extends State<ScrollControllerTest> {

  final ScrollController _scrollController = ScrollController();

  String _scrollLocation = 'Reached Start';  //declare initial value
  
  void _listenToScrollMoments(){
    String currentLocation = '';
    if(_scrollController.offset == _scrollController.position.minScrollExtent){
      currentLocation = 'Reached Start';
    }else if(_scrollController.offset == _scrollController.position.maxScrollExtent){
      currentLocation = 'Reached End';
    }else{
      currentLocation = 'IN Between List';
    }

    setState(() {
      _scrollLocation = currentLocation;
    });
  }

  @override
  void initState() {
    _scrollController.addListener(_listenToScrollMoments);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(_scrollLocation),  //call here
        ),
        body: ListView.builder(
          controller: _scrollController,

          itemCount: 20,
          itemBuilder: (context, index) {
            return Container(
              alignment: Alignment.center,
              color: index %2 ==0 ? Colors.blue.shade100 : Colors.orange.shade100,
              height: 150,
              child: Text("Item $index", style: TextStyle(fontSize: 22),),
            );
          },
        ),
      ),
    );
  }
}