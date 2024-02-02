import 'package:ecommerce_app/Screens/TabBarScreens/ProfileScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../Screens/HomeScreens/HomeScreen.dart';
import '../Screens/TabBarScreens/CartScreen.dart';
import '../Screens/TabBarScreens/ChatScreen.dart';

class HomeController extends GetxController {
  final List<Widget> screens = [
    const HomeScreen(),
    const FavScreen(),
    CartScreen(),
    const ProfileScreen(),
  ];

  final RxInt currentIndex = 0.obs;
}