import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseFunctions {
  static final FirebaseAuth _auth = FirebaseAuth.instance;

  // Function to add data to Firebase Firestore
  static Future<void> addData(String title, String price, String image, String counter) async {
    var email = _auth.currentUser!.email.toString();
    var userid = _auth.currentUser!.uid.toString();

    Map<String, dynamic> data = {
      "title": title,
      'price': price,
      'image': image,
      'no of product': counter,
      'email': email,
    };
    try {
      FirebaseFirestore cloud = FirebaseFirestore.instance;
      cloud.collection(userid).doc(title).set(data);
      QuerySnapshot snapshot=await cloud.collection(userid).where('title',isEqualTo: title).get();
      if(snapshot!=null) {
        Get.snackbar("Success", "Product successfully added to cart", snackPosition: SnackPosition.TOP,backgroundColor: Colors.green,colorText: Colors.white,duration: Duration(seconds: 1));
      } else {
        Get.snackbar("Error", "Failed to add product to cart", snackPosition: SnackPosition.TOP,backgroundColor: Colors.red,colorText: Colors.white);
      }
    } catch (error) {
      Get.snackbar("Error", "$error", snackPosition: SnackPosition.TOP,backgroundColor: Colors.red,colorText: Colors.white);
      print(error);
    }
  }

// Function to Retrieve data to Firebase Firestore
}
