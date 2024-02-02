import 'package:ecommerce_app/Controllers/passwordController.dart';
import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/Screens/Registration/UserDetails.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/CustomCircleAvatar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'LoginScreen.dart';

class SignUpScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  PasswordController controller = PasswordController();

  SignUpScreen({super.key});

  //Firebase SignUp
  Future<void> Signup() async {
    try {
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text,
        password: passwordController.text,
      );
      if (userCredential.user != null) {
        Get.off(UserDetails());
        Get.snackbar("success", "Account created Successfully",snackPosition: SnackPosition.TOP,duration: const Duration(seconds: 2),backgroundColor: Colors.green,colorText: Colors.white);

      }
    } catch (excep) {
      Get.snackbar("error", "$excep",snackPosition: SnackPosition.TOP,duration: const Duration(seconds: 2),backgroundColor: Colors.red,colorText: Colors.white);

    }
  }


  //ValidatorFunctions
  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        backgroundColor: Colors.purple,
        title: const Text('Sign Up',style: TextStyle(color: Colors.white),),

      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Let's Create Your Account", style: TextStyle(fontSize: 30),),
                const SizedBox(height: 20,),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                      labelText: 'Email',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )
                  ),
                  validator: _validateEmail,
                ),
                const SizedBox(height: 12),
                Obx((){
                  return
                    TextFormField(
                      obscureText: controller.obsecure.value,
                      controller: passwordController,
                      decoration: InputDecoration(
                          labelText: 'Password',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          suffixIcon: IconButton(
                            onPressed: (){
                              controller.togglePasswordVisibility();
                            },
                            icon: controller.obsecure.value
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          )
                      ),
                      validator: _validatePassword,
                    );
                }),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CustomElevatedButton(
                      bgcolor: Colors.purple,
                      text: "SignUp",
                      onPressed: () {
                        try {
                          if (_formKey.currentState!.validate()) {
                            Signup();
                          }
                        }
                        catch (a) {
                          print('Signup ERROR: $a');
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.center,
                  child: TextButton(
                    onPressed: () {
                      Get.to(LoginScreen());
                    },
                    child: const Text('Already have an account? Login'),
                  ),
                ),
                const SizedBox(height: 20,),
                const SizedBox(height: 15,),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Flexible(child: Divider(thickness: 0.5,
                      color: Colors.grey,
                      indent: 60,
                      endIndent: 5,)),
                    Text(
                      'Or SignIn With', style: TextStyle(color: Colors.grey),),
                    Flexible(child: Divider(thickness: 0.5,
                      color: Colors.grey,
                      indent: 5,
                      endIndent: 60,))
                  ],
                ),
                const SizedBox(height: 35,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [
                        CustomCircleAvatar(
                            30, Image.asset("assets/images/Socialicons/facebook.jpg"),
                            page: LoginScreen()),
                        const Text("Facebook"),
                      ],
                    ),
                    Column(
                      children: [
                        CustomCircleAvatar(
                            26, Image.asset("assets/images/Socialicons/google.jpg"),
                            page: LoginScreen()),
                        const Text("Google"),
                      ],
                    ),
                    Column(
                      children: [
                        CustomCircleAvatar(
                            30, Image.asset("assets/images/Socialicons/phone.jpg"),
                            page: LoginScreen()),
                        const Text("Phone"),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}