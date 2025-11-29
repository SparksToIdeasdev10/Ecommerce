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
  Future<void> fetchUserAddress() async {
    try {
      isLoading.value = true;
      hasData.value = false;

      String? token = await getToken();

      if (token == null || token.isEmpty) {
        if (!hasShownSnackbar.value) {
          Get.snackbar("Error", "Please login again");
          hasShownSnackbar.value = true;
        }
        return;
      }

      print("🔄 Fetching address data...");

      final addressResponse = await AddressApiService().fetchAddress(token);

      if (addressResponse.status) {
        addressData.value = addressResponse.data;

        // Check if we have valid address data
        bool hasValidData = _hasValidAddressData(addressResponse.data);
        hasData.value = hasValidData;

        // Fill form with data
        _fillFormWithAddressData(addressResponse.data);

        print("✅ Address Data Loaded Successfully");
        print("   Has Valid Data: $hasValidData");

        // Show snackbar only once if no address data
        if (!hasValidData && !hasShownSnackbar.value) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            Get.snackbar(
              "Address Required",
              "Please update your address to continue",
              snackPosition: SnackPosition.BOTTOM,
              duration: Duration(seconds: 3),
            );
          });
          hasShownSnackbar.value = true;
        }
      } else {
        print("❌ Failed to load address: ${addressResponse.message}");
        if (!hasShownSnackbar.value) {
          Get.snackbar("Error", "Failed to load address: ${addressResponse.message}");
          hasShownSnackbar.value = true;
        }
      }
    } catch (e) {
      print("❌ Error fetching address: $e");
      if (!hasShownSnackbar.value) {
        Get.snackbar(
          "Error",
          "Failed to fetch address: $e",
          snackPosition: SnackPosition.BOTTOM,
        );
        hasShownSnackbar.value = true;
      }
    } finally {
      isLoading.value = false;
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
  Future<void> updateUserAddress() async {
    try {
      isLoading.value = true;

      String? token = await getToken();
      if (token == null || token.isEmpty) {
        Get.snackbar("Error", "Please login again");
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
        Get.snackbar("Success", "Address updated successfully!");
        Get.back();
        fetchUserAddress();
      } else {
        Get.snackbar("Error", response.message);
      }
    } catch (e) {
      Get.snackbar("Error", "Failed to update address: $e");
    } finally {
      isLoading.value = false;
    }
  }
}