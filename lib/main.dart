import 'package:ecommerce/screens/My_order/my_order_screen.dart';
import 'package:ecommerce/screens/add_new_card/add_new_card_screen.dart';
import 'package:ecommerce/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:ecommerce/screens/cart_screen/cartscreen.dart';
import 'package:ecommerce/screens/change_password/change_password_screen.dart';
import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
import 'package:ecommerce/screens/edit_Profile/edit_profile_screen.dart';
import 'package:ecommerce/screens/edit_adress_screen/edit_address_screen.dart';
import 'package:ecommerce/screens/forgot_password/forgot_password_screen.dart';
import 'package:ecommerce/screens/login/login.dart';
import 'package:ecommerce/screens/notifications/notification_screen.dart';
import 'package:ecommerce/screens/order_tracking/order_tracking_screen.dart';
import 'package:ecommerce/screens/otp_verification/otp_verification_screens.dart';
import 'package:ecommerce/screens/payment_screeen/paymentscreen.dart';
import 'package:ecommerce/screens/privacy_policy/privacy_policy_screen.dart';
import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce/screens/profile/profile_screen.dart';
import 'package:ecommerce/screens/search/search_screen.dart';
import 'package:ecommerce/screens/terms_conditions/terms_conditions_screen.dart';
import 'package:ecommerce/splashscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ecommerce App',
      theme: ThemeData(
        scaffoldBackgroundColor: Color(0xFFF2E8CF),
        dialogBackgroundColor: Color(0xFFF2E8CF),
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: Color(0xFFF2E8CF),
        ),
        cardColor: Colors.white, // Keep cards white for contrast
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFF2E8CF),
        ),
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: splashscreen()
    );
  }
}
