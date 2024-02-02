//Section For Social Icons
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../Screens/Registration/LoginScreen.dart';
import '../../Screens/Registration/SignUpScreen.dart';
import '../CustomCircleAvatar.dart';
import '../CustomElevatedButton.dart';

class SocialiconsSection extends StatelessWidget {
  const SocialiconsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                CustomCircleAvatar(
                    30, Image.asset("assets/images/Socialicons/facebook.jpg"),
                    page: LoginScreen()),
                const Text("Facebook"),
              ],
            ),
            Column(
              children: [
                CustomCircleAvatar(
                    26, Image.asset("assets/images/Socialicons/google.jpg"),
                    page: LoginScreen()),
                const Text("Google"),
              ],
            ),
            Column(
              children: [
                CustomCircleAvatar(
                    30, Image.asset("assets/images/Socialicons/phone.jpg"),
                    page: LoginScreen()),
                const Text("Phone"),
              ],
            ),
          ],
        ),
        const SizedBox(
          height: 40,
        ),
        Row(
          children: [
            CustomElevatedButton(
              text: "Create Account",
              bgcolor: Colors.white38,
              textColor: Colors.white,
              onPressed: () {
                Get.to(SignUpScreen());
              },
            ),
          ],
        ),
      ],
    );
  }
}