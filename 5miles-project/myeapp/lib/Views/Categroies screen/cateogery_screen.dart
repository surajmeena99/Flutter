import 'package:myeapp/Views/Categroies%20screen/categories_details.dart';
import 'package:myeapp/WidgetsCommon/bg_widget.dart';
import 'package:myeapp/consts/consts.dart';
import 'package:myeapp/consts/lists.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Cateogery_Screen extends StatelessWidget {
  const Cateogery_Screen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        title: categories.text.white.fontFamily(bold).make(),
      ),
      body: Container(
        child: GridView.builder(
            shrinkWrap: true,
            itemCount: 9,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 200),
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Image.asset(
                    categoryList[index],
                    height: 120,
                    width: 200,
                    fit: BoxFit.cover,
                  ),
                  10.heightBox,
                  "${categoryTitleList[index]}"
                      .text
                      .align(TextAlign.center)
                      .color(darkFontGrey)
                      .make()
                ],
              ).box.white.clip(Clip.antiAlias).outerShadowSm.make().onTap(() {
                Get.to(
                    () => Categories_details(title: categoryTitleList[index]));
              });
            }),
      ),
    ));
  }
}
