import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Reusable/BuyNow.dart';
import '../Reusable/CategoryMainContainer.dart';

class ShirtsCategory extends StatefulWidget {
  const ShirtsCategory({super.key});

  @override
  State<ShirtsCategory> createState() => _ShirtsCategoryState();
}

class _ShirtsCategoryState extends State<ShirtsCategory> {
  List<String> image =[
    "assets/images/t-Shirts/image1.png",
    "assets/images/t-Shirts/image2.png",
    "assets/images/t-Shirts/image3.png",
    "assets/images/t-Shirts/image4.png",
    "assets/images/t-Shirts/image5.png",
    "assets/images/t-Shirts/image6.png",

  ];
  List<String> title = [
    'Product1',
    'Product2',
    'Product3',
    'Product4',
    'Product5',
    'Product6',
  ];
  List<String> price= [
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
        title: const Text('T-Shirts-Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
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
          itemCount: title.length,
        ),
      ),
    );
  }
}
