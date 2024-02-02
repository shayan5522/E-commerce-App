import 'package:ecommerce_app/CategorySection/Reusable/BuyNow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'BottomSheet.dart';

class CustomItem extends StatelessWidget {
  final String imagepath;
  final String title;
  final String price;
  final VoidCallback onpressed;

   const CustomItem(
    this.imagepath,
    this.title,
    this.price,
       {super.key, required this.onpressed,}
  );
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){Get.to(()=>BuyNow(title, imagepath, price));},
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
                child: Image.asset(imagepath,fit: BoxFit.cover,),
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
                            Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.black),),
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
                        Text(price,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20,color: Colors.blue),),
                      ],
                    ),
                  ),
                ),
              ),
              //fav-icon
              Positioned(
                top: 132,
                left: 338,
                child: Container(
                  width: Get.width*0.1,
                  height: Get.width*0.1,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    ),
                  child: Icon(Icons.favorite_border),
                ),
              ),
            ],
        ),
      ),
    );
  }
}