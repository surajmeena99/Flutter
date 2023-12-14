import 'package:flutter/material.dart';

void main(){
  runApp(Tops_Task());
}

class Tops_Task extends StatelessWidget {
  const Tops_Task({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: SingleChildScrollView(

        child: Container(  //Outer Box
          padding: EdgeInsets.all(12),
          child: Column( //Vertical Boxes
            children: [
              Container( //Box-v1
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  )
                ),
              ),

              SizedBox(
                height: 25,
              ),

              Container(  //Box-v2
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  )
                ),
                child: Row(  //Horizontal Boxes
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(  //Box-h1
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(5),
                      color: Colors.yellow[500],  
                    ),
                    Container(  //Box-h2
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(5),
                      color: Colors.pink[500],  
                    ),
                    Container(
                      height: 80,
                      width: 80,
                      margin: EdgeInsets.all(5),
                      color: Colors.purple[500], 
                      child: Icon(Icons.star, color: Colors.blue, size: 55,), 
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(  //Box-v3
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  )
                ),
                child: Image.network("https://media.istockphoto.com/id/1454448091/photo/man-planting-flag-on-piles-of-cash.webp?b=1&s=170667a&w=0&k=20&c=O4_hGE0XZ5JuIYUVDblKYOTJM7gkb9eSLp86PqgWLj0="),
              ),
              SizedBox(
                height: 25,
              ),
              Container(  //Box-v4
                height: 80,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  )
                ),
                child: Image.asset("assets/images/suraj.jpg"), /*   assets: - assets/images/     */
              ),
              SizedBox(
                height: 25,
              ),
              Container(  //Box-v5
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.pink[500], 
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  )
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Container(  //Box-v5
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.yellow[500], 
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  )
                ),
                child: Text("Suraj Meena", style: TextStyle(fontSize: 50, color: Colors.green),),
              ),
              SizedBox(
                height: 25,
              ),
              Container(  //Box-v6
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.purple[500], 
                  border: Border.all(
                    width: 2,
                    color: Colors.blue
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}