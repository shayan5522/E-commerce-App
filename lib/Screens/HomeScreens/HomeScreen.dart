import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../CategorySection/Blazzers/BlazersCategory.dart';
import '../../CategorySection/Shirts/MainShirtsScreen.dart';
import '../../CategorySection/Tshirts/TShirtsCategory.dart';
import '../../CustomWidgets/HomeContainers/smallContainerHS.dart';
import '../../CustomWidgets/HomeContainers/wideContainers.dart';
import 'CarouselSlider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
            const SizedBox(
              height: 8,
            ),
            const Text(
              "All Brands",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 8,
            ),
            const HorizontalBrandsContainer(),
            const SizedBox(
              height: 8,
            ),
             CarouselSlider1(),
            const SizedBox(
              height: 8,
            ),
            const Text(
              "Categories",
              style: TextStyle(fontSize: 30),
            ),
            const SizedBox(
              height: 8,
            ),
            const HorizontalMainContainers(),
          ],
        ),
      ),
    );
  }
}
//brands
class HorizontalBrandsContainer extends StatelessWidget {
  const HorizontalBrandsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          small_containers(
              "assets/images/brand_logos/logo1.jpg", "Bonanza"),
          SizedBox(
            width: 10,
          ),
          small_containers(
              "assets/images/brand_logos/logo2.jpg", "Khaadi"),
          SizedBox(
            width: 10,
          ),
          small_containers(
              "assets/images/brand_logos/logo3.jpg", "Nike",),
          SizedBox(
            width: 10,
          ),
          small_containers(
              "assets/images/brand_logos/logo4.png", "Adidas",),
          SizedBox(
            width: 10,
          ),
          small_containers(
              "assets/images/brand_logos/logo5.png", "James",),
        ],
      ),
    );
  }
}
//collection
class HorizontalMainContainers extends StatelessWidget {
  const HorizontalMainContainers({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Wide_containers(
              "assets/images/product_images/image1.jpg", "Shirts", "\$122", () {
            Get.to(MainShirtsScreen());
          }),
          const SizedBox(
            width: 10,
          ),
          Wide_containers(
              "assets/images/product_images/image2.jpg", "Blazers", "\$122",
              () {
            Get.to(const BlazersCategory());
          }),
          const SizedBox(
            width: 10,
          ),
          Wide_containers(
              "assets/images/product_images/image3.jpg", "T-Shirts", "\$122",
              () {
            Get.to( const ShirtsCategory());
          }),
          const SizedBox(
            width: 10,
          ),
          Wide_containers(
              "assets/images/product_images/image4.jpg", "Shawls", "\$122", () {
            Get.to(MainShirtsScreen());
          }),
          const SizedBox(
            width: 10,
          ),
          Wide_containers(
              "assets/images/product_images/image5.jpg", "Hoodies", "\$122",
              () {
            Get.to(MainShirtsScreen());
          }),
          const SizedBox(
            width: 10,
          ),
          Wide_containers(
              "assets/images/product_images/image6.jpg", "Stallers", "\$122",
              () {
            Get.to(MainShirtsScreen());
          }),
          const SizedBox(
            width: 10,
          ),
          Wide_containers(
              "assets/images/product_images/image7.jpg", "Kurta", "\$122", () {
            Get.to(MainShirtsScreen());
          }),
          const SizedBox(
            width: 10,
          ),
          Wide_containers("assets/images/product_images/image8.jpg",
              "Dressing-Coats", "\$122", () {
            Get.to(MainShirtsScreen());
          }),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}


