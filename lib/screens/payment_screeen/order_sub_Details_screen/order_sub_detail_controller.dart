// // // import 'dart:ui';
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // //
// // // import 'order_sub_detail_apiservices.dart';
// // // import 'order_sub_detail_model.dart';
// // //
// // //
// // // class OrderDetailSingleController extends GetxController {
// // //   final OrderDetailSingleApiService _apiService = OrderDetailSingleApiService();
// // //
// // //   // Current order data
// // //   Rx<OrderDetailData?> orderDetail = Rx<OrderDetailData?>(null);
// // //
// // //   // Loading states
// // //   RxBool isLoading = false.obs;
// // //   RxString errorMessage = ''.obs;
// // //
// // //   // Order ID
// // //   int? currentOrderId;
// // //
// // //   // Fetch single order details
// // //   Future<void> fetchOrderDetails(int orderId) async {
// // //     try {
// // //       print('🔄 STARTING: Fetching order details for ID: $orderId');
// // //       isLoading.value = true;
// // //       errorMessage.value = '';
// // //       currentOrderId = orderId;
// // //
// // //       final response = await _apiService.fetchOrderDetails(orderId);
// // //
// // //       if (response.status) {
// // //         if (response.data != null) {
// // //           orderDetail.value = response.data;
// // //           print('✅ Order details loaded successfully!');
// // //           print('   Order ID: ${orderDetail.value?.id}');
// // //           print('   Order Status: ${orderDetail.value?.orderStatus}');
// // //           print('   Total Price: \$${orderDetail.value?.totalPrice}');
// // //         } else {
// // //           errorMessage.value = 'No order details found';
// // //           print('ℹ️ No order details data received');
// // //         }
// // //       } else {
// // //         errorMessage.value = 'Failed to load order details';
// // //         print('❌ API response status is false');
// // //       }
// // //     } catch (e) {
// // //       errorMessage.value = 'Error: $e';
// // //       print('🔥 Exception fetching order details: $e');
// // //     } finally {
// // //       isLoading.value = false;
// // //       print('🏁 COMPLETED: Order details fetch finished');
// // //     }
// // //   }
// // //
// // //   // Get formatted order date
// // //   String getFormattedDate(String dateTime) {
// // //     try {
// // //       if (dateTime.isEmpty) return '';
// // //       return dateTime.split(' ')[0]; // Returns only date part
// // //     } catch (e) {
// // //       return dateTime;
// // //     }
// // //   }
// // //
// // //   // Get status color
// // //   Color getStatusColor(String status) {
// // //     final lowerStatus = status.toLowerCase();
// // //
// // //     switch (lowerStatus) {
// // //       case 'pending':
// // //       case 'processing':
// // //         return const Color(0xFF16423C);
// // //       case 'shipped':
// // //         return Colors.blue;
// // //       case 'delivered':
// // //         return Colors.green;
// // //       case 'cancelled':
// // //         return Colors.red;
// // //       default:
// // //         return const Color(0xFF16423C);
// // //     }
// // //   }
// // //
// // //   // Get status display text
// // //   String getStatusText(String status) {
// // //     final lowerStatus = status.toLowerCase();
// // //
// // //     switch (lowerStatus) {
// // //       case 'pending':
// // //         return 'On Progress';
// // //       case 'processing':
// // //         return 'Processing';
// // //       case 'shipped':
// // //         return 'Shipped';
// // //       case 'delivered':
// // //         return 'Delivered';
// // //       case 'cancelled':
// // //         return 'Cancelled';
// // //       default:
// // //         return status;
// // //     }
// // //   }
// // //
// // //   // Clear data
// // //   void clearData() {
// // //     orderDetail.value = null;
// // //     errorMessage.value = '';
// // //     currentOrderId = null;
// // //   }
// // // }
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// // import 'order_sub_detail_apiservices.dart';
// // import 'order_sub_detail_model.dart';
// //
// //
// //
// // class OrderDetailSingleController extends GetxController {
// //   final OrderDetailSingleApiService _apiService = OrderDetailSingleApiService();
// //
// //   // Current order data
// //   Rx<OrderDetailData?> orderDetail = Rx<OrderDetailData?>(null);
// //
// //   // Loading states
// //   RxBool isLoading = false.obs;
// //   RxString errorMessage = ''.obs;
// //
// //   // Order ID
// //   int? currentOrderId;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     print('✅ OrderDetailSingleController initialized');
// //   }
// //
// //   // Fetch single order details
// //   Future<void> fetchOrderDetails(int orderId) async {
// //     try {
// //       print('🔄 STARTING: Fetching order details for ID: $orderId');
// //       isLoading.value = true;
// //       errorMessage.value = '';
// //       currentOrderId = orderId;
// //
// //       // Clear previous data
// //       orderDetail.value = null;
// //
// //       final response = await _apiService.fetchOrderDetails(orderId);
// //
// //       print('📨 API Response received: ${response.status}');
// //
// //       if (response.status) {
// //         if (response.data != null) {
// //           orderDetail.value = response.data;
// //           print('✅ Order details loaded successfully!');
// //           print('   Order ID: ${orderDetail.value?.id}');
// //           print('   Order Status: ${orderDetail.value?.orderStatus}');
// //           print('   Total Price: \$${orderDetail.value?.totalPrice}');
// //         } else {
// //           errorMessage.value = 'No order details found';
// //           print('ℹ️ No order details data received');
// //         }
// //       } else {
// //         errorMessage.value = 'Failed to load order details';
// //         print('❌ API response status is false');
// //       }
// //     } catch (e) {
// //       errorMessage.value = 'Error loading order details: $e';
// //       print('🔥 Exception fetching order details: $e');
// //     } finally {
// //       isLoading.value = false;
// //       print('🏁 COMPLETED: Order details fetch finished');
// //     }
// //   }
// //
// //   // Get formatted order date
// //   String getFormattedDate(String? dateTime) {
// //     try {
// //       if (dateTime == null || dateTime.isEmpty) return 'N/A';
// //       final parts = dateTime.split(' ');
// //       return parts.isNotEmpty ? parts[0] : dateTime;
// //     } catch (e) {
// //       return dateTime ?? 'N/A';
// //     }
// //   }
// //
// //   // Get status color
// //   Color getStatusColor(String? status) {
// //     final lowerStatus = status?.toLowerCase() ?? '';
// //
// //     switch (lowerStatus) {
// //       case 'pending':
// //       case 'processing':
// //         return const Color(0xFF16423C);
// //       case 'shipped':
// //         return Colors.blue;
// //       case 'delivered':
// //         return Colors.green;
// //       case 'cancelled':
// //         return Colors.red;
// //       default:
// //         return const Color(0xFF16423C);
// //     }
// //   }
// //
// //   // Get status display text
// //   String getStatusText(String? status) {
// //     final lowerStatus = status?.toLowerCase() ?? '';
// //
// //     switch (lowerStatus) {
// //       case 'pending':
// //         return 'On Progress';
// //       case 'processing':
// //         return 'Processing';
// //       case 'shipped':
// //         return 'Shipped';
// //       case 'delivered':
// //         return 'Delivered';
// //       case 'cancelled':
// //         return 'Cancelled';
// //       default:
// //         return status ?? 'Unknown';
// //     }
// //   }
// //
// //   // Clear data
// //   void clearData() {
// //     orderDetail.value = null;
// //     errorMessage.value = '';
// //     currentOrderId = null;
// //   }
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'order_detail_single_model.dart';
// import 'order_detail_single_apiservice.dart';
//
// class OrderDetailSingleController extends GetxController {
//   final OrderDetailSingleApiService _apiService = OrderDetailSingleApiService();
//
//   // Current order data
//   Rx<OrderDetailData?> orderDetail = Rx<OrderDetailData?>(null);
//
//   // Loading states
//   RxBool isLoading = false.obs;
//   RxString errorMessage = ''.obs;
//
//   // Order ID
//   int? currentOrderId;
//
//   @override
//   void onInit() {
//     super.onInit();
//     print('✅ OrderDetailSingleController initialized');
//   }
//
//   // Fetch single order details
//   Future<void> fetchOrderDetails(int orderId) async {
//     try {
//       print('🔄 STARTING: Fetching order details for ID: $orderId');
//       isLoading.value = true;
//       errorMessage.value = '';
//       currentOrderId = orderId;
//
//       // Clear previous data
//       orderDetail.value = null;
//
//       final response = await _apiService.fetchOrderDetails(orderId);
//
//       print('📨 API Response received');
//       print('   Response status: ${response.status}');
//
//       if (response.status) {
//         if (response.data != null) {
//           orderDetail.value = response.data;
//           print('✅ Order details loaded successfully!');
//           print('   Order ID: ${orderDetail.value?.id}');
//           print('   Order Status: ${orderDetail.value?.orderStatus}');
//           print('   Product Count: ${orderDetail.value?.cartItems.length}');
//           print('   Total Price: ${orderDetail.value?.currencySign}${orderDetail.value?.totalPrice}');
//         } else {
//           errorMessage.value = 'No order details found';
//           print('ℹ️ No order details data received');
//         }
//       } else {
//         errorMessage.value = 'Failed to load order details';
//         print('❌ API returned false status');
//       }
//     } catch (e) {
//       errorMessage.value = 'Error: $e';
//       print('🔥 Exception fetching order details: $e');
//     } finally {
//       isLoading.value = false;
//       print('🏁 COMPLETED: Order details fetch finished');
//     }
//   }
//
//   // Get formatted order date
//   String getFormattedDate(String? dateTime) {
//     try {
//       if (dateTime == null || dateTime.isEmpty) return 'N/A';
//       final parts = dateTime.split(' ');
//       return parts.isNotEmpty ? parts[0] : dateTime;
//     } catch (e) {
//       return dateTime ?? 'N/A';
//     }
//   }
//
//   // Get status color
//   Color getStatusColor(String? status) {
//     final lowerStatus = status?.toLowerCase() ?? '';
//
//     switch (lowerStatus) {
//       case 'pending':
//       case 'processing':
//         return const Color(0xFF16423C);
//       case 'shipped':
//         return Colors.blue;
//       case 'delivered':
//         return Colors.green;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return const Color(0xFF16423C);
//     }
//   }
//
//   // Get status display text
//   String getStatusText(String? status) {
//     final lowerStatus = status?.toLowerCase() ?? '';
//
//     switch (lowerStatus) {
//       case 'pending':
//         return 'On Progress';
//       case 'processing':
//         return 'Processing';
//       case 'shipped':
//         return 'Shipped';
//       case 'delivered':
//         return 'Delivered';
//       case 'cancelled':
//         return 'Cancelled';
//       default:
//         return status ?? 'Unknown';
//     }
//   }
//
//   // Clear data
//   void clearData() {
//     orderDetail.value = null;
//     errorMessage.value = '';
//     currentOrderId = null;
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'order_sub_detail_apiservices.dart';
// import 'order_sub_detail_model.dart';
//
//
//
// class OrderDetailSingleController extends GetxController {
//   final OrderDetailSingleApiService _apiService = OrderDetailSingleApiService();
//
//   // Current order data
//   Rx<OrderDetailData?> orderDetail = Rx<OrderDetailData?>(null);
//
//   // Loading states
//   RxBool isLoading = false.obs;
//   RxString errorMessage = ''.obs;
//
//   // Order ID
//   int? currentOrderId;
//
//   @override
//   void onInit() {
//     super.onInit();
//     print('✅ OrderDetailSingleController initialized');
//   }
//
//   // Fetch single order details
//   Future<void> fetchOrderDetails(int orderId) async {
//     try {
//       print('🔄 STARTING: Fetching order details for ID: $orderId');
//       isLoading.value = true;
//       errorMessage.value = '';
//       currentOrderId = orderId;
//
//       // Clear previous data
//       orderDetail.value = null;
//
//       final response = await _apiService.fetchOrderDetails(orderId);
//
//       print('📨 API Response received');
//       print('   Response status: ${response.status}');
//
//       if (response.status) {
//         if (response.data != null) {
//           orderDetail.value = response.data;
//           print('✅ Order details loaded successfully!');
//           print('   Order ID: ${orderDetail.value?.id}');
//           print('   Order Status: ${orderDetail.value?.orderStatus}');
//           print('   Product Count: ${orderDetail.value?.cartItems.length}');
//           print('   Total Price: ${orderDetail.value?.currencySign}${orderDetail.value?.totalPrice}');
//         } else {
//           errorMessage.value = 'No order details found';
//           print('ℹ️ No order details data received');
//         }
//       } else {
//         errorMessage.value = 'Failed to load order details';
//         print('❌ API returned false status');
//       }
//     } catch (e) {
//       errorMessage.value = 'Error: $e';
//       print('🔥 Exception fetching order details: $e');
//     } finally {
//       isLoading.value = false;
//       print('🏁 COMPLETED: Order details fetch finished');
//     }
//   }
//
//   // Get formatted order date
//   String getFormattedDate(String? dateTime) {
//     try {
//       if (dateTime == null || dateTime.isEmpty) return 'N/A';
//       final parts = dateTime.split(' ');
//       return parts.isNotEmpty ? parts[0] : dateTime;
//     } catch (e) {
//       return dateTime ?? 'N/A';
//     }
//   }
//
//   // Get status color
//   Color getStatusColor(String? status) {
//     final lowerStatus = status?.toLowerCase() ?? '';
//
//     switch (lowerStatus) {
//       case 'pending':
//       case 'processing':
//         return const Color(0xFF16423C);
//       case 'shipped':
//         return Colors.blue;
//       case 'delivered':
//         return Colors.green;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return const Color(0xFF16423C);
//     }
//   }
//
//   // Get status display text
//   String getStatusText(String? status) {
//     final lowerStatus = status?.toLowerCase() ?? '';
//
//     switch (lowerStatus) {
//       case 'pending':
//         return 'On Progress';
//       case 'processing':
//         return 'Processing';
//       case 'shipped':
//         return 'Shipped';
//       case 'delivered':
//         return 'Delivered';
//       case 'cancelled':
//         return 'Cancelled';
//       default:
//         return status ?? 'Unknown';
//     }
//   }
//
//   // Clear data
//   void clearData() {
//     orderDetail.value = null;
//     errorMessage.value = '';
//     currentOrderId = null;
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'order_sub_detail_apiservices.dart';
// import 'order_sub_detail_model.dart';
//
//
// class OrderDetailSingleController extends GetxController {
//   final OrderDetailSingleApiService _apiService = OrderDetailSingleApiService();
//
//   // Current order data
//   Rx<OrderDetailData?> orderDetail = Rx<OrderDetailData?>(null);
//
//   // Loading states
//   RxBool isLoading = false.obs;
//   RxString errorMessage = ''.obs;
//
//   // Order ID
//   int? currentOrderId;
//
//   @override
//   void onInit() {
//     super.onInit();
//     print('🟢 ORDER DETAILS CONTROLLER: Initialized');
//   }
//
//   // Fetch single order details
//   Future<void> fetchOrderDetails(int orderId) async {
//     print('\n🎬🎬🎬 CONTROLLER: STARTING fetchOrderDetails 🎬🎬🎬');
//     print('🎯 Target Order ID: $orderId');
//
//     try {
//       isLoading.value = true;
//       errorMessage.value = '';
//       currentOrderId = orderId;
//
//       // Clear previous data
//       orderDetail.value = null;
//
//       print('🔄 CONTROLLER: Calling API service...');
//       final response = await _apiService.fetchOrderDetails(orderId);
//
//       print('📨 CONTROLLER: API Response received');
//       print('   API Response Status: ${response.status}');
//       print('   Has Data: ${response.data != null}');
//
//       if (response.status) {
//         if (response.data != null) {
//           orderDetail.value = response.data;
//           print('✅✅✅ CONTROLLER: Order details LOADED SUCCESSFULLY! ✅✅✅');
//           print('   📋 Order ID: ${orderDetail.value?.id}');
//           print('   🏷️ Order Status: ${orderDetail.value?.orderStatus}');
//           print('   🛒 Product Count: ${orderDetail.value?.cartItems.length}');
//           print('   💰 Currency: ${orderDetail.value?.currencySign}');
//           print('   💵 Total Price: ${orderDetail.value?.currencySign}${orderDetail.value?.totalPrice}');
//           print('   📅 Created At: ${orderDetail.value?.createdAt}');
//
//           // Print cart items
//           if (orderDetail.value!.cartItems.isNotEmpty) {
//             print('   🛍️ Products in order:');
//             for (var item in orderDetail.value!.cartItems) {
//               print('      - ${item.name} (Qty: ${item.qty}) - ${orderDetail.value?.currencySign}${item.price}');
//             }
//           }
//         } else {
//           errorMessage.value = 'No order details found';
//           print('⚠️ CONTROLLER: No data in response');
//         }
//       } else {
//         errorMessage.value = 'Failed to load order details';
//         print('❌ CONTROLLER: API returned false status');
//       }
//     } catch (e) {
//       errorMessage.value = 'Error: $e';
//       print('🔥🔥🔥 CONTROLLER: Exception: $e');
//     } finally {
//       isLoading.value = false;
//       print('🏁 CONTROLLER: fetchOrderDetails completed');
//       print('   isLoading: ${isLoading.value}');
//       print('   errorMessage: "${errorMessage.value}"');
//       print('   orderDetail is null: ${orderDetail.value == null}');
//       print('🎬🎬🎬 CONTROLLER: END fetchOrderDetails 🎬🎬🎬\n');
//     }
//   }
//
//   // Get formatted order date
//   String getFormattedDate(String? dateTime) {
//     try {
//       if (dateTime == null || dateTime.isEmpty) return 'N/A';
//       final parts = dateTime.split(' ');
//       return parts.isNotEmpty ? parts[0] : dateTime;
//     } catch (e) {
//       return dateTime ?? 'N/A';
//     }
//   }
//
//   // Get status color
//   Color getStatusColor(String? status) {
//     final lowerStatus = status?.toLowerCase() ?? '';
//
//     switch (lowerStatus) {
//       case 'pending':
//       case 'processing':
//         return const Color(0xFF16423C);
//       case 'shipped':
//         return Colors.blue;
//       case 'delivered':
//         return Colors.green;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return const Color(0xFF16423C);
//     }
//   }
//
//   // Get status display text
//   String getStatusText(String? status) {
//     final lowerStatus = status?.toLowerCase() ?? '';
//
//     switch (lowerStatus) {
//       case 'pending':
//         return 'On Progress';
//       case 'processing':
//         return 'Processing';
//       case 'shipped':
//         return 'Shipped';
//       case 'delivered':
//         return 'Delivered';
//       case 'cancelled':
//         return 'Cancelled';
//       default:
//         return status ?? 'Unknown';
//     }
//   }
//
//   // Clear data
//   void clearData() {
//     orderDetail.value = null;
//     errorMessage.value = '';
//     currentOrderId = null;
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'order_sub_detail_apiservices.dart';
// import 'order_sub_detail_model.dart';
//
// class OrderDetailSingleController extends GetxController {
//   final OrderDetailSingleApiService _apiService = OrderDetailSingleApiService();
//
//   // Current order data
//   Rx<OrderDetailData?> orderDetail = Rx<OrderDetailData?>(null);
//
//   // Loading states
//   RxBool isLoading = false.obs;
//   RxString errorMessage = ''.obs;
//
//   // Order ID
//   int? currentOrderId;
//
//   // Track API calls from controller
//   RxInt apiCallCount = 0.obs;
//   RxString lastApiCallTime = ''.obs;
//   RxBool wasApiCalled = false.obs;
//
//
//   @override
//   void onInit() {
//     super.onInit();
//     print('🟢 ORDER DETAILS CONTROLLER: Initialized');
//   }
//
//   // Fetch single order details
//   Future<void> fetchOrderDetails(int orderId) async {
//     print('\n🎬🎬🎬 CONTROLLER: STARTING fetchOrderDetails 🎬🎬🎬');
//     print('🎯 Target Order ID: $orderId');
//     print('⏰ Controller Start Time: ${DateTime.now()}');
//
//     // Update tracking
//     apiCallCount.value++;
//     lastApiCallTime.value = DateTime.now().toString();
//     wasApiCalled.value = true;
//
//     try {
//       isLoading.value = true;
//       errorMessage.value = '';
//       currentOrderId = orderId;
//
//       // Clear previous data
//       orderDetail.value = null;
//
//       print('\n🔄 CONTROLLER: Calling API service...');
//       print('   API Service Instance: $_apiService');
//       print('   HashCode: ${_apiService.hashCode}');
//
//       final response = await _apiService.fetchOrderDetails(orderId);
//
//       print('\n📨 CONTROLLER: API Response received at ${DateTime.now()}');
//       print('   API Response Status: ${response.status}');
//       print('   Has Data: ${response.data != null}');
//
//       if (response.status) {
//         if (response.data != null) {
//           orderDetail.value = response.data;
//
//           print('\n✅✅✅ CONTROLLER: Order details LOADED SUCCESSFULLY! ✅✅✅');
//           print('   📋 Order ID: ${orderDetail.value?.id}');
//           print('   🏷️ Order Status: ${orderDetail.value?.orderStatus}');
//           print('   🛒 Product Count: ${orderDetail.value?.cartItems.length}');
//           print('   💰 Currency: ${orderDetail.value?.currencySign}');
//           print('   💵 Total Price: ${orderDetail.value?.currencySign}${orderDetail.value?.totalPrice}');
//           print('   📅 Created At: ${orderDetail.value?.createdAt}');
//
//           // Print cart items
//           if (orderDetail.value!.cartItems.isNotEmpty) {
//             print('   🛍️ Products in order:');
//             for (var item in orderDetail.value!.cartItems) {
//               print('      - ${item.name} (Qty: ${item.qty}) - ${orderDetail.value?.currencySign}${item.price}');
//             }
//           }
//         } else {
//           errorMessage.value = 'No order details found';
//           print('⚠️ CONTROLLER: No data in response');
//         }
//       } else {
//         errorMessage.value = 'Failed to load order details';
//         print('❌ CONTROLLER: API returned false status');
//       }
//     } catch (e) {
//       errorMessage.value = 'Error: $e';
//       print('🔥🔥🔥 CONTROLLER: Exception: $e');
//     } finally {
//       isLoading.value = false;
//       print('\n🏁 CONTROLLER: fetchOrderDetails completed');
//       print('   ⏰ Completion Time: ${DateTime.now()}');
//       print('   📊 API Call Count: ${apiCallCount.value}');
//       print('   ⏱️ Last Call Time: ${lastApiCallTime.value}');
//       print('   🔄 isLoading: ${isLoading.value}');
//       print('   ❌ errorMessage: "${errorMessage.value}"');
//       print('   📦 orderDetail is null: ${orderDetail.value == null}');
//       print('🎬🎬🎬 CONTROLLER: END fetchOrderDetails 🎬🎬🎬\n');
//     }
//   }
//
//   // Get formatted order date
//   String getFormattedDate(String? dateTime) {
//     try {
//       if (dateTime == null || dateTime.isEmpty) return 'N/A';
//       final parts = dateTime.split(' ');
//       return parts.isNotEmpty ? parts[0] : dateTime;
//     } catch (e) {
//       return dateTime ?? 'N/A';
//     }
//   }
//
//   // Get status color
//   Color getStatusColor(String? status) {
//     final lowerStatus = status?.toLowerCase() ?? '';
//
//     switch (lowerStatus) {
//       case 'pending':
//       case 'processing':
//         return const Color(0xFF16423C);
//       case 'shipped':
//         return Colors.blue;
//       case 'delivered':
//         return Colors.green;
//       case 'cancelled':
//         return Colors.red;
//       default:
//         return const Color(0xFF16423C);
//     }
//   }
//
//   // Get status display text
//   String getStatusText(String? status) {
//     final lowerStatus = status?.toLowerCase() ?? '';
//
//     switch (lowerStatus) {
//       case 'pending':
//         return 'On Progress';
//       case 'processing':
//         return 'Processing';
//       case 'shipped':
//         return 'Shipped';
//       case 'delivered':
//         return 'Delivered';
//       case 'cancelled':
//         return 'Cancelled';
//       default:
//         return status ?? 'Unknown';
//     }
//   }
//
//   // Clear data
//   void clearData() {
//     orderDetail.value = null;
//     errorMessage.value = '';
//     currentOrderId = null;
//   }
//
//   // Check if API was called
//   bool get wasApiCalledSuccessfully => wasApiCalled.value && orderDetail.value != null;
//
//   // Print API call summary
//   void printApiCallSummary() {
//     print('\n📋📋📋 API CALL SUMMARY 📋📋📋');
//     print('   Was API Called: ${wasApiCalled.value}');
//     print('   Total API Calls: ${apiCallCount.value}');
//     print('   Last API Call Time: ${lastApiCallTime.value}');
//     print('   Has Order Data: ${orderDetail.value != null}');
//     print('   Current Order ID: $currentOrderId');
//     print('📋📋📋📋📋📋📋📋📋📋📋📋📋📋\n');
//   }
//
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'order_sub_detail_apiservices.dart';
import 'order_sub_detail_model.dart';

class OrderDetailSingleController extends GetxController {
  final OrderDetailSingleApiService _apiService = OrderDetailSingleApiService();

  // Current order data
  Rx<OrderDetailData?> orderDetail = Rx<OrderDetailData?>(null);

  // Loading states
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  // Cancel states
  RxBool isCancelling = false.obs;
  RxString cancelMessage = ''.obs;
  RxBool showCancelButton = true.obs;

  // Order ID
  int? currentOrderId;

  // Track API calls from controller
  RxInt apiCallCount = 0.obs;
  RxString lastApiCallTime = ''.obs;
  RxBool wasApiCalled = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('🟢 ORDER DETAILS CONTROLLER: Initialized');
  }

  // Fetch single order details
  Future<void> fetchOrderDetails(int orderId) async {
    print('\n🎬🎬🎬 CONTROLLER: STARTING fetchOrderDetails 🎬🎬🎬');
    print('🎯 Target Order ID: $orderId');
    print('⏰ Controller Start Time: ${DateTime.now()}');

    // Update tracking
    apiCallCount.value++;
    lastApiCallTime.value = DateTime.now().toString();
    wasApiCalled.value = true;

    try {
      isLoading.value = true;
      errorMessage.value = '';
      currentOrderId = orderId;

      // Clear previous data
      orderDetail.value = null;

      print('\n🔄 CONTROLLER: Calling API service...');
      print('   API Service Instance: $_apiService');
      print('   HashCode: ${_apiService.hashCode}');

      final response = await _apiService.fetchOrderDetails(orderId);

      print('\n📨 CONTROLLER: API Response received at ${DateTime.now()}');
      print('   API Response Status: ${response.status}');
      print('   Has Data: ${response.data != null}');

      if (response.status) {
        if (response.data != null) {
          orderDetail.value = response.data;

          // Update cancel button visibility based on status
          showCancelButton.value = _canOrderBeCancelled(response.data!.orderStatus);

          print('\n✅✅✅ CONTROLLER: Order details LOADED SUCCESSFULLY! ✅✅✅');
          print('   📋 Order ID: ${orderDetail.value?.id}');
          print('   🏷️ Order Status: ${orderDetail.value?.orderStatus}');
          print('   🛒 Product Count: ${orderDetail.value?.cartItems.length}');
          print('   💰 Currency: ${orderDetail.value?.currencySign}');
          print('   💵 Total Price: ${orderDetail.value?.currencySign}${orderDetail.value?.totalPrice}');
          print('   📅 Created At: ${orderDetail.value?.createdAt}');

          // Print cart items
          if (orderDetail.value!.cartItems.isNotEmpty) {
            print('   🛍️ Products in order:');
            for (var item in orderDetail.value!.cartItems) {
              print('      - ${item.name} (Qty: ${item.qty}) - ${orderDetail.value?.currencySign}${item.price}');
            }
          }
        } else {
          errorMessage.value = 'No order details found';
          print('⚠️ CONTROLLER: No data in response');
        }
      } else {
        errorMessage.value = 'Failed to load order details';
        print('❌ CONTROLLER: API returned false status');
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
      print('🔥🔥🔥 CONTROLLER: Exception: $e');
    } finally {
      isLoading.value = false;
      print('\n🏁 CONTROLLER: fetchOrderDetails completed');
      print('   ⏰ Completion Time: ${DateTime.now()}');
      print('   📊 API Call Count: ${apiCallCount.value}');
      print('   ⏱️ Last Call Time: ${lastApiCallTime.value}');
      print('   🔄 isLoading: ${isLoading.value}');
      print('   ❌ errorMessage: "${errorMessage.value}"');
      print('   📦 orderDetail is null: ${orderDetail.value == null}');
      print('🎬🎬🎬 CONTROLLER: END fetchOrderDetails 🎬🎬🎬\n');
    }
  }

  // CANCEL ORDER FUNCTION
  Future<void> cancelOrder() async {
    if (currentOrderId == null) {
      cancelMessage.value = 'No order selected';
      return;
    }

    print('\n🚫🚫🚫 CONTROLLER: STARTING cancelOrder 🚫🚫🚫');
    print('🎯 Target Order ID: $currentOrderId');

    try {
      isCancelling.value = true;
      cancelMessage.value = '';

      print('🔄 CONTROLLER: Calling cancel API...');
      final response = await _apiService.cancelOrder(currentOrderId!);

      print('\n📨 CONTROLLER: Cancel API Response received');
      print('   Success: ${response['success']}');
      print('   Message: ${response['message']}');

      if (response['success'] == true) {
        cancelMessage.value = response['message'];

        // Refresh order details to get updated status
        await fetchOrderDetails(currentOrderId!);

        // Show success snackbar
        Get.snackbar(
          'Success',
          response['message'],
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      } else {
        cancelMessage.value = response['message'];

        // Show error snackbar
        Get.snackbar(
          'Failed',
          response['message'],
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
        );
      }
    } catch (e) {
      cancelMessage.value = 'Error: $e';
      print('🔥🔥🔥 CONTROLLER: Exception in cancelOrder: $e');

      Get.snackbar(
        'Error',
        'Failed to cancel order: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isCancelling.value = false;
      print('🏁 CONTROLLER: cancelOrder completed');
      print('🚫🚫🚫 CONTROLLER: END cancelOrder 🚫🚫🚫\n');
    }
  }

  // Check if order can be cancelled
  bool _canOrderBeCancelled(String? status) {
    final lowerStatus = status?.toLowerCase() ?? '';

    // Only pending/processing orders can be cancelled
    final cancellableStatuses = ['pending', 'processing', 'on progress'];

    return cancellableStatuses.contains(lowerStatus);
  }

  // Get formatted order date
  String getFormattedDate(String? dateTime) {
    try {
      if (dateTime == null || dateTime.isEmpty) return 'N/A';
      final parts = dateTime.split(' ');
      return parts.isNotEmpty ? parts[0] : dateTime;
    } catch (e) {
      return dateTime ?? 'N/A';
    }
  }

  // Get status color
  Color getStatusColor(String? status) {
    final lowerStatus = status?.toLowerCase() ?? '';

    switch (lowerStatus) {
      case 'pending':
      case 'processing':
        return const Color(0xFF16423C);
      case 'shipped':
        return Colors.blue;
      case 'delivered':
        return Colors.green;
      case 'cancelled':
        return Colors.red;
      default:
        return const Color(0xFF16423C);
    }
  }

  // Get status display text
  String getStatusText(String? status) {
    final lowerStatus = status?.toLowerCase() ?? '';

    switch (lowerStatus) {
      case 'pending':
        return 'On Progress';
      case 'processing':
        return 'Processing';
      case 'shipped':
        return 'Shipped';
      case 'delivered':
        return 'Delivered';
      case 'cancelled':
        return 'Cancelled';
      default:
        return status ?? 'Unknown';
    }
  }

  // Clear data
  void clearData() {
    orderDetail.value = null;
    errorMessage.value = '';
    currentOrderId = null;
    isCancelling.value = false;
    cancelMessage.value = '';
    showCancelButton.value = true;
  }

  // Check if API was called
  bool get wasApiCalledSuccessfully => wasApiCalled.value && orderDetail.value != null;

  // Print API call summary
  void printApiCallSummary() {
    print('\n📋📋📋 API CALL SUMMARY 📋📋📋');
    print('   Was API Called: ${wasApiCalled.value}');
    print('   Total API Calls: ${apiCallCount.value}');
    print('   Last API Call Time: ${lastApiCallTime.value}');
    print('   Has Order Data: ${orderDetail.value != null}');
    print('   Current Order ID: $currentOrderId');
    print('📋📋📋📋📋📋📋📋📋📋📋📋📋📋\n');
  }
}