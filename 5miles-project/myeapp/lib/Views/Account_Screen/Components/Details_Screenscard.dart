import 'package:flutter/material.dart';
import 'package:myeapp/consts/consts.dart';

Widget Details_screens_card({width, String? title, String? Count}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Count!.text.fontFamily(bold).color(darkFontGrey).make(),
      title!.text.fontFamily(bold).size(8).color(darkFontGrey).make()
    ],
  ).box.white.padding(EdgeInsets.all(4)).rounded.height(60).width(width).make();
}
