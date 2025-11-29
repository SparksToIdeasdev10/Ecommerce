import 'package:ecommerce/customs/buttonscreen.dart';
import 'package:ecommerce/screens/reset_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart'; // Make sure to add this dependency in pubspec.yaml

class OTPVerificationScreen extends StatelessWidget {
  OTPVerificationScreen({super.key});

  final TextEditingController otpController = TextEditingController();

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

    // Customize the pin input theme
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
        fontSize: 20,
        color: Colors.black,
        fontWeight: FontWeight.bold,
      ),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12),
        color: themeColor,
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: themeColor),
      borderRadius: BorderRadius.circular(12),
    );

    final submittedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: themeColor),
      borderRadius: BorderRadius.circular(12),
      color: Color(0xFFF2E8CF),
    );

    return Scaffold(
      backgroundColor: const Color(0xFFF2E8CF),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                "OTP Verification",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF004643),
                ),
              ),
            ),
          ),

          SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "We will send you a code please check your\nMobile No. and enter your code",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black87,
                ),
              ),
            ),
          ),

          SizedBox(height: 40),

          // OTP Input Field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: _buildLabel("Enter OTP", themeColor),
          ),

          const SizedBox(height: 8),

          // Pinput for OTP
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Pinput(
              length: 4,
              controller: otpController,
              defaultPinTheme: defaultPinTheme,
              focusedPinTheme: focusedPinTheme,
              submittedPinTheme: submittedPinTheme,
              showCursor: true,
              onCompleted: (pin) {
                // OTP entered completely
                print("OTP Entered: $pin");
              },
            ),
          ),

          SizedBox(height: 30),

          // Resend OTP Text
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Didn't receive code?",
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.black87,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    // Resend OTP logic
                    print("Resend OTP pressed!");
                  },
                  child: Text(
                    "Resend Again",
                    style: TextStyle(
                      color: themeColor,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
              ],
            ),
          ),

          SizedBox(height: 30),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: CustomButton(
              text: "Continue",
              onPressed: () {

                Get.to(ResetPasswodScreen());
                // Verify OTP logic
                if (otpController.text.length == 4) {
                  print("OTP Verified: ${otpController.text}");
                  // Navigate to next screen or perform verification
                } else {
                  // Show error for incomplete OTP
                  print("Please enter complete OTP");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}