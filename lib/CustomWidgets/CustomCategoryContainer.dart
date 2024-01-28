import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCategoryContainer extends StatelessWidget {
  final String imagepath;
  final String title;
  final String price;

  const CustomCategoryContainer(this.imagepath, this.title, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.8,
      height: Get.height * 0.4,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0x30CCC7FF,),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.topRight,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(15),
                  topRight: Radius.circular(15),
                ),
                child: Image.asset(
                  imagepath,
                  width: Get.width, // Adjust the width as needed
                  height: Get.height * 0.18, // Adjust the height as needed
                  fit: BoxFit.cover,
                ),
              ),
              IconButton(
                onPressed: () {
                  // Add to wishlist logic
                  print('Add to Wishlist pressed');
                },
                icon: const Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            price,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Add to cart logic
                  print('Add to Cart pressed');
                },
                child: const Text('Add to Cart'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Buy Now logic
                  print('Buy Now pressed');
                },
                child: const Text('Buy Now'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
