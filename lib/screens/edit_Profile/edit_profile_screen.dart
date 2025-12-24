import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../customs/buttonscreen.dart';
import '../../customs/textfields.dart';
import 'edit_profile_controller.dart';

class editprofilescreen extends StatefulWidget {

  editprofilescreen({super.key});


  @override
  State<editprofilescreen> createState() => _editprofilescreenState();
}


class _editprofilescreenState extends State<editprofilescreen> {

  final EditProfileController _controller = Get.put(EditProfileController());


  final themeColor = const Color(0xFF004643);


  @override
  void initState() {
    super.initState();
    _controller.fetchUserProfile();
    // _fillFormWithData();
  }




  // This will be called when profile data is loaded
  // void _fillFormWithData() {
  //   if (_controller.profileData.isNotEmpty) {
  //     final user = _controller.profileData;
  //
  //     // Combine first_name and last_name
  //     String fullName = '${user['first_name'] ?? ''} ${user['last_name'] ?? ''}'.trim();
  //     fullnameController.text = fullName;
  //     mobileController.text = user['phone'] ?? '';
  //     emailController.text = user['email'] ?? '';
  //
  //     print("📝 Form filled with data:");
  //     print("Full Name: $fullName");
  //     print("Phone: ${user['phone']}");
  //     print("Email: ${user['email']}");
  //   }
  // }


  // Widget _buildRegisterTab(Color themeColor) {
  //   return SingleChildScrollView(
  //     child: Column(
  //       children: [
  //         // Full Name Field
  //         _buildLabel("Full Name", themeColor),
  //         //const SizedBox(height: 8),
  //         SizedBox(height: Get.height * 0.01),
  //         CustomTextField(
  //           controller: _controller.fullnameController,
  //           hintText: 'Enter your full name',
  //           obscureText: false,
  //           borderColor: Colors.grey[300]!,
  //           focusedBorderColor: themeColor,
  //           isRequired: true,
  //           borderRadius: 25,
  //           suffixIcon: Icon(Icons.edit_outlined),
  //         ),
  //         //const SizedBox(height: 16),
  //         SizedBox(height: Get.height * 0.02),
  //
  //         // Mobile Number Field
  //         _buildLabel("Mobile Number", themeColor),
  //         //const SizedBox(height: 8),
  //         SizedBox(height: Get.height * 0.01),
  //         CustomTextField(
  //           controller: _controller.mobileController,
  //           hintText: 'Enter your Number',
  //           obscureText: false,
  //           borderColor: Colors.grey[300]!,
  //           focusedBorderColor: themeColor,
  //           isRequired: true,
  //           borderRadius: 25,
  //           suffixIcon: Icon(Icons.edit_outlined),
  //
  //         ),
  //        // const SizedBox(height: 16),
  //         SizedBox(height: Get.height * 0.02),
  //
  //         // Email Field
  //         _buildLabel("Email", themeColor),
  //         //const SizedBox(height: 8),
  //         SizedBox(height: Get.height * 0.01),
  //         CustomTextField(
  //           controller: _controller.emailController,
  //           hintText: 'Enter your email',
  //           obscureText: false,
  //           borderColor: Colors.grey[300]!,
  //           focusedBorderColor: themeColor,
  //           isRequired: true,
  //           borderRadius: 25,
  //           suffixIcon: Icon(Icons.edit_outlined),
  //
  //         ),
  //         //const SizedBox(height: 50),
  //         SizedBox(height: Get.height * 0.06),
  //
  //         //Register Button
  //         CustomButton(
  //           text: "Save",
  //           onPressed: (){},
  //         ),
  //         //In your _buildRegisterTab method, update the button:
  //
  //         const SizedBox(height: 20),
  //         SizedBox(height: Get.height * 0.02),
  //
  //       ],
  //     ),
  //   );
  // }

  // In your editprofilescreen.dart - UPDATE the button part
  Widget _buildRegisterTab(Color themeColor) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Full Name Field
          _buildLabel("Full Name", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.fullnameController,
            hintText: 'Enter your full name',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Mobile Number Field
          _buildLabel("Mobile Number", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.mobileController,
            hintText: 'Enter your Number',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Email Field
          _buildLabel("Email", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.emailController,
            hintText: 'Enter your email',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.06),

          // Save Button - FIXED: Now calls updateUserProfile
          Obx(() => _controller.isLoading.value
              ? Center(
            child: CircularProgressIndicator(),
          )
              : CustomButton(
            text: "Save",
            onPressed: () {
              // Validation
              if (_controller.fullnameController.text.isEmpty ||
                  _controller.mobileController.text.isEmpty ||
                  _controller.emailController.text.isEmpty) {
                Get.snackbar(
                  "Error",
                  "Please fill all fields",
                  snackPosition: SnackPosition.BOTTOM,
                );
                return;
              }

              // Call UPDATE method (not fetch!)
              _controller.updateUserProfile();
            },
          ),
          ),
          SizedBox(height: Get.height * 0.02),
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
          fontSize: Get.width * 0.04,
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
      title: Text("Edit Profile",style: TextStyle(color: Colors.white),),),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                Center(
                  child: Padding(
                    padding: EdgeInsets.only(top: Get.height * 0.03),
                    child: CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage("assets/images/editimage.png"),
                    ),
                  ),
                ),
        
                Positioned(
                  //top: 100,
                  top: Get.width * 0.25,
                    //right: 160,
                    right: Get.width * 0.38,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF16423C),
                        child: Icon(Icons.camera_alt_outlined,color: Colors.white,)))
              ],
            ),
            SizedBox(height: 40,),
            // Padding(
            //   padding: const EdgeInsets.only(top: 50,left: 10),
            //   child: Text("Card Number",style: TextStyle(color: Color(0xFF16423C),
            //       fontWeight: FontWeight.bold,fontSize: 20),),
            // ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: _buildRegisterTab(Color((0xFF004643))),
            )
          ],
        ),
      ),
    );
  }
}
