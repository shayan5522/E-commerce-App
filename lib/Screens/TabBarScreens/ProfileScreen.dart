import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Authentication/AuthService.dart';
import 'package:ecommerce_app/CustomWidgets/CustomCircleAvatar.dart';
import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/Screens/Registration/LoginScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatefulWidget {

  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}
class _ProfileScreenState extends State<ProfileScreen> {

  final AuthService _auth = AuthService();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  var userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
     //Data fetching using Stream Builder
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection(userId).where("uid", isEqualTo:  userId).snapshots(),
        builder: (context, snapshot){
          try{
            if(snapshot.connectionState == ConnectionState.active){
              if(snapshot.hasData && snapshot.data != null){
                return ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (BuildContext, index){
                      return Padding(
                        padding: const EdgeInsets.all(12.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomCircleAvatar(
                                    70,
                                    Image.network(snapshot.data!.docs[index]['profile'])),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            const Divider(color: Colors.grey,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Profile Information",
                                  style: TextStyle(color: Colors.black, fontSize: 20),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("User Name",
                                      style: TextStyle(color: Colors.grey, fontSize: 15),),
                                    Text(snapshot.data!.docs[index]['name']),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Cnic",
                                      style: TextStyle(color: Colors.grey, fontSize: 15),),
                                    Text(snapshot.data!.docs[index]['cnic']),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            const Divider(color: Colors.grey,),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text("Personal Information",
                                  style: TextStyle(color: Colors.black, fontSize: 20),),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("User-id",
                                      style: TextStyle(color: Colors.grey, fontSize: 15),),
                                    Text(snapshot.data!.docs[index]['uid']),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text(
                                      "Phone", style: TextStyle(color: Colors.grey, fontSize: 15),),
                                    Text(snapshot.data!.docs[index]['phone']),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Text("Gender",
                                      style: TextStyle(color: Colors.grey, fontSize: 15),),
                                    Text(snapshot.data!.docs[index]['gender']),
                                  ],
                                ),
                              ],
                            ),
                            const SizedBox(height: 20,),
                            const Divider(color: Colors.grey,),
                            const SizedBox(height: 20,),
                            Row(
                              children: [
                                CustomElevatedButton(
                                  text: "SignOut",
                                  onPressed: () {
                                    Get.dialog(
                                        AlertDialog(
                                          title: const Text('Logout'),
                                          content: const Text('Are you Sure'),
                                          actions: [
                                            Row(
                                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                              children: [
                                                TextButton(onPressed: () {
                                                  Get.back();
                                                },
                                                    child: const Text('Cancel',
                                                      style: TextStyle(color: Colors.black),)),
                                                ElevatedButton(onPressed: () {
                                                  Get.off(LoginScreen());
                                                }, child: const Text('Logout')),
                                              ],
                                            ),
                                          ],
                                        )
                                    );
                                  },
                                  bgcolor: Colors.blueAccent,
                                ),
                              ],
                            ),
                          ],
                        ),
                      );
                    }
                );
              }
              else {
                return const Center(child: Text('No data to Display'));
              }
            }
            else{
              return const Center(child: CircularProgressIndicator(),);
            }
          }
          catch(exc){
            print('exception is: $exc');
            return  const Center(child: Text('An error occurred.'));
          }
        },
      ),
    );
  }
}
