import 'package:ecommerce_app/CustomWidgets/CustomGridView/GridLayout.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomGridView/CustomItemContainer.dart';

class BlazersCategory extends StatefulWidget {
  const BlazersCategory({super.key, Key});

  @override
  State<BlazersCategory> createState() => _BlazersCategoryState();
}

class _BlazersCategoryState extends State<BlazersCategory> {
  List<String> images =[
    "assets/images/Blazers/image1.png",
    "assets/images/Blazers/image2.png",
    "assets/images/Blazers/image3.png",
    "assets/images/Blazers/image4.png",
    "assets/images/Blazers/image5.png",
    "assets/images/Blazers/image6.png",
  ];
  List<String> products = [
    'Product1',
    'Product2',
    'Product3',
    'Product4',
    'Product5',
    'Product6',
  ];
  List<String> prices = [
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
        child: Gridlayout(
          mainAxisExtent: 230,
          itemCount: products.length,
          itemBuilder: (BuildContext, index)=> CustomItem(
              imagepath: images[index],
              title: products[index],
              price: prices[index], onpressed: () {  },),
        ),
      ),
    );
  }
}
