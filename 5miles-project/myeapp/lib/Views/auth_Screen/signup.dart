import 'package:myeapp/Controllers/Auth_Controller.dart';
import 'package:myeapp/HomeScreen/home.dart';
import 'package:myeapp/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:get/get.dart';
import '../../WidgetsCommon/applogo_widget.dart';
import '../../WidgetsCommon/bg_widget.dart';
import '../../WidgetsCommon/custom_textfiel.dart';
import '../../WidgetsCommon/our_button.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool? isCheck = false;
  var Controller = Get.put(AuthController());
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var reenteredpassController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "Join the  $appname".text.white.fontFamily(bold).size(24).make(),
          15.heightBox,
          Obx(()=>
             Column(
              children: [
                cunstomTextField(
                    hint: nameHint, title: name, controller: nameController,isPass: false),
                cunstomTextField(
                    hint: emailHint, title: email, controller: emailController,isPass: false),
                cunstomTextField(
                    hint: passwordHint,
                    title: password,
                    controller: passwordController,isPass: true),
                cunstomTextField(
                    hint: retypepassHint,
                    title: retyrppassword,
                    controller: reenteredpassController,isPass: true),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {}, child: forgetpassword.text.make()),
                ),
            
                Row(
                  children: [
                    Checkbox(
                        checkColor: redColor,
                        value: isCheck,
                        onChanged: (newValue) {
                          setState(() {
                            isCheck = newValue;
                          });
                        }),
                    5.widthBox,
                    // ignore: prefer_const_constructors
                    Expanded(
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                          text: "I agree to ",
                          style: TextStyle(
                            fontFamily: regular,
                            color: fontGrey,
                          ),
                        ),
                        TextSpan(
                            text: termANDcond,
                            style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            )),
                        TextSpan(
                            text: "&",
                            style: TextStyle(
                              fontFamily: regular,
                              color: fontGrey,
                            )),
                        TextSpan(
                            text: privacyPolicy,
                            style: TextStyle(
                              fontFamily: regular,
                              color: redColor,
                            )),
                      ])),
                    )
                  ],
                ),
                5.heightBox,
                //ourbuttom().box.width(context.screenWidth - 50).make(),
              Controller.isloading.value?CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ):  ourbuttom(
                    color: isCheck == true ? redColor : lightGrey,
                    title: signup,
                    textcolor: whiteColor,
                    onPress: () async {
                      if (isCheck != false) {
                        try {
                          Controller.isloading(true);
                          await Controller.siginMethod(
                                  context: context,
                                  email: emailController.text,
                                  password: passwordController.text)
                              .then((value) {
                            return Controller.storeUserData(
                                email: emailController.text,
                                name: nameController.text,
                                password: passwordController.text);
                          }).then((value) {
                            VxToast.show(context, msg: Loginsu);
                            Get.offAll(() => Home());
                          });
                        } catch (e) {
                          auth.signOut();
                          VxToast.show(context, msg: e.toString());
                          Controller.isloading(false);
                        }
                      }
                    }).box.white.width(context.screenWidth - 50).make(),
              ],
            )
                .box
                .white
                .rounded
                .shadowSm
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .make(),
          ),
          10.heightBox,
          // we will reap this widget with gesturewidget
          RichText(
              text: TextSpan(
            children: [
              TextSpan(
                  text: alreadyhaveaccount,
                  style: TextStyle(fontFamily: bold, color: fontGrey)),
              TextSpan(
                  text: login,
                  style: TextStyle(fontFamily: bold, color: redColor))
            ],
          )).onTap(() {
            Get.back();
          })
        ],
      )),
    ));
  }
}
