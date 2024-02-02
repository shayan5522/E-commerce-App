import 'package:ecommerce_app/CategorySection/Reusable/BottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce_app/CategorySection/Reusable/BottomSheet.dart';
import 'BottomSheet.dart';
import 'BottomSheet.dart';
import 'BottomSheet.dart';

class BuyNow extends StatelessWidget {
  String title;
  String price;
  String image;

  BuyNow(
      this.title,
      this.image,
      this.price
      );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            width: Get.width,
            height: Get.height,
            color: Colors.blue,
          ),
          //Title-Container
          Container(
            width: Get.width,
            height: Get.width * 0.31,
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 20,),
                  Text(title,style: TextStyle(fontSize: 38,color: Colors.white,fontWeight: FontWeight.bold),),
                  Text("Code Here",style: TextStyle(fontSize: 17,color: Colors.white),),
                ],
              ),
            ),
          ),
          //Price-Container
          Positioned(
            top: 300,
            child: Container(
              width: Get.width*0.22,
              height: Get.height*0.1,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Price",style: TextStyle(fontSize: 15,color: Colors.white)),
                    Text(price,style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
                  ],
                ),
              ),
            ),
          ),
          //Second Main Container
          Positioned(
            top:  Get.height * 0.45,
            child: SingleChildScrollView(
              child: Container(
                width: Get.width,
                height: Get.height * 0.6,
                decoration: BoxDecoration(
                    color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 100,),
                      Text("Lorem ipsum dolor ss vitae justo vulp, elit libero posuere libero, vel ultricies nunc augue vel lacus. Ut ullamcorper risus quis purus cursus, vel pulvinar odio condimentum. Maecenas vel tristique libero."
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          //image Container
          Positioned(
            top: 130,
            left: 95,
            child: Container(
              width: Get.width*0.7,
              height: Get.height*0.4,
              color: Colors.transparent,
              child: Image.asset(image,fit: BoxFit.cover,),
            ),
          ),
          //Buttons Row
          Positioned(
            top: 790,
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border: Border.all(
                            color: Colors.blue,
                          ),
                        ),
                        child: IconButton(
                            onPressed: () {
                              Get.bottomSheet(
                                CustomBottomSheet(image: image, title: title, price: price),
                              );
                            },

                            icon: Icon(CupertinoIcons.cart_fill,color: Colors.blue,))),
                    SizedBox(width: 10,),
                    Container(
                      width: Get.width*0.79,
                      height: Get.height*0.06,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: ElevatedButton(
                        onPressed: (){},
                        child: Text('BUY NOW',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.white),),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color?>(Colors.blue),
                          shape:  MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(color: Colors.blue, width: 1.0),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
