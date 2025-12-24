// // // // order_controller.dart
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
// // // import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
// // //
// // // import 'order_detail_apiservices.dart';
// // //
// // //
// // //
// // // class OrderController extends GetxController {
// // //   final apio _orderApiService = apio();
// // //   final EditAddressController _addressController = Get.find<EditAddressController>();
// // //   final CartController _cartController = Get.find<CartController>();
// // //
// // //   // States
// // //   var isLoading = false.obs;
// // //   var orderId = 0.obs;
// // //   var errorMessage = ''.obs;
// // //   var isOrderPlaced = false.obs;
// // //
// // //   // Static data as per your example
// // //   final String paymentMethod = 'cod';
// // //   final int shippingId = 1;
// // //   final int stateId = 6;
// // //
// // //   // Static cart data (as per your example)
// // //   final Map<String, dynamic> staticCartData = {
// // //     '535-Red,M': {
// // //       'options_id': [269, 1094],
// // //       'attribute': {
// // //         'names': ['Color', 'Size'],
// // //         'option_name': ['Red', 'M'],
// // //         'option_price': [5, 5]
// // //       },
// // //       'attribute_price': 10,
// // //       'name': '2021 Summer Dress',
// // //       'slug': '2021-Summer-Dress',
// // //       'qty': 1,
// // //       'price': 144.83,
// // //       'main_price': 134.83,
// // //       'photo': 'dress.jpg',
// // //       'item_type': 'normal',
// // //       'item_l_n': null,
// // //       'item_l_k': null
// // //     }
// // //   };
// // //
// // //   // Check if address is available
// // //   bool get hasValidAddress {
// // //     final addressData = _addressController.addressData.value;
// // //     return addressData.shipAddress1 != null &&
// // //         addressData.shipAddress1!.isNotEmpty;
// // //
// // //   }
// // //
// // //   // Create shipping address map
// // //   Map<String, dynamic> _createShippingAddress() {
// // //     final addressData = _addressController.addressData.value;
// // //
// // //     return {
// // //       'ship_first_name': addressData.shipFirstName ?? '',
// // //       'ship_last_name': addressData.shipLastName ?? '',
// // //       'ship_email': addressData.shipEmail ?? '',
// // //       'ship_phone': addressData.shipPhone ?? '',
// // //       'ship_address1': addressData.shipAddress1 ?? '',
// // //       'ship_zip': addressData.shipZip ?? '',
// // //       'ship_city': addressData.shipCity ?? '',
// // //       'ship_country': addressData.shipCountry ?? '',
// // //     };
// // //   }
// // //
// // //   // Create billing address map
// // //   Map<String, dynamic> _createBillingAddress() {
// // //     final addressData = _addressController.addressData.value;
// // //
// // //     // If billing details are separate, use them, otherwise use shipping address
// // //     final hasBillingDetails = addressData.billFirstName != null &&
// // //         addressData.billFirstName!.isNotEmpty;
// // //
// // //
// // //     if (hasBillingDetails) {
// // //       return {
// // //         'bill_first_name': addressData.billFirstName ?? '',
// // //         'bill_last_name': addressData.billLastName ?? '',
// // //         'bill_email': addressData.billEmail ?? '',
// // //         'bill_phone': addressData.billPhone ?? '',
// // //         'bill_address1': addressData.billAddress1 ?? '',
// // //         'bill_zip': addressData.billZip ?? '',
// // //         'bill_city': addressData.billCity ?? '',
// // //         'bill_country': addressData.billCountry ?? '',
// // //       };
// // //     } else {
// // //       // Use shipping address for billing
// // //       return _createShippingAddress();
// // //     }
// // //   }
// // //
// // //   // Create order request
// // //   OrderRequest _createOrderRequest() {
// // //     return OrderRequest(
// // //       address: _createShippingAddress(),
// // //       billing: _createBillingAddress(),
// // //       paymentMethod: paymentMethod,
// // //       shippingId: shippingId,
// // //       stateId: stateId,
// // //       cart: staticCartData, // Using static cart data
// // //     );
// // //   }
// // //
// // //   // Main function to place order
// // //   Future<void> placeOrder() async {
// // //     try {
// // //       // Reset states
// // //       isLoading(true);
// // //       errorMessage('');
// // //       isOrderPlaced(false);
// // //
// // //       // 1. Check if address is available
// // //       if (!hasValidAddress) {
// // //         errorMessage('Please add your shipping address first');
// // //         Get.snackbar(
// // //           'Address Required',
// // //           'Please add your shipping address before placing order',
// // //           snackPosition: SnackPosition.BOTTOM,
// // //           backgroundColor: Colors.orange,
// // //           colorText: Colors.white,
// // //           duration: Duration(seconds: 3),
// // //         );
// // //         return;
// // //       }
// // //
// // //       // 2. Check if cart has items
// // //       if (_cartController.cartItems.isEmpty) {
// // //         errorMessage('Your cart is empty');
// // //         Get.snackbar(
// // //           'Empty Cart',
// // //           'Please add items to your cart before checkout',
// // //           snackPosition: SnackPosition.BOTTOM,
// // //           backgroundColor: Colors.orange,
// // //           colorText: Colors.white,
// // //         );
// // //         return;
// // //       }
// // //
// // //       // 3. Check token availability
// // //       final prefs = await SharedPreferences.getInstance();
// // //       final token = prefs.getString('token');
// // //
// // //       if (token == null || token.isEmpty) {
// // //         errorMessage('Please login to place order');
// // //         Get.snackbar(
// // //           'Login Required',
// // //           'Please login to place order',
// // //           snackPosition: SnackPosition.BOTTOM,
// // //           backgroundColor: Colors.red,
// // //           colorText: Colors.white,
// // //         );
// // //         return;
// // //       }
// // //
// // //       // 4. Create order request
// // //       final orderRequest = _createOrderRequest();
// // //
// // //       // 5. Call API
// // //       final response = await _orderApiService.placeOrder(orderRequest);
// // //
// // //       // 6. Handle response
// // //       if (response.status) {
// // //         orderId(response.orderId);
// // //         isOrderPlaced(true);
// // //
// // //         // Show success message
// // //         Get.snackbar(
// // //           'Success!',
// // //           response.message,
// // //           snackPosition: SnackPosition.BOTTOM,
// // //           backgroundColor: Colors.green,
// // //           colorText: Colors.white,
// // //           duration: Duration(seconds: 2),
// // //         );
// // //
// // //         // Optional: Clear cart after successful order
// // //         // _cartController.clearCart();
// // //
// // //       } else {
// // //         errorMessage(response.message);
// // //         Get.snackbar(
// // //           'Order Failed',
// // //           response.message,
// // //           snackPosition: SnackPosition.BOTTOM,
// // //           backgroundColor: Colors.red,
// // //           colorText: Colors.white,
// // //         );
// // //       }
// // //
// // //     } catch (e) {
// // //       errorMessage(e.toString());
// // //       Get.snackbar(
// // //         'Error',
// // //         e.toString(),
// // //         snackPosition: SnackPosition.BOTTOM,
// // //         backgroundColor: Colors.red,
// // //         colorText: Colors.white,
// // //         duration: Duration(seconds: 3),
// // //       );
// // //     } finally {
// // //       isLoading(false);
// // //     }
// // //   }
// // //
// // //   // Navigate to order screen
// // //   void navigateToOrderScreen() {
// // //     if (isOrderPlaced.value && orderId.value > 0) {
// // //       Get.offAllNamed('/order-screen', arguments: {'orderId': orderId.value});
// // //     } else {
// // //       Get.snackbar(
// // //         'No Order',
// // //         'Please place an order first',
// // //         snackPosition: SnackPosition.BOTTOM,
// // //         backgroundColor: Colors.orange,
// // //         colorText: Colors.white,
// // //       );
// // //     }
// // //   }
// // //
// // //   // Reset controller
// // //   void reset() {
// // //     isLoading(false);
// // //     orderId(0);
// // //     errorMessage('');
// // //     isOrderPlaced(false);
// // //   }
// // // }


//  order_controller.dart
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
// // import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
// // import 'order_detail_apiservices.dart';
// // import 'order_model.dart';
// //
// // class OrderController extends GetxController {
// //   final apio _orderApiService = apio();
// //   final EditAddressController _addressController = Get.find<EditAddressController>();
// //   final CartController _cartController = Get.find<CartController>();
// //
// //   // States
// //   var isLoading = false.obs;
// //   var orderId = 0.obs;
// //   var errorMessage = ''.obs;
// //   var isOrderPlaced = false.obs;
// //
// //   // User data from SharedPreferences
// //   var userFirstName = ''.obs;
// //   var userLastName = ''.obs;
// //   var userFullName = ''.obs;
// //   var userEmail = ''.obs;
// //   var userPhone = ''.obs;
// //
// //   // Static data as per your example
// //   final String paymentMethod = 'cod';
// //   final int shippingId = 1;
// //   final int stateId = 6;
// //
// //   // Static cart data (as per your example)
// //   final Map<String, dynamic> staticCartData = {
// //     '535-Red,M': {
// //       'options_id': [269, 1094],
// //       'attribute': {
// //         'names': ['Color', 'Size'],
// //         'option_name': ['Red', 'M'],
// //         'option_price': [5, 5]
// //       },
// //       'attribute_price': 10,
// //       'name': '2021 Summer Dress',
// //       'slug': '2021-Summer-Dress',
// //       'qty': 1,
// //       'price': 144.83,
// //       'main_price': 134.83,
// //       'photo': 'dress.jpg',
// //       'item_type': 'normal',
// //       'item_l_n': null,
// //       'item_l_k': null
// //     }
// //   };
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     loadUserDataFromPrefs();
// //   }
// //
// //   // Load user data from SharedPreferences
// //   Future<void> loadUserDataFromPrefs() async {
// //     try {
// //       final prefs = await SharedPreferences.getInstance();
// //
// //       userFirstName.value = prefs.getString('user_firstname') ?? '';
// //       userLastName.value = prefs.getString('user_lastname') ?? '';
// //       userFullName.value = prefs.getString('user_fullname') ?? '';
// //       userEmail.value = prefs.getString('user_email') ?? '';
// //       userPhone.value = prefs.getString('user_phone') ?? '';
// //
// //       print('✅ Loaded user data from SharedPreferences:');
// //       print('   First Name: ${userFirstName.value}');
// //       print('   Last Name: ${userLastName.value}');
// //       print('   Full Name: ${userFullName.value}');
// //       print('   Email: ${userEmail.value}');
// //       print('   Phone: ${userPhone.value}');
// //     } catch (e) {
// //       print('❌ Error loading user data from SharedPreferences: $e');
// //     }
// //   }
// //
// //   // Check if user has profile data
// //   Future<bool> hasUserProfile() async {
// //     final prefs = await SharedPreferences.getInstance();
// //     final email = prefs.getString('user_email');
// //     final phone = prefs.getString('user_phone');
// //     return (email != null && email.isNotEmpty) ||
// //         (phone != null && phone.isNotEmpty);
// //   }
// //
// //   // Get complete user profile from SharedPreferences
// //   Future<Map<String, dynamic>> getUserProfileFromPrefs() async {
// //     final prefs = await SharedPreferences.getInstance();
// //
// //     return {
// //       'id': prefs.getString('user_id') ?? '',
// //       'firstName': prefs.getString('user_firstname') ?? '',
// //       'lastName': prefs.getString('user_lastname') ?? '',
// //       'fullName': prefs.getString('user_fullname') ?? '',
// //       'email': prefs.getString('user_email') ?? '',
// //       'phone': prefs.getString('user_phone') ?? '',
// //       'isEmailVerified': prefs.getBool('user_email_verified') ?? false,
// //     };
// //   }
// //
// //   // Check if address is available
// //   bool get hasValidAddress {
// //     final addressData = _addressController.addressData.value;
// //     return addressData.shipAddress1 != null &&
// //         addressData.shipAddress1!.isNotEmpty;
// //   }
// //
// //   // Create shipping address map - using SharedPreferences data as fallback
// //   Future<Map<String, dynamic>> _createShippingAddress() async {
// //     final addressData = _addressController.addressData.value;
// //
// //     // Get user profile from SharedPreferences for fallback
// //     final userProfile = await getUserProfileFromPrefs();
// //
// //     return {
// //
// //
// //       'ship_email': userProfile['id']?.isNotEmpty == true
// //           ? addressData.shipEmail!
// //           : userProfile['email'] ?? '',
// //       'ship_phone': addressData.shipPhone?.isNotEmpty == true
// //           ? addressData.shipPhone!
// //           : userProfile['phone'] ?? '',
// //       'ship_address1': addressData.shipAddress1 ?? '',
// //       'ship_zip': addressData.shipZip ?? '',
// //       'ship_city': addressData.shipCity ?? '',
// //       'ship_country': addressData.shipCountry ?? '',
// //     };
// //   }
// //
// //   // Create billing address map - using SharedPreferences data as fallback
// //   Future<Map<String, dynamic>> _createBillingAddress() async {
// //     final addressData = _addressController.addressData.value;
// //
// //     // Check if we have separate billing details
// //     final hasBillingDetails = addressData.billFirstName != null &&
// //         addressData.billFirstName!.isNotEmpty;
// //
// //     if (hasBillingDetails) {
// //       return {
// //         'bill_first_name': addressData.billFirstName ?? '',
// //         'bill_last_name': addressData.billLastName ?? '',
// //         'bill_email': addressData.billEmail ?? '',
// //         'bill_phone': addressData.billPhone ?? '',
// //         'bill_address1': addressData.billAddress1 ?? '',
// //         'bill_zip': addressData.billZip ?? '',
// //         'bill_city': addressData.billCity ?? '',
// //         'bill_country': addressData.billCountry ?? '',
// //       };
// //     } else {
// //       // Use shipping address for billing, with SharedPreferences fallback
// //       final shippingAddress = await _createShippingAddress();
// //       return shippingAddress;
// //     }
// //   }
// //
// //   // Create order request
// //   Future<OrderRequest> _createOrderRequest() async {
// //     final shippingAddress = await _createShippingAddress();
// //     final billingAddress = await _createBillingAddress();
// //
// //     print('📦 Creating order request with:');
// //     print('   Shipping Name: ${shippingAddress['ship_first_name']} ${shippingAddress['ship_last_name']}');
// //     print('   Shipping Email: ${shippingAddress['ship_email']}');
// //     print('   Shipping Phone: ${shippingAddress['ship_phone']}');
// //
// //     return OrderRequest(
// //       address: shippingAddress,
// //       billing: billingAddress,
// //       paymentMethod: paymentMethod,
// //       shippingId: shippingId,
// //       stateId: stateId,
// //       cart: staticCartData, // Using static cart data
// //     );
// //   }
// //
// //   // Validate all requirements before placing order
// //   Future<String?> validateOrderRequirements() async {
// //     // Check if user has profile
// //     if (!await hasUserProfile()) {
// //       return 'Please complete your profile first';
// //     }
// //
// //     // Check if address is available
// //     if (!hasValidAddress) {
// //       return 'Please add your shipping address';
// //     }
// //
// //     // Check if cart has items
// //     if (_cartController.cartItems.isEmpty) {
// //       return 'Your cart is empty';
// //     }
// //
// //     // Check token availability
// //     final prefs = await SharedPreferences.getInstance();
// //     final token = prefs.getString('token');
// //     if (token == null || token.isEmpty) {
// //       return 'Please login to place order';
// //     }
// //
// //     return null; // No errors
// //   }
// //
// //   // Main function to place order
// //   Future<void> placeOrder() async {
// //     try {
// //       // Reset states
// //       isLoading(true);
// //       errorMessage('');
// //       isOrderPlaced(false);
// //
// //       // 1. Validate all requirements
// //       final validationError = await validateOrderRequirements();
// //       if (validationError != null) {
// //         errorMessage(validationError);
// //         Get.snackbar(
// //           'Validation Error',
// //           validationError,
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.orange,
// //           colorText: Colors.white,
// //           duration: Duration(seconds: 3),
// //         );
// //         return;
// //       }
// //
// //       // 2. Create order request
// //       final orderRequest = await _createOrderRequest();
// //
// //       // 3. Check token availability
// //       final prefs = await SharedPreferences.getInstance();
// //       final token = prefs.getString('token');
// //
// //       if (token == null || token.isEmpty) {
// //         errorMessage('Please login to place order');
// //         Get.snackbar(
// //           'Login Required',
// //           'Please login to place order',
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.red,
// //           colorText: Colors.white,
// //         );
// //         return;
// //       }
// //
// //       // 4. Call API
// //       final response = await _orderApiService.placeOrder(orderRequest);
// //
// //       // 5. Handle response
// //       if (response.status) {
// //         orderId(response.orderId);
// //         isOrderPlaced(true);
// //
// //         // Show success message
// //         Get.snackbar(
// //           'Success! 🎉',
// //           response.message,
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.green,
// //           colorText: Colors.white,
// //           duration: Duration(seconds: 2),
// //         );
// //
// //         // Log success
// //         print('✅ Order placed successfully!');
// //         print('   Order ID: ${response.orderId}');
// //         print('   Message: ${response.message}');
// //
// //       } else {
// //         errorMessage(response.message);
// //         Get.snackbar(
// //           'Order Failed',
// //           response.message,
// //           snackPosition: SnackPosition.BOTTOM,
// //           backgroundColor: Colors.red,
// //           colorText: Colors.white,
// //         );
// //       }
// //
// //     } catch (e) {
// //       errorMessage(e.toString());
// //       Get.snackbar(
// //         'Error',
// //         e.toString(),
// //         snackPosition: SnackPosition.BOTTOM,
// //         backgroundColor: Colors.red,
// //         colorText: Colors.white,
// //         duration: Duration(seconds: 3),
// //       );
// //     } finally {
// //       isLoading(false);
// //     }
// //   }
// //
// //   // Get user profile summary from SharedPreferences
// //   Future<String> getUserProfileSummary() async {
// //     final userProfile = await getUserProfileFromPrefs();
// //     return '''
// // 📋 User Profile Summary:
// // Name: ${userProfile['fullName']}
// // Email: ${userProfile['email']}
// // Phone: ${userProfile['phone']}
// // Email Verified: ${userProfile['isEmailVerified'] ? 'Yes' : 'No'}
// // ''';
// //   }
// //
// //   // Debug method to print user data
// //   Future<void> debugPrintUserData() async {
// //     final userProfile = await getUserProfileFromPrefs();
// //     print('🔍 Debug - User Profile from SharedPreferences:');
// //     print('   ID: ${userProfile['id']}');
// //     print('   First Name: ${userProfile['firstName']}');
// //     print('   Last Name: ${userProfile['lastName']}');
// //     print('   Full Name: ${userProfile['fullName']}');
// //     print('   Email: ${userProfile['email']}');
// //     print('   Phone: ${userProfile['phone']}');
// //     print('   Email Verified: ${userProfile['isEmailVerified']}');
// //   }
// //
// //   // Navigate to order screen
// //   void navigateToOrderScreen() {
// //     if (isOrderPlaced.value && orderId.value > 0) {
// //       Get.offAllNamed('/order-screen', arguments: {'orderId': orderId.value});
// //     } else {
// //       Get.snackbar(
// //         'No Order',
// //         'Please place an order first',
// //         snackPosition: SnackPosition.BOTTOM,
// //         backgroundColor: Colors.orange,
// //         colorText: Colors.white,
// //       );
// //     }
// //   }
// //
// //   // Reset controller
// //   void reset() {
// //     isLoading(false);
// //     orderId(0);
// //     errorMessage('');
// //     isOrderPlaced(false);
// //   }
// // }
// // order_controller.dart - FIXED VERSION
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
// import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
// import 'order_detail_apiservices.dart';
// import 'order_model.dart';
//
// class OrderController extends GetxController {
//   final apio _orderApiService = apio();
//   final EditAddressController _addressController = Get.find<EditAddressController>();
//   final CartController _cartController = Get.find<CartController>();
//
//   // States
//   var isLoading = false.obs;
//   var orderId = 0.obs;
//   var errorMessage = ''.obs;
//   var isOrderPlaced = false.obs;
//
//   // User data from SharedPreferences
//   var userFirstName = ''.obs;
//   var userLastName = ''.obs;
//   var userFullName = ''.obs;
//   var userEmail = ''.obs;
//   var userPhone = ''.obs;
//
//   // Static data as per your example
//   final String paymentMethod = 'cod';
//   final int shippingId = 1;
//   final int stateId = 6;
//
//   // Static cart data (as per your example)
//   final Map<String, dynamic> staticCartData = {
//     '535-Red,M': {
//       'options_id': [269, 1094],
//       'attribute': {
//         'names': ['Color', 'Size'],
//         'option_name': ['Red', 'M'],
//         'option_price': [5, 5]
//       },
//       'attribute_price': 10,
//       'name': '2021 Summer Dress',
//       'slug': '2021-Summer-Dress',
//       'qty': 1,
//       'price': 144.83,
//       'main_price': 134.83,
//       'photo': 'dress.jpg',
//       'item_type': 'normal',
//       'item_l_n': null,
//       'item_l_k': null
//     }
//   };
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadUserDataFromPrefs();
//   }
//
//   // Load user data from SharedPreferences
//   Future<void> loadUserDataFromPrefs() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//
//       userFirstName.value = prefs.getString('user_firstname') ?? '';
//       userLastName.value = prefs.getString('user_lastname') ?? '';
//       userFullName.value = prefs.getString('user_fullname') ?? '';
//       userEmail.value = prefs.getString('user_email') ?? '';
//       userPhone.value = prefs.getString('user_phone') ?? '';
//
//       print('✅ Loaded user data from SharedPreferences:');
//       print('   First Name: ${userFirstName.value}');
//       print('   Last Name: ${userLastName.value}');
//       print('   Full Name: ${userFullName.value}');
//       print('   Email: ${userEmail.value}');
//       print('   Phone: ${userPhone.value}');
//     } catch (e) {
//       print('❌ Error loading user data from SharedPreferences: $e');
//     }
//   }
//
//   // Check if user has profile data
//   Future<bool> hasUserProfile() async {
//     final prefs = await SharedPreferences.getInstance();
//     final email = prefs.getString('user_email');
//     final phone = prefs.getString('user_phone');
//     return (email != null && email.isNotEmpty) ||
//         (phone != null && phone.isNotEmpty);
//   }
//
//   // Get complete user profile from SharedPreferences
//   Future<Map<String, dynamic>> getUserProfileFromPrefs() async {
//     final prefs = await SharedPreferences.getInstance();
//
//     return {
//       'id': prefs.getString('user_id') ?? '',
//       'firstName': prefs.getString('user_firstname') ?? '',
//       'lastName': prefs.getString('user_lastname') ?? '',
//       'fullName': prefs.getString('user_fullname') ?? '',
//       'email': prefs.getString('user_email') ?? '',
//       'phone': prefs.getString('user_phone') ?? '',
//       'isEmailVerified': prefs.getInt('user_email_verified') ?? 0,
//     };
//   }
//
//   // Check if address is available
//   bool get hasValidAddress {
//     final addressData = _addressController.addressData.value;
//     // Your AddressData has shipAddress1 field
//     return addressData.shipAddress1 != null &&
//         addressData.shipAddress1!.isNotEmpty;
//   }
//
//   // ✅ FIXED: Create shipping address map - using ONLY fields from your AddressData
//   Future<Map<String, dynamic>> _createShippingAddress() async {
//     final addressData = _addressController.addressData.value;
//
//     // Get user profile from SharedPreferences
//     final userProfile = await getUserProfileFromPrefs();
//
//     return {
//       // Name fields from SharedPreferences (user profile)
//       'ship_first_name': userProfile['firstName'] ?? '',
//       'ship_last_name': userProfile['lastName'] ?? '',
//
//       // Email and phone from SharedPreferences (user profile)
//       'ship_email': userProfile['email'] ?? '',
//       'ship_phone': userProfile['phone'] ?? '',
//
//       // Address fields from AddressData model
//       'ship_address1': addressData.shipAddress1 ?? '',
//       'ship_address2': addressData.shipAddress2 ?? '', // Add if needed
//       'ship_zip': addressData.shipZip ?? '',
//       'ship_city': addressData.shipCity ?? '',
//       'ship_country': addressData.shipCountry ?? '',
//       'ship_company': addressData.shipCompany ?? '', // Add if needed
//     };
//   }
//
//   // ✅ FIXED: Create billing address map
//   Future<Map<String, dynamic>> _createBillingAddress() async {
//     final addressData = _addressController.addressData.value;
//     final userProfile = await getUserProfileFromPrefs();
//
//     // Check if we have separate billing address details
//     final hasBillingAddress = addressData.billAddress1 != null &&
//         addressData.billAddress1!.isNotEmpty;
//
//     if (hasBillingAddress) {
//       return {
//         // Name fields from SharedPreferences (same as shipping)
//         'bill_first_name': userProfile['firstName'] ?? '',
//         'bill_last_name': userProfile['lastName'] ?? '',
//
//         // Email and phone from SharedPreferences (same as shipping)
//         'bill_email': userProfile['email'] ?? '',
//         'bill_phone': userProfile['phone'] ?? '',
//
//         // Billing address fields from AddressData
//         'bill_address1': addressData.billAddress1 ?? '',
//         'bill_address2': addressData.billAddress2 ?? '',
//         'bill_zip': addressData.billZip ?? '',
//         'bill_city': addressData.billCity ?? '',
//         'bill_country': addressData.billCountry ?? '',
//         'bill_company': addressData.billCompany ?? '',
//       };
//     } else {
//       // Use shipping address for billing
//       return await _createShippingAddress();
//     }
//   }
//
//   // Create order request
//   Future<OrderRequest> _createOrderRequest() async {
//     final shippingAddress = await _createShippingAddress();
//     final billingAddress = await _createBillingAddress();
//
//     print('📦 Order Request Data:');
//     print('   Shipping Name: ${shippingAddress['ship_first_name']} ${shippingAddress['ship_last_name']}');
//     print('   Shipping Email: ${shippingAddress['ship_email']}');
//     print('   Shipping Phone: ${shippingAddress['ship_phone']}');
//     print('   Shipping Address: ${shippingAddress['ship_address1']}');
//     print('   Billing Name: ${billingAddress['bill_first_name']} ${billingAddress['bill_last_name']}');
//     print('   Billing Email: ${billingAddress['bill_email']}');
//
//     return OrderRequest(
//       address: shippingAddress,
//       billing: billingAddress,
//       paymentMethod: paymentMethod,
//       shippingId: shippingId,
//       stateId: stateId,
//       cart: staticCartData,
//     );
//   }
//
//   // Validate all requirements before placing order
//   Future<String?> validateOrderRequirements() async {
//     // Check if user has profile
//     if (!await hasUserProfile()) {
//       return 'Please complete your profile first';
//     }
//
//     // Check if address is available
//     if (!hasValidAddress) {
//       return 'Please add your shipping address';
//     }
//
//     // Check if cart has items
//     if (_cartController.cartItems.isEmpty) {
//       return 'Your cart is empty';
//     }
//
//     // Check token availability
//     final prefs = await SharedPreferences.getInstance();
//     final token = prefs.getString('token');
//     if (token == null || token.isEmpty) {
//       return 'Please login to place order';
//     }
//
//     return null; // No errors
//   }
//
//   // Main function to place order
//   // Future<void> placeOrder() async {
//   //   try {
//   //     // Reset states
//   //     isLoading(true);
//   //     errorMessage('');
//   //     isOrderPlaced(false);
//   //
//   //     // 1. Validate all requirements
//   //     final validationError = await validateOrderRequirements();
//   //     if (validationError != null) {
//   //       errorMessage(validationError);
//   //       Get.snackbar(
//   //         'Validation Error',
//   //         validationError,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.orange,
//   //         colorText: Colors.white,
//   //         duration: Duration(seconds: 3),
//   //       );
//   //       return;
//   //     }
//   //
//   //     // 2. Get token
//   //     final prefs = await SharedPreferences.getInstance();
//   //     final token = prefs.getString('token');
//   //
//   //     if (token == null || token.isEmpty) {
//   //       errorMessage('Please login to place order');
//   //       Get.snackbar(
//   //         'Login Required',
//   //         'Please login to place order',
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.red,
//   //         colorText: Colors.white,
//   //       );
//   //       return;
//   //     }
//   //
//   //     // 3. Create order request
//   //     final orderRequest = await _createOrderRequest();
//   //
//   //     // 4. Debug print order data
//   //     print('🎯 Sending order data to API:');
//   //     print(orderRequest.toJson());
//   //
//   //     // 5. Call API
//   //     final response = await _orderApiService.orderdata(token, orderRequest);
//   //
//   //     // 6. Handle response
//   //     if (response.status) {
//   //       orderId(response.orderId);
//   //       isOrderPlaced(true);
//   //
//   //       // Show success message
//   //       Get.snackbar(
//   //         'Success! 🎉',
//   //         response.message,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.green,
//   //         colorText: Colors.white,
//   //         duration: Duration(seconds: 2),
//   //       );
//   //
//   //       // Log success
//   //       print('✅ Order placed successfully!');
//   //       print('   Order ID: ${response.orderId}');
//   //       print('   Message: ${response.message}');
//   //
//   //     } else {
//   //       errorMessage(response.message);
//   //       Get.snackbar(
//   //         'Order Failed',
//   //         response.message,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.red,
//   //         colorText: Colors.white,
//   //       );
//   //     }
//   //
//   //   } catch (e) {
//   //     errorMessage(e.toString());
//   //     Get.snackbar(
//   //       'Error',
//   //       e.toString(),
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       backgroundColor: Colors.red,
//   //       colorText: Colors.white,
//   //       duration: Duration(seconds: 3),
//   //     );
//   //     print('❌ Order placement error: $e');
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   // }
//   // In OrderController - make sure it shows errors when API fails
//   Future<void> placeOrder() async {
//     try {
//       isLoading(true);
//       errorMessage('');
//       isOrderPlaced(false);
//
//       // 1. Validate all requirements
//       final validationError = await validateOrderRequirements();
//       if (validationError != null) {
//         errorMessage(validationError);
//         Get.snackbar(
//           'Validation Error',
//           validationError,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.orange,
//           colorText: Colors.white,
//           duration: Duration(seconds: 3),
//         );
//         return;
//       }
//
//       // 2. Get token
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//
//       if (token == null || token.isEmpty) {
//         errorMessage('Please login to place order');
//         Get.snackbar(
//           'Login Required',
//           'Please login to place order',
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//         return;
//       }
//
//       // 3. Create order request
//       final orderRequest = await _createOrderRequest();
//
//       // 4. Call API
//       final response = await _orderApiService.orderdata(token, orderRequest);
//
//       // 5. Handle response
//       if (response.status) {
//         orderId(response.orderId);
//         isOrderPlaced(true);
//
//         print('✅ Order placed successfully! Order ID: ${response.orderId}');
//
//       } else {
//         errorMessage(response.message);
//         Get.snackbar(
//           'Order Failed',
//           response.message,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//
//     } catch (e) {
//       errorMessage(e.toString());
//       Get.snackbar(
//         'Error',
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//         duration: Duration(seconds: 3),
//       );
//       print('❌ Order placement error: $e');
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   // Get user profile summary from SharedPreferences
//   Future<String> getUserProfileSummary() async {
//     final userProfile = await getUserProfileFromPrefs();
//     return '''
// 📋 User Profile Summary:
// Name: ${userProfile['fullName']}
// Email: ${userProfile['email']}
// Phone: ${userProfile['phone']}
// Email Verified: ${(userProfile['isEmailVerified'] ?? 0) == 1 ? 'Yes' : 'No'}
// ''';
//   }
//
//   // Debug method to print user data
//   Future<void> debugPrintUserData() async {
//     final userProfile = await getUserProfileFromPrefs();
//     print('🔍 Debug - User Profile from SharedPreferences:');
//     print('   ID: ${userProfile['id']}');
//     print('   First Name: ${userProfile['firstName']}');
//     print('   Last Name: ${userProfile['lastName']}');
//     print('   Full Name: ${userProfile['fullName']}');
//     print('   Email: ${userProfile['email']}');
//     print('   Phone: ${userProfile['phone']}');
//     print('   Email Verified: ${userProfile['isEmailVerified']}');
//   }
//
//   // Navigate to order screen
//   void navigateToOrderScreen() {
//     if (isOrderPlaced.value && orderId.value > 0) {
//       Get.offAllNamed('/order-screen', arguments: {'orderId': orderId.value});
//     } else {
//       Get.snackbar(
//         'No Order',
//         'Please place an order first',
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.orange,
//         colorText: Colors.white,
//       );
//     }
//   }
//
//   // Reset controller
//   void reset() {
//     isLoading(false);
//     orderId(0);
//     errorMessage('');
//     isOrderPlaced(false);
//   }
// }
//

// order_controller.dart - COMPLETE FIXED VERSION
//
// import 'package:ecommerce/screens/My_order/my_order_screen.dart';
// import 'package:ecommerce/screens/edit_Profile/edit_profile_controller.dart';
// import 'package:ecommerce/screens/payment_screeen/order_details_screens/order_detail_controllers.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
// import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
// import '../order_details_screens/my_order_screen.dart';
// import 'order_apiservices.dart';
// import 'order_model.dart';
//
// class OrderController extends GetxController {
//   final apio _orderApiService = apio();
//
//   // States
//   var isLoading = false.obs;
//   var orderId = 0.obs;
//   var errorMessage = ''.obs;
//   var isOrderPlaced = false.obs;
//
//   // User data from SharedPreferences
//   var userFirstName = ''.obs;
//   var userLastName = ''.obs;
//   var userFullName = ''.obs;
//   var userEmail = ''.obs;
//   var userPhone = ''.obs;
//
//   // Static data as per your example
//   final String paymentMethod = 'cod';
//   final int shippingId = 1;
//   final int stateId = 6;
// //rakhna hai
//   // Static cart data (as per your example)
//   // final Map<String, dynamic> staticCartData = {
//   //   '535-Red,M': {
//   //     'options_id': [269, 1094],
//   //     'attribute': {
//   //       'names': ['Color', 'Size'],
//   //       'option_name': ['Red', 'M'],
//   //       'option_price': [5, 5]
//   //     },
//   //     'attribute_price': 10,
//   //     'name': '2021 Summer Dress',
//   //     'slug': '2021-Summer-Dress',
//   //     'qty': 1,
//   //     'price': 144.83,
//   //     'main_price': 134.83,
//   //     'photo': 'dress.jpg',
//   //     'item_type': 'normal',
//   //     'item_l_n': null,
//   //     'item_l_k': null
//   //   }
//   // };
//
//   @override
//   void onInit() {
//     super.onInit();
//     loadUserDataFromPrefs();
//   }
//
//   // Load user data from SharedPreferences
//   Future<void> loadUserDataFromPrefs() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//
//       userFirstName.value = prefs.getString('user_firstname') ?? '';
//       userLastName.value = prefs.getString('user_lastname') ?? '';
//       userFullName.value = prefs.getString('user_fullname') ?? '';
//       userEmail.value = prefs.getString('user_email') ?? '';
//       userPhone.value = prefs.getString('user_phone') ?? '';
//
//       print('✅ Loaded user data from SharedPreferences:');
//       print('   First Name: ${userFirstName.value}');
//       print('   Last Name: ${userLastName.value}');
//       print('   Full Name: ${userFullName.value}');
//       print('   Email: ${userEmail.value}');
//       print('   Phone: ${userPhone.value}');
//     } catch (e) {
//       print('❌ Error loading user data from SharedPreferences: $e');
//     }
//   }
//
//   // ✅ FIXED: Check if address is available
//   bool get hasValidAddress {
//     try {
//       final addressController = Get.find<EditAddressController>();
//       final addressData = addressController.addressData.value;
//
//       // Check if addressController and addressData are not null
//       if (addressController == null || addressData == null) {
//         return false;
//       }
//
//       return addressData.shipAddress1 != null &&
//           addressData.shipAddress1!.isNotEmpty;
//     } catch (e) {
//       print('❌ Error checking address: $e');
//       return false;
//     }
//   }
//
//   // ✅ FIXED: Create shipping address map with null safety
//   Future<Map<String, dynamic>> _createShippingAddress() async {
//     try {
//       final addressController = Get.find<EditAddressController>();
//       final addressData = addressController.addressData.value;
//
//       // Get user profile from SharedPreferences
//       final userProfile = await getUserProfileFromPrefs();
//       final prefs = await SharedPreferences.getInstance();
//
//       final username = await prefs.getString('user_firstname');
//       final lastname = await prefs.getString('user_lastname');
//       final email = await prefs.getString('user_email');
//       final phone = await prefs.getString('user_phone');
//
//       // Null-safe access to addressData fields
//       return {
//         // Name fields from SharedPreferences (user profile)
//         'ship_first_name':username,
//         'ship_last_name': lastname,
//
//         // Email and phone from SharedPreferences (user profile)
//         'ship_email': email,
//         'ship_phone': phone,
//
//         // Address fields from AddressData model - with null safety
//         'ship_address1': addressData?.shipAddress1 ?? '',
//         'ship_address2': addressData?.shipAddress2 ?? '',
//         'ship_zip': addressData?.shipZip ?? '',
//         'ship_city': addressData?.shipCity ?? '',
//         'ship_country': addressData?.shipCountry ?? '',
//         'ship_company': addressData?.shipCompany ?? '',
//       };
//     } catch (e) {
//       print('❌ Error creating shipping address: $e');
//       return {
//         'ship_first_name': '',
//         'ship_last_name': '',
//         'ship_email': '',
//         'ship_phone': '',
//         'ship_address1': '',
//         'ship_address2': '',
//         'ship_zip': '',
//         'ship_city': '',
//         'ship_country': '',
//         'ship_company': '',
//       };
//     }
//   }
//
//   // ✅ FIXED: Create billing address map with null safety
//   Future<Map<String, dynamic>> _createBillingAddress() async {
//     try {
//       final addressController = Get.find<EditAddressController>();
//       final addressData = addressController.addressData.value;
//       final userProfile = await getUserProfileFromPrefs();
//
//       // Check if we have separate billing address details - with null safety
//       bool hasBillingAddress = false;
//       if (addressData?.billAddress1 != null &&
//           addressData!.billAddress1!.isNotEmpty) {
//         hasBillingAddress = true;
//       }
//       final prefs = await SharedPreferences.getInstance();
//
//       final username = await prefs.getString('user_firstname');
//       final lastname = await prefs.getString('user_lastname');
//       final email = await prefs.getString('user_email');
//       final phone = await prefs.getString('user_phone');
//       if (hasBillingAddress) {
//         return {
//           // Name fields from SharedPreferences (same as shipping)
//           'bill_first_name': username,
//           'bill_last_name': lastname,
//
//           // Email and phone from SharedPreferences (same as shipping)
//           'bill_email': email,
//           'bill_phone': phone,
//
//           // Billing address fields from AddressData - with null safety
//           'bill_address1': addressData?.billAddress1 ?? '',
//           'bill_address2': addressData?.billAddress2 ?? '',
//           'bill_zip': addressData?.billZip ?? '',
//           'bill_city': addressData?.billCity ?? '',
//           'bill_country': addressData?.billCountry ?? '',
//           'bill_company': addressData?.billCompany ?? '',
//         };
//       } else {
//         // Use shipping address for billing
//         return await _createShippingAddress();
//       }
//     } catch (e) {
//       print('❌ Error creating billing address: $e');
//       return await _createShippingAddress();
//     }
//   }
//
//   // Get complete user profile from SharedPreferences
//   Future<Map<String, dynamic>> getUserProfileFromPrefs() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       print("✅ User data saved to ${prefs.getString('user_firstname')}");
//       print("✅ User data saved to ${prefs.getString('user_lastname')}");
//       print("✅ User data saved to ${prefs.getString('user_fullname')}");
//       print("✅ User data saved to ${prefs.getString('user_email')}");
//
//       return {
//         'id': prefs.getString('user_id') ?? '',
//         'firstName': prefs.getString('user_firstname') ?? '',
//         'lastName': prefs.getString('user_lastname') ?? '',
//         'fullName': prefs.getString('user_fullname') ?? '',
//         'email': prefs.getString('user_email') ?? '',
//         'phone': prefs.getString('user_phone') ?? '',
//         'isEmailVerified': prefs.getInt('user_email_verified') ?? 0,
//       };
//     } catch (e) {
//       print('❌ Error getting user profile: $e');
//       return {};
//     }
//   }
//
//   // Check if user has profile data
//   Future<bool> hasUserProfile() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final email = prefs.getString('user_email');
//       final phone = prefs.getString('user_phone');
//       return (email != null && email.isNotEmpty) ||
//           (phone != null && phone.isNotEmpty);
//     } catch (e) {
//       print('❌ Error checking user profile: $e');
//       return false;
//     }
//   }
// //yeh main rakhna hai
//   // Create order request
//   // Future<OrderRequest> _createOrderRequest() async {
//   //   try {
//   //     final shippingAddress = await _createShippingAddress();
//   //     final billingAddress = await _createBillingAddress();
//   //
//   //     print('📦 Order Request Data:');
//   //     print('   Shipping Name: ${shippingAddress['ship_first_name']} ${shippingAddress['ship_last_name']}');
//   //     print('   Shipping Email: ${shippingAddress['ship_email']}');
//   //     print('   Shipping Phone: ${shippingAddress['ship_phone']}');
//   //     print('   Shipping Address: ${shippingAddress['ship_address1']}');
//   //
//   //     return OrderRequest(
//   //       address: shippingAddress,
//   //       billing: billingAddress,
//   //       paymentMethod: paymentMethod,
//   //       shippingId: shippingId,
//   //       stateId: stateId,
//   //       cart: staticCartData,
//   //     );
//   //   } catch (e) {
//   //     print('❌ Error creating order request: $e');
//   //     rethrow;
//   //   }
//   // }
//   Future<OrderRequest> _createOrderRequest() async {
//     try {
//       print('\n📝 ===== CREATING ORDER REQUEST WITH REAL CART DATA =====');
//
//       final shippingAddress = await _createShippingAddress();
//       final billingAddress = await _createBillingAddress();
//
//       // ========== GET REAL CART DATA ==========
//       print('\n🛒 STEP 1: Getting cart controller...');
//       final cartController = Get.find<CartController>();
//
//       print('📊 Cart has ${cartController.cartItems.length} items');
//
//       if (cartController.cartItems.isEmpty) {
//         print('❌ ERROR: Cart is empty!');
//         throw Exception('Your cart is empty. Please add items first.');
//       }
//
//       // ========== CREATE DYNAMIC CART DATA ==========
//       print('\n🔄 STEP 2: Converting cart items to API format...');
//       final Map<String, dynamic> cartData = {};
//
//       for (int i = 0; i < cartController.cartItems.length; i++) {
//         final cartItem = cartController.cartItems[i];
//
//         print('\n📦 ITEM ${i + 1}: ${cartItem.name}');
//         print('   Product ID: ${cartItem.id}');
//         print('   Color: ${cartItem.color}');
//         print('   Size: ${cartItem.size}');
//         print('   Qty: ${cartItem.qty}');
//
//         // Create key: "productId-Color,Size"
//         final key = '${cartItem.id}-${cartItem.color},${cartItem.size}';
//         print('   API Key: $key');
//
//         // Parse prices
//         final discountPrice = double.tryParse(cartItem.discount_price) ?? 0.0;
//         final previousPrice = double.tryParse(cartItem.previous_price) ?? 0.0;
//
//         // Use discount price if available
//         final price = discountPrice > 0 ? discountPrice : previousPrice;
//         final mainPrice = previousPrice;
//
//         print('   Price: \$$price, Main Price: \$$mainPrice');
//
//         // Create cart item in API format
//         cartData[key] = {
//           'options_id': [269, 1094], // You need real option IDs
//           'attribute': {
//             'names': ['Color', 'Size'],
//             'option_name': [cartItem.color, cartItem.size],
//             'option_price': [5, 5]
//           },
//           'attribute_price': 10,
//           'name': cartItem.name,
//           'slug': cartItem.name.toLowerCase().replaceAll(' ', '-'),
//           'qty': cartItem.qty,
//           'price': price,
//           'main_price': mainPrice,
//           'photo': cartItem.photo,
//           'item_type': 'normal',
//           'item_l_n': null,
//           'item_l_k': null
//         };
//
//         print('✅ Added: ${cartItem.name} x${cartItem.qty}');
//       }
//
//       // ========== PRINT WHAT WE'RE SENDING ==========
//       print('\n🎯 STEP 3: Final cart data summary:');
//       print('   Total items: ${cartData.length}');
//       print('   Keys:');
//       cartData.keys.forEach((key) {
//         print('     - $key');
//       });
//
//       // ========== PRINT SHIPPING INFO ==========
//       print('\n🏠 STEP 4: Shipping & Billing Info:');
//       print('   Shipping: ${shippingAddress['ship_first_name']} ${shippingAddress['ship_last_name']}');
//       print('   Email: ${shippingAddress['ship_email']}');
//       print('   Phone: ${shippingAddress['ship_phone']}');
//       print('   Address: ${shippingAddress['ship_address1']}');
//       print('   Payment Method: $paymentMethod');
//
//       print('\n✅ Order request created successfully!');
//       print('======================================\n');
//
//       return OrderRequest(
//         address: shippingAddress,
//         billing: billingAddress,
//         paymentMethod: paymentMethod,
//         shippingId: shippingId,
//         stateId: stateId,
//         cart: cartData, // ✅ NOW USING DYNAMIC CART DATA!
//       );
//     } catch (e, stackTrace) {
//       print('\n❌ ===== ERROR CREATING ORDER REQUEST =====');
//       print('Error: $e');
//       print('Stack: $stackTrace');
//       print('========================================\n');
//       rethrow;
//     }
//   }
//
//   // Validate all requirements before placing order
//   Future<String?> validateOrderRequirements() async {
//     try {
//       // Check if user has profile
//       if (!await hasUserProfile()) {
//         return 'Please complete your profile first';
//       }
//
//       // Check if address is available
//       if (!hasValidAddress) {
//         return 'Please add your shipping address';
//       }
//
//       // Check if cart has items
//       final cartController = Get.find<CartController>();
//       if (cartController.cartItems.isEmpty) {
//         return 'Your cart is empty';
//       }
//
//       // Check token availability
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//       if (token == null || token.isEmpty) {
//         return 'Please login to place order';
//       }
//
//       return null; // No errors
//     } catch (e) {
//       print('❌ Validation error: $e');
//       return 'Error validating order: $e';
//     }
//   }
//
//   // Main function to place order
//   // Future<void> placeOrder() async {
//   //   try {
//   //     // Reset states
//   //     isLoading(true);
//   //     errorMessage('');
//   //     isOrderPlaced(false);
//   //
//   //     // 1. Validate all requirements
//   //     final validationError = await validateOrderRequirements();
//   //     if (validationError != null) {
//   //       errorMessage(validationError);
//   //       Get.snackbar(
//   //         'Validation Error',
//   //         validationError,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.orange,
//   //         colorText: Colors.white,
//   //         duration: Duration(seconds: 3),
//   //       );
//   //       return;
//   //     }
//   //
//   //     // 2. Get token
//   //     final prefs = await SharedPreferences.getInstance();
//   //     final token = prefs.getString('token');
//   //
//   //     if (token == null || token.isEmpty) {
//   //       errorMessage('Please login to place order');
//   //       Get.snackbar(
//   //         'Login Required',
//   //         'Please login to place order',
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.red,
//   //         colorText: Colors.white,
//   //       );
//   //       return;
//   //     }
//   //
//   //     // 3. Create order request
//   //     final orderRequest = await _createOrderRequest();
//   //
//   //     // 4. Call API
//   //     final response = await _orderApiService.orderdata(token, orderRequest);
//   //
//   //     // 5. Handle response
//   //     if (response.status) {
//   //       orderId(response.orderId);
//   //       isOrderPlaced(true);
//   //
//   //       // Show success message
//   //       Get.snackbar(
//   //         'Success! 🎉',
//   //         response.message,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.green,
//   //         colorText: Colors.white,
//   //         duration: Duration(seconds: 2),
//   //       );
//   //
//   //       // Log success
//   //       print('✅ Order placed successfully!');
//   //       print('   Order ID: ${response.orderId}');
//   //       print('   Message: ${response.message}');
//   //
//   //     } else {
//   //       errorMessage(response.message);
//   //       Get.snackbar(
//   //         'Order Failed',
//   //         response.message,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.red,
//   //         colorText: Colors.white,
//   //       );
//   //     }
//   //
//   //   } catch (e) {
//   //     errorMessage(e.toString());
//   //     Get.snackbar(
//   //       'Error',
//   //       e.toString(),
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       backgroundColor: Colors.red,
//   //       colorText: Colors.white,
//   //       duration: Duration(seconds: 3),
//   //     );
//   //     print('❌ Order placement error: $e');
//   //   } finally {
//   //     isLoading(false);
//   //   }
//   // }
//   // In OrderController - Add this method
//
//   Future<void> loadProfileIfNeeded() async {
//     try {
//       print('🔍 Checking if profile is loaded...');
//
//       final prefs = await SharedPreferences.getInstance();
//       final hasProfile = prefs.getBool('has_user_profile') ?? false;
//       final email = prefs.getString('user_email');
//
//       print('   Has profile flag: $hasProfile');
//       print('   Email in prefs: "$email"');
//
//       if (!hasProfile || email == null || email.isEmpty) {
//         print('⚠️ Profile not found, loading from API...');
//
//         try {
//           // Get EditProfileController
//           final editProfileController = Get.find<EditProfileController>();
//
//           // Load profile
//           await editProfileController.fetchUserProfile();
//
//           // Wait for it to save
//           await Future.delayed(Duration(seconds: 2));
//
//           // Reload from SharedPreferences
//           await loadUserDataFromPrefs();
//
//           print('✅ Profile loaded successfully');
//         } catch (e) {
//           print('❌ Failed to load profile: $e');
//         }
//       }
//     } catch (e) {
//       print('❌ Error in loadProfileIfNeeded: $e');
//     }
//   }
//   // Future<void> placeOrder() async {
//   //   try {
//   //     print('🚀 STARTING placeOrder()');
//   //     isLoading(true);
//   //     errorMessage('');
//   //     isOrderPlaced(false);
//   //
//   //     // 1. Validate all requirements
//   //     print('🔍 Validating requirements...');
//   //     final validationError = await validateOrderRequirements();
//   //     if (validationError != null) {
//   //       print('❌ Validation failed: $validationError');
//   //       errorMessage(validationError);
//   //       Get.snackbar(
//   //         'Validation Error',
//   //         validationError,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.orange,
//   //         colorText: Colors.white,
//   //         duration: Duration(seconds: 3),
//   //       );
//   //       return;
//   //     }
//   //     print('✅ Validation passed');
//   //
//   //     // 2. Get token
//   //     final prefs = await SharedPreferences.getInstance();
//   //     final token = prefs.getString('token');
//   //     print('🔑 Token: ${token != null ? "Exists" : "NULL"}');
//   //
//   //     if (token == null || token.isEmpty) {
//   //       print('❌ No token found');
//   //       errorMessage('Please login to place order');
//   //       Get.snackbar(
//   //         'Login Required',
//   //         'Please login to place order',
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.red,
//   //         colorText: Colors.white,
//   //       );
//   //       return;
//   //     }
//   //
//   //     // 3. Create order request
//   //     print('📦 Creating order request...');
//   //     final orderRequest = await _createOrderRequest();
//   //     print('📋 Order request created');
//   //     print('   Address: ${orderRequest.address}');
//   //     print('   Cart items: ${orderRequest.cart.length}');
//   //
//   //     // 4. Call API
//   //     print('📡 Calling API...');
//   //     final response = await _orderApiService.orderdata(token, orderRequest);
//   //     print('📨 API Response received');
//   //     print('   Status: ${response.status}');
//   //     print('   Message: ${response.message}');
//   //     print('   Order ID: ${response.orderId}');
//   //
//   //     // 5. Handle response
//   //     if (response.status) {
//   //       orderId(response.orderId);
//   //       isOrderPlaced(true);
//   //       print('🎉 Order placed successfully! isOrderPlaced = ${isOrderPlaced.value}');
//   //
//   //       // Show success message
//   //       Get.snackbar(
//   //         'Success! 🎉',
//   //         response.message,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.green,
//   //         colorText: Colors.white,
//   //         duration: Duration(seconds: 2),
//   //       );
//   //
//   //     } else {
//   //       print('❌ API returned false status');
//   //       errorMessage(response.message);
//   //       Get.snackbar(
//   //         'Order Failed',
//   //         response.message,
//   //         snackPosition: SnackPosition.BOTTOM,
//   //         backgroundColor: Colors.red,
//   //         colorText: Colors.white,
//   //       );
//   //     }
//   //
//   //   } catch (e) {
//   //     print('🔥 ERROR in placeOrder(): $e');
//   //     errorMessage(e.toString());
//   //     Get.snackbar(
//   //       'Error',
//   //       e.toString(),
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       backgroundColor: Colors.red,
//   //       colorText: Colors.white,
//   //       duration: Duration(seconds: 3),
//   //     );
//   //   } finally {
//   //     print('🏁 FINALLY: Setting isLoading to false');
//   //     isLoading(false);
//   //   }
//   // }
//   // Future<void> placeOrder() async {
//   //   try {
//   //     print('🚀 STARTING placeOrder()');
//   //     print('📱 isLoading before: ${isLoading.value}');
//   //
//   //     isLoading(true); // 👈 THIS is making your button show loading
//   //
//   //     print('📱 isLoading after set to true: ${isLoading.value}');
//   //
//   //     // ... rest of your code
//   //
//   //   } catch (e) {
//   //     print('🔥 ERROR in placeOrder(): $e');
//   //     errorMessage(e.toString());
//   //   } finally {
//   //     print('🏁 FINALLY: Setting isLoading to false');
//   //     isLoading(false); // 👈 This should turn off loading
//   //     print('📱 isLoading after finally: ${isLoading.value}');
//   //   }
//   // }
//   // Future<void> placeOrder() async {
//   //   try {
//   //     print('🚀 STARTING placeOrder()');
//   //     isLoading(true);
//   //     errorMessage('');
//   //     isOrderPlaced(false);
//   //
//   //     // Debug 1: Check token
//   //     final prefs = await SharedPreferences.getInstance();
//   //     final token = prefs.getString('token');
//   //     print('🔑 Token available: ${token != null && token.isNotEmpty}');
//   //
//   //     if (token == null || token.isEmpty) {
//   //       errorMessage('Please login to place order');
//   //       print('❌ No token found');
//   //       return;
//   //     }
//   //
//   //     // Debug 2: Check address
//   //     print('🏠 Has valid address: $hasValidAddress');
//   //     if (!hasValidAddress) {
//   //       errorMessage('Please add your shipping address');
//   //       print('❌ No valid address');
//   //       return;
//   //     }
//   //
//   //     // Debug 3: Create order request
//   //     print('📦 Creating order request...');
//   //     final orderRequest = await _createOrderRequest();
//   //
//   //     // Debug 4: Print request data
//   //     print('📋 Order Request Data:');
//   //     print('   Address: ${orderRequest.address}');
//   //     print('   Billing: ${orderRequest.billing}');
//   //     print('   Cart: ${orderRequest.cart.length} items');
//   //
//   //     // Debug 5: Call API
//   //     print('📡 Calling API...');
//   //     final response = await _orderApiService.orderdata(token, orderRequest);
//   //
//   //     print('✅ API Response received:');
//   //     print('   Status: ${response.status}');
//   //     print('   Message: ${response.message}');
//   //     print('   Order ID: ${response.orderId}');
//   //
//   //     if (response.status) {
//   //       orderId(response.orderId);
//   //       isOrderPlaced(true);
//   //       print('🎉 Order placed successfully!');
//   //     } else {
//   //       errorMessage(response.message);
//   //       print('❌ API returned false status');
//   //     }
//   //
//   //   } catch (e) {
//   //     print('🔥 ERROR in placeOrder(): $e');
//   //     print('🔥 Error type: ${e.runtimeType}');
//   //     print('🔥 Error stack: ${e.toString()}');
//   //
//   //     errorMessage(e.toString());
//   //   } finally {
//   //     print('🏁 FINALLY: Setting isLoading to false');
//   //     print('   Current isOrderPlaced: ${isOrderPlaced.value}');
//   //     print('   Current errorMessage: ${errorMessage.value}');
//   //     isLoading(false);
//   //   }
//   // }
//   Future<void> placeOrder() async {
//     try {
//       print('🚀 STARTING placeOrder()');
//       isLoading(true);
//       errorMessage('');
//       isOrderPlaced(false);
//
//       // 1. Get token
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//
//       if (token == null || token.isEmpty) {
//         errorMessage('Please login to place order');
//         return;
//       }
//
//       print('🔑 Token: $token');
//
//       // 2. Create order request
//       final orderRequest = await _createOrderRequest();
//
//       // 3. Call API
//       print('📡 Calling API with data:');
//       print(orderRequest.toJson());
//
//       final response = await _orderApiService.orderdata(token, orderRequest);
//
//       print('✅ API Response:');
//       print('   Status: ${response.status}');
//       print('   Message: ${response.message}');
//       print('   Order ID: ${response.orderId}');
//
//       if (response.status) {
//         orderId(response.orderId);
//         isOrderPlaced(true);
//         Get.snackbar(
//           'Success! 🎉',
//           response.message,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//         );
//       } else {
//         errorMessage(response.message);
//         Get.snackbar(
//           'Order Failed',
//           response.message,
//           snackPosition: SnackPosition.BOTTOM,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//
//     } catch (e) {
//       print('❌ Error: $e');
//       errorMessage(e.toString());
//       Get.snackbar(
//         'Error',
//         e.toString(),
//         snackPosition: SnackPosition.BOTTOM,
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading(false);
//     }
//   }
//
//   // Get user profile summary from SharedPreferences
//   Future<String> getUserProfileSummary() async {
//     final userProfile = await getUserProfileFromPrefs();
//     return '''
// 📋 User Profile Summary:
// Name: ${userProfile['fullName']}
// Email: ${userProfile['email']}
// Phone: ${userProfile['phone']}
// Email Verified: ${(userProfile['isEmailVerified'] ?? 0) == 1 ? 'Yes' : 'No'}
// ''';
//   }
//
//   // Debug method to print user data
//   Future<void> debugPrintUserData() async {
//     final userProfile = await getUserProfileFromPrefs();
//     print('🔍 Debug - User Profile from SharedPreferences:');
//     print('   ID: ${userProfile['id']}');
//     print('   First Name: ${userProfile['firstName']}');
//     print('   Last Name: ${userProfile['lastName']}');
//     print('   Full Name: ${userProfile['fullName']}');
//     print('   Email: ${userProfile['email']}');
//     print('   Phone: ${userProfile['phone']}');
//     print('   Email Verified: ${userProfile['isEmailVerified']}');
//   }
//
//   // Navigate to order screen
//   // void navigateToOrderScreen() {
//   //   if (isOrderPlaced.value && orderId.value > 0) {
//   //     Get.to(() => MyOrderScreen());
//   //   } else {
//   //     Get.snackbar(
//   //       'No Order',
//   //       'Please place an order first',
//   //       snackPosition: SnackPosition.BOTTOM,
//   //       backgroundColor: Colors.orange,
//   //       colorText: Colors.white,
//   //     );
//   //   }
//   // }
// // In your existing OrderController, add this method:
//   void navigateToOrderDetails() async {
//     try {
//       print('📍 Navigating to order details...');
//
//       // Initialize OrderDetailsController
//       Get.put(MyOrderScreen());
//
//       // Show loading
//       Get.dialog(
//         Center(child: CircularProgressIndicator()),
//         barrierDismissible: false,
//       );
//
//       // Fetch orders
//       final orderDetailsController = Get.put(MyOrderScreen());
//      // await orderDetailsController.fetchUserOrders();
//
//       // Close loading
//       Get.back();
//
//       // Navigate to order details screen
//       Get.to(() => MyOrderScreen());
//
//     } catch (e) {
//       if (Get.isDialogOpen ?? false) Get.back();
//       Get.snackbar(
//         'Error',
//         'Failed to load orders: $e',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     }
//   }
//   // Reset controller
//   void reset() {
//     isLoading(false);
//     orderId(0);
//     errorMessage('');
//     isOrderPlaced(false);
//   }
//   Future<bool> ensureUserDataLoaded() async {
//     try {
//       print('🔍 Checking user data...');
//
//       // Reload from SharedPreferences first
//       await loadUserDataFromPrefs();
//
//       print('👤 Current user data:');
//       print('   Email: ${userEmail.value}');
//       print('   Phone: ${userPhone.value}');
//       print('   First Name: ${userFirstName.value}');
//
//       // If data is empty, try to load profile
//       if (userEmail.value.isEmpty || userPhone.value.isEmpty) {
//         print('⚠️ User data empty, loading profile...');
//
//         try {
//           final editProfileController = Get.find<EditProfileController>();
//           await editProfileController.fetchUserProfile();
//
//           // Wait and reload
//           await Future.delayed(Duration(seconds: 2));
//           await loadUserDataFromPrefs();
//
//           print('✅ Profile loaded, checking again...');
//           print('   Email now: ${userEmail.value}');
//           print('   Phone now: ${userPhone.value}');
//         } catch (e) {
//           print('❌ Failed to load profile: $e');
//         }
//       }
//
//       // Return true if we have data
//       return userEmail.value.isNotEmpty && userPhone.value.isNotEmpty;
//
//     } catch (e) {
//       print('❌ Error in ensureUserDataLoaded: $e');
//       return false;
//     }
//   }
//
// }
// // In OrderController
// Future<Map<String, dynamic>> _createShippingAddress() async {
//   try {
//     final addressController = Get.find<EditAddressController>();
//     final addressData = addressController.addressData.value;
//
//     // ✅ Use hardcoded user data since SharedPreferences is empty
//     return {
//       'ship_first_name': 'Ajay',
//       'ship_last_name': 'Chauhan',
//       'ship_email': 'ajay@gmail.com',
//       'ship_phone': '9876543210',
//       'ship_address1': addressData?.shipAddress1 ?? 'Ahmedabad',
//       'ship_address2': addressData?.shipAddress2 ?? '',
//       'ship_zip': addressData?.shipZip ?? '380001',
//       'ship_city': addressData?.shipCity ?? 'Ahmedabad',
//       'ship_country': addressData?.shipCountry ?? 'India',
//       'ship_company': addressData?.shipCompany ?? '',
//     };
//   } catch (e) {
//     return {
//       'ship_first_name': 'Ajay',
//       'ship_last_name': 'Chauhan',
//       'ship_email': 'ajay@gmail.com',
//       'ship_phone': '9876543210',
//       'ship_address1': 'Ahmedabad',
//       'ship_zip': '380001',
//       'ship_city': 'Ahmedabad',
//       'ship_country': 'India',
//     };
//   }
// }
//
// Future<Map<String, dynamic>> _createBillingAddress() async {
//   try {
//     final addressController = Get.find<EditAddressController>();
//     final addressData = addressController.addressData.value;
//
//     // Use billing address if available, otherwise use shipping
//     if (addressData?.billAddress1 != null &&
//         addressData!.billAddress1!.isNotEmpty) {
//       return {
//         'bill_first_name': 'Ajay',
//         'bill_last_name': 'Chauhan',
//         'bill_email': 'ajay@gmail.com',
//         'bill_phone': '9876543210',
//         'bill_address1': addressData.billAddress1 ?? 'Ahmedabad',
//         'bill_address2': addressData.billAddress2 ?? '',
//         'bill_zip': addressData.billZip ?? '380001',
//         'bill_city': addressData.billCity ?? 'Ahmedabad',
//         'bill_country': addressData.billCountry ?? 'India',
//         'bill_company': addressData.billCompany ?? '',
//       };
//     } else {
//       // Use shipping address for billing
//       return await _createShippingAddress();
//     }
//   } catch (e) {
//     return await _createShippingAddress();
//   }
// }
//
//
//

import 'dart:convert';

import 'package:ecommerce/screens/My_order/my_order_screen.dart';
import 'package:ecommerce/screens/edit_Profile/edit_profile_controller.dart';
import 'package:ecommerce/screens/payment_screeen/order_details_screens/order_detail_controllers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
import '../order_details_screens/my_order_screen.dart';
import 'order_apiservices.dart';
import 'order_model.dart';

class OrderController extends GetxController {
  final apio _orderApiService = apio();

  // States
  var isLoading = false.obs;
  var orderId = 0.obs;
  var errorMessage = ''.obs;
  var isOrderPlaced = false.obs;

  // User data from SharedPreferences
  var userFirstName = ''.obs;
  var userLastName = ''.obs;
  var userFullName = ''.obs;
  var userEmail = ''.obs;
  var userPhone = ''.obs;

  // Static data
  final String paymentMethod = 'cod';
  final int shippingId = 1;
  final int stateId = 6;

  @override
  void onInit() {
    super.onInit();
    loadUserDataFromPrefs();
  }

  // Load user data from SharedPreferences
  Future<void> loadUserDataFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();

      userFirstName.value = prefs.getString('user_firstname') ?? '';
      userLastName.value = prefs.getString('user_lastname') ?? '';
      userFullName.value = prefs.getString('user_fullname') ?? '';
      userEmail.value = prefs.getString('user_email') ?? '';
      userPhone.value = prefs.getString('user_phone') ?? '';

      print('✅ Loaded user data from SharedPreferences:');
      print('   First Name: ${userFirstName.value}');
      print('   Last Name: ${userLastName.value}');
      print('   Full Name: ${userFullName.value}');
      print('   Email: ${userEmail.value}');
      print('   Phone: ${userPhone.value}');
    } catch (e) {
      print('❌ Error loading user data from SharedPreferences: $e');
    }
  }

  // ✅ FIXED: Check if address is available
  bool get hasValidAddress {
    try {
      final addressController = Get.find<EditAddressController>();
      final addressData = addressController.addressData.value;

      if (addressController == null || addressData == null) {
        return false;
      }

      return addressData.shipAddress1 != null &&
          addressData.shipAddress1!.isNotEmpty;
    } catch (e) {
      print('❌ Error checking address: $e');
      return false;
    }
  }

  // ✅ FIXED: Create shipping address map
  Future<Map<String, dynamic>> _createShippingAddress() async {
    try {
      final addressController = Get.find<EditAddressController>();
      final addressData = addressController.addressData.value;

      return {
        'ship_first_name': 'Ajay',
        'ship_last_name': 'Chauhan',
        'ship_email': 'ajay@gmail.com',
        'ship_phone': '9876543210',
        'ship_address1': addressData?.shipAddress1 ?? 'Ahmedabad',
        'ship_address2': addressData?.shipAddress2 ?? '',
        'ship_zip': addressData?.shipZip ?? '380001',
        'ship_city': addressData?.shipCity ?? 'Ahmedabad',
        'ship_country': addressData?.shipCountry ?? 'India',
        'ship_company': addressData?.shipCompany ?? '',
      };
    } catch (e) {
      return {
        'ship_first_name': 'Ajay',
        'ship_last_name': 'Chauhan',
        'ship_email': 'ajay@gmail.com',
        'ship_phone': '9876543210',
        'ship_address1': 'Ahmedabad',
        'ship_zip': '380001',
        'ship_city': 'Ahmedabad',
        'ship_country': 'India',
      };
    }
  }

  // ✅ FIXED: Create billing address map
  Future<Map<String, dynamic>> _createBillingAddress() async {
    try {
      final addressController = Get.find<EditAddressController>();
      final addressData = addressController.addressData.value;

      if (addressData?.billAddress1 != null &&
          addressData!.billAddress1!.isNotEmpty) {
        return {
          'bill_first_name': 'Ajay',
          'bill_last_name': 'Chauhan',
          'bill_email': 'ajay@gmail.com',
          'bill_phone': '9876543210',
          'bill_address1': addressData.billAddress1 ?? 'Ahmedabad',
          'bill_address2': addressData.billAddress2 ?? '',
          'bill_zip': addressData.billZip ?? '380001',
          'bill_city': addressData.billCity ?? 'Ahmedabad',
          'bill_country': addressData.billCountry ?? 'India',
          'bill_company': addressData.billCompany ?? '',
        };
      } else {
        return await _createShippingAddress();
      }
    } catch (e) {
      return await _createShippingAddress();
    }
  }

  // Get complete user profile from SharedPreferences
  Future<Map<String, dynamic>> getUserProfileFromPrefs() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      return {
        'id': prefs.getString('user_id') ?? '',
        'firstName': prefs.getString('user_firstname') ?? '',
        'lastName': prefs.getString('user_lastname') ?? '',
        'fullName': prefs.getString('user_fullname') ?? '',
        'email': prefs.getString('user_email') ?? '',
        'phone': prefs.getString('user_phone') ?? '',
        'isEmailVerified': prefs.getInt('user_email_verified') ?? 0,
      };
    } catch (e) {
      print('❌ Error getting user profile: $e');
      return {};
    }
  }

  // ========== UPDATED: Create order request with REAL cart data ==========
  Future<OrderRequest> _createOrderRequest() async {
    try {
      print('\n📝 ===== CREATING ORDER REQUEST WITH REAL CART DATA =====');

      final shippingAddress = await _createShippingAddress();
      final billingAddress = await _createBillingAddress();

      // ========== GET REAL CART DATA ==========
      print('\n🛒 STEP 1: Getting cart controller...');
      final cartController = Get.find<CartController>();

      print('📊 Cart has ${cartController.cartItems.length} items');

      if (cartController.cartItems.isEmpty) {
        print('❌ ERROR: Cart is empty!');
        throw Exception('Your cart is empty. Please add items first.');
      }

      // ========== PRINT ALL CART DATA FIRST ==========
      print('\n🔍 DEBUG: PRINTING ALL CART DATA FROM API');
      print('=' * 50);
      for (int i = 0; i < cartController.cartItems.length; i++) {
        final cartItem = cartController.cartItems[i];
        print('\n📦 ITEM ${i + 1}: ${cartItem.name}');
        print('   Cart ID: ${cartItem.cartId}');
        print('   Product ID: ${cartItem.id}');
        print('   Quantity: ${cartItem.qty}');
        print('   Discount Price: \$${cartItem.discountPriceValue}');
        print('   Previous Price: \$${cartItem.previousPriceValue}');
        print('   Photo: ${cartItem.photo}');

        // Get color and size from attributes
        String color = '';
        String size = '';
        List<int> optionIds = [];
        List<String> attributeNames = [];
        List<String> optionNames = [];
        List<double> optionPrices = [];

        if (cartItem.attributes.isNotEmpty) {
          print('   Attributes found: ${cartItem.attributes.length}');
          for (var attr in cartItem.attributes) {
            print('     ${attr.name} (${attr.keyword}):');
            if (attr.options.isNotEmpty) {
              final option = attr.options.first;
              print('       - Option Name: ${option.name}');
              print('       - Option ID: ${option.id}');
              print('       - Option Price: \$${option.price}');

              // Collect data for order API
              optionIds.add(option.id);
              attributeNames.add(attr.name);
              optionNames.add(option.name);
              optionPrices.add(option.price);

              // Set color and size
              if (attr.keyword == 'color') {
                color = option.name;
              }
              if (attr.keyword == 'size') {
                size = option.name;
              }
            }
          }
        }

        print('   Color: $color');
        print('   Size: $size');
        print('   Option IDs: $optionIds');
        print('   Attribute Names: $attributeNames');
        print('   Option Names: $optionNames');
        print('   Option Prices: $optionPrices');

        // Calculate total attribute price
        double attributeTotalPrice = optionPrices.fold(0.0, (sum, price) => sum + price);
        print('   Total Attribute Price: \$$attributeTotalPrice');

        // Calculate final price
        double basePrice = cartItem.discountPriceValue > 0
            ? cartItem.discountPriceValue
            : cartItem.previousPriceValue;
        double finalPrice = basePrice + attributeTotalPrice;
        print('   Base Price: \$$basePrice');
        print('   Final Price (with attributes): \$$finalPrice');
      }
      print('=' * 50);
      print('\n');

      // ========== CREATE DYNAMIC CART DATA FOR API ==========
      print('\n🔄 STEP 2: Converting cart items to API format...');
      final Map<String, dynamic> cartData = {};

      for (int i = 0; i < cartController.cartItems.length; i++) {
        final cartItem = cartController.cartItems[i];

        // Extract data from cart item
        String color = '';
        String size = '';
        List<int> optionIds = [];
        List<String> attributeNames = [];
        List<String> optionNames = [];
        List<double> optionPrices = [];

        // Get data from attributes
        for (var attr in cartItem.attributes) {
          if (attr.options.isNotEmpty) {
            final option = attr.options.first;
            optionIds.add(option.id);
            attributeNames.add(attr.name);
            optionNames.add(option.name);
            optionPrices.add(option.price);

            if (attr.keyword == 'color') color = option.name;
            if (attr.keyword == 'size') size = option.name;
          }
        }

        // Create API key
        final key = '${cartItem.id}-$color,$size';

        // Calculate prices
        double basePrice = cartItem.discountPriceValue > 0
            ? cartItem.discountPriceValue
            : cartItem.previousPriceValue;
        double attributeTotalPrice = optionPrices.fold(0.0, (sum, price) => sum + price);
        double finalPrice = basePrice + attributeTotalPrice;

        // Create slug from name
        String slug = cartItem.name
            .toLowerCase()
            .replaceAll(RegExp(r'[^a-z0-9\s-]'), '')
            .replaceAll(RegExp(r'\s+'), '-')
            .replaceAll(RegExp(r'-+'), '-');

        // Create cart item in API format
        cartData[key] = {
          'options_id': optionIds,
          'attribute': {
            'names': attributeNames,
            'option_name': optionNames,
            'option_price': optionPrices,
          },
          'attribute_price': attributeTotalPrice,
          'name': cartItem.name,
          'slug': slug,
          'qty': cartItem.qty,
          'price': finalPrice,
          'main_price': cartItem.previousPriceValue,
          'photo': cartItem.photo,
          'item_type': 'normal',
          'item_l_n': null,
          'item_l_k': null
        };

        print('✅ Added to order: ${cartItem.name} x${cartItem.qty}');
        print('   Key: $key');
        print('   Price: \$$finalPrice');
        print('   Option IDs: $optionIds');
      }

      // ========== PRINT FINAL ORDER DATA ==========
      print('\n🎯 STEP 3: Final order data to send:');
      print('   Total cart items: ${cartData.length}');
      print('   Cart data keys:');
      cartData.keys.forEach((key) => print('     - $key'));

      print('\n📋 Full cart data structure:');
      print(jsonEncode(cartData));

      // ========== PRINT SHIPPING INFO ==========
      print('\n🏠 STEP 4: Shipping & Billing Info:');
      print('   Shipping Name: ${shippingAddress['ship_first_name']} ${shippingAddress['ship_last_name']}');
      print('   Shipping Email: ${shippingAddress['ship_email']}');
      print('   Shipping Phone: ${shippingAddress['ship_phone']}');
      print('   Shipping Address: ${shippingAddress['ship_address1']}');
      print('   Payment Method: $paymentMethod');
      print('   Shipping ID: $shippingId');
      print('   State ID: $stateId');

      print('\n✅ Order request created successfully!');
      print('======================================\n');

      return OrderRequest(
        address: shippingAddress,
        billing: billingAddress,
        paymentMethod: paymentMethod,
        shippingId: shippingId,
        stateId: stateId,
        cart: cartData,
      );
    } catch (e, stackTrace) {
      print('\n❌ ===== ERROR CREATING ORDER REQUEST =====');
      print('Error: $e');
      print('Stack: $stackTrace');
      print('========================================\n');
      rethrow;
    }
  }

  // Validate all requirements before placing order
  Future<String?> validateOrderRequirements() async {
    try {
      // Check if user has profile
      if (!await hasUserProfile()) {
        return 'Please complete your profile first';
      }

      // Check if address is available
      if (!hasValidAddress) {
        return 'Please add your shipping address';
      }

      // Check if cart has items
      final cartController = Get.find<CartController>();
      if (cartController.cartItems.isEmpty) {
        return 'Your cart is empty';
      }

      // Check token availability
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');
      if (token == null || token.isEmpty) {
        return 'Please login to place order';
      }

      return null;
    } catch (e) {
      print('❌ Validation error: $e');
      return 'Error validating order: $e';
    }
  }

  // Check if user has profile data
  Future<bool> hasUserProfile() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final email = prefs.getString('user_email');
      final phone = prefs.getString('user_phone');
      return (email != null && email.isNotEmpty) ||
          (phone != null && phone.isNotEmpty);
    } catch (e) {
      print('❌ Error checking user profile: $e');
      return false;
    }
  }

  // ========== MAIN FUNCTION TO PLACE ORDER ==========
  Future<void> placeOrder() async {
    try {
      print('🚀 STARTING placeOrder()');
      isLoading(true);
      errorMessage('');
      isOrderPlaced(false);

      // 1. Validate all requirements
      final validationError = await validateOrderRequirements();
      if (validationError != null) {
        errorMessage(validationError);
        Get.snackbar(
          'Validation Error',
          validationError,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return;
      }

      // 2. Get token
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        errorMessage('Please login to place order');
        Get.snackbar(
          'Login Required',
          'Please login to place order',
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return;
      }

      print('🔑 Token found: ${token.substring(0, 20)}...');

      // 3. Create order request with REAL cart data
      final orderRequest = await _createOrderRequest();

      // 4. Print the full request for debugging
      print('\n📦 FULL ORDER REQUEST TO SEND:');
      print(jsonEncode(orderRequest.toJson()));
      print('\n');

      // 5. Call API
      print('📡 Calling order API...');
      final response = await _orderApiService.orderdata(token, orderRequest);

      print('✅ API Response received:');
      print('   Status: ${response.status}');
      print('   Message: ${response.message}');
      print('   Order ID: ${response.orderId}');

      if (response.status) {
        orderId(response.orderId);
        isOrderPlaced(true);

        // Clear cart after successful order
        final cartController = Get.find<CartController>();

        cartController.update();

        Get.snackbar(
          'Success! 🎉',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.green,
          colorText: Colors.white,
        );

        print('🎉 Order placed successfully! Order ID: ${response.orderId}');
      } else {
        errorMessage(response.message);
        Get.snackbar(
          'Order Failed',
          response.message,
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        print('❌ Order failed: ${response.message}');
      }

    } catch (e) {
      print('🔥 ERROR in placeOrder(): $e');
      print('🔥 Stack trace: ${e.toString()}');

      errorMessage(e.toString());
      Get.snackbar(
        'Error',
        'Failed to place order: ${e.toString()}',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      print('🏁 FINALLY: Setting isLoading to false');
      isLoading(false);
    }
  }

  // Debug method to print full order request
  Future<void> debugPrintOrderRequest() async {
    try {
      print('\n🔍 DEBUG: Testing order request creation...');
      print('=' * 60);

      final cartController = Get.find<CartController>();

      if (cartController.cartItems.isEmpty) {
        print('Cart is empty!');
        return;
      }

      print('Total cart items: ${cartController.cartItems.length}');

      for (var item in cartController.cartItems) {
        print('\n📦 Product: ${item.name}');
        print('   ID: ${item.id}');
        print('   Cart ID: ${item.cartId}');
        print('   Qty: ${item.qty}');
        print('   Discount Price: \$${item.discountPriceValue}');
        print('   Previous Price: \$${item.previousPriceValue}');

        if (item.attributes.isNotEmpty) {
          for (var attr in item.attributes) {
            print('   Attribute: ${attr.name} (${attr.keyword})');
            if (attr.options.isNotEmpty) {
              print('     Option: ${attr.options.first.name}');
              print('     Option ID: ${attr.options.first.id}');
              print('     Option Price: \$${attr.options.first.price}');
            }
          }
        }
      }

      // Try to create full order request
      try {
        final orderRequest = await _createOrderRequest();
        print('\n📋 FULL ORDER REQUEST JSON:');
        print(jsonEncode(orderRequest.toJson()));
      } catch (e) {
        print('Error creating order request: $e');
      }

      print('=' * 60);
    } catch (e) {
      print('Debug error: $e');
    }
  }

  // Reset controller
  void reset() {
    isLoading(false);
    orderId(0);
    errorMessage('');
    isOrderPlaced(false);
  }
}


