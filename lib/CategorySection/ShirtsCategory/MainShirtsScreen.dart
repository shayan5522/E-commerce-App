import 'package:ecommerce_app/CategorySection/ShirtsCategory/Shirt1Screen.dart';
import 'package:ecommerce_app/CustomWidgets/CustomGridView/GridLayout.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CustomWidgets/CustomGridView/CustomItemContainer.dart';
class MainShirtsScreen extends StatefulWidget {
  const MainShirtsScreen({super.key, Key});

  @override
  State<MainShirtsScreen> createState() => _MainShirtsScreenState();
}

class _MainShirtsScreenState extends State<MainShirtsScreen> {
  List<String> images = [
    "assets/images/shirt_images/image1.jpg",
    "assets/images/shirt_images/image7.jpg",
    "assets/images/shirt_images/image3.jpg",
    "assets/images/shirt_images/image4.jpg",
    "assets/images/shirt_images/image5.jpg",
    "assets/images/shirt_images/image6.jpg",
    "assets/images/shirt_images/image7.jpg",
  ];
  List<String> products = [
    'Product1',
    'Product2',
    'Product3',
    'Product4',
    'Product5',
    'Product6',
    'Product7',
  ];
  List<String> prices = [
    '\$120',
    '\$230',
    '\$340',
    '\$450',
    '\$650',
    '\$750',
    '\$350',
  ];
  List<Widget> productDetail = [
    const Shirt1(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shirts-Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Gridlayout(
          mainAxisExtent: 230,
          itemCount: products.length,
          itemBuilder: (BuildContext, index) => CustomItem(
            onpressed: () {
              print("object");
              Get.to(productDetail[index]);
            },
            imagepath: images[index],
            title: products[index],
            price: prices[index],
          ),
        ),
      ),
    );
  }
}
