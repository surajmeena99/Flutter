import 'package:firebase_auth/firebase_auth.dart';
import 'package:myeapp/HomeScreen/home.dart';
import 'package:myeapp/Views/auth_Screen/login_Screen.dart';
import 'package:myeapp/WidgetsCommon/applogo_widget.dart';
import 'package:myeapp/consts/colors.dart';
import 'package:myeapp/consts/consts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  //craeting a function overe here
  changeScreen() {
    Future.delayed(Duration(seconds: 3), () {
      //using getx here
      // Get.to(() => const Login_Screen());
      auth.authStateChanges().listen((User? user) { 
        if(user == null && mounted){
          Get.to(()=>Login_Screen());
        }else{
          Get.to(()=>Home());
        }
      });
    });
  }

  @override
  void initState() {
    changeScreen();
    // TODO: implement initState
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: redColor,
      body: Center(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topLeft,
              child: Image.asset(
                icSplashBg,
                width: 300,
              ),
            ),
            20.heightBox,
            applogoWidget(),
            10.heightBox,
            appname.text.fontFamily(bold).size(22).white.make(),
            5.heightBox,
            appversion.text.white.make(),
            Spacer(),
            credits.text.white.fontFamily(semibold).make(),
            30.heightBox,
            //our splash screen is allmost ready here
          ],
        ),
      ),
    );
  }
}
