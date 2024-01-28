import 'package:ecommerce_app/CategorySection/BlazersCategory.dart';
import 'package:ecommerce_app/CategorySection/TShirtsCategory.dart';
import 'package:ecommerce_app/CustomWidgets/CustomContainer1.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CategorySection/ShirtsCategory/MainShirtsScreen.dart';
import '../../CustomWidgets/CustomContainer2.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return 
      SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //title
              const Text("Find Best Product",style: TextStyle(fontSize: 40),),
              const SizedBox(height: 15,),
              //search-bar
              TextField(
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                  label: const Text('Search'),
                  hintText: 'Search any product',

                ),
              ),
              const SizedBox(height: 15,),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomContainer1("assets/images/product_images/image1.jpg", "Shirts", "\$122",(){Get.to(const MainShirtsScreen());}),
                    const SizedBox(width: 10,),
                    CustomContainer1("assets/images/product_images/image2.jpg", "Blazers", "\$122",(){Get.to(const BlazersCategory());}),
                    const SizedBox(width: 10,),
                    CustomContainer1("assets/images/product_images/image3.jpg", "T-Shirts", "\$122",(){Get.to(const TShirtsCategory());}),
                    const SizedBox(width: 10,),
                    CustomContainer1("assets/images/product_images/image4.jpg", "Shawls", "\$122",(){Get.to(const MainShirtsScreen());}),
                    const SizedBox(width: 10,),
                    CustomContainer1("assets/images/product_images/image5.jpg", "Hoodies", "\$122",(){Get.to(const MainShirtsScreen());}),
                    const SizedBox(width: 10,),
                    CustomContainer1("assets/images/product_images/image6.jpg", "Stallers", "\$122",(){Get.to(const MainShirtsScreen());}),
                    const SizedBox(width: 10,),
                    CustomContainer1("assets/images/product_images/image7.jpg", "Kurta", "\$122",(){Get.to(const MainShirtsScreen());}),
                    const SizedBox(width: 10,),
                    CustomContainer1("assets/images/product_images/image8.jpg", "Dressing-Coats", "\$122",(){Get.to(const MainShirtsScreen());}),
                    const SizedBox(width: 10,),
                  ],
                ),
              ),
              const SizedBox(height: 15,),
              const Text("All Brands",style: TextStyle(fontSize: 40),),
              const SizedBox(height: 15,),
              const SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    CustomContainer2("assets/images/brand_logos/logo1.jpg","Bonanza","\$200"),
                    SizedBox(width: 10,),
                    CustomContainer2("assets/images/brand_logos/logo2.jpg","Khaadi","\$200"),
                    SizedBox(width: 10,),
                    CustomContainer2("assets/images/brand_logos/logo3.jpg","Nike","\$200"),
                    SizedBox(width: 10,),
                    CustomContainer2("assets/images/brand_logos/logo4.png","Adidas","\$200"),
                    SizedBox(width: 10,),
                    CustomContainer2("assets/images/brand_logos/logo5.png","James","\$200"),
                  ],
                ),
              )
            ],
          ),
        ),
      );
  }
}
