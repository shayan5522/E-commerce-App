import 'package:ecommerce_app/CustomWidgets/CustomGridView/GridLayout.dart';
import 'package:flutter/material.dart';
import '../CustomWidgets/CustomGridView/CustomItemContainer.dart';

class TShirtsCategory extends StatefulWidget {
  const TShirtsCategory({super.key, Key});

  @override
  State<TShirtsCategory> createState() => _TShirtsCategoryState();
}

class _TShirtsCategoryState extends State<TShirtsCategory> {
  List<String> images =[
    "assets/images/t-Shirts/image1.png",
    "assets/images/t-Shirts/image2.png",
    "assets/images/t-Shirts/image3.png",
    "assets/images/t-Shirts/image4.png",
    "assets/images/t-Shirts/image5.png",
    "assets/images/t-Shirts/image6.png",

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
        title: const Text('T-Shirts-Category'),
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
          // CustomCategoryContainer("assets/images/Socialicons/apple.jpg", "Apple", "\$122")),
        ),
      ),
    );
  }
}
