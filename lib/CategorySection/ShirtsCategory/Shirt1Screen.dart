import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Shirt1 extends StatelessWidget {

  const Shirt1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: const Color(0x30CCC7FF,),
          width: Get.width,
          height: Get.height * 0.9,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                )),
                child: Stack(
                  children: [
                    Container(
                        width: Get.width,
                        height: Get.height * 0.46,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            fit: BoxFit.cover,
                              image: AssetImage(
                            "assets/images/shirt_images/image3.jpg",
                          )),
                        ),
                        child: null),
                    Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: Get.width,
                height: Get.height*0.2,
                decoration: const BoxDecoration(
                  color: Color(0x527EA99D),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    )),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 10,),
                          Text(
                            "\$150",
                            style: TextStyle(
                                fontSize: 24, fontWeight: FontWeight.bold,color: Colors.blue),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Bonanza Shirt",
                            style: TextStyle(fontSize: 15),
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Size",
                            style: TextStyle(
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          //////////////Add Buttons
                        ],
                      ),
                      Column(
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: const Icon(Icons.share),),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 50,),
              Row(
                children: [
                  CustomElevatedButton(
                    text: "Buy Now",
                    onPressed: () {},
                    bgcolor: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
