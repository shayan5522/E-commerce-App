import 'package:ecommerce_app/CustomWidgets/CustomCircleAvatar.dart';
import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ResetEmail extends StatelessWidget {
  const ResetEmail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        actions: [
          IconButton(onPressed: (){Get.back();},
              icon: const Icon(Icons.close)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomCircleAvatar(110, Image.asset("assets/images/SplashScreen/bg.jpg"))
              ],
            ),
            const SizedBox(height: 40,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Password Reset Email Sent",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
              ],
            ),
            const SizedBox(height: 20,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Text("Don't worry sometimes people can forget too, enter your email we will send you password reset link",
                  style: TextStyle(fontSize: 15,),)),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              children: [
                CustomElevatedButton(
                    text: "Submit",
                    bgcolor: Colors.purpleAccent,
                    onPressed: (){}),
              ],
            ),
            const SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(
                    onPressed: (){},
                    child: const Text('Resend code')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
