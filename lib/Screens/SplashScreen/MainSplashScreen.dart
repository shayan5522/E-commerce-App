import 'package:ecommerce_app/CustomWidgets/CustomCircleAvatar.dart';
import 'package:ecommerce_app/Screens/Registration/WelcomeScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
       const Duration(seconds: 3),
          () {
        Get.off(const WelcomeScreen(),
          transition: Transition.fade,
          duration: const Duration(microseconds: 1000),
        );
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/SplashScreen/bg.jpg",
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,),
           Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircleAvatar(90, Image.asset("assets/images/SplashScreen/E-Commerce.png")),
                const SizedBox(height: 5,),
                const Text("""Welcome To My E-commerce App""",style: TextStyle(color: Colors.white,fontSize: 20),),
                const SizedBox(height: 100,),
                const CircularProgressIndicator(
                color: Colors.white,
                ),
              ],
            ),
          ),
        ],

      ),
    );
  }
}
