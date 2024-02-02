import 'package:ecommerce_app/CustomWidgets/CustomCircleAvatar.dart';
import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:ecommerce_app/CustomWidgets/CustomListTile/RListTile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Setting extends StatelessWidget {
  const Setting({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              //header
              Container(
                height: Get.height * 0.14,
                decoration: const BoxDecoration(
                  color: Color(
                    0x030ccc6f,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      const Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          "Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 24),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              CustomCircleAvatar(28, Image.asset("assets/images/SplashScreen/E-Commerce.png")),
                              const SizedBox(
                                width: 10,
                              ),
                              const Text(
                                'Coding with Shayan',
                                style: TextStyle(fontSize: 17),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 50,
                          ),
                          IconButton(onPressed: () {}, icon: const Icon(Icons.edit)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              //body
              Container(
                height: Get.height,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  color: Color(
                    0x30CCC7FF,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Account Setting',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      RlistTile(
                        title: "My Address",
                        subtitle: "hurnamaira kotera",
                        onTap: () {},
                        icon: Icons.add_road,
                      ),
                      RlistTile(
                        title: "My Cart",
                        subtitle: "hurnamaira kotera",
                        onTap: () {},
                        icon: Icons.shopping_cart,
                      ),
                      RlistTile(
                        title: "My Orders",
                        subtitle: "hurnamaira kotera",
                        onTap: () {},
                        icon: Icons.offline_pin_outlined,
                      ),
                      RlistTile(
                        title: "Bank Account",
                        subtitle: "hurnamaira kotera",
                        onTap: () {},
                        icon: Icons.account_balance,
                      ),
                      RlistTile(
                        title: "My Coupons",
                        subtitle: "hurnamaira kotera",
                        onTap: () {},
                        icon: Icons.contact_support,
                      ),
                      RlistTile(
                        title: "Notifications",
                        subtitle: "hurnamaira kotera",
                        onTap: () {},
                        icon: Icons.notification_important,
                      ),
                      RlistTile(
                        title: "Account Privacy",
                        subtitle: "hurnamaira kotera",
                        onTap: () {},
                        icon: Icons.privacy_tip,
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        children: [
                          CustomElevatedButton(text: "Logout", onPressed: (){},bgcolor: Colors.blue,),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
