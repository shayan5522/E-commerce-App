import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Screens/HomeScreens/WelcomeScreen.dart';

class AuthService{
  final FirebaseAuth _auth= FirebaseAuth.instance;
  Future<void> SignOut()async {
    Get.dialog(
        AlertDialog(
          title: const Text("Logout"),
          content: const Text('Are You Sure You want to logout'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){
                  Get.back();
                }, child: const Text("Cancel",style: TextStyle(color: Colors.black),),
                ),
                ElevatedButton(onPressed: () async {
                  await _auth.signOut();
                  _auth.currentUser == null;
                  Get.offAll(const WelcomeScreen());
                }, child: const Text('Logout')),
              ],
            )
          ],
        )
    );
  }
  User? getCurrentUser(){
    return _auth.currentUser;
  }
}