import 'package:flutter/material.dart';

class ReusableSplashScreen extends StatelessWidget {
  final ImageProvider? image;
  final String? title;
  final String? subtitle;

  const ReusableSplashScreen({super.key, 
    this.image,
    this.title,
    this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image(image: image ?? const AssetImage("default_image_path")),
        const SizedBox(height: 50,),
        Center(child: Text(title ?? "Default Title", style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30))),
        const SizedBox(height: 20,),
        Center(
          child: Text(subtitle ?? "Default Subtitle", style: const TextStyle(fontSize: 15)),
        ),
      ],
    );
  }
}
