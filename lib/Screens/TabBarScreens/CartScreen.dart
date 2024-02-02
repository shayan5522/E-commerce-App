import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget  {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;
  var userid=FirebaseAuth.instance.currentUser!.uid.toString();
  var email=FirebaseAuth.instance.currentUser!.email;
  CartScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<QuerySnapshot>(
        stream: firestore.collection(userid).where('email',isEqualTo: email).snapshots(),
        builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 8.0,
                  mainAxisSpacing: 8.0,
                  mainAxisExtent: 290,
                ),
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext, index) {
                  return SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      children: [
                        SizedBox(
                          height: Get.height * 0.6,
                          width: Get.width,
                          //color: ,
                          child: Container(
                            width: Get.width,
                            height: Get.height,
                            decoration: const BoxDecoration(
                              color: Color(0x30CCC7FF),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(3),
                                topRight: Radius.circular(3),
                                bottomLeft: Radius.circular(3),
                                bottomRight: Radius.circular(3),
                              ),
                            ),
                            //elevation: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                    width: Get.width,
                                    height: Get.height * 0.2,
                                    child: Image.asset(
                                      snapshot.data!.docs[index]['image'],
                                      fit: BoxFit.cover,
                                    )),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(3),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Text(snapshot.data!.docs[index]["title"]),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.data!.docs[index]["price"]),
                                          ],
                                        ),
                                        Row(
                                          children: [
                                            Text(snapshot.data!.docs[index]["no of product"]),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: Get.width * 0.2,
                                              child: ElevatedButton(
                                                onPressed: () {},
                                                child: const Text('Buy'),
                                              ),
                                            ),
                                            SizedBox(
                                              width: Get.width * 0.24,
                                              child: ElevatedButton(
                                                onPressed: () {
                                                  firestore.collection(userid).doc(snapshot.data!.docs[index]['title']).delete();
                                                  // Get.back();
                                                },
                                                child: const Text('Remove',style: TextStyle(fontSize: 12,color: Color(
                                                    0xE8EE2E44)),),
                                              ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            } else {
              return Text("No Data To Display");
            }
          }
      ),
    );
  }
}
