import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/CategorySection/Reusable/CategoryMainContainer.dart';
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
              return ListView.builder(
                itemCount: snapshot.data!.docs.length,
                itemBuilder: (BuildContext, index) {
                  return InkWell(
                    onTap: (){},
                    child: Container(
                      width: Get.width,
                      height: Get.height*0.21,
                      decoration: BoxDecoration(
                        color: Color(0xFFFEAEAEA),
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5),
                          topLeft: Radius.circular(5),
                        ),
                      ),
                      child: Stack(
                        children: [
                          //mainContainer
                          Container(
                            width: Get.width,
                            height: Get.height*0.2,
                            decoration: BoxDecoration(
                              color: Colors.transparent,
                              borderRadius: BorderRadius.circular(5),
                            ),
                          ),
                          //image-Container
                          Container(
                            width: Get.width*0.35,
                            height: Get.height*0.18,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF4F4F5,),
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(5),
                                bottomLeft: Radius.circular(5),
                              ),
                            ),
                            child: Image.asset(snapshot.data!.docs[index]['image'],fit: BoxFit.cover,),
                          ),
                          //Details-Container
                          Positioned(
                            right: 0,
                            left: 137,
                            child: Container(
                              width: Get.width*0.65,
                              height: Get.height*0.18,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(5),
                                  bottomRight: Radius.circular(5),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(snapshot.data!.docs[index]['title'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
                                    Text("Number",style: TextStyle(fontSize: 13,color: Colors.black),),
                                    SizedBox(height: 10,),
                                    Row(
                                      children: [
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star,color: Colors.yellow,),
                                        Icon(Icons.star_border),
                                      ],
                                    ),
                                    SizedBox(height: 10,),
                                    Text(snapshot.data!.docs[index]['price'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          //delete-icon
                          Positioned(
                            top: 132,
                            left: 338,
                            child: Container(
                              width: Get.width*0.1,
                              height: Get.width*0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: IconButton(
                                onPressed: () {firestore.collection(userid).doc(snapshot.data!.docs[index]['title']).delete();},
                                icon: Icon(Icons.delete,color: Colors.red,),),
                            ),
                          ),
                          //Buy-button
                          Positioned(
                            top: 12,
                            left: 300,
                            child: Container(
                              width: Get.width*0.2,
                              height: Get.width*0.1,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: ElevatedButton(
                                style: ButtonStyle(
                                  shape: MaterialStateProperty.all<OutlinedBorder>(RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  )),
                                  backgroundColor: MaterialStateProperty.all<Color>(Colors.white),
                                ),
                                onPressed: () {  },
                                child: Text('Buy',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green),),
                              ),
                            ),
                          ),
                        ],
                      ),
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