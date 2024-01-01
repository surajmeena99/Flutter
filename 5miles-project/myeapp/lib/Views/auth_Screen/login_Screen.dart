import 'package:myeapp/Controllers/Auth_Controller.dart';
import 'package:myeapp/Views/auth_Screen/signup.dart';
import 'package:myeapp/WidgetsCommon/applogo_widget.dart';
import 'package:myeapp/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myeapp/HomeScreen/home.dart';
import '../../WidgetsCommon/bg_widget.dart';
import '../../WidgetsCommon/custom_textfiel.dart';
import '../../WidgetsCommon/our_button.dart';
import '../../consts/lists.dart';

class Login_Screen extends StatelessWidget {
  const Login_Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var controller =Get.put(AuthController());


    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
          child: Column(
        children: [
          (context.screenHeight * 0.1).heightBox,
          applogoWidget(),
          10.heightBox,
          "login in to $appname".text.white.fontFamily(bold).size(24).make(),
          15.heightBox,
          Obx(()=>
             Column(
              children: [
                cunstomTextField(hint: emailHint, title: email,isPass: false,controller: controller.emailcontroller),
                cunstomTextField(hint: passwordHint, title: password,isPass: true,controller: controller.passcontroller),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: ()async {
                        await controller.LoginMethod(context: context).then((value){
                          VxToast.show(context, msg: login);
                          Get.offAll(()=>Home());
                        });
                      }, child: forgetpassword.text.make()),
                ),
                5.heightBox,
                //ourbuttom().box.width(context.screenWidth - 50).make(),
              controller.isloading.value?CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ):  ourbuttom(
                    color: redColor,
                    title: login,
                    textcolor: whiteColor,
                    onPress: () async{
                      controller.isloading(true);
                      await controller.LoginMethod(context:context).then((value){
                          if (value != null) {
                            VxToast.show(context, msg: login);
                            Get.offAll(()=>Home());
                          }else{
                            controller.isloading(false);
                          }
                      });
              }).box.white.width(context.screenWidth - 50).make(),
            
                5.heightBox,
                createnewaccount.text.color(fontGrey).make(),
            
                5.heightBox,
                ourbuttom(
                    color: lightGolden,
                    title: signup,
                    textcolor: redColor,
                    onPress: () {
                      Get.to(() => SignupScreen());
                    }).box.white.width(context.screenWidth - 50).make(),
                10.heightBox,
                loginwith.text.color(fontGrey).make(),
                5.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                      3,
                      (index) => Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CircleAvatar(
                              radius: 25,
                              backgroundColor: lightGrey,
                              child: Image.asset(
                                socialIconList[index],
                                width: 30,
                              ),
                            ),
                          )),
                )
              ],
            )
                .box
                .white
                .rounded
                .shadowSm
                .padding(EdgeInsets.all(16))
                .width(context.screenWidth - 70)
                .make(),
          )
        ],
      )),
    ));
  }
}
