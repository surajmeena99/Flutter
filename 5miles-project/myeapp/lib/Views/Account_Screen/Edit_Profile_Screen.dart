import 'package:flutter/material.dart';
import 'package:myeapp/WidgetsCommon/bg_widget.dart';
import 'package:myeapp/WidgetsCommon/custom_textfiel.dart';
import 'package:myeapp/WidgetsCommon/our_button.dart';
import 'package:myeapp/consts/consts.dart';
import 'package:myeapp/consts/images.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return  bgWidget(
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: Column(
           children: [
             Image.asset(
                  imgProfile2,
                  width: 100,
                  fit: BoxFit.cover,
                ).box.roundedFull.clip(Clip.antiAlias).make(),
                10.heightBox,
                ourbuttom(
                  color: redColor,onPress: (){},textcolor: whiteColor,title: "Change"
                ),
                Divider(),
                20.heightBox,
                cunstomTextField(
                  hint: nameHint,
                  isPass: false,
                  title: name,
                ),
                cunstomTextField(
                  hint: password,
                  isPass: true,
                  title: password,
                ),
           ],
          ).box.padding(EdgeInsets.all(16)).margin(EdgeInsets.only(top: 50)).shadowSm.make(),
        ),
      )
    );
  }
}