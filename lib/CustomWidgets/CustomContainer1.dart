import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomContainer1 extends StatelessWidget {
  final String imagepath;
  final String title;
  final String price;
  final VoidCallback? onpressed;

  const CustomContainer1(this.imagepath, this.title, this.price, this.onpressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width * 0.35,
      height: Get.height * 0.31,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: const Color(0x30CCC7FF,),
      ),
      child: GestureDetector(
        onTap: onpressed,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius:  const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.asset(
                imagepath,
                width: Get.width, // Adjust the width as needed
                height: Get.height*0.24, // Adjust the height as needed
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: Colors.black
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
          ],
        ),
      ),
    );
  }
}
//

