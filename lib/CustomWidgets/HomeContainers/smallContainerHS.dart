import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../CustomCircleAvatar.dart';
class small_containers extends StatelessWidget {
  final String imagepath;
  final String title;

  const small_containers(this.imagepath, this.title, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.23,
      height: Get.height * 0.13,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(3),
        color: const Color(0x30CCC7FF,),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Align text to the left
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center, // Center the avatar horizontally
            children: [
              CustomCircleAvatar(
                20,
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
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
