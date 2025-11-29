

import 'package:ecommerce/customs/buttonscreen.dart';
import 'package:ecommerce/customs/textfields.dart';
import 'package:ecommerce/screens/login/login.dart';

import 'package:ecommerce/screens/otp_verification/otp_verification_screens.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgotPasswodScreen extends StatelessWidget {
   ForgotPasswodScreen({super.key});

  final TextEditingController mobileController = TextEditingController();


   Widget _buildLabel(String text, Color color) {
     return Align(
       alignment: Alignment.centerLeft,
       child: Text(
         text,
         style: TextStyle(
           color: color,
           fontWeight: FontWeight.bold,
           fontSize: 14,
         ),
       ),
     );
   }

  @override
  Widget build(BuildContext context) {

    final themeColor = const Color(0xFF004643);

    return Scaffold(
      backgroundColor: const Color(0xFFF2E8CF), // Added background color
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center, // Align items to start
        children: [
          Image.asset(
            "assets/images/Logo.png",
            height: 120,
          ),


          const SizedBox(height: 140),

           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text(
                "Forgot Password",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF004643),
                ),
                         ),
             ),
           ),
          SizedBox(height: 20,),
           Padding(
             padding: const EdgeInsets.symmetric(horizontal: 20.0),
             child: Align(
               alignment: Alignment.centerLeft,
               child: Text(
                "Don’t Worry it happens, please enter the\nMobile No. associated with your account.",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
                         ),
             ),
           ),
          SizedBox(height: 40,),

          // Mobile Number Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: _buildLabel("Mobile Number", themeColor),
          ),
          const SizedBox(height: 8),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: CustomTextField(
              controller: mobileController,
              hintText: 'Enter your Number',
              obscureText: false,
              borderColor: Colors.grey[300]!,
              focusedBorderColor: themeColor,
              isRequired: true,
              borderRadius: 25,
            ),
          ),
          SizedBox(height: 30,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: "Continue",
              onPressed: () {
                Get.to(OTPVerificationScreen());
                // Add your button action here
                print("Get Started button pressed!");
                // You can add navigation or other logic here
              },
            ),
          ),
        ],
      ),
    );
  }
}
