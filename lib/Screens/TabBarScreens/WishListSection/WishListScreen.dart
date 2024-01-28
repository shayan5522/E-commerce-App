import 'package:ecommerce_app/CustomWidgets/CustomGridView/CustomItemContainer.dart';
import 'package:ecommerce_app/CustomWidgets/CustomGridView/GridLayout.dart';
import 'package:flutter/material.dart';

class WishListScreen extends StatefulWidget {
  // final String? imagepath;
  // final String? title;
  // final String? price;
  //final VoidCallback onpressed;

  const WishListScreen({super.key,
    // required this.imagepath,
    // required this.title,
    // required this.price,
    //required this.onpressed,
  });

  @override
  State<WishListScreen> createState() => _WishListScreenState();
}

class _WishListScreenState extends State<WishListScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Gridlayout(
              mainAxisExtent: 280,
              itemCount: 1,
              itemBuilder: (BuildContext context, int index){
                return CustomItem(

                  onpressed: () {  }, imagepath: 'assets/images/shirt_images/image1.jpg', title: 'Prduct1', price: '\$120s',
                );
              }
          ),
        ),
      ),
    );
  }
}
