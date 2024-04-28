import 'package:flutter/material.dart';

void main(){
  runApp(ScrollControllerTest());
}
class ScrollControllerTest extends StatelessWidget {
  ScrollControllerTest({super.key});

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {

    //we call here because we use stateless widget
    // _scrollController.addListener((){
    //   print(_scrollController.offset);
    // });  
    
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Scroll Controller Test"),
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
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FloatingActionButton(
              onPressed: (){
                // _scrollController.jumpTo(_scrollController.position.minScrollExtent);

                // _scrollController.animateTo(_scrollController.position.minScrollExtent,
                //   duration: Duration(seconds: 2),
                //   curve: Curves.easeIn,
                // );

                _scrollController.animateTo(_scrollController.offset - 150,
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: Icon(Icons.arrow_upward),
            ),
            FloatingActionButton(
              onPressed: (){
                // _scrollController.jumpTo(_scrollController.position.maxScrollExtent);

                // _scrollController.animateTo(_scrollController.position.maxScrollExtent,
                //   duration: Duration(seconds: 2),
                //   curve: Curves.easeIn,
                // );

                _scrollController.animateTo(_scrollController.offset + 150,
                  duration: Duration(microseconds: 500),
                  curve: Curves.easeIn,
                );
              },
              child: Icon(Icons.arrow_downward),
            ),
          ],
        ),
      ),
    );
  }
}