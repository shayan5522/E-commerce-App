import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/CounterController.dart';
import '../../FireStoreMethods/FirebaseFunctions.dart';

class CustomBottomSheet extends StatelessWidget {
  final String image;
  final String title;
  final String price;

  CustomBottomSheet({super.key, 
    required this.image,
    required this.title,
    required this.price,
  });
  final CounterController _controller = CounterController();
  var email = FirebaseAuth.instance.currentUser!.email.toString();
  //function to add data to firebase-cart
  Future<void> adddata( String counter,String image,String title,String price)async {
    await FirebaseFunctions.addData(title, price, image, counter);
  }
  FirebaseFunctions controller = FirebaseFunctions();

  @override
  Widget build(BuildContext context){
       return  Container(
         width: Get.width,
         height: Get.height * 0.6,
         decoration: const BoxDecoration(
           color: Colors.white,
           borderRadius: BorderRadius.only(
             topLeft: Radius.circular(15),
             topRight: Radius.circular(15),
           ),
         ),
         child:
         Column(
           mainAxisAlignment: MainAxisAlignment.start,
           children: [
             Text(title,
               style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
             Container(
               child: Image.asset(
                 image,
                 width: Get.width * 0.5,
                 height: Get.height * 0.3,
                 fit: BoxFit.cover,
               ),
             ),
             Container(
               width: Get.width*0.8,
               color: Colors.transparent,
               child: Column(
                 crossAxisAlignment: CrossAxisAlignment.start,
                 mainAxisAlignment: MainAxisAlignment.start,
                 children: [
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text("Price of Product: ", style: TextStyle(
                           color: Colors.lightBlueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
                       Text(price,
                         style: const TextStyle(color: Colors.green, fontSize: 15,fontWeight: FontWeight.bold),),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text("Name of Product: ", style: TextStyle(
                           color: Colors.lightBlueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
                       Text(title,
                         style: const TextStyle(color: Colors.green, fontSize: 15,fontWeight: FontWeight.bold),),
                     ],
                   ),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       const Text("No of Products: ", style: TextStyle(
                           color: Colors.lightBlueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
                       SizedBox(
                         width: 110,
                         height: 50,
                         child: Stack(
                           children: [
                             Positioned(
                               left: 30,
                               bottom: 5,
                               child: IconButton(
                                 onPressed: () {
                                   _controller.decrementCounter();
                                 },
                                 icon: const Icon(Icons.minimize),
                               ),
                             ),
                             Obx(() {
                               return Positioned(
                                 top: 15,
                                 left: 73,
                                 child: Text(
                                   _controller.counter.toString(),
                                   style: const TextStyle(fontSize: 20),
                                 ),
                               );
                             }),
                             Positioned(
                               left: 80,
                               top: 6,
                               right: 1,
                               bottom: 0,
                               child: IconButton(
                                 onPressed: () {
                                   _controller.incrementCounter();
                                 },
                                 icon: const Icon(Icons.add),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   ),
                 ],
               ),
             ),
             const SizedBox(height: 30,),
             Container(
               width: Get.width * 0.5,
               height: 40,
               decoration: BoxDecoration(
                 color: Colors.lightBlueAccent,
                 borderRadius: BorderRadius.circular(10),
                 boxShadow: const [
                   BoxShadow(
                       color: Colors.grey,
                       spreadRadius: 1,
                       blurRadius: 10,
                       offset: Offset(3, 10)
                   ),
                 ],
               ),
               child: TextButton(
                 onPressed: () {
                   adddata(_controller.counter.toString(),image,title,price);
                   Get.back();
                 },
                 child: const Text("Confirm", style: TextStyle(fontSize: 20,
                     fontWeight: FontWeight.w500,
                     letterSpacing: 10,
                     color: Colors.white),),
               ),
             ),
           ],
         ),
       );
    }
}
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../../Controllers/CounterController.dart';
// import '../../FireStoreMethods/FirebaseFunctions.dart';
//
// class CustomBottomSheet extends StatelessWidget {
//   final String image;
//   final String title;
//   final String price;
//
//   CustomBottomSheet({super.key,
//     required this.image,
//     required this.title,
//     required this.price,
//   });
//   final CounterController _controller = CounterController();
//   var email = FirebaseAuth.instance.currentUser!.email.toString();
//   //function to add data to firebase-cart
//   Future<void> adddata( String counter,String image,String title,String price)async {
//     await FirebaseFunctions.addData(title, price, image, counter);
//   }
//   FirebaseFunctions controller = FirebaseFunctions();
//
//   @override
//   Widget build(BuildContext context){
//     return  Container(
//       width: Get.width,
//       height: Get.height * 0.6,
//       decoration: const BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.only(
//           topLeft: Radius.circular(15),
//           topRight: Radius.circular(15),
//         ),
//       ),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.start,
//         children: [
//           Text(title,
//             style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 25),),
//           Image.asset(
//             image,
//             width: Get.width * 0.5,
//             height: Get.height * 0.3,
//             fit: BoxFit.cover,
//           ),
//           Padding(
//             padding: const EdgeInsets.all(10.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Price of Product: ", style: TextStyle(
//                         color: Colors.lightBlueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
//                     Text(price,
//                       style: const TextStyle(color: Colors.green, fontSize: 15,fontWeight: FontWeight.bold),),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("Name of Product: ", style: TextStyle(
//                         color: Colors.lightBlueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
//                     Text(title,
//                       style: const TextStyle(color: Colors.green, fontSize: 15,fontWeight: FontWeight.bold),),
//                   ],
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     const Text("No of Products: ", style: TextStyle(
//                         color: Colors.lightBlueAccent, fontSize: 15,fontWeight: FontWeight.bold),),
//                     SizedBox(
//                       width: 110,
//                       height: 50,
//                       child: Stack(
//                         children: [
//                           Positioned(
//                             left: 10,
//                             bottom: 5,
//                             child: IconButton(
//                               onPressed: () {
//                                 _controller.decrementCounter();
//                               },
//                               icon: const Icon(Icons.minimize),
//                             ),
//                           ),
//                           Obx(() {
//                             return Positioned(
//                               top: 15,
//                               left: 57,
//                               child: Text(
//                                 _controller.counter.toString(),
//                                 style: const TextStyle(fontSize: 20),
//                               ),
//                             );
//                           }),
//                           Positioned(
//                             left: 70,
//                             top: 6,
//                             right: 1,
//                             bottom: 0,
//                             child: IconButton(
//                               onPressed: () {
//                                 _controller.incrementCounter();
//                               },
//                               icon: const Icon(Icons.add),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//                 const SizedBox(height: 30,),
//                 Center(
//                   child: Container(
//                     width: Get.width * 0.5,
//                     height: 40,
//                     decoration: BoxDecoration(
//                       color: Colors.lightBlueAccent,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: const [
//                         BoxShadow(
//                             color: Colors.grey,
//                             spreadRadius: 1,
//                             blurRadius: 10,
//                             offset: Offset(3, 10)
//                         ),
//                       ],
//                     ),
//                     child: TextButton(
//                       onPressed: () {
//                         adddata(_controller.counter.toString(),image,title,price);
//                         Get.back();
//                       },
//                       child: const Text("Confirm", style: TextStyle(fontSize: 20,
//                           fontWeight: FontWeight.w500,
//                           letterSpacing: 10,
//                           color: Colors.white),),
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
