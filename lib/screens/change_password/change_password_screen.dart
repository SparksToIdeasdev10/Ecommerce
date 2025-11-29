import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../customs/buttonscreen.dart';
import '../../customs/textfields.dart';

class ChangePasswordScreen extends StatefulWidget {
  ChangePasswordScreen({super.key});


  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}


class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final themeColor = const Color(0xFF004643);
  final TextEditingController fullnameController = TextEditingController();
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController emailController = TextEditingController();

  bool isOldPasswordVisible = false;
  bool isNewPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  Widget _buildRegisterTab(Color themeColor) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Old Password Field
          _buildLabel("Old Password", themeColor),
          //const SizedBox(height: 8),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: fullnameController,
            hintText: 'Old Password',
            obscureText: !isOldPasswordVisible, // Toggle based on visibility
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: IconButton(
              icon: Icon(
                isOldPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: themeColor,
              ),
              onPressed: () {
                setState(() {
                  isOldPasswordVisible = !isOldPasswordVisible;
                });
              },
            ),
          ),
          //const SizedBox(height: 16),
          SizedBox(height: Get.height * 0.02),

          // New Password Field
          _buildLabel("New password", themeColor),
          //const SizedBox(height: 8),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: mobileController,
            hintText: 'New password',
            obscureText: !isNewPasswordVisible, // Toggle based on visibility
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: IconButton(
              icon: Icon(
                isNewPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: themeColor,
              ),
              onPressed: () {
                setState(() {
                  isNewPasswordVisible = !isNewPasswordVisible;
                });
              },
            ),
          ),
          //const SizedBox(height: 16),
          SizedBox(height: Get.height * 0.02),

          // Confirm Password Field
          _buildLabel("Confirm password", themeColor),
          //const SizedBox(height: 8),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: emailController,
            hintText: 'Confirm password',
            obscureText: !isConfirmPasswordVisible, // Toggle based on visibility
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: IconButton(
              icon: Icon(
                isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off,
                color: themeColor,
              ),
              onPressed: () {
                setState(() {
                  isConfirmPasswordVisible = !isConfirmPasswordVisible;
                });
              },
            ),
          ),
          //const SizedBox(height: 50),
          SizedBox(height: Get.height * 0.06),

          // Save Button
          CustomButton(
            text: "Save",
            onPressed: (){},
          ),
          //const SizedBox(height: 20),
          SizedBox(height: Get.height * 0.03),
        ],
      ),
    );
  }

  Widget _buildLabel(String text, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          //fontSize: 14,
          fontSize: Get.width * 0.04, // Responsive font size,
        ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(leading: InkWell(onTap: (){
        Get.back();
      },
          child: Icon(Icons.arrow_back,color: Colors.white,)),
        backgroundColor: Color(0xFF16423C),
        title: Text("Change Password",style: TextStyle(color: Colors.white,
        fontSize:  Get.width * 0.045,),),),
      body: Column(
        children: [

          //SizedBox(height: 40,),
          SizedBox(height: Get.height * 0.04),

          Padding(
            //padding: const EdgeInsets.all(15.0),
            padding: EdgeInsets.all(Get.width * 0.03),
            child: _buildRegisterTab(const Color((0xFF004643))),
          )
        ],
      ),
    );
  }
}
