import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CustomWidgets/CustomSnackbar/customSnackbar.dart';
import 'Screens/SplashScreen/MainSplashScreen.dart';

void main(){
  Get.put(CustomSnackbarController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      //home: ProfileScreen(),
    );
  }
}
