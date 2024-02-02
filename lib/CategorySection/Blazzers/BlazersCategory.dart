import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Reusable/BuyNow.dart';
import '../Reusable/CategoryMainContainer.dart';

class BlazersCategory extends StatefulWidget {
  const BlazersCategory({super.key, Key});

  @override
  State<BlazersCategory> createState() => _BlazersCategoryState();
}

class _BlazersCategoryState extends State<BlazersCategory> {
  List<String> image =[
    "assets/images/Blazers/image1.png",
    "assets/images/Blazers/image2.png",
    "assets/images/Blazers/image3.png",
    "assets/images/Blazers/image4.png",
    "assets/images/Blazers/image5.png",
    "assets/images/Blazers/image6.png",
  ];
  List<String> title = [
    'Product1',
    'Product2',
    'Product3',
    'Product4',
    'Product5',
    'Product6',
  ];
  List<String> price = [
    '\$120',
    '\$230',
    '\$340',
    '\$450',
    '\$650',
    '\$750',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blazers-Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          itemCount: title.length,
          itemBuilder: (context, index) => CustomItem(
            onpressed: () {
              Get.to(
                BuyNow(
                  image[index],
                  title[index],
                  price[index],
                ),
              );
            },
            image[index],
            title[index],
            price[index],
          ),
        ),
      ),
    );
  }
}
