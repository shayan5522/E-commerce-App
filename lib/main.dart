import 'package:ecommerce_app/CategorySection/Reusable/BuyNow.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'CategorySection/Shirts/MainShirtsScreen.dart';
import 'Screens/HomeScreens/SplashScreen.dart';
import 'firebase_options.dart';

void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return    GetMaterialApp(
      // theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
       home: SplashScreen(),
    );
  }
}
