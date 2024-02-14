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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
            children: [
              //image-Container
              Align(
                alignment: Alignment.topLeft,
                child: Image.asset(imagepath,
                  fit: BoxFit.cover,
                  width: 100,
                  height: 120,
                ),
              ),
              //Details-Container
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  width: Get.width*0.65,
                  height: 120,
                  decoration: BoxDecoration(
                     color: Colors.grey,
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
                            Text(title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15,color: Colors.black),),
                            Text("Number",style: TextStyle(fontSize: 12,color: Colors.black),),
                          Row(
                            children: [
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star,color: Colors.yellow,),
                              Icon(Icons.star_border),
                            ],
                          ),
                        SizedBox(height: 5,),
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