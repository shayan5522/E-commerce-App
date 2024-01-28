import 'package:ecommerce_app/Screens/AboutSection/Settings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../TabBarScreens/ProfileScreen.dart';
import '../TabBarScreens/StoreScreen.dart';
import '../TabBarScreens/WishListSection/WishListScreen.dart';
import 'HomeScreen.dart';

class TabBarScreen extends StatefulWidget {
  const TabBarScreen({super.key});
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}
class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
    @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ECOMMERCE APP'),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () { Scaffold.of(context).openDrawer(); },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
      ),
      drawer: Drawer(
        width: Get.width*0.7,
        backgroundColor: Colors.grey,
        child: ListView(
          children: [
            const DrawerHeader(
              child:
              Column(
                children: [
                  CircleAvatar(
                    radius: 55,
                    backgroundImage: AssetImage("assets/images/SplashScreen/E-Commerce.png"),
                  ),
                  Text('Shayan Ahmed')
                ],
              ),
            ),
            Column(
              children: [
                ListTile(
                  title: const Text('Setting'),
                  subtitle: const Text('Click to naviagte to home'),
                  leading: const Icon(Icons.settings),
                  onTap: (){Get.to(const SettingScreen());},
                ),
                ListTile(
                  title: const Text('Account Setup'),
                  subtitle: const Text('Click to naviagte to home'),
                  leading: const Icon(Icons.account_box_outlined),
                  onTap: (){Get.to(const ProfileScreen());},
                ),
                const SizedBox(height: 50 ),
                const ListTile(
                  title: Text('Logout',style: TextStyle(color: Colors.red),),
                  subtitle: Text('Click to logout',style: TextStyle(color: Colors.red),),
                  leading: Icon(Icons.arrow_forward,color: Colors.red,),
                ),
              ],
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
      children: const [
        HomeScreen(),
        StoreScreen(),
        WishListScreen(),
        ProfileScreen()
      ],
    ),
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(15),
          topRight: Radius.circular(15),
        ),
        child: Container(
          color: Colors.grey,
          child: TabBar(
            controller: _tabController,
            dividerColor: Colors.transparent,
            padding: const EdgeInsets.all(20),
            overlayColor: MaterialStateProperty.all(Colors.transparent),
            indicatorColor: Colors.transparent,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            tabs: const [
                Icon(Icons.home),
                Icon(Icons.store),
                Icon(Icons.heart_broken_sharp),
                Icon(Icons.person),
            ],
          ),
        ),
      ),
    );
  }
}
