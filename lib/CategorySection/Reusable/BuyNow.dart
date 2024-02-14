import 'package:ecommerce_app/CategorySection/Reusable/BottomSheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
          //whole Screen
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xffcf54c2),
                  Color(0xff2f339d),
                  Color(0xffd33dd5),
                ]
              )
            ),
          ),
          //Title-Container
          Align(
            alignment: Alignment.topLeft,
            child: Container(
              width: double.infinity,
              height: Get.height * 0.16,
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 20,),
                    Text(title,style: TextStyle(fontSize: 25,color: Colors.white,fontWeight: FontWeight.bold),),
                    Text("Code Here",style: TextStyle(fontSize: 17,color: Colors.white),),
                  ],
                ),
              ),
            ),
          ),
          // //Price-Container
          Align(
            alignment: Alignment.centerLeft,
            child: Container(
              width: Get.width*0.3,
              height: Get.height*0.13,
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
          // //Second Main Container
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              height: Get.height * 0.39,
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
                    ,textAlign: TextAlign.justify,),
                  ],
                ),
              ),
            ),
          ),
          // //image Container
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(image,fit: BoxFit.contain,
            width: Get.width * 0.7,
            height: Get.height * 0.6,

            ),
          ),
          // //Buttons Row
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              color: Colors.transparent,
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
                    Expanded(
                      child: Container(
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
