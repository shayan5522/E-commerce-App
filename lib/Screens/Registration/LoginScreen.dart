import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/Screens/HomeScreens/TabBarScreen.dart';
import 'package:ecommerce_app/CustomWidgets/CustomCircleAvatar.dart';
import 'package:ecommerce_app/CustomWidgets/CustomTextfileds.dart';
import 'package:ecommerce_app/Screens/Registration/ForgetScreen.dart';
import 'package:ecommerce_app/Screens/Registration/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login',style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () { Get.back();  },
          icon:const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: const SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(8.0),
          child: Column(
            children: [
                Container1(),
                Container2(),
            ],
          ),
        ),
      ),
    );
  }
}
//Section for Email & Password
class Container1 extends StatelessWidget {
  const Container1({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(height: 10,),
            const Row(
              children: [
                Text('Welcome Back', style: TextStyle(fontSize: 45,fontWeight: FontWeight.bold)),
              ],
            ),
            const Row(
              children: [
                Text('Ready To Login', style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(height: 30,),
            CustomTextFields('Email', 'Email', const Icon(Icons.email), const Icon(Icons.email), TextInputType.emailAddress),
            const SizedBox(height: 30,),
            CustomTextFields('Password', 'Password', const Icon(Icons.password), const Icon(Icons.remove_red_eye), TextInputType.visiblePassword),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Checkbox(value: true, onChanged: (value){}),
                      const Text("Remember Me")
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                    child: TextButton(
                        onPressed: (){
                          Get.to(const ForgetPassScreen());
                        },
                        child: const Text('Forget Password'))),
              ],
            ),
            const SizedBox(height: 30,),
            Row(
              children: [
              CustomElevatedButton(
                text: "Login",
                bgcolor: Colors.purpleAccent,
                onPressed: (){
                  Get.to(const TabBarScreen());},),
            ]
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
              CustomElevatedButton(
                text: "Create Account",
                bgcolor: Colors.white,
                textColor: Colors.black,
                onPressed: (){
                  Get.to(const SignupScreen());},),
            ]
            ),
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(child: Divider(thickness: 0.5,color: Colors.grey,indent: 60, endIndent: 5,)),
                Text('Or SignIn With',style: TextStyle(color: Colors.grey),),
                Flexible(child: Divider(thickness: 0.5,color: Colors.grey,indent: 5, endIndent: 60,))
              ],
            ),
            const SizedBox(height: 30),
          ],
        ),
      );
  }
}
//Section For Social Icons
class Container2 extends StatelessWidget {
  const Container2({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CustomCircleAvatar(30, Image.asset("assets/images/Socialicons/facebook.jpg"),page: const LoginScreen()),
          CustomCircleAvatar(28, Image.asset("assets/images/Socialicons/google.jpg"),page: const LoginScreen()),
          CustomCircleAvatar(30, Image.asset("assets/images/Socialicons/phone.jpg"),page: const LoginScreen()),
        ],
    );
  }
}
