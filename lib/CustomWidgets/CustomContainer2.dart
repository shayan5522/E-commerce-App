import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CustomCircleAvatar.dart'; // Replace with the actual path

class CustomContainer2 extends StatelessWidget {
  final String imagepath;
  final String title;
  final String price;

  const CustomContainer2(this.imagepath, this.title, this.price, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.5,
      height: Get.height * 0.14,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0x30CCC7FF,),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Align text to the left
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the avatar horizontally
            children: [
              CustomCircleAvatar(
                40,
                Image.asset(imagepath),
              ),
            ],
          ),
          const SizedBox(width: 30),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              Text(
                price,
                style: const TextStyle(
                  fontSize: 14,
                  color: Colors.blueAccent,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
