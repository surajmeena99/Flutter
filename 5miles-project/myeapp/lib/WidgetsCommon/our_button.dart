import 'package:myeapp/consts/consts.dart';
import 'package:flutter/material.dart';

Widget ourbuttom({onPress, color, textcolor, String? title}) {
  return ElevatedButton(
      style:
          ElevatedButton.styleFrom(primary: color, padding: EdgeInsets.all(12)),
      onPressed: onPress,
      child: title?.text.color(textcolor).fontFamily(bold).make());
}
