import 'package:flutter/material.dart';

import 'ReusableSplashScreen.dart';

class SlidingSplashScreen extends StatelessWidget {
  const SlidingSplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            scrollDirection: Axis.horizontal,
            children: [
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: (){},
                  child: const Text('skip',style: TextStyle(color: Colors.pink),),
                ),
              ),
              const ReusableSplashScreen(
                image: AssetImage("assets/images/SplashScreen/bg.jpg"),
                title: "Choose Your Product",
                subtitle: "Choose Your ProductChoose Your ProductChoose Your ProductChoose Your ProductChoose Your ProductChoose Your Product",
              ),
              const ReusableSplashScreen(
                image: AssetImage("assets/images/SplashScreen/bg.jpg"),
                title: "Choose Your Product2",
                subtitle: "Choose Your ProductChoose Your ProductChoose Your ProductChoose Your ProductChoose Your ProductChoose Your Product",
              ),
              const ReusableSplashScreen(
                image: AssetImage("assets/images/SplashScreen/bg.jpg"),
                title: "Choose Your Product3",
                subtitle: "Choose Your ProductChoose Your ProductChoose Your ProductChoose Your ProductChoose Your ProductChoose Your Product",
              ),
            ],
          )
        ],
      ),
    );
  }
}
