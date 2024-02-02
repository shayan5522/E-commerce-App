import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommerce_app/Authentication/AuthService.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Controllers/BottomNavbarController.dart';
import 'DrawerScreen.dart';

class TabBarScreen extends StatefulWidget {
   const TabBarScreen({super.key});
  @override
  State<TabBarScreen> createState() => _TabBarScreenState();
}
class _TabBarScreenState extends State<TabBarScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final HomeController _homeController = Get.put(HomeController());
  AuthService auth = AuthService();
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
        actions: [
          IconButton(onPressed: (){
            auth.SignOut();
          }, icon: const Icon(Icons.logout,color: Colors.red,))
        ],

      ),
      drawer:  const Drawerclass(),
      body: Obx((){
        return _homeController.screens[_homeController.currentIndex.value];
      }),
     bottomNavigationBar: ConvexAppBar(
       backgroundColor: const Color(0x30CCC7FF,),
       items: const [
         TabItem(icon: Icon(Icons.home,color: Colors.blue,)),
         TabItem(icon: Icon(Icons.chat,color: Colors.blue,),),
         TabItem(icon: Icon(Icons.shopping_cart,color: Colors.blue,),),
         TabItem(icon: Icon(Icons.person,color: Colors.blue,),),
       ],
       onTap: (int i) => _homeController.currentIndex.value = i,
       ),
     );

  }
}

