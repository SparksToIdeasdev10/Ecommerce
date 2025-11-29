import 'dart:async';

import 'package:ecommerce/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'getstartedscreen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({super.key});

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2),()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      if(token != "" || token != null){
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNavScreen()));
      }else{
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>GetStartedScreen()));
      }
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF2E8CF),
      body: Center(child: Image.asset("assets/images/Logo.png")),
    );
  }
}
