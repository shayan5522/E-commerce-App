import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../Reusable/BuyNow.dart';
import '../Reusable/CategoryMainContainer.dart';

class MainShirtsScreen extends StatelessWidget {
  List<String> image = [
    "assets/images/shirt_images/image1.png",
    "assets/images/shirt_images/image7.jpg",
    "assets/images/shirt_images/image3.jpg",
    "assets/images/shirt_images/image4.jpg",
    "assets/images/shirt_images/image5.jpg",
    "assets/images/shirt_images/image6.jpg",
    "assets/images/shirt_images/image7.jpg",
  ];
  List<String> title = [
    'Bonanza',
    'Nike',
    'Khaadi',
    'j.',
    'MTJ',
    'Grace',
    'Gucci',
  ];
  List<String> price = [
    '\$120',
    '\$230',
    '\$340',
    '\$450',
    '\$650',
    '\$750',
    '\$350',
  ];
  MainShirtsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shirts-Category'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          padding: EdgeInsets.zero,
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisExtent: 230,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
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
