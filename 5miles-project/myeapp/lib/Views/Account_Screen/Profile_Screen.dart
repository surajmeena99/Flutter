import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import 'package:myeapp/Controllers/Auth_Controller.dart';
import 'package:myeapp/Views/Account_Screen/Components/Details_Screenscard.dart';
import 'package:myeapp/Views/auth_Screen/login_Screen.dart';
import 'package:myeapp/WidgetsCommon/bg_widget.dart';
import 'package:myeapp/consts/consts.dart';
import 'package:myeapp/consts/lists.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          ///edit profile buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: const Align(
              alignment: Alignment.topRight,
              child: Icon(
                Icons.edit,
                color: whiteColor,
              ),
            ).onTap(() {}),
          ),

          ///user details section
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Image.asset(
                  imgProfile2,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      credits.text.white.make(),
                      20.widthBox,
                      "gadadarshan2503@gmail.com".text.white.size(8).make(),
                    ],
                  ).box.width(context.screenWidth * 0.3).make(),
                ),
                5.widthBox,
                OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: BorderSide(color: whiteColor)),
                    onPressed: () async {
                        await Get.put(AuthController()).SignoutMethod(context: context);
                        Get.offAll(()=>Login_Screen());
                    },
                    child: "logout".text.white.make()),
              ],
            ),
          ),
          5.heightBox,
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Details_screens_card(
                  Count: "00",
                  title: "In your Cart",
                  width: (context.screenWidth / 3.5)),
              Details_screens_card(
                Count: "22",
                title: "in your wishlist",
                width: (context.screenWidth / 3.5),
              ),
              Details_screens_card(
                Count: "3037",
                title: "in your Orders",
                width: (context.screenWidth / 3.5),
              ),
            ],
          ),

          ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, index) {
                    return ListTile(
                      title: ProfileList[index]
                          .text
                          .fontFamily(bold)
                          .color(darkFontGrey)
                          .make(),
                      leading: Image.asset(
                        ProfileIcons[index],
                        height: 20,
                        width: 20,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      color: darkFontGrey,
                    );
                  },
                  itemCount: ProfileList.length)
              .box
              .color(lightGrey)
              .padding(EdgeInsets.symmetric(horizontal: 16))
              .rounded
              .margin(EdgeInsets.all(12))
              .shadowSm
              .make()
              .box
              .color(redColor)
              .make()
        ],
      )),
    ));
  }
}
