import 'package:myeapp/Views/Categroies%20screen/item_details.dart';
import 'package:myeapp/WidgetsCommon/bg_widget.dart';
import 'package:myeapp/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';

class Categories_details extends StatelessWidget {
  final String? title;
  const Categories_details({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
      child: Scaffold(
        appBar: AppBar(
          title: title?.text.fontFamily(bold).white.make(),
        ),
        body: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                    children: List.generate(
                        6,
                        (index) => "Baby Clothing"
                            .text
                            .size(12)
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .makeCentered()
                            .box
                            .rounded
                            .color(whiteColor)
                            .size(120, 60)
                            .margin(EdgeInsets.all(5))
                            .make())),
              ),
              //items Container()
              20.heightBox,
              Expanded(
                  child: GridView.builder(
                      shrinkWrap: true,
                      itemCount: 6,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisExtent: 250,
                          mainAxisSpacing: 8,
                          crossAxisSpacing: 8),
                      itemBuilder: (context, index) {
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              imgP5,
                              height: 150,
                              width: 200,
                              fit: BoxFit.cover,
                            ),
                            "Laptop 64/24"
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            10.heightBox,
                            "\$600"
                                .text
                                .color(redColor)
                                .fontFamily(bold)
                                .size(16)
                                .make()
                          ],
                        )
                            .box
                            .margin(EdgeInsets.symmetric(horizontal: 4))
                            .roundedSM
                            .white
                            .shadowSm
                            .padding(EdgeInsets.all(12))
                            .make()
                            .onTap(() {
                          Get.to(() => ItemDetails(
                                title: "Dummy Titel",
                              ));
                        });
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
