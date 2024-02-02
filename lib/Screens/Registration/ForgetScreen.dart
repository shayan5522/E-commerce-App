import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/Screens/Registration/LoginScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Controllers/passwordController.dart';

class ForgetPassScreen extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController cPassController = TextEditingController();
  PasswordController controller = PasswordController();

  ForgetPassScreen({super.key});
  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    }
    return null;
  }
  void validate(){
    if(passwordController.text != cPassController.text)
    {
      Get.snackbar("error", "Password did not match");
    }
    else{
      Get.off(()=>LoginScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(color: Colors.purple),
            child: const Padding(
              padding: EdgeInsets.all(15.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100,),
                  Row(
                    children: [
                      Icon(Icons.password,color: Colors.white,),
                      SizedBox(width: 15,),
                      Text("Reset Password",style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white),),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('''Create your new password for app, 
so you can login to your account''',style: TextStyle(color: Colors.white,fontSize: 16),)
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.35,
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height * 0.9,
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    color: Colors.white),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 30,),
                      Form(
                        key: _formKey,
                          child: Column(
                            children: [
                              Obx((){
                                return
                                  TextFormField(
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
                              const SizedBox(height: 15),
                              Obx((){
                                return
                                  TextFormField(
                                    controller: cPassController,
                                    obscureText: controller.obsecure.value,
                                    decoration: InputDecoration(
                                      labelText: 'Confirm-Password',
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
                            ],
                          )
                      ),
                      const SizedBox(height: 50,),
                      Row(
                        children: [
                          CustomElevatedButton(
                            bgcolor: Colors.purple,
                            onPressed: () {
                              try {
                                if (_formKey.currentState!.validate()) {
                                  validate();
                                }
                              } catch (a) {
                                print(a);
                              }
                            },
                            text: 'Submit',
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
