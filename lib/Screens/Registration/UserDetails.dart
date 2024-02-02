import 'dart:async';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Controllers/imageController.dart';
import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/Screens/HomeScreens/TabBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserDetails extends StatelessWidget {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final TextEditingController cnicController = TextEditingController();
  final TextEditingController ageController = TextEditingController();

  imagePickerController controller = imagePickerController();
  FirebaseAuth auth = FirebaseAuth.instance;

  User? user = FirebaseAuth.instance.currentUser;
  var userid = FirebaseAuth.instance.currentUser!.uid.toString();

  UserDetails({super.key});

  //ValidatorFunctions
  String? _validateName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Name';
    }
    return null;
  }
  String? _validatePhone(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone_no';
    }
    return null;
  }
  String? _validateCnic(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your Cnic';
    }
    return null;
  }

  //function to add details in firebase
  Future<void> addData(File profilepic) async {

    if (user != null) {
      UploadTask uploadTask = FirebaseStorage.instance
          .ref() //main Database
          .child("ProfilePics") //first folder
          .child(userid!) //id of user before data
          .putFile(profilepic); //image url
      //to check live streams data going to database
      StreamSubscription streamSubscription =uploadTask.snapshotEvents.listen((event) {
        double percentage = event.bytesTransferred / event.totalBytes * 100;
      });
      //Task uploaded
      TaskSnapshot taskSnapshot = await uploadTask;
      String imageurl = await taskSnapshot.ref.getDownloadURL();
      //distroy subscription after uploded
      streamSubscription.cancel();

      Map<String, dynamic> add = {
        "name": nameController.text,
        'phone': phoneController.text,
        'cnic': cnicController.text,
        'uid': userid,
        'gender': genderController.text,
        'profile': imageurl,
      };

      FirebaseFirestore.instance
          .collection(userid!)
          .doc("Personal_Data")
          .set(add);
      Get.snackbar("Success", "Record successfully added", snackPosition: SnackPosition.TOP,backgroundColor: Colors.green,colorText: Colors.white);
      Get.off(() => const TabBarScreen());
    } else {
      const Text('error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: const Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Stack(
                      children: [
                        Center(
                          child: Obx(() => CircleAvatar(
                            radius: 70,
                            backgroundImage: controller.imagePath.isNotEmpty
                                ? FileImage(File(controller.imagePath.toString()))
                                : null,
                            child: controller.imagePath.isEmpty
                                ? const Icon(
                              Icons.perm_identity_outlined,
                              size: 60,
                            )
                                : null,
                          )),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 117,
                          child: Container(
                            width: Get.width * 0.099,
                            height: Get.height * 0.044,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: IconButton(
                              icon: const Icon(Icons.camera_alt),
                              onPressed: () {
                                controller.getImage();
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                const SizedBox(height: 12),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                      labelText: 'User Name',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: _validateName,
                ),
                const SizedBox(height: 12),
                TextFormField(
                  keyboardType: TextInputType.phone,
                  controller: phoneController,
                  decoration: InputDecoration(
                      labelText: 'Phone',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      )),
                  validator: _validatePhone,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  keyboardType: TextInputType.number,
                  controller: cnicController,
                  decoration: InputDecoration(
                    labelText: 'Cnic',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(14),
                    CnicFormatter(), // Custom formatter for CNIC
                  ],
                  validator: _validateCnic,
                ),
                const SizedBox(height: 20),
                DropdownButtonFormField<String>(
                  value: genderController.text.isNotEmpty ? genderController.text : null,
                  items: ['Male', 'Female', 'Other'].map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    // Update the state when the user selects a new value
                    if (newValue != null) {
                      genderController.text = newValue;
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Gender',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your gender';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: ageController,
                  readOnly: true,
                  onTap: () async {
                    DateTime? pickedDate = await showDatePicker(
                      context: context,
                      initialDate: DateTime.now(),
                      firstDate: DateTime(1900),
                      lastDate: DateTime.now(),
                    );

                    if (pickedDate != null && pickedDate != DateTime.now()) {
                      ageController.text = pickedDate.toLocal().toString().split(' ')[0];
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Birthdate',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please select your birthdate';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    CustomElevatedButton(
                      bgcolor: Colors.blue,
                      text: "Submit",
                      onPressed: () {
                        try {
                          if (_formKey.currentState!.validate()) {
                            if (controller.imagePath.isNotEmpty) {
                              addData(File(controller.imagePath.toString()));
                            } else {
                              // Handle the case when imagePath is empty
                              print("Image path is empty");
                            }
                          }
                        } catch (e) {
                          print(e);
                        }
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to the welcome screen
                  },
                  child: const Text('Already have an account? Login'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class CnicFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String formattedText = newValue.text;

    if (newValue.text.length >= 5) {
      // Add a hyphen after the first 5 characters
      formattedText = '${newValue.text.substring(0, 5)}-${newValue.text.substring(5)}';
    }

    if (newValue.text.length >= 13) {
      // Add a hyphen after the next 7 characters
      formattedText = '${formattedText.substring(0, 13)}-${formattedText.substring(13)}';
    }

    if (newValue.text.length >= 14) {
      // Limit the length to 14 characters
      formattedText = formattedText.substring(0, 14);
    }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}


