import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/CustomWidgets/CustomTextfileds.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/CustomCircleAvatar.dart';
import 'LoginScreen.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SignUp',
          style: TextStyle(color: Colors.white,fontSize: 30,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () { Get.back();  },
          icon:const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text("Let's Create Your Account",style: TextStyle(fontSize: 30),),
                const SizedBox(height: 20,),
                CustomTextFields("First-Name", 'First-Name', const Icon(Icons.person), const Icon(Icons.person),TextInputType.text),
                const SizedBox(height: 10,),
                CustomTextFields("Last-Name", 'Last-Name', const Icon(Icons.person), const Icon(Icons.person),TextInputType.text),
                const SizedBox(height: 10,),
                CustomTextFields("Email", 'Email', const Icon(Icons.email), const Icon(Icons.email),TextInputType.emailAddress),
                const SizedBox(height: 10,),
                CustomTextFields("Gender", 'Gender', const Icon(Icons.generating_tokens), const Icon(Icons.generating_tokens),TextInputType.text),
                const SizedBox(height: 10,),
                CustomTextFields("Age", 'Age', const Icon(Icons.apps_outage), const Icon(Icons.apps_outage_outlined),TextInputType.text),
                const SizedBox(height: 10,),
                CustomTextFields("Password", 'Password', const Icon(Icons.password), const Icon(Icons.password_sharp),TextInputType.visiblePassword,obsecureText: true,),
                const SizedBox(height: 10,),
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Checkbox(value: true, onChanged: (value){}),
                      const Text("I agree to Privacy Policy and Terms of use")
                    ],
                  ),
                ),
                ],
            ),
                const SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CustomElevatedButton(
                        bgcolor: Colors.purpleAccent,
                        text: "SignUp",
                        onPressed: (){})
                  ],
                ),
                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Divider(thickness: 0.5,color: Colors.grey,indent: 60, endIndent: 5,)),
                    Text('Or SignIn With',style: TextStyle(color: Colors.grey),),
                    Flexible(child: Divider(thickness: 0.5,color: Colors.grey,indent: 5, endIndent: 60,))
                  ],
                ),
                const SizedBox(height: 15,),
                Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomCircleAvatar(20, Image.asset("assets/images/Socialicons/facebook.jpg"),page: const LoginScreen()),
                CustomCircleAvatar(18, Image.asset("assets/images/Socialicons/google.jpg"),page: const LoginScreen()),
                CustomCircleAvatar(20, Image.asset("assets/images/Socialicons/phone.jpg"),page: const LoginScreen()),
              ],
            ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
