import 'package:ecommerce_app/CustomWidgets/CustomCircleAvatar.dart';
import 'package:ecommerce_app/CustomWidgets/CustomElevatedButton.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomCircleAvatar(60, Image.asset("assets/images/SplashScreen/bg.jpg")),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: (){}, child: const Text('Change Profile Picture',style: TextStyle(color: Colors.black),)),
              ],
            ),
            const SizedBox(height: 20,),
              const Divider(color: Colors.grey,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Profile Information",style: TextStyle(color: Colors.black,fontSize: 20),),
                Text("Profile Information",style: TextStyle(color: Colors.grey,fontSize: 15),),
                Text("User Name",style: TextStyle(color: Colors.grey,fontSize: 15),),
              ],
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.grey,),
            const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Personal Information",style: TextStyle(color: Colors.black,fontSize: 20),),
                Text("User-id",style: TextStyle(color: Colors.grey,fontSize: 15),),
                Text("Email",style: TextStyle(color: Colors.grey,fontSize: 15),),
                Text("Phone",style: TextStyle(color: Colors.grey,fontSize: 15),),
                Text("Gender",style: TextStyle(color: Colors.grey,fontSize: 15),),
              ],
            ),
            const SizedBox(height: 20,),
            const Divider(color: Colors.grey,),
            const SizedBox(height: 20,),
            Align(
              alignment: Alignment.center,
              child: CustomElevatedButton(
                text: "SignOut",
                onPressed: (){},
                bgcolor: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
