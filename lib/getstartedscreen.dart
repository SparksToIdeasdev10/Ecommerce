

import 'package:ecommerce/screens/login/login.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'customs/buttonscreen.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Get screen dimensions
    final Size screenSize = MediaQuery.of(context).size;
    final bool isPortrait = screenSize.height > screenSize.width;
    return Scaffold(
      backgroundColor: const Color(0xFFF2E8CF), // Added background color
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: screenSize.width * 0.05, // 5% of screen width
          vertical: screenSize.height * 0.02,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Align items to start
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 40),
              child: Image.asset(
                "assets/images/img_1.png",
                height: 380,
              ),
            ),

            SizedBox(height: screenSize.height * 0.02), // Add some spacing

            // Custom Button added here (before the text)


            SizedBox(height:screenSize.height * 0.03), // Add spacing between button and text

            // Your existing text widgets
            Center(
              child: const Text(
                "Get Started",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFFF004643),
                ),
              ),
            ),
            SizedBox(height: 20,),
            Center(
              child: const Text(
                "Lorem Ipsum has been the industry's  ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: const Text(
                "standard dummy text ever since the 1500s, ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: const Text(
                "when an unknown printer took a galley of",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: const Text(
                " type and scrambled it to make a type ",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Center(
              child: const Text(
                "specimen book",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
            SizedBox(height: 30,),
            Padding(
              padding: const EdgeInsets.only(right: 30), // Match left padding
              child: CustomButton(
                text: "Login",
                onPressed: () {
                  Get.to(LoginScreen(initialTabIndex: 0));
                  // Add your button action here
                  print("Get Started button pressed!");
                  // You can add navigation or other logic here
                },
              ),
            ),
            SizedBox(height: screenSize.height * 0.01),
            Padding(
              padding: const EdgeInsets.only(right: 30), // Match left padding
              child: CustomButton(
                text: "Register",
                onPressed: () {
                  Get.to(LoginScreen(initialTabIndex: 1));
                  // Add your button action here
                  print("Get Started button pressed!");
                  // You can add navigation or other logic here
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
