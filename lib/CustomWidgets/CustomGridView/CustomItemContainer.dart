import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomItem extends StatelessWidget {
  final String? imagepath;
  final String? title;
  final String? price;
  final VoidCallback onpressed;

  const CustomItem({super.key, 
    required this.imagepath,
    required this.title,
    required this.price,
    required this.onpressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onpressed,
      child: Container(
        width: Get.width * 0.5,
        height: Get.height * 0.5,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(18),
            bottomLeft: Radius.circular(18),
          ),
          color: Color(0x30CCC7FF,),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // For image and heart icon
            Container(
              child: Stack(
                children: [
                  Container(
                    // Image
                   child: Image.asset(
                      imagepath!,
                      width: Get.width,
                      height: Get.height * 0.18,
                      fit: BoxFit.cover,),
                  ),
                  // Fav icon
                  Positioned(
                    top: 0.0,
                    right: 0.0,
                    child: Container(
                      child: IconButton(
                        icon: const Icon(Icons.favorite,color: Colors.red,),
                        onPressed: () {},
                      ),
                    ),
                  )
                ],
              ),
            ),
            //SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        Text(title!,
                          style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),),
                        // Price
                        Text(price!,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                    // Add to cart Button
                    Column(
                      children: [
                        IconButton(
                          onPressed: () {},
                          icon: const Icon(CupertinoIcons.shopping_cart),
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
    );
  }
}
