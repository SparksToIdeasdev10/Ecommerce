// // // edit_address_controller.dart
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import 'edit_address_apiservices.dart';
// // import 'edit_address_model.dart';
// //
// //
// //
// // class EditAddressController extends GetxController {
// //   var isLoading = false.obs;
// //   var addressData = AddressData().obs;
// //
// //   // Shipping Address Controllers
// //   final TextEditingController shipAddress1Controller = TextEditingController();
// //   final TextEditingController shipAddress2Controller = TextEditingController();
// //   final TextEditingController shipZipController = TextEditingController();
// //   final TextEditingController shipCityController = TextEditingController();
// //   final TextEditingController shipCountryController = TextEditingController();
// //   final TextEditingController shipCompanyController = TextEditingController();
// //
// //   // Billing Address Controllers
// //   final TextEditingController billAddress1Controller = TextEditingController();
// //   final TextEditingController billAddress2Controller = TextEditingController();
// //   final TextEditingController billZipController = TextEditingController();
// //   final TextEditingController billCityController = TextEditingController();
// //   final TextEditingController billCountryController = TextEditingController();
// //   final TextEditingController billCompanyController = TextEditingController();
// //
// //   // Get token from SharedPreferences
// //   Future<String?> getToken() async {
// //     try {
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       String? token = prefs.getString('token');
// //       print("🔑 Retrieved token for address: $token");
// //       return token;
// //     } catch (e) {
// //       print("❌ Error getting token: $e");
// //       return null;
// //     }
// //   }
// //
// //   // Fetch current address data
// //   Future<void> fetchUserAddress() async {
// //     try {
// //       isLoading.value = true;
// //
// //       String? token = await getToken();
// //
// //       if (token == null || token.isEmpty) {
// //         Get.snackbar("Error", "Please login again");
// //         return;
// //       }
// //
// //       // Call the API service
// //       final addressResponse = await AddressApiService().fetchAddress(token);
// //
// //       if (addressResponse.status) {
// //         addressData.value = addressResponse.data;
// //
// //         // Fill the form with address data
// //         _fillFormWithAddressData(addressResponse.data);
// //
// //         print("✅ Address Data Loaded:");
// //         print("   Shipping Address: ${addressResponse.data.shipAddress1}");
// //         print("   Shipping City: ${addressResponse.data.shipCity}");
// //         print("   Billing Address: ${addressResponse.data.billAddress1}");
// //         print("   Billing City: ${addressResponse.data.billCity}");
// //
// //         Get.snackbar("Success", "Address loaded successfully!");
// //       } else {
// //         Get.snackbar("Error", "Failed to load address");
// //       }
// //     } catch (e) {
// //       print("❌ Error fetching address: $e");
// //       Get.snackbar(
// //         "Error",
// //         "Failed to fetch address: $e",
// //         snackPosition: SnackPosition.BOTTOM,
// //       );
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   // Fill form with address data
// //   void _fillFormWithAddressData(AddressData address) {
// //     // Shipping Address
// //     shipAddress1Controller.text = address.shipAddress1 ?? '';
// //     shipAddress2Controller.text = address.shipAddress2 ?? '';
// //     shipZipController.text = address.shipZip ?? '';
// //     shipCityController.text = address.shipCity ?? '';
// //     shipCountryController.text = address.shipCountry ?? '';
// //     shipCompanyController.text = address.shipCompany ?? '';
// //
// //     // Billing Address
// //     billAddress1Controller.text = address.billAddress1 ?? '';
// //     billAddress2Controller.text = address.billAddress2 ?? '';
// //     billZipController.text = address.billZip ?? '';
// //     billCityController.text = address.billCity ?? '';
// //     billCountryController.text = address.billCountry ?? '';
// //     billCompanyController.text = address.billCompany ?? '';
// //
// //     print("📝 Address Form filled with data");
// //   }
// //
// //   // Update address
// //   Future<void> updateUserAddress() async {
// //     try {
// //       isLoading.value = true;
// //
// //       String? token = await getToken();
// //
// //       if (token == null || token.isEmpty) {
// //         Get.snackbar("Error", "Please login again");
// //         return;
// //       }
// //
// //       // Validation for required fields
// //       if (shipAddress1Controller.text.isEmpty ||
// //           shipZipController.text.isEmpty ||
// //           shipCityController.text.isEmpty ||
// //           shipCountryController.text.isEmpty ||
// //           billAddress1Controller.text.isEmpty ||
// //           billZipController.text.isEmpty ||
// //           billCityController.text.isEmpty ||
// //           billCountryController.text.isEmpty) {
// //         Get.snackbar(
// //           "Error",
// //           "Please fill all required fields",
// //           snackPosition: SnackPosition.BOTTOM,
// //         );
// //         return;
// //       }
// //
// //       print("🔄 Updating address with:");
// //       print("   Shipping: ${shipAddress1Controller.text}, ${shipCityController.text}");
// //       print("   Billing: ${billAddress1Controller.text}, ${billCityController.text}");
// //
// //       // Call the UPDATE API
// //       final updateResponse = await AddressApiService().updateAddress(
// //         token: token,
// //         shipAddress1: shipAddress1Controller.text,
// //         shipAddress2: shipAddress2Controller.text,
// //         shipZip: shipZipController.text,
// //         shipCity: shipCityController.text,
// //         shipCountry: shipCountryController.text,
// //         shipCompany: shipCompanyController.text,
// //         billAddress1: billAddress1Controller.text,
// //         billAddress2: billAddress2Controller.text,
// //         billZip: billZipController.text,
// //         billCity: billCityController.text,
// //         billCountry: billCountryController.text,
// //         billCompany: billCompanyController.text,
// //       );
// //
// //       if (updateResponse.status) {
// //         // SUCCESS - Address updated
// //         Get.snackbar(
// //           "Success",
// //           updateResponse.message,
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.green,
// //           colorText: Colors.white,
// //         );
// //
// //         print("✅ Address updated successfully!");
// //         print("   New Shipping: ${updateResponse.data.shipAddress1}");
// //         print("   New Billing: ${updateResponse.data.billAddress1}");
// //
// //         // Update the local data
// //         addressData.value = updateResponse.data;
// //
// //       } else {
// //         Get.snackbar("Error", updateResponse.message);
// //       }
// //     } catch (e) {
// //       print("❌ Error updating address: $e");
// //       Get.snackbar(
// //         "Error",
// //         "Failed to update address: $e",
// //         snackPosition: SnackPosition.BOTTOM,
// //         backgroundColor: Colors.red,
// //         colorText: Colors.white,
// //       );
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// //
// //   @override
// //   void onClose() {
// //     // Dispose all controllers
// //     shipAddress1Controller.dispose();
// //     shipAddress2Controller.dispose();
// //     shipZipController.dispose();
// //     shipCityController.dispose();
// //     shipCountryController.dispose();
// //     shipCompanyController.dispose();
// //     billAddress1Controller.dispose();
// //     billAddress2Controller.dispose();
// //     billZipController.dispose();
// //     billCityController.dispose();
// //     billCountryController.dispose();
// //     billCompanyController.dispose();
// //     super.onClose();
// //   }
// // }
//
// //
// // // edit_address_controller.dart
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// //
// // import 'edit_address_apiservices.dart';
// // import 'edit_address_model.dart';
// //
// //
// // class EditAddressController extends GetxController {
// //   var isLoading = false.obs;
// //   var addressData = AddressData().obs;
// //   var hasData = false.obs; // Add this to track if we have data
// //
// //   // Shipping Address Controllers
// //   final TextEditingController shipAddress1Controller = TextEditingController();
// //   final TextEditingController shipAddress2Controller = TextEditingController();
// //   final TextEditingController shipZipController = TextEditingController();
// //   final TextEditingController shipCityController = TextEditingController();
// //   final TextEditingController shipCountryController = TextEditingController();
// //   final TextEditingController shipCompanyController = TextEditingController();
// //
// //   // Billing Address Controllers
// //   final TextEditingController billAddress1Controller = TextEditingController();
// //   final TextEditingController billAddress2Controller = TextEditingController();
// //   final TextEditingController billZipController = TextEditingController();
// //   final TextEditingController billCityController = TextEditingController();
// //   final TextEditingController billCountryController = TextEditingController();
// //   final TextEditingController billCompanyController = TextEditingController();
// //
// //   // Get token from SharedPreferences
// //   Future<String?> getToken() async {
// //     try {
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       String? token = prefs.getString('token');
// //       print("🔑 Retrieved token for address: $token");
// //       return token;
// //     } catch (e) {
// //       print("❌ Error getting token: $e");
// //       return null;
// //     }
// //   }
// //
// //   // Fetch current address data
// //   // Future<void> fetchUserAddress() async {
// //   //   try {
// //   //     isLoading.value = true;
// //   //     hasData.value = false;
// //   //
// //   //     String? token = await getToken();
// //   //
// //   //     if (token == null || token.isEmpty) {
// //   //       Get.snackbar("Error", "Please login again");
// //   //       return;
// //   //     }
// //   //
// //   //     print("🔄 Fetching address data...");
// //   //
// //   //     // Call the API service
// //   //     final addressResponse = await AddressApiService().fetchAddress(token);
// //   //
// //   //     if (addressResponse.status) {
// //   //       addressData.value = addressResponse.data;
// //   //       hasData.value = true;
// //   //
// //   //       // Fill the form with address data
// //   //       _fillFormWithAddressData(addressResponse.data);
// //   //
// //   //       print("✅ Address Data Loaded Successfully:");
// //   //       print("   Shipping Address: ${addressResponse.data.shipAddress1}");
// //   //       print("   Shipping City: ${addressResponse.data.shipCity}");
// //   //       print("   Shipping Zip: ${addressResponse.data.shipZip}");
// //   //       print("   Billing Address: ${addressResponse.data.billAddress1}");
// //   //       print("   Billing City: ${addressResponse.data.billCity}");
// //   //
// //   //       // Get.snackbar("Success", "Address loaded successfully!");
// //   //     } else {
// //   //       print("❌ Failed to load address: ${addressResponse.message}");
// //   //       Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
// //   //     }
// //   //   } catch (e) {
// //   //     print("❌ Error fetching address: $e");
// //   //     Get.snackbar(
// //   //       "Error",
// //   //       "Failed to fetch address: $e",
// //   //       snackPosition: SnackPosition.BOTTOM,
// //   //     );
// //   //   } finally {
// //   //     isLoading.value = false;
// //   //   }
// //   // }
// //
// //   // In your EditAddressController, update the fetchUserAddress method:
// //   // Future<void> fetchUserAddress() async {
// //   //   try {
// //   //     isLoading.value = true;
// //   //     hasData.value = false;
// //   //
// //   //     String? token = await getToken();
// //   //
// //   //     if (token == null || token.isEmpty) {
// //   //       Get.snackbar("Error", "Please login again");
// //   //       return;
// //   //     }
// //   //
// //   //     print("🔄 Fetching address data...");
// //   //
// //   //     // Call the API service
// //   //     final addressResponse = await AddressApiService().fetchAddress(token);
// //   //
// //   //     if (addressResponse.status) {
// //   //       addressData.value = addressResponse.data;
// //   //
// //   //       // Check if we have any actual address data (not all null)
// //   //       bool hasValidData = _hasValidAddressData(addressResponse.data);
// //   //       hasData.value = hasValidData;
// //   //
// //   //       // Fill the form with address data (even if null, it will be empty)
// //   //       _fillFormWithAddressData(addressResponse.data);
// //   //
// //   //       print("✅ Address Data Loaded Successfully:");
// //   //       print("   Shipping Address: ${addressResponse.data.shipAddress1}");
// //   //       print("   Shipping City: ${addressResponse.data.shipCity}");
// //   //       print("   Shipping Zip: ${addressResponse.data.shipZip}");
// //   //       print("   Billing Address: ${addressResponse.data.billAddress1}");
// //   //       print("   Billing City: ${addressResponse.data.billCity}");
// //   //       print("   Has Valid Data: $hasValidData");
// //   //
// //   //       if (!hasValidData) {
// //   //         print("ℹ️ No address data found. User needs to add address.");
// //   //       }
// //   //
// //   //     } else {
// //   //       print("❌ Failed to load address: ${addressResponse.message}");
// //   //       Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
// //   //     }
// //   //   } catch (e) {
// //   //     print("❌ Error fetching address: $e");
// //   //     Get.snackbar(
// //   //       "Error",
// //   //       "Failed to fetch address: $e",
// //   //       snackPosition: SnackPosition.BOTTOM,
// //   //     );
// //   //   } finally {
// //   //     isLoading.value = false;
// //   //   }
// //   // }
// //   // In your EditAddressController, update the fetchUserAddress method:
// //   Future<void> fetchUserAddress() async {
// //     try {
// //       isLoading.value = true;
// //       hasData.value = false;
// //
// //       String? token = await getToken();
// //
// //       if (token == null || token.isEmpty) {
// //         Get.snackbar("Error", "Please login again");
// //         return;
// //       }
// //
// //       print("🔄 Fetching address data...");
// //
// //       // Call the API service
// //       final addressResponse = await AddressApiService().fetchAddress(token);
// //
// //       if (addressResponse.status) {
// //         addressData.value = addressResponse.data;
// //
// //         // Always set hasData to true if API returns success
// //         // Even if some fields are null, we have the data structure
// //         hasData.value = true;
// //
// //         // Fill the form with address data
// //         //_fillFormWithAddressData(addressResponse.data);
// //
// //         print("✅ Address Data Loaded Successfully:");
// //         print("   Shipping Address: ${addressResponse.data.shipAddress1}");
// //         print("   Shipping City: ${addressResponse.data.shipCity}");
// //         print("   Shipping Zip: ${addressResponse.data.shipZip}");
// //         print("   Billing Address: ${addressResponse.data.billAddress1}");
// //         print("   Billing City: ${addressResponse.data.billCity}");
// //         print("   Has Data: true");
// //
// //       } else {
// //         print("❌ Failed to load address: ${addressResponse.message}");
// //         Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
// //       }
// //     } catch (e) {
// //       print("❌ Error fetching address: $e");
// //       Get.snackbar(
// //         "Error",
// //         "Failed to fetch address: $e",
// //         snackPosition: SnackPosition.BOTTOM,
// //       );
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
// // }
//
// // edit_address_controller.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'edit_address_apiservices.dart';
// import 'edit_address_model.dart';
//
// class EditAddressController extends GetxController {
//   var isLoading = false.obs;
//   var addressData = AddressData().obs;
//   var hasData = false.obs;
//   var hasShownSnackbar = false.obs; // Track if snackbar was shown
//
//   // Your existing controllers - DON'T CHANGE
//   final TextEditingController shipAddress1Controller = TextEditingController();
//   final TextEditingController shipAddress2Controller = TextEditingController();
//   final TextEditingController shipZipController = TextEditingController();
//   final TextEditingController shipCityController = TextEditingController();
//   final TextEditingController shipCountryController = TextEditingController();
//   final TextEditingController shipCompanyController = TextEditingController();
//
//   final TextEditingController billAddress1Controller = TextEditingController();
//   final TextEditingController billAddress2Controller = TextEditingController();
//   final TextEditingController billZipController = TextEditingController();
//   final TextEditingController billCityController = TextEditingController();
//   final TextEditingController billCountryController = TextEditingController();
//   final TextEditingController billCompanyController = TextEditingController();
//
//   // Your existing getToken method - DON'T CHANGE
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print("🔑 Retrieved token for address: $token");
//       return token;
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   // Updated fetch method with snackbar logic
//   Future<void> fetchUserAddress() async {
//     try {
//       isLoading.value = true;
//       hasData.value = false;
//
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         if (!hasShownSnackbar.value) {
//           Get.snackbar("Error", "Please login again");
//           hasShownSnackbar.value = true;
//         }
//         return;
//       }
//
//       print("🔄 Fetching address data...");
//
//       final addressResponse = await AddressApiService().fetchAddress(token);
//       print("${addressResponse.data}");
//
//       if (addressResponse.status) {
//         addressData.value = addressResponse.data;
//
//         // Check if we have valid address data
//         bool hasValidData = _hasValidAddressData(addressResponse.data);
//         hasData.value = hasValidData;
//
//         // Fill form with data
//         _fillFormWithAddressData(addressResponse.data);
//
//         print("✅ Address Data Loaded Successfully");
//         print("   Has Valid Data: $hasValidData");
//
//         // Show snackbar only once if no address data
//         if (!hasValidData && !hasShownSnackbar.value) {
//           WidgetsBinding.instance.addPostFrameCallback((_) {
//             Get.snackbar(
//               "Address Required",
//               "Please update your address to continue",
//               snackPosition: SnackPosition.BOTTOM,
//               duration: Duration(seconds: 3),
//             );
//           });
//           hasShownSnackbar.value = true;
//         }
//       } else {
//         print("❌ Failed to load address: ${addressResponse.message}");
//         if (!hasShownSnackbar.value) {
//           Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
//           hasShownSnackbar.value = true;
//         }
//       }
//     } catch (e) {
//       print("❌ Error fetching address: $e");
//       if (!hasShownSnackbar.value) {
//         Get.snackbar(
//           "Error",
//           "Failed to fetch address: $e",
//           snackPosition: SnackPosition.BOTTOM,
//         );
//         hasShownSnackbar.value = true;
//       }
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Helper method to check if we have valid address data
//   bool _hasValidAddressData(AddressData data) {
//     return (data.shipAddress1 != null && data.shipAddress1!.isNotEmpty) ||
//         (data.billAddress1 != null && data.billAddress1!.isNotEmpty);
//   }
//
//   // Method to fill form with address data
//   void _fillFormWithAddressData(AddressData data) {
//     // Shipping address
//     shipAddress1Controller.text = data.shipAddress1 ?? '';
//     shipAddress2Controller.text = data.shipAddress2 ?? '';
//     shipZipController.text = data.shipZip ?? '';
//     shipCityController.text = data.shipCity ?? '';
//     shipCountryController.text = data.shipCountry ?? '';
//     shipCompanyController.text = data.shipCompany ?? '';
//
//     // Billing address
//     billAddress1Controller.text = data.billAddress1 ?? '';
//     billAddress2Controller.text = data.billAddress2 ?? '';
//     billZipController.text = data.billZip ?? '';
//     billCityController.text = data.billCity ?? '';
//     billCountryController.text = data.billCountry ?? '';
//     billCompanyController.text = data.billCompany ?? '';
//   }
//
//   // Add update method if not exists
//   // Future<void> updateUserAddress() async {
//   //   try {
//   //     isLoading.value = true;
//   //
//   //     String? token = await getToken();
//   //     if (token == null || token.isEmpty) {
//   //       Get.snackbar("Error", "Please login again");
//   //       return;
//   //     }
//   //
//   //     final response = await AddressApiService().updateAddress(
//   //       token: token,
//   //       shipAddress1: shipAddress1Controller.text.trim(),
//   //       shipAddress2: shipAddress2Controller.text.trim(),
//   //       shipZip: shipZipController.text.trim(),
//   //       shipCity: shipCityController.text.trim(),
//   //       shipCountry: shipCountryController.text.trim(),
//   //       billAddress1: billAddress1Controller.text.trim(),
//   //       billAddress2: billAddress2Controller.text.trim(),
//   //       billZip: billZipController.text.trim(),
//   //       billCity: billCityController.text.trim(),
//   //       billCountry: billCountryController.text.trim(),
//   //       shipCompany: shipCompanyController.text.trim(),
//   //       billCompany: billCompanyController.text.trim(),
//   //     );
//   //
//   //     if (response.status) {
//   //       Get.snackbar("Success", "Address updated successfully!");
//   //       Get.back();
//   //       fetchUserAddress();
//   //     } else {
//   //       Get.snackbar("Error", response.message);
//   //     }
//   //   } catch (e) {
//   //     Get.snackbar("Error", "Failed to update address: $e");
//   //   } finally {
//   //     isLoading.value = false;
//   //   }
//   // }
//
// // In EditAddressController
// //   Future<void> updateUserAddress() async {
// //     try {
// //       isLoading.value = true;
// //
// //       String? token = await getToken();
// //       if (token == null || token.isEmpty) {
// //         Get.snackbar("Error", "Please login again");
// //         isLoading.value = false;
// //         return;
// //       }
// //
// //       // Get values from text controllers
// //       String shipAddress1 = shipAddress1Controller.text.trim();
// //       String shipAddress2 = shipAddress2Controller.text.trim();
// //       String shipZip = shipZipController.text.trim();
// //       String shipCity = shipCityController.text.trim();
// //       String shipCountry = shipCountryController.text.trim();
// //       String shipCompany = shipCompanyController.text.trim();
// //
// //       String billAddress1 = billAddress1Controller.text.trim();
// //       String billAddress2 = billAddress2Controller.text.trim();
// //       String billZip = billZipController.text.trim();
// //       String billCity = billCityController.text.trim();
// //       String billCountry = billCountryController.text.trim();
// //       String billCompany = billCompanyController.text.trim();
// //
// //       // Validate required fields
// //       if (shipAddress1.isEmpty || shipZip.isEmpty || shipCity.isEmpty || shipCountry.isEmpty ||
// //           billAddress1.isEmpty || billZip.isEmpty || billCity.isEmpty || billCountry.isEmpty) {
// //         Get.snackbar("Error", "Please fill all required fields");
// //         isLoading.value = false;
// //         return;
// //       }
// //
// //       print("🔄 Calling UPDATE API...");
// //       print("📤 Shipping Address: $shipAddress1, $shipCity, $shipZip, $shipCountry");
// //       print("📤 Billing Address: $billAddress1, $billCity, $billZip, $billCountry");
// //
// //       // Call the UPDATE API
// //       final response = await AddressApiService().updateAddress(
// //         token: token,
// //         shipAddress1: shipAddress1,
// //         shipAddress2: shipAddress2,
// //         shipZip: shipZip,
// //         shipCity: shipCity,
// //         shipCountry: shipCountry,
// //         shipCompany: shipCompany,
// //         billAddress1: billAddress1,
// //         billAddress2: billAddress2,
// //         billZip: billZip,
// //         billCity: billCity,
// //         billCountry: billCountry,
// //         billCompany: billCompany,
// //       );
// //
// //       print("✅ Update API Response - Status: ${response.status}");
// //       print("✅ Update API Response - Message: ${response.message}");
// //
// //       if (response.status) {
// //         // Update successful
// //         Get.snackbar("Success", "Address updated successfully!");
// //
// //         // Update local data
// //         addressData.value = response.data;
// //         hasData.value = true;
// //
// //         // Go back to previous screen
// //         Get.back();
// //
// //       } else {
// //         // Update failed
// //         Get.snackbar("Error", response.message);
// //       }
// //
// //     } catch (e) {
// //       print("❌ Error in updateUserAddress: $e");
// //       Get.snackbar("Error", "Failed to update address: $e");
// //     } finally {
// //       isLoading.value = false;
// //     }
// //   }
//
//
// }


// // edit_address_controller.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'edit_address_apiservices.dart';
// import 'edit_address_model.dart';
//
//
//
// class EditAddressController extends GetxController {
//   var isLoading = false.obs;
//   var addressData = AddressData().obs;
//
//   // Shipping Address Controllers
//   final TextEditingController shipAddress1Controller = TextEditingController();
//   final TextEditingController shipAddress2Controller = TextEditingController();
//   final TextEditingController shipZipController = TextEditingController();
//   final TextEditingController shipCityController = TextEditingController();
//   final TextEditingController shipCountryController = TextEditingController();
//   final TextEditingController shipCompanyController = TextEditingController();
//
//   // Billing Address Controllers
//   final TextEditingController billAddress1Controller = TextEditingController();
//   final TextEditingController billAddress2Controller = TextEditingController();
//   final TextEditingController billZipController = TextEditingController();
//   final TextEditingController billCityController = TextEditingController();
//   final TextEditingController billCountryController = TextEditingController();
//   final TextEditingController billCompanyController = TextEditingController();
//
//   // Get token from SharedPreferences
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print("🔑 Retrieved token for address: $token");
//       return token;
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   // Fetch current address data
//   Future<void> fetchUserAddress() async {
//     try {
//       isLoading.value = true;
//
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         Get.snackbar("Error", "Please login again");
//         return;
//       }
//
//       // Call the API service
//       final addressResponse = await AddressApiService().fetchAddress(token);
//
//       if (addressResponse.status) {
//         addressData.value = addressResponse.data;
//
//         // Fill the form with address data
//         _fillFormWithAddressData(addressResponse.data);
//
//         print("✅ Address Data Loaded:");
//         print("   Shipping Address: ${addressResponse.data.shipAddress1}");
//         print("   Shipping City: ${addressResponse.data.shipCity}");
//         print("   Billing Address: ${addressResponse.data.billAddress1}");
//         print("   Billing City: ${addressResponse.data.billCity}");
//
//         Get.snackbar("Success", "Address loaded successfully!");
//       } else {
//         Get.snackbar("Error", "Failed to load address");
//       }
//     } catch (e) {
//       print("❌ Error fetching address: $e");
//       Get.snackbar(
//         "Error",
//         "Failed to fetch address: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Fill form with address data
//   void _fillFormWithAddressData(AddressData address) {
//     // Shipping Address
//     shipAddress1Controller.text = address.shipAddress1 ?? '';
//     shipAddress2Controller.text = address.shipAddress2 ?? '';
//     shipZipController.text = address.shipZip ?? '';
//     shipCityController.text = address.shipCity ?? '';
//     shipCountryController.text = address.shipCountry ?? '';
//     shipCompanyController.text = address.shipCompany ?? '';
//
//     // Billing Address
//     billAddress1Controller.text = address.billAddress1 ?? '';
//     billAddress2Controller.text = address.billAddress2 ?? '';
//     billZipController.text = address.billZip ?? '';
//     billCityController.text = address.billCity ?? '';
//     billCountryController.text = address.billCountry ?? '';
//     billCompanyController.text = address.billCompany ?? '';
//
//     print("📝 Address Form filled with data");
//   }
//
//   // Update address
//   Future<void> updateUserAddress() async {
//     try {
//       isLoading.value = true;
//
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         Get.snackbar("Error", "Please login again");
//         return;
//       }
//
//       // Validation for required fields
//       if (shipAddress1Controller.text.isEmpty ||
//           shipZipController.text.isEmpty ||
//           shipCityController.text.isEmpty ||
//           shipCountryController.text.isEmpty ||
//           billAddress1Controller.text.isEmpty ||
//           billZipController.text.isEmpty ||
//           billCityController.text.isEmpty ||
//           billCountryController.text.isEmpty) {
//         Get.snackbar(
//           "Error",
//           "Please fill all required fields",
//           snackPosition: SnackPosition.BOTTOM,
//         );
//         return;
//       }
//
//       print("🔄 Updating address with:");
//       print("   Shipping: ${shipAddress1Controller.text}, ${shipCityController.text}");
//       print("   Billing: ${billAddress1Controller.text}, ${billCityController.text}");
//
//       // Call the UPDATE API
//       final updateResponse = await AddressApiService().updateAddress(
//         token: token,
//         shipAddress1: shipAddress1Controller.text,
//         shipAddress2: shipAddress2Controller.text,
//         shipZip: shipZipController.text,
//         shipCity: shipCityController.text,
//         shipCountry: shipCountryController.text,
//         shipCompany: shipCompanyController.text,
//         billAddress1: billAddress1Controller.text,
//         billAddress2: billAddress2Controller.text,
//         billZip: billZipController.text,
//         billCity: billCityController.text,
//         billCountry: billCountryController.text,
//         billCompany: billCompanyController.text,
//       );
//
//       if (updateResponse.status) {
//         // SUCCESS - Address updated
//         Get.snackbar(
//           "Success",
//           updateResponse.message,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//         );
//
//         print("✅ Address updated successfully!");
//         print("   New Shipping: ${updateResponse.data.shipAddress1}");
//         print("   New Billing: ${updateResponse.data.billAddress1}");
//
//         // Update the local data
//         addressData.value = updateResponse.data;
//
//       } else {
//         Get.snackbar("Error", updateResponse.message);
//       }
//     } catch (e) {
//       print("❌ Error updating address: $e");
//       Get.snackbar(
//         "Error",
//         "Failed to update address: $e",
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   @override
//   void onClose() {
//     // Dispose all controllers
//     shipAddress1Controller.dispose();
//     shipAddress2Controller.dispose();
//     shipZipController.dispose();
//     shipCityController.dispose();
//     shipCountryController.dispose();
//     shipCompanyController.dispose();
//     billAddress1Controller.dispose();
//     billAddress2Controller.dispose();
//     billZipController.dispose();
//     billCityController.dispose();
//     billCountryController.dispose();
//     billCompanyController.dispose();
//     super.onClose();
//   }
// }

//
// // edit_address_controller.dart
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'edit_address_apiservices.dart';
// import 'edit_address_model.dart';
//
//
// class EditAddressController extends GetxController {
//   var isLoading = false.obs;
//   var addressData = AddressData().obs;
//   var hasData = false.obs; // Add this to track if we have data
//
//   // Shipping Address Controllers
//   final TextEditingController shipAddress1Controller = TextEditingController();
//   final TextEditingController shipAddress2Controller = TextEditingController();
//   final TextEditingController shipZipController = TextEditingController();
//   final TextEditingController shipCityController = TextEditingController();
//   final TextEditingController shipCountryController = TextEditingController();
//   final TextEditingController shipCompanyController = TextEditingController();
//
//   // Billing Address Controllers
//   final TextEditingController billAddress1Controller = TextEditingController();
//   final TextEditingController billAddress2Controller = TextEditingController();
//   final TextEditingController billZipController = TextEditingController();
//   final TextEditingController billCityController = TextEditingController();
//   final TextEditingController billCountryController = TextEditingController();
//   final TextEditingController billCompanyController = TextEditingController();
//
//   // Get token from SharedPreferences
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print("🔑 Retrieved token for address: $token");
//       return token;
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   // Fetch current address data
//   // Future<void> fetchUserAddress() async {
//   //   try {
//   //     isLoading.value = true;
//   //     hasData.value = false;
//   //
//   //     String? token = await getToken();
//   //
//   //     if (token == null || token.isEmpty) {
//   //       Get.snackbar("Error", "Please login again");
//   //       return;
//   //     }
//   //
//   //     print("🔄 Fetching address data...");
//   //
//   //     // Call the API service
//   //     final addressResponse = await AddressApiService().fetchAddress(token);
//   //
//   //     if (addressResponse.status) {
//   //       addressData.value = addressResponse.data;
//   //       hasData.value = true;
//   //
//   //       // Fill the form with address data
//   //       _fillFormWithAddressData(addressResponse.data);
//   //
//   //       print("✅ Address Data Loaded Successfully:");
//   //       print("   Shipping Address: ${addressResponse.data.shipAddress1}");
//   //       print("   Shipping City: ${addressResponse.data.shipCity}");
//   //       print("   Shipping Zip: ${addressResponse.data.shipZip}");
//   //       print("   Billing Address: ${addressResponse.data.billAddress1}");
//   //       print("   Billing City: ${addressResponse.data.billCity}");
//   //
//   //       // Get.snackbar("Success", "Address loaded successfully!");
//   //     } else {
//   //       print("❌ Failed to load address: ${addressResponse.message}");
//   //       Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
//   //     }
//   //   } catch (e) {
//   //     print("❌ Error fetching address: $e");
//   //     Get.snackbar(
//   //       "Error",
//   //       "Failed to fetch address: $e",
//   //       snackPosition: SnackPosition.BOTTOM,
//   //     );
//   //   } finally {
//   //     isLoading.value = false;
//   //   }
//   // }
//
//   // In your EditAddressController, update the fetchUserAddress method:
//   // Future<void> fetchUserAddress() async {
//   //   try {
//   //     isLoading.value = true;
//   //     hasData.value = false;
//   //
//   //     String? token = await getToken();
//   //
//   //     if (token == null || token.isEmpty) {
//   //       Get.snackbar("Error", "Please login again");
//   //       return;
//   //     }
//   //
//   //     print("🔄 Fetching address data...");
//   //
//   //     // Call the API service
//   //     final addressResponse = await AddressApiService().fetchAddress(token);
//   //
//   //     if (addressResponse.status) {
//   //       addressData.value = addressResponse.data;
//   //
//   //       // Check if we have any actual address data (not all null)
//   //       bool hasValidData = _hasValidAddressData(addressResponse.data);
//   //       hasData.value = hasValidData;
//   //
//   //       // Fill the form with address data (even if null, it will be empty)
//   //       _fillFormWithAddressData(addressResponse.data);
//   //
//   //       print("✅ Address Data Loaded Successfully:");
//   //       print("   Shipping Address: ${addressResponse.data.shipAddress1}");
//   //       print("   Shipping City: ${addressResponse.data.shipCity}");
//   //       print("   Shipping Zip: ${addressResponse.data.shipZip}");
//   //       print("   Billing Address: ${addressResponse.data.billAddress1}");
//   //       print("   Billing City: ${addressResponse.data.billCity}");
//   //       print("   Has Valid Data: $hasValidData");
//   //
//   //       if (!hasValidData) {
//   //         print("ℹ️ No address data found. User needs to add address.");
//   //       }
//   //
//   //     } else {
//   //       print("❌ Failed to load address: ${addressResponse.message}");
//   //       Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
//   //     }
//   //   } catch (e) {
//   //     print("❌ Error fetching address: $e");
//   //     Get.snackbar(
//   //       "Error",
//   //       "Failed to fetch address: $e",
//   //       snackPosition: SnackPosition.BOTTOM,
//   //     );
//   //   } finally {
//   //     isLoading.value = false;
//   //   }
//   // }
//   // In your EditAddressController, update the fetchUserAddress method:
//   Future<void> fetchUserAddress() async {
//     try {
//       isLoading.value = true;
//       hasData.value = false;
//
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         Get.snackbar("Error", "Please login again");
//         return;
//       }
//
//       print("🔄 Fetching address data...");
//
//       // Call the API service
//       final addressResponse = await AddressApiService().fetchAddress(token);
//
//       if (addressResponse.status) {
//         addressData.value = addressResponse.data;
//
//         // Always set hasData to true if API returns success
//         // Even if some fields are null, we have the data structure
//         hasData.value = true;
//
//         // Fill the form with address data
//         //_fillFormWithAddressData(addressResponse.data);
//
//         print("✅ Address Data Loaded Successfully:");
//         print("   Shipping Address: ${addressResponse.data.shipAddress1}");
//         print("   Shipping City: ${addressResponse.data.shipCity}");
//         print("   Shipping Zip: ${addressResponse.data.shipZip}");
//         print("   Billing Address: ${addressResponse.data.billAddress1}");
//         print("   Billing City: ${addressResponse.data.billCity}");
//         print("   Has Data: true");
//
//       } else {
//         print("❌ Failed to load address: ${addressResponse.message}");
//         Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
//       }
//     } catch (e) {
//       print("❌ Error fetching address: $e");
//       Get.snackbar(
//         "Error",
//         "Failed to fetch address: $e",
//         snackPosition: SnackPosition.BOTTOM,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
// }

// edit_address_controller.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'edit_address_apiservices.dart';
import 'edit_address_model.dart';

class EditAddressController extends GetxController {
  var isLoading = false.obs;
  var addressData = AddressData().obs;
  var hasData = false.obs;
  var hasShownSnackbar = false.obs; // Track if snackbar was shown
  var addressUpdateSuccess = false.obs;


  // Your existing controllers - DON'T CHANGE
  final TextEditingController shipAddress1Controller = TextEditingController();
  final TextEditingController shipAddress2Controller = TextEditingController();
  final TextEditingController shipZipController = TextEditingController();
  final TextEditingController shipCityController = TextEditingController();
  final TextEditingController shipCountryController = TextEditingController();
  final TextEditingController shipCompanyController = TextEditingController();

  final TextEditingController billAddress1Controller = TextEditingController();
  final TextEditingController billAddress2Controller = TextEditingController();
  final TextEditingController billZipController = TextEditingController();
  final TextEditingController billCityController = TextEditingController();
  final TextEditingController billCountryController = TextEditingController();
  final TextEditingController billCompanyController = TextEditingController();

  // Your existing getToken method - DON'T CHANGE
  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token for address: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

  // Updated fetch method with snackbar logic
  // Future<void> fetchUserAddress() async {
  //   try {
  //     isLoading.value = true;
  //     hasData.value = false;
  //
  //     String? token = await getToken();
  //
  //     if (token == null || token.isEmpty) {
  //       if (!hasShownSnackbar.value) {
  //         Get.snackbar("Error", "Please login again");
  //         hasShownSnackbar.value = true;
  //       }
  //       return;
  //     }
  //
  //     print("🔄 Fetching address data...");
  //
  //     final addressResponse = await AddressApiService().fetchAddress(token);
  //
  //     if (addressResponse.status) {
  //       addressData.value = addressResponse.data;
  //
  //       // Check if we have valid address data
  //       bool hasValidData = _hasValidAddressData(addressResponse.data);
  //       hasData.value = hasValidData;
  //
  //       // Fill form with data
  //       _fillFormWithAddressData(addressResponse.data);
  //
  //       print("✅ Address Data Loaded Successfully");
  //       print("   Has Valid Data: $hasValidData");
  //
  //       // Show snackbar only once if no address data
  //       if (!hasValidData && !hasShownSnackbar.value) {
  //         WidgetsBinding.instance.addPostFrameCallback((_) {
  //           Get.snackbar(
  //             "Address Required",
  //             "Please update your address to continue",
  //             snackPosition: SnackPosition.BOTTOM,
  //             duration: Duration(seconds: 3),
  //           );
  //         });
  //         hasShownSnackbar.value = true;
  //       }
  //     } else {
  //       print("❌ Failed to load address: ${addressResponse.message}");
  //       if (!hasShownSnackbar.value) {
  //         Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
  //         hasShownSnackbar.value = true;
  //       }
  //     }
  //   } catch (e) {
  //     print("❌ Error fetching address: $e");
  //     if (!hasShownSnackbar.value) {
  //       Get.snackbar(
  //         "Error",
  //         "Failed to fetch address: $e",
  //         snackPosition: SnackPosition.BOTTOM,
  //       );
  //       hasShownSnackbar.value = true;
  //     }
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  Future<void> fetchUserAddress() async {
    try {
      isLoading.value = true;
      hasData.value = false;

      String? token = await getToken();

      if (token == null || token.isEmpty) {
        if (!hasShownSnackbar.value) {
          // Use delay to show snackbar after build
          Future.delayed(Duration(milliseconds: 500), () {
            if (!hasShownSnackbar.value) {
              Get.snackbar(
                "Error",
                "Please login again",
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 3),
              );
              hasShownSnackbar.value = true;
            }
          });
        }
        return;
      }

      print("🔄 Fetching address data...");

      final addressResponse = await AddressApiService().fetchAddress(token);

      if (addressResponse.status) {
        addressData.value = addressResponse.data;

        // Check if we have valid address data
        bool hasValidData = _hasValidAddressData(addressResponse.data);

        // Use delay to update observables after build
        Future.delayed(Duration.zero, () {
          hasData.value = hasValidData;
        });

        // Fill form with data
        _fillFormWithAddressData(addressResponse.data);

        print("✅ Address Data Loaded Successfully");
        print("   Has Valid Data: $hasValidData");

        // Show snackbar only once if no address data
        if (!hasValidData && !hasShownSnackbar.value) {
          Future.delayed(Duration(milliseconds: 500), () {
            if (!hasShownSnackbar.value) {
              Get.snackbar(
                "Address Required",
                "Please update your address to continue",
                snackPosition: SnackPosition.BOTTOM,
                duration: Duration(seconds: 3),
              );
              hasShownSnackbar.value = true;
            }
          });
        }
      } else {
        print("❌ Failed to load address: ${addressResponse.message}");
        if (!hasShownSnackbar.value) {
          Future.delayed(Duration(milliseconds: 500), () {
            if (!hasShownSnackbar.value) {
              Get.snackbar(
                  "Error",
                  "Failed to load address: ${addressResponse.message}"
              );
              hasShownSnackbar.value = true;
            }
          });
        }
      }
    } catch (e) {
      print("❌ Error fetching address: $e");
      if (!hasShownSnackbar.value) {
        Future.delayed(Duration(milliseconds: 500), () {
          if (!hasShownSnackbar.value) {
            Get.snackbar(
              "Error",
              "Failed to fetch address: $e",
              snackPosition: SnackPosition.BOTTOM,
            );
            hasShownSnackbar.value = true;
          }
        });
      }
    } finally {
      // Use delay to update isLoading after build
      Future.delayed(Duration.zero, () {
        isLoading.value = false;
      });
    }
  }

  // Helper method to check if we have valid address data
  bool _hasValidAddressData(AddressData data) {
    return (data.shipAddress1 != null && data.shipAddress1!.isNotEmpty) ||
        (data.billAddress1 != null && data.billAddress1!.isNotEmpty);
  }

  // Method to fill form with address data
  void _fillFormWithAddressData(AddressData data) {
    // Shipping address
    shipAddress1Controller.text = data.shipAddress1 ?? '';
    shipAddress2Controller.text = data.shipAddress2 ?? '';
    shipZipController.text = data.shipZip ?? '';
    shipCityController.text = data.shipCity ?? '';
    shipCountryController.text = data.shipCountry ?? '';
    shipCompanyController.text = data.shipCompany ?? '';

    // Billing address
    billAddress1Controller.text = data.billAddress1 ?? '';
    billAddress2Controller.text = data.billAddress2 ?? '';
    billZipController.text = data.billZip ?? '';
    billCityController.text = data.billCity ?? '';
    billCountryController.text = data.billCountry ?? '';
    billCompanyController.text = data.billCompany ?? '';
  }

  // Add update method if not exists
  // Future<void> updateUserAddress() async {
  //   try {
  //     isLoading.value = true;
  //
  //     String? token = await getToken();
  //     if (token == null || token.isEmpty) {
  //       Get.snackbar("Error", "Please login again");
  //       return;
  //     }
  //
  //     final response = await AddressApiService().updateAddress(
  //       token: token,
  //       shipAddress1: shipAddress1Controller.text.trim(),
  //       shipAddress2: shipAddress2Controller.text.trim(),
  //       shipZip: shipZipController.text.trim(),
  //       shipCity: shipCityController.text.trim(),
  //       shipCountry: shipCountryController.text.trim(),
  //       billAddress1: billAddress1Controller.text.trim(),
  //       billAddress2: billAddress2Controller.text.trim(),
  //       billZip: billZipController.text.trim(),
  //       billCity: billCityController.text.trim(),
  //       billCountry: billCountryController.text.trim(),
  //       shipCompany: shipCompanyController.text.trim(),
  //       billCompany: billCompanyController.text.trim(),
  //     );
  //
  //     if (response.status) {
  //       Get.snackbar("Success", "Address updated successfully!",
  //         snackPosition: SnackPosition.BOTTOM,
  //         backgroundColor: Colors.green,
  //         colorText: Colors.white,
  //         duration: Duration(seconds: 2),
  //         margin: EdgeInsets.all(10),
  //         borderRadius: 10,);
  //       Get.back();
  //       fetchUserAddress();
  //     } else {
  //       Get.snackbar("Error", response.message);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to update address: $e",
  //       snackPosition: SnackPosition.BOTTOM,
  //       backgroundColor: Colors.red,
  //       colorText: Colors.white);
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  // Future<void> updateUserAddress() async {
  //   try {
  //     isLoading.value = true;
  //
  //     String? token = await getToken();
  //     if (token == null || token.isEmpty) {
  //       // Show snackbar after a tiny delay
  //       Future.delayed(Duration(milliseconds: 100), () {
  //         Get.snackbar("Error", "Please login again");
  //       });
  //       return;
  //     }
  //
  //     final response = await AddressApiService().updateAddress(
  //       token: token,
  //       shipAddress1: shipAddress1Controller.text.trim(),
  //       shipAddress2: shipAddress2Controller.text.trim(),
  //       shipZip: shipZipController.text.trim(),
  //       shipCity: shipCityController.text.trim(),
  //       shipCountry: shipCountryController.text.trim(),
  //       billAddress1: billAddress1Controller.text.trim(),
  //       billAddress2: billAddress2Controller.text.trim(),
  //       billZip: billZipController.text.trim(),
  //       billCity: billCityController.text.trim(),
  //       billCountry: billCountryController.text.trim(),
  //       shipCompany: shipCompanyController.text.trim(),
  //       billCompany: billCompanyController.text.trim(),
  //     );
  //
  //     if (response.status) {
  //       // SIMPLE SNACKBAR - Add this line
  //       Get.snackbar("✅ Success", "Address updated successfully!",
  //         snackPosition: SnackPosition.BOTTOM,
  //         duration: Duration(seconds: 2),);
  //
  //       // Your existing code - keep this as is
  //       //Get.back();
  //       // Close screen AFTER snackbar is done
  //       Future.delayed(Duration(seconds: 2), () {
  //         Get.back(); // now it will work
  //       });
  //       fetchUserAddress();
  //     } else {
  //       Get.snackbar("Error", response.message);
  //     }
  //   } catch (e) {
  //     Get.snackbar("Error", "Failed to update address: $e");
  //   } finally {
  //     isLoading.value = false;
  //   }
  // }
  Future<void> updateUserAddress() async {
    try {
      isLoading.value = true;

      String? token = await getToken();
      if (token == null || token.isEmpty) {
        // Show error without Get.closeCurrentSnackbar() since it causes LateInitializationError
        Get.snackbar(
          "❌ Error",
          "Please login again",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          titleText: Text(
            "❌ Error",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          messageText: Text(
            "Please login again",
            style: TextStyle(color: Colors.white),
          ),
          margin: EdgeInsets.all(10),
          borderRadius: 10,
          isDismissible: true,
        );
        isLoading.value = false;
        return;
      }

      final response = await AddressApiService().updateAddress(
        token: token,
        shipAddress1: shipAddress1Controller.text.trim(),
        shipAddress2: shipAddress2Controller.text.trim(),
        shipZip: shipZipController.text.trim(),
        shipCity: shipCityController.text.trim(),
        shipCountry: shipCountryController.text.trim(),
        billAddress1: billAddress1Controller.text.trim(),
        billAddress2: billAddress2Controller.text.trim(),
        billZip: billZipController.text.trim(),
        billCity: billCityController.text.trim(),
        billCountry: billCountryController.text.trim(),
        shipCompany: shipCompanyController.text.trim(),
        billCompany: billCompanyController.text.trim(),
      );

      if (response.status) {
        // Show success snackbar - SIMPLE VERSION
        Get.snackbar(
          "✅ Success",
          "Address updated successfully!",
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.green,
          titleText: Text(
            "✅ Success",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          messageText: Text(
            "Address updated successfully!",
            style: TextStyle(color: Colors.white),
          ),
          margin: EdgeInsets.all(10),
          borderRadius: 10,
          isDismissible: true,
        );

        // Update success flag
        addressUpdateSuccess.value = true;

        // Delay navigation to ensure snackbar is visible
        await Future.delayed(Duration(seconds: 2));

        // Navigate back WITHOUT Get.back() - let the screen handle it
        // Get.back(); // REMOVE THIS LINE - it's causing the error

        // Refresh data
        await fetchUserAddress();
      } else {
        // Show API error
        Get.snackbar(
          "❌ Error",
          response.message,
          snackPosition: SnackPosition.BOTTOM,
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red,
          titleText: Text(
            "❌ Error",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          messageText: Text(
            response.message,
            style: TextStyle(color: Colors.white),
          ),
          margin: EdgeInsets.all(10),
          borderRadius: 10,
        );
      }
    } catch (e) {
      // Show exception error
      Get.snackbar(
        "❌ Error",
        "Failed to update address: $e",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(seconds: 3),
        backgroundColor: Colors.red,
        titleText: Text(
          "❌ Error",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        messageText: Text(
          "Failed to update address: ${e.toString()}",
          style: TextStyle(color: Colors.white),
        ),
        margin: EdgeInsets.all(10),
        borderRadius: 10,
      );
    } finally {
      isLoading.value = false;
    }
  }
}