// // import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// //
// // import '../../customs/buttonscreen.dart';
// //
// // class editaddressscreen extends StatefulWidget {
// //   const editaddressscreen({super.key});
// //
// //   @override
// //   State<editaddressscreen> createState() => _editaddressscreenState();
// // }
// //
// // class _editaddressscreenState extends State<editaddressscreen> {
// //   final editaddressController controllers = Get.put(editaddressController());
// //
// //   @override
// //   void initState() {
// //     controllers.addressdata();
// //     super.initState();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final screenWidth = MediaQuery.of(context).size.width;
// //     final screenHeight = MediaQuery.of(context).size.height;
// //
// //     return Scaffold(
// //       appBar: AppBar(
// //         backgroundColor: Color(0xFF16423C),
// //         leading: InkWell(
// //           onTap: () {
// //             Get.back();
// //           },
// //           child: Icon(Icons.arrow_back, color: Colors.white),
// //         ),
// //         title: Text("Edit Address", style: TextStyle(color: Colors.white)),
// //       ),
// //       body: Obx(() {
// //         // Show loading while data is being fetched
// //         if (controllers.issearchloading.value) {
// //           return Center(
// //             child: Column(
// //               mainAxisAlignment: MainAxisAlignment.center,
// //               children: [
// //                 CircularProgressIndicator(),
// //                 SizedBox(height: 16),
// //                 Text("Loading addresses..."),
// //               ],
// //             ),
// //           );
// //         }
// //
// //         final addressData = controllers.searchresponse.value.data;
// //
// //         return SingleChildScrollView(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.start,
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               Padding(
// //                 padding: const EdgeInsets.only(top: 20, left: 20),
// //                 child: Text(
// //                   "Choose Your Location",
// //                   style: TextStyle(
// //                     color: Color(0xFF16423C),
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 20,
// //                   ),
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //
// //               // Display API data for the first address section
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
// //                 child: Text(
// //                   addressData.shipAddress1 ?? "406 Akshat Tower, Nr. Pakwan Hotel, ",
// //                   style: TextStyle(fontSize: 16),
// //                 ),
// //               ),
// //               Padding(
// //                 padding: const EdgeInsets.only(left: 10),
// //                 child: Text(
// //                   "${addressData.shipCity ?? "Bodakdev"}, ${addressData.shipZip ?? "Ahmdabad - 380001"}",
// //                   style: TextStyle(fontSize: 16),
// //                 ),
// //               ),
// //               SizedBox(height: 20),
// //
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
// //                 child: Container(
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(20),
// //                     color: Colors.white,
// //                   ),
// //                   height: 60,
// //                   width: 380,
// //                   child: Align(
// //                     alignment: Alignment.centerLeft,
// //                     child: Padding(
// //                       padding: const EdgeInsets.only(left: 10),
// //                       child: Row(
// //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                         children: [
// //                           Icon(Icons.location_on_outlined),
// //                           Text("Enter your Promocode", style: TextStyle(fontSize: 18)),
// //                           Padding(
// //                             padding: const EdgeInsets.only(right: 10),
// //                             child: Icon(Icons.settings),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                   ),
// //                 ),
// //               ),
// //
// //               Padding(
// //                 padding: const EdgeInsets.all(8.0),
// //                 child: Text(
// //                   "Select Your Location",
// //                   style: TextStyle(
// //                     color: Color(0xFF16423C),
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //
// //               // First address card with API data
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
// //                 child: Container(
// //                   decoration: BoxDecoration(
// //                     borderRadius: BorderRadius.circular(12),
// //                     color: Colors.white,
// //                   ),
// //                   height: 80,
// //                   width: 380,
// //                   child: Row(
// //                     children: [
// //                       CircleAvatar(
// //                         backgroundImage: AssetImage("assets/images/img.png"),
// //                         radius: 35,
// //                         child: Icon(
// //                           Icons.location_on_outlined,
// //                           color: Color(0xFF16423C),
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Padding(
// //                             padding: const EdgeInsets.only(left: 40),
// //                             child: Text(
// //                               addressData.shipAddress1 ?? "406 Akshat Tower, Nr. Pakwan Hotel, ",
// //                               style: TextStyle(fontSize: 14),
// //                             ),
// //                           ),
// //                           Padding(
// //                             padding: const EdgeInsets.only(left: 40),
// //                             child: Text(
// //                               "${addressData.shipCity ?? "Bodakdev"}, ${addressData.shipZip ?? "Ahmdabad - 380001"}",
// //                               style: TextStyle(fontSize: 14),
// //                             ),
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //
// //               // Second address card with API data (billing address)
// //
// //
// //               SizedBox(height: 60),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
// //                 child: CustomButton(
// //                   text: "Confirm",
// //                   onPressed: () {
// //                     print("Confirm button pressed!");
// //                   },
// //                 ),
// //               ),
// //             ],
// //           ),
// //         );
// //       }),
// //     );
// //   }
// // }
//
//
//
// // editaddressscreen.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../customs/buttonscreen.dart';
// import '../../customs/textfields.dart';
// import 'edit_address_controller.dart'; // Import the new controller
//
// class EditAddressScreen extends StatefulWidget {
//   const EditAddressScreen({super.key});
//
//   @override
//   State<EditAddressScreen> createState() => _EditAddressScreenState();
// }
//
// class _EditAddressScreenState extends State<EditAddressScreen> {
//   final EditAddressController _controller = Get.put(EditAddressController());
//   final themeColor = const Color(0xFF004643);
//
//   @override
//   void initState() {
//     super.initState();
//     _controller.fetchUserAddress();
//   }
//
//   Widget _buildAddressForm(Color themeColor) {
//     return SingleChildScrollView(
//       child: Column(
//         children: [
//           // Shipping Address Section
//           _buildSectionHeader("Shipping Address", themeColor),
//           SizedBox(height: Get.height * 0.02),
//
//           // Shipping Address Line 1
//           _buildLabel("Shipping Address Line 1", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.shipAddress1Controller,
//             hintText: 'Enter shipping address line 1',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: true,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Shipping Address Line 2
//           _buildLabel("Shipping Address Line 2", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.shipAddress2Controller,
//             hintText: 'Enter shipping address line 2',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: false,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Shipping Zip Code
//           _buildLabel("Zip Code", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.shipZipController,
//             hintText: 'Enter zip code',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: true,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Shipping City
//           _buildLabel("City", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.shipCityController,
//             hintText: 'Enter city',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: true,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Shipping Country
//           _buildLabel("Country", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.shipCountryController,
//             hintText: 'Enter country',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: true,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Shipping Company
//
//           SizedBox(height: Get.height * 0.04),
//
//
//           // Billing Address Line 1
//           _buildLabel("Billing Address Line 1", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.billAddress1Controller,
//             hintText: 'Enter billing address line 1',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: true,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Billing Address Line 2
//
//           SizedBox(height: Get.height * 0.02),
//
//           // Billing Zip Code
//           _buildLabel("Zip Code", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.billZipController,
//             hintText: 'Enter zip code',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: true,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Billing City
//           _buildLabel("City", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.billCityController,
//             hintText: 'Enter city',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: true,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Billing Country
//           _buildLabel("Country", themeColor),
//           SizedBox(height: Get.height * 0.01),
//           CustomTextField(
//             controller: _controller.billCountryController,
//             hintText: 'Enter country',
//             obscureText: false,
//             borderColor: Colors.grey[300]!,
//             focusedBorderColor: themeColor,
//             isRequired: true,
//             borderRadius: 25,
//             suffixIcon: Icon(Icons.edit_outlined),
//           ),
//           SizedBox(height: Get.height * 0.02),
//
//           // Billing Company
//
//           SizedBox(height: Get.height * 0.06),
//
//           // Save Button
//           Obx(() => _controller.isLoading.value
//               ? Center(
//             child: CircularProgressIndicator(),
//           )
//               : CustomButton(
//             text: "Save Address",
//             onPressed: () {
//             //  _controller.updateUserAddress();
//             },
//           ),
//           ),
//           // Save Button
//
//           SizedBox(height: Get.height * 0.02),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildSectionHeader(String text, Color color) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: TextStyle(
//           color: color,
//           fontWeight: FontWeight.bold,
//           fontSize: Get.width * 0.045,
//         ),
//       ),
//     );
//   }
//
//   Widget _buildLabel(String text, Color color) {
//     return Align(
//       alignment: Alignment.centerLeft,
//       child: Text(
//         text,
//         style: TextStyle(
//           color: color,
//           fontWeight: FontWeight.bold,
//           fontSize: Get.width * 0.04,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(Icons.arrow_back, color: Colors.white),
//         ),
//         backgroundColor: Color(0xFF16423C),
//         title: Text("Edit Address", style: TextStyle(color: Colors.white)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(15.0),
//         child: _buildAddressForm(Color(0xFF004643)),
//       ),
//     );
//   }
// }


// import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../customs/buttonscreen.dart';
//
// class editaddressscreen extends StatefulWidget {
//   const editaddressscreen({super.key});
//
//   @override
//   State<editaddressscreen> createState() => _editaddressscreenState();
// }
//
// class _editaddressscreenState extends State<editaddressscreen> {
//   final editaddressController controllers = Get.put(editaddressController());
//
//   @override
//   void initState() {
//     controllers.addressdata();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF16423C),
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(Icons.arrow_back, color: Colors.white),
//         ),
//         title: Text("Edit Address", style: TextStyle(color: Colors.white)),
//       ),
//       body: Obx(() {
//         // Show loading while data is being fetched
//         if (controllers.issearchloading.value) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 16),
//                 Text("Loading addresses..."),
//               ],
//             ),
//           );
//         }
//
//         final addressData = controllers.searchresponse.value.data;
//
//         return SingleChildScrollView(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top: 20, left: 20),
//                 child: Text(
//                   "Choose Your Location",
//                   style: TextStyle(
//                     color: Color(0xFF16423C),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 20,
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//
//               // Display API data for the first address section
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
//                 child: Text(
//                   addressData.shipAddress1 ?? "406 Akshat Tower, Nr. Pakwan Hotel, ",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 10),
//                 child: Text(
//                   "${addressData.shipCity ?? "Bodakdev"}, ${addressData.shipZip ?? "Ahmdabad - 380001"}",
//                   style: TextStyle(fontSize: 16),
//                 ),
//               ),
//               SizedBox(height: 20),
//
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20),
//                     color: Colors.white,
//                   ),
//                   height: 60,
//                   width: 380,
//                   child: Align(
//                     alignment: Alignment.centerLeft,
//                     child: Padding(
//                       padding: const EdgeInsets.only(left: 10),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Icon(Icons.location_on_outlined),
//                           Text("Enter your Promocode", style: TextStyle(fontSize: 18)),
//                           Padding(
//                             padding: const EdgeInsets.only(right: 10),
//                             child: Icon(Icons.settings),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//
//               Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   "Select Your Location",
//                   style: TextStyle(
//                     color: Color(0xFF16423C),
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                   ),
//                 ),
//               ),
//
//               // First address card with API data
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
//                 child: Container(
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(12),
//                     color: Colors.white,
//                   ),
//                   height: 80,
//                   width: 380,
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundImage: AssetImage("assets/images/img.png"),
//                         radius: 35,
//                         child: Icon(
//                           Icons.location_on_outlined,
//                           color: Color(0xFF16423C),
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                       Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.only(left: 40),
//                             child: Text(
//                               addressData.shipAddress1 ?? "406 Akshat Tower, Nr. Pakwan Hotel, ",
//                               style: TextStyle(fontSize: 14),
//                             ),
//                           ),
//                           Padding(
//                             padding: const EdgeInsets.only(left: 40),
//                             child: Text(
//                               "${addressData.shipCity ?? "Bodakdev"}, ${addressData.shipZip ?? "Ahmdabad - 380001"}",
//                               style: TextStyle(fontSize: 14),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//
//               // Second address card with API data (billing address)
//
//
//               SizedBox(height: 60),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
//                 child: CustomButton(
//                   text: "Confirm",
//                   onPressed: () {
//                     print("Confirm button pressed!");
//                   },
//                 ),
//               ),
//             ],
//           ),
//         );
//       }),
//     );
//   }
// }



// editaddressscreen.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../customs/buttonscreen.dart';
import '../../customs/textfields.dart';
import 'edit_address_controller.dart'; // Import the new controller

class EditAddressScreen extends StatefulWidget {
  const EditAddressScreen({super.key});

  @override
  State<EditAddressScreen> createState() => _EditAddressScreenState();
}

class _EditAddressScreenState extends State<EditAddressScreen> {
  final EditAddressController _controller = Get.put(EditAddressController());
  final themeColor = const Color(0xFF004643);

  @override
  void initState() {
    super.initState();
    // Use WidgetsBinding to run after build is complete
    WidgetsBinding.instance.addPostFrameCallback((_) {
    _controller.fetchUserAddress();
    });

  }

  Widget _buildAddressForm(Color themeColor) {
    return SingleChildScrollView(
      child: Column(

        children: [
          // Shipping Address Section
          _buildSectionHeader("Shipping Address", themeColor),
          SizedBox(height: Get.height * 0.02),

          // Shipping Address Line 1
          _buildLabel("Shipping Address Line 1", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.shipAddress1Controller,
            hintText: 'Enter shipping address line 1',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Shipping Address Line 2
          _buildLabel("Shipping Address Line 2", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.shipAddress2Controller,
            hintText: 'Enter shipping address line 2',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: false,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Shipping Zip Code
          _buildLabel("Zip Code", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.shipZipController,
            hintText: 'Enter zip code',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Shipping City
          _buildLabel("City", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.shipCityController,
            hintText: 'Enter city',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Shipping Country
          _buildLabel("Country", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.shipCountryController,
            hintText: 'Enter country',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Shipping Company

          SizedBox(height: Get.height * 0.04),


          // Billing Address Line 1
          _buildLabel("Billing Address Line 1", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.billAddress1Controller,
            hintText: 'Enter billing address line 1',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Billing Address Line 2

          SizedBox(height: Get.height * 0.02),

          // Billing Zip Code
          _buildLabel("Zip Code", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.billZipController,
            hintText: 'Enter zip code',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Billing City
          _buildLabel("City", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.billCityController,
            hintText: 'Enter city',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Billing Country
          _buildLabel("Country", themeColor),
          SizedBox(height: Get.height * 0.01),
          CustomTextField(
            controller: _controller.billCountryController,
            hintText: 'Enter country',
            obscureText: false,
            borderColor: Colors.grey[300]!,
            focusedBorderColor: themeColor,
            isRequired: true,
            borderRadius: 25,
            suffixIcon: Icon(Icons.edit_outlined),
          ),
          SizedBox(height: Get.height * 0.02),

          // Billing Company

          SizedBox(height: Get.height * 0.06),

          // Save Button
          // Obx(() => _controller.isLoading.value
          //     ? Center(
          //   child: CircularProgressIndicator(),
          // )
          //     : CustomButton(
          //   text: "Save Address",
          //   onPressed: () {
          //   //  _controller.updateUserAddress();
          //   },
          // ),
          // ),
          // Save Button
          // Obx(() => _controller.isLoading.value
          //     ? Center(
          //   child: CircularProgressIndicator(),
          // )
          //     : CustomButton(
          //   text: "Save Address",
          //   onPressed: () {
          //
          //     _controller.updateUserAddress(); // <-- UNCOMMENT THIS LINE
          //   },
          // ),
      Obx(() => _controller.isLoading.value
          ? Center(
        child: CircularProgressIndicator(),
      )
          : CustomButton(
        text: "Save Address",
        onPressed: () async {
          // Call your existing update method
          await _controller.updateUserAddress();
          if (_controller.addressUpdateSuccess.value) {
            // Reset the flag
            _controller.addressUpdateSuccess.value = false;

            // Wait for snackbar to show
            await Future.delayed(Duration(seconds: 2));

            // Navigate back AFTER snackbar
            Get.back();
          }

          // Show snackbar after update completes

        },
      ),
      ),

          SizedBox(height: Get.height * 0.02),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String text, Color color) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Text(
        text,
        style: TextStyle(
          color: color,
          fontWeight: FontWeight.bold,
          fontSize: Get.width * 0.045,
        ),
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
          fontSize: Get.width * 0.04,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        backgroundColor: Color(0xFF16423C),
        title: Text("Edit Address", style: TextStyle(color: Colors.white)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: _buildAddressForm(Color(0xFF004643)),
      ),
    );
  }
}