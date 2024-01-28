import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomSnackbarController extends GetxController {
  void showSnackbar(String title, String description) {
    Get.snackbar(
      title,
      description,
      backgroundColor: Colors.white,
      colorText: Colors.black,
      duration: const Duration(seconds: 2),
      snackPosition: SnackPosition.BOTTOM,
    );
  }
}

class CustomSnackbar extends StatelessWidget {
  final String title;
  final String description;

  const CustomSnackbar(this.title, this.description, {super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        // Use Get.find to get the CustomSnackbarController instance
        CustomSnackbarController controller = Get.find<CustomSnackbarController>();
        controller.showSnackbar(title, description);
      },
      child: const Text('Show Snackbar'),
    );
  }
}
