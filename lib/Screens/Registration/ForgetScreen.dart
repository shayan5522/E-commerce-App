import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/CustomWidgets/CustomTextfileds.dart';
import 'package:ecommerce_app/Screens/Registration/ResetEmailScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetPassScreen extends StatelessWidget {
  const ForgetPassScreen({super.key});

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
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("Forget Password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,),),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(child: Text("Don't worry sometimes people can forget too, enter your email we will send you password reset link",
                  style: TextStyle(fontSize: 15,),)),
              ],
            ),
            const SizedBox(height: 40,),
            CustomTextFields("Enter Your Email", "email", const Icon(Icons.email),const Icon(Icons.email), TextInputType.emailAddress),
            const SizedBox(height: 20,),
            Row(
              children: [
                CustomElevatedButton(
                    text: "Submit",
                    bgcolor: Colors.purpleAccent,
                    onPressed: (){
                      Get.to(const ResetEmail());
                    }),
              ],
            )
          ],
        ),
      ),
    );
  }
}
