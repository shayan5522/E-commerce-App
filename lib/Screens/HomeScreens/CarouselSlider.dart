import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class CarouselSlider1 extends StatelessWidget {
  final List<String> items = [
    'assets/images/SliderImages/image1.png',
    'assets/images/SliderImages/image2.png',
    'assets/images/SliderImages/image3.png',
    'assets/images/SliderImages/image5.jpg'
  ];

   CarouselSlider1({super.key});
  @override
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: items.map((item) {
        return RoundedContainer(imageurl: item);
      }).toList(),
      options: CarouselOptions(
        pageSnapping: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        autoPlay: true,
        reverse: false,
      ),
    );
  }
}
class RoundedContainer extends StatelessWidget {
  const RoundedContainer({super.key, 
    this.width,  this.height, required this.imageurl, this.bgColor, this.fit, this.onpressed,
  });
  final double? width,height;
  final String imageurl;
  final Color? bgColor;
  final BoxFit? fit;
  final VoidCallback? onpressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        width: Get.width,
        height: Get.height*0.4,
        decoration: BoxDecoration(
          borderRadius:   BorderRadius.circular(3),
        ),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image(image: AssetImage(imageurl),fit: BoxFit.cover,)),
      ),
    );
  }
}