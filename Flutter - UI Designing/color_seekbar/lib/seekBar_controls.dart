import 'package:flutter/material.dart';

class MySeekbar extends StatefulWidget {
  const MySeekbar({super.key});

  @override
  State<MySeekbar> createState() => _MySeekbarState();
}

class _MySeekbarState extends State<MySeekbar> {
  double redValue = 0;
  double greenValue = 0;
  double blueValue = 0;

  Widget buildSeekBar(String label, double value, ValueChanged<double> onChanged) {
    return Column(
      children: [
        Text(label),
        SizedBox(height: 10),
        Container(
          width: 150,
          child: Slider(
            value: value,
            min: 0,
            max: 255,
            onChanged: onChanged,
          ),
        ),
        Text(value.toInt().toString()),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // this line ensures that the color is recomputed(rebuild) whenever the state of the widget changes.
    Color bgColor = Color.fromARGB(
      redValue.toInt(), 
      greenValue.toInt(), 
      blueValue.toInt(),
      1
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Color Change Seekbar"),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Adjust the color using SeekBars"),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildSeekBar(
                    'Red', 
                    redValue, 
                    (value) {
                      setState(() {
                        redValue = value;
                      });
                    }
                  ),
                  buildSeekBar('Green', greenValue, (value) {
                    setState(() {
                      greenValue = value;
                    });
                  }),
                  buildSeekBar('Blue', blueValue, (value) {
                    setState(() {
                      blueValue = value;
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}