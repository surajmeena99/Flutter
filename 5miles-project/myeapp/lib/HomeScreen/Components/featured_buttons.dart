import 'package:myeapp/consts/consts.dart';
import 'package:flutter/material.dart';

Widget featuredButton({icon, String? title}) {
  return Row(
    children: [
      Image.asset(
        icon,
        width: 60,
        fit: BoxFit.fill,
      ),
      10.widthBox,
      title!.text.fontFamily(semibold).color(darkFontGrey).make()
    ],
  )
      .box
      .white
      .margin(EdgeInsets.symmetric(horizontal: 4))
      .width(200)
      .padding(EdgeInsets.all(4))
      .roundedSM
      .outerShadowSm
      .make();
}
