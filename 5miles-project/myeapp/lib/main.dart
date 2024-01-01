import 'package:firebase_core/firebase_core.dart';
import 'package:myeapp/Views/Splash_screen/Splash_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:myeapp/firebase_options.dart';
import 'consts/consts.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //We are using getx so we have to change materialapp into getmaterialapp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
          //to set icon colors in app bar
          iconTheme: IconThemeData(
            color: darkFontGrey,
          ),
          scaffoldBackgroundColor: Colors.transparent,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.transparent,
          ),
          fontFamily: regular),
      home: SplashScreen(),
    );
  }
}
