import 'package:flutter/material.dart';

class Gridlayout extends StatelessWidget {
  const Gridlayout({super.key, 
    required this.mainAxisExtent,
    required this.itemCount,
    required this.itemBuilder,
  });

  final int itemCount;
  final double? mainAxisExtent;
  final Widget? Function(BuildContext, int) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: EdgeInsets.zero,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisExtent: mainAxisExtent,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
        ),
        itemBuilder: itemBuilder,
        itemCount: itemCount,
    );
  }
}
