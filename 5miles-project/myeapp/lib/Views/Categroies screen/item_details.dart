import 'package:myeapp/HomeScreen/Components/featured_buttons.dart';
import 'package:myeapp/WidgetsCommon/our_button.dart';
import 'package:myeapp/consts/consts.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:myeapp/consts/lists.dart';

class ItemDetails extends StatelessWidget {
  final String? title;
  const ItemDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: lightGrey,
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.share,
                  color: darkFontGrey,
                )),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.favorite_outline_rounded,
                color: darkFontGrey,
              ),
            )
          ],
          title: title!.text.fontFamily(bold).color(darkFontGrey).make(),
        ),
        body: Column(children: [
          Expanded(
              child: Container(
            padding: const EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // we will create swiper here
                    VxSwiper.builder(
                        autoPlay: true,
                        height: 350,
                        itemCount: 3,
                        itemBuilder: (context, index) {
                          return Image.asset(
                            imgFc5,
                            width: double.infinity,
                            fit: BoxFit.cover,
                          );
                        }),
                    10.heightBox,
                    //titile and details section
                    title!.text
                        .size(16)
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    //ratting vx
                    VxRating(
                      onRatingUpdate: (value) {},
                      normalColor: textfieldGrey,
                      selectionColor: golden,
                      size: 25,
                      stepInt: true,
                      count: 5,
                    ),
                    10.heightBox,
                    "\$30,000"
                        .text
                        .color(redColor)
                        .fontFamily(bold)
                        .size(18)
                        .make(),
                    10.heightBox,
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(2),
                          child: Expanded(
                              child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                "Seller".text.white.fontFamily(semibold).make(),
                                5.heightBox,
                                "In House Brands"
                                    .text
                                    .fontFamily(bold)
                                    .color(darkFontGrey)
                                    .size(16)
                                    .make()
                              ])),
                        ),
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              child: Icon(
                                Icons.message_rounded,
                                color: darkFontGrey,
                              ),
                            ),
                          ],
                        )
                      ],
                    )
                        .box
                        .height(60)
                        .padding(const EdgeInsets.symmetric(horizontal: 8))
                        .color(textfieldGrey)
                        .make(),
                    20.heightBox,
                    Column(
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Color :".text.color(textfieldGrey).make(),
                            ),
                            Row(
                                children: List.generate(
                                    3,
                                    (index) => VxBox()
                                        .size(40, 40)
                                        .roundedFull
                                        .color(Vx.randomPrimaryColor)
                                        .margin(
                                            const EdgeInsets.symmetric(horizontal: 6))
                                        .make())),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),

                        //quntity row

                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child:
                                  "Quienty :".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.remove),
                                ),
                                "0"
                                    .text
                                    .size(16)
                                    .color(darkFontGrey)
                                    .fontFamily(bold)
                                    .make(),
                                IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.add),
                                ),
                                10.widthBox,
                                "(0 avialabel)".text.color(textfieldGrey).make()
                              ],
                            ),
                          ],
                        ).box.padding(const EdgeInsets.all(8)).make(),
                        //total box is here
                        Row(
                          children: [
                            SizedBox(
                              width: 100,
                              child: "Total :".text.color(textfieldGrey).make(),
                            ),
                            Row(
                              children: [
                                "\$0.00"
                                    .text
                                    .fontFamily(bold)
                                    .size(16)
                                    .color(redColor)
                                    .make()
                              ],
                            )
                          ],
                        ),
                      ],
                    ).box.white.shadowSm.make(),
                    //discription details
                    10.heightBox,
                    "Description"
                        .text
                        .color(darkFontGrey)
                        .fontFamily(semibold)
                        .make(),
                    10.heightBox,
                    "This is dummy item and bunny desciption here "
                        .text
                        .color(darkFontGrey)
                        .make(),
                    10.heightBox,
                    ListView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      children: List.generate(
                          Itemsdetailsbuttonlist.length,
                          (index) => ListTile(
                                title: Itemsdetailsbuttonlist[index]
                                    .text
                                    .fontFamily(semibold)
                                    .color(darkFontGrey)
                                    .make(),
                                trailing: const Icon(Icons.arrow_forward),
                              )),
                    ),
                    10.heightBox,
                    ////Product You may like
                    productsyoumaylike.text
                        .fontFamily(bold)
                        .size(16)
                        .color(darkFontGrey)
                        .make(),
                    20.heightBox,
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: List.generate(
                            3,
                            (index) => Column(
                                  children: [
                                    featuredButton(
                                        icon: featuredImages1[index],
                                        title: featuredTitel1[index]),
                                    10.heightBox,
                                    featuredButton(
                                        icon: featuredImages2[index],
                                        title: featuredTitel2[index]),
                                  ],
                                )).toList(),
                      ),
                    ),
                  ]),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourbuttom(
                color: redColor,
                onPress: () {},
                textcolor: whiteColor,
                title: "Add to Cart"),
          )
        ]));
  }
}
