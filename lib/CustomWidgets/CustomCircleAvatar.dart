import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomCircleAvatar extends StatefulWidget {
  final int rad;
  final Image backgroundImage;
  final Widget? page;

  const CustomCircleAvatar(this.rad, this.backgroundImage,{super.key, this.page});
  @override
  State<CustomCircleAvatar> createState() => _CustomCircleAvatarState();
}

class _CustomCircleAvatarState extends State<CustomCircleAvatar> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Get.to(widget.page);
      },
      child: CircleAvatar(
        radius: widget.rad.toDouble(),
        backgroundImage: widget.backgroundImage.image,
      ),
    );
  }
}
