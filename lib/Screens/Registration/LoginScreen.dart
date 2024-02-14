import 'package:ecommerce_app/Controllers/passwordController.dart';
import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/Screens/HomeScreens/TabBarScreen.dart';
import 'package:ecommerce_app/Screens/Registration/ForgetScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/Socialicons/SocialiconContainer.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Login',
          style: TextStyle(
              color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.purple,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Container1(),
              const SocialiconsSection(),
            ],
          ),
        ),
      ),
    );
  }
}
//Section for Email & Password
class Container1 extends StatelessWidget {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  PasswordController controller = PasswordController();
  FirebaseAuth auth = FirebaseAuth.instance;
  Container1({super.key, Key});

  //Firebase Login
  Future<void> login()async{
    try{
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: emailController.text,
          password: passwordController.text
      );
      if(userCredential.user != null){
        Get.off(()=> const TabBarScreen());
        Get.snackbar("success", "login Successfully",snackPosition: SnackPosition.TOP,duration: const Duration(seconds: 2),backgroundColor: Colors.grey,colorText: Colors.white);
      }
    }
    catch(exp){
      Get.snackbar("Error", "$exp",snackPosition: SnackPosition.TOP,duration: const Duration(seconds: 2),backgroundColor: Colors.red,colorText: Colors.white);
      print(exp);
    }
  }
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
    return Center(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const SizedBox(
              height: 10,
            ),
            const Row(
              children: [
                Text('Welcome Back',
                    style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold)),
              ],
            ),
            const Row(
              children: [
                Text('Ready To Login',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
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
                  keyboardType: TextInputType.visiblePassword,
                  controller: passwordController,
                  obscureText: controller.obsecure.value,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    suffixIcon: IconButton(
                      onPressed: () {
                        controller.togglePasswordVisibility();
                      },
                      icon: Icon(
                        controller.obsecure.value
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                    ),
                  ),
                  validator: _validatePassword,
                );
            }),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    children: [
                      Checkbox(value: true, onChanged: (value) {}),
                      const Text("Remember Me"),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Get.to( ForgetPassScreen());
                    },
                    child: const Text('Forget Password'),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                CustomElevatedButton(
                  bgcolor: Colors.purple,
                  onPressed: ()  {
                    try {
                      if (_formKey.currentState!.validate()) {
                        login();
                      }
                    } catch (a) {
                      print(a);
                    }
                  },
                  text: 'Login',
                ),
              ],
            ),
            const SizedBox(
              height: 35,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                    indent: 60,
                    endIndent: 5,
                  ),
                ),
                Text(
                  'Or SignIn With',
                  style: TextStyle(color: Colors.grey),
                ),
                Flexible(
                  child: Divider(
                    thickness: 0.5,
                    color: Colors.grey,
                    indent: 5,
                    endIndent: 60,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 30),

          ],
        ),
      ),
    );
  }
}



