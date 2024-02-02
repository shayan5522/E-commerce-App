import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/Authentication/AuthService.dart';
import 'package:ecommerce_app/Screens/DrawerSection/AboutScreen.dart';
import 'package:ecommerce_app/Screens/DrawerSection/FeedbackScreen.dart';
import 'package:ecommerce_app/Screens/TabBarScreens/CartScreen.dart';
import 'package:ecommerce_app/Screens/DrawerSection/OrdersScreen.dart';
import 'package:ecommerce_app/Screens/TabBarScreens/ProfileScreen.dart';
import 'package:ecommerce_app/Screens/TabBarScreens/WishListScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Drawerclass extends StatefulWidget {
  const Drawerclass({super.key});

  @override
  State<Drawerclass> createState() => _DrawerclassState();
}

class _DrawerclassState extends State<Drawerclass> {
  AuthService auth = AuthService();
  var email=FirebaseAuth.instance.currentUser!.email.toString();

  @override
  Widget build(BuildContext context) {
    return   Drawer(
      width: Get.width*0.7,
      backgroundColor: Colors.white,
      child: ListView(
        children: [
           DrawerHeader(
            child:
            Column(
              children: [
                const CircleAvatar(
                  radius: 55,
                  backgroundImage: AssetImage("assets/images/SplashScreen/E-Commerce.png"),
                ),
                Text(email),
              ],
            ),
          ),
          Column(
            children: [
              ListTileReusable("Home", const Icon(Icons.home,), const Icon(Icons.arrow_forward), () {Get.back();}),
              ListTileReusable("Cart", const Icon(Icons.shopping_cart), const Icon(Icons.arrow_forward), () {Get.back();Get.to(CartScreen()); }),
              ListTileReusable("Wishlist", const Icon(Icons.favorite), const Icon(Icons.arrow_forward), () {Get.back();Get.to(const WishList());  }),
              ListTileReusable("Orders", const Icon(Icons.access_time), const Icon(Icons.arrow_forward), () {Get.back();Get.to(const Orders());  }),
              ListTileReusable("Account", const Icon(Icons.account_box), const Icon(Icons.arrow_forward), () {Get.back();Get.to(const ProfileScreen());  }),
              ListTileReusable("Setting", const Icon(Icons.settings), const Icon(Icons.arrow_forward), () {Get.back();Get.to(const Settings());  }),
              ListTileReusable("About", const Icon(Icons.report_problem_outlined), const Icon(Icons.arrow_forward), () {Get.back();Get.to(const About());  }),
              ListTileReusable("feedback", const Icon(Icons.feedback), const Icon(Icons.arrow_forward), () {Get.back();Get.to(const FeedbackScreen());  }),
              const Divider(),
              const SizedBox(height: 10,),
              ListTileReusable("Logout", const Icon(Icons.exit_to_app), const Icon(null), () {auth.SignOut();}),
            ],
          ),
        ],
      ),
    );
  }
}

class ListTileReusable extends StatelessWidget {
  String title;
  Icon leading;
  Icon trailing;
  VoidCallback onPressed;
  ListTileReusable(this.title,this.leading,this.trailing,this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      trailing: trailing,
      leading: leading,
      onTap: onPressed,
      splashColor: const Color(0xE2C23DD9),
    );
  }
}