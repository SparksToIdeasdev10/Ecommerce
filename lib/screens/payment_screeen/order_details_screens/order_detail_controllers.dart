// // // // order_details_controller.dart
// // // import 'package:get/get.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // // import 'order_detail_apiservices.dart';
// // // import 'order_details_model.dart';
// // //
// // //
// // // class OrderDetailsController extends GetxController {
// // //   final ApiService _apiService = ApiService();
// // //
// // //   // States
// // //   var isLoading = false.obs;
// // //   var orders = <OrderData>[].obs;
// // //   var errorMessage = ''.obs;
// // //   var selectedOrder = Rx<OrderData?>(null);
// // //
// // //   // Get token from SharedPreferences
// // //   Future<String?> getToken() async {
// // //     try {
// // //       final prefs = await SharedPreferences.getInstance();
// // //       final token = prefs.getString('token');
// // //       print('🔑 Retrieved token for order details: $token');
// // //       return token;
// // //     } catch (e) {
// // //       print('❌ Error getting token: $e');
// // //       return null;
// // //     }
// // //   }
// // //
// // //   // Fetch all orders for user
// // //   Future<void> fetchUserOrders() async {
// // //     try {
// // //       print('🔄 Fetching user orders...');
// // //       isLoading(true);
// // //       errorMessage('');
// // //
// // //       final token = await getToken();
// // //
// // //       if (token == null || token.isEmpty) {
// // //         errorMessage('Please login to view orders');
// // //         print('❌ No token found');
// // //         return;
// // //       }
// // //
// // //       final response = await _apiService.fetchOrderDetails(token);
// // //
// // //       if (response!.status) {
// // //         orders.value = response.data;
// // //         print('✅ Successfully loaded ${orders.length} orders');
// // //
// // //         // Sort by created date (newest first)
// // //         orders.sort((a, b) => b.createdAt.compareTo(a.createdAt));
// // //
// // //         if (orders.isNotEmpty) {
// // //           selectedOrder.value = orders.first;
// // //         }
// // //       } else {
// // //         errorMessage('Failed to load orders');
// // //         print('❌ API returned false status');
// // //       }
// // //     } catch (e) {
// // //       errorMessage('Error: $e');
// // //       print('🔥 Error fetching orders: $e');
// // //     } finally {
// // //       isLoading(false);
// // //     }
// // //   }
// // //
// // //   // Fetch single order by ID
// // //   Future<void> fetchOrderById(int orderId) async {
// // //     try {
// // //       print('🔄 Fetching order #$orderId...');
// // //       isLoading(true);
// // //       errorMessage('');
// // //
// // //       final token = await getToken();
// // //
// // //       if (token == null || token.isEmpty) {
// // //         errorMessage('Please login to view order');
// // //         return;
// // //       }
// // //
// // //       final order = await _apiService.fetchOrderById(token, orderId);
// // //       selectedOrder.value = order;
// // //
// // //       print('✅ Successfully loaded order #${order.id}');
// // //     } catch (e) {
// // //       errorMessage('Error: $e');
// // //       print('🔥 Error fetching order by ID: $e');
// // //     } finally {
// // //       isLoading(false);
// // //     }
// // //   }
// // //
// // //   // Select an order
// // //   void selectOrder(OrderData order) {
// // //     selectedOrder.value = order;
// // //     print('✅ Selected order #${order.id}');
// // //   }
// // //
// // //   // Get order by ID from local list
// // //   OrderData? getOrderById(int orderId) {
// // //     try {
// // //       return orders.firstWhere((order) => order.id == orderId);
// // //     } catch (e) {
// // //       return null;
// // //     }
// // //   }
// // //
// // //   // Clear all data
// // //   void clear() {
// // //     orders.clear();
// // //     selectedOrder.value = null;
// // //     errorMessage.value = '';
// // //     isLoading.value = false;
// // //   }
// // //
// // //   @override
// // //   void onInit() {
// // //     super.onInit();
// // //     // Optionally fetch orders when controller initializes
// // //     // fetchUserOrders();
// // //   }
// // // }
// //
// // //
// // // import 'dart:ui';
// // //
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // //
// // // import 'order_detail_apiservices.dart';
// // // import 'order_details_model.dart';
// // //
// // //
// // //
// // // class OrderListController extends GetxController {
// // //   final ApiService _apiService = ApiService();
// // //
// // //   // For all orders
// // //   RxList<OrderData> allOrders = <OrderData>[].obs;
// // //
// // //   // For active orders (Pending, Processing, Shipped)
// // //   RxList<OrderData> activeOrders = <OrderData>[].obs;
// // //
// // //   // For history orders (Delivered, Cancelled)
// // //   RxList<OrderData> historyOrders = <OrderData>[].obs;
// // //
// // //   // Loading states
// // //   RxBool isLoading = false.obs;
// // //   RxString errorMessage = ''.obs;
// // //
// // //   // Fetch all orders from API
// // //   Future<void> fetchAllOrders() async {
// // //     try {
// // //       isLoading.value = true;
// // //       errorMessage.value = '';
// // //
// // //       final response = await _apiService.fetchOrderList();
// // //
// // //       if (response != null && response.status == true) {
// // //         if (response.data.isNotEmpty) {
// // //           allOrders.value = response.data;
// // //
// // //           // Separate into active and history orders
// // //           _categorizeOrders();
// // //
// // //           print('✅ Orders loaded: ${allOrders.length} total');
// // //           print('   Active orders: ${activeOrders.length}');
// // //           print('   History orders: ${historyOrders.length}');
// // //         } else {
// // //           errorMessage.value = 'No orders found';
// // //           print('ℹ️ No orders data received');
// // //         }
// // //       } else {
// // //         errorMessage.value = 'Failed to load orders';
// // //         print('❌ API response status is false or null');
// // //       }
// // //     } catch (e) {
// // //       errorMessage.value = 'Error: $e';
// // //       print('🔥 Exception fetching orders: $e');
// // //     } finally {
// // //       isLoading.value = false;
// // //     }
// // //   }
// // //
// // //   // Categorize orders into active and history
// // //   void _categorizeOrders() {
// // //     activeOrders.clear();
// // //     historyOrders.clear();
// // //
// // //     for (var order in allOrders) {
// // //       if (_isHistoryOrder(order.orderStatus)) {
// // //         historyOrders.add(order);
// // //       } else {
// // //         activeOrders.add(order);
// // //       }
// // //     }
// // //   }
// // //
// // //   // Check if order is history (delivered or cancelled)
// // //   bool _isHistoryOrder(String status) {
// // //     final lowerStatus = status.toLowerCase();
// // //     return lowerStatus == 'delivered' ||
// // //         lowerStatus == 'cancelled' ||
// // //         lowerStatus == 'completed';
// // //   }
// // //
// // //   // Check if order is active
// // //   bool _isActiveOrder(String status) {
// // //     return !_isHistoryOrder(status);
// // //   }
// // //
// // //   // Get product name from order
// // //   String getProductName(OrderData order) {
// // //     if (order.cartItems.isNotEmpty) {
// // //       return order.cartItems.first.name;
// // //     }
// // //     return 'Product';
// // //   }
// // //
// // //   // Get product image from order
// // //   String getProductImage(OrderData order) {
// // //     if (order.cartItems.isNotEmpty) {
// // //       return order.cartItems.first.photo;
// // //     }
// // //     return '';
// // //   }
// // //
// // //   // Get product attributes
// // //   String getProductAttributes(OrderData order) {
// // //     if (order.cartItems.isNotEmpty) {
// // //       return order.cartItems.first.attributesString;
// // //     }
// // //     return '';
// // //   }
// // //
// // //   // Get total price for display
// // //   String getDisplayPrice(OrderData order) {
// // //     return '${order.currencySign}${order.totalPrice.toStringAsFixed(2)}';
// // //   }
// // //
// // //   // Get total quantity
// // //   int getTotalQuantity(OrderData order) {
// // //     int total = 0;
// // //     for (var item in order.cartItems) {
// // //       total += item.qty;
// // //     }
// // //     return total;
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
// // //   // Clear all data
// // //   void clearData() {
// // //     allOrders.clear();
// // //     activeOrders.clear();
// // //     historyOrders.clear();
// // //     errorMessage.value = '';
// // //   }
// // // }
// // import 'dart:ui';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'order_detail_apiservices.dart';
// // import 'order_details_model.dart';
// //
// // class OrderListController extends GetxController {
// //   final ApiService _apiService = ApiService();
// //
// //   // For all orders
// //   RxList<OrderData> allOrders = <OrderData>[].obs;
// //   RxList<OrderData> activeOrders = <OrderData>[].obs;
// //   RxList<OrderData> historyOrders = <OrderData>[].obs;
// //
// //   // Loading states
// //   RxBool isLoading = false.obs;
// //   RxString errorMessage = ''.obs;
// //
// //   @override
// //   void onInit() {
// //     super.onInit();
// //     print('✅ OrderListController initialized');
// //   }
// //
// //   // Fetch all orders from API
// //   Future<void> fetchAllOrders() async {
// //     try {
// //       print('🔄 Starting fetchAllOrders...');
// //       isLoading.value = true;
// //       errorMessage.value = '';
// //
// //       final response = await _apiService.fetchOrderList();
// //
// //       print('📨 API Response received');
// //       print('   Status: ${response.status}');
// //       print('   Data length: ${response.data.length}');
// //
// //       if (response.status) {
// //         if (response.data.isNotEmpty) {
// //           allOrders.value = response.data;
// //           print('✅ Orders loaded: ${allOrders.length} items');
// //
// //           // Separate into active and history orders
// //           _categorizeOrders();
// //
// //           print('📊 Order breakdown:');
// //           print('   Total orders: ${allOrders.length}');
// //           print('   Active orders: ${activeOrders.length}');
// //           print('   History orders: ${historyOrders.length}');
// //
// //           // Log first order for debugging
// //           if (allOrders.isNotEmpty) {
// //             final firstOrder = allOrders.first;
// //             print('📋 First order details:');
// //             print('   Order ID: ${firstOrder.id}');
// //             print('   Status: ${firstOrder.orderStatus}');
// //             print('   Product: ${firstOrder.displayProductName}');
// //             print('   Price: \$${firstOrder.totalPrice.toStringAsFixed(2)}');
// //           }
// //         } else {
// //           errorMessage.value = 'No orders found';
// //           print('ℹ️ No orders in response');
// //         }
// //       } else {
// //         errorMessage.value = 'Failed to load orders. Please try again.';
// //         print('❌ API returned false status');
// //       }
// //     } catch (e) {
// //       errorMessage.value = 'Error: $e';
// //       print('🔥 Exception in fetchAllOrders: $e');
// //     } finally {
// //       isLoading.value = false;
// //       print('🏁 fetchAllOrders completed');
// //     }
// //   }
// //
// //   // Categorize orders
// //   void _categorizeOrders() {
// //     activeOrders.clear();
// //     historyOrders.clear();
// //
// //     for (var order in allOrders) {
// //       if (_isHistoryOrder(order.orderStatus)) {
// //         historyOrders.add(order);
// //       } else {
// //         activeOrders.add(order);
// //       }
// //     }
// //   }
// //
// //   bool _isHistoryOrder(String status) {
// //     final lowerStatus = status.toLowerCase();
// //     return lowerStatus == 'delivered' ||
// //         lowerStatus == 'cancelled' ||
// //         lowerStatus == 'completed';
// //   }
// //
// //   // Helper methods for UI
// //   String getProductName(OrderData order) => order.displayProductName;
// //
// //   String getProductImage(OrderData order) => order.displayProductImage;
// //
// //   String getProductAttributes(OrderData order) {
// //     final item = order.firstCartItem;
// //     return item?.attributesString ?? '';
// //   }
// //
// //   String getDisplayPrice(OrderData order) {
// //     return '${order.currencySign}${order.totalPrice.toStringAsFixed(2)}';
// //   }
// //
// //   int getTotalQuantity(OrderData order) {
// //     int total = 0;
// //     for (var item in order.cartItems) {
// //       total += item.qty;
// //     }
// //     return total;
// //   }
// //
// //   String getStatusText(String status) {
// //     final lowerStatus = status.toLowerCase();
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
// //         return status;
// //     }
// //   }
// //
// //   Color getStatusColor(String status) {
// //     final lowerStatus = status.toLowerCase();
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
// //   void clearData() {
// //     allOrders.clear();
// //     activeOrders.clear();
// //     historyOrders.clear();
// //     errorMessage.value = '';
// //   }
// // }
//
// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'order_detail_apiservices.dart';
// import 'order_details_model.dart';
//
// class OrderListController extends GetxController {
//   final ApiService _apiService = ApiService();
//
//   // For all orders
//   RxList<OrderData> allOrders = <OrderData>[].obs;
//
//   // For active orders (Pending, Processing, Shipped)
//   RxList<OrderData> activeOrders = <OrderData>[].obs;
//
//   // For history orders (Delivered, Cancelled)
//   RxList<OrderData> historyOrders = <OrderData>[].obs;
//
//   // Loading states
//   RxBool isLoading = false.obs;
//   RxString errorMessage = ''.obs;
//
//   // Fetch all orders from API
//   Future<void> fetchAllOrders() async {
//     try {
//       isLoading.value = true;
//       errorMessage.value = '';
//
//       final response = await _apiService.fetchOrderList();
//
//       if (response != null && response.status == true) {
//         if (response.data.isNotEmpty) {
//           allOrders.value = response.data;
//
//           // Separate into active and history orders
//           _categorizeOrders();
//
//           print('✅ Orders loaded: ${allOrders.length} total');
//           print('   Active orders: ${activeOrders.length}');
//           print('   History orders: ${historyOrders.length}');
//         } else {
//           errorMessage.value = 'No orders found';
//           print('ℹ️ No orders data received');
//         }
//       } else {
//         errorMessage.value = 'Failed to load orders';
//         print('❌ API response status is false or null');
//       }
//     } catch (e) {
//       errorMessage.value = 'Error: $e';
//       print('🔥 Exception fetching orders: $e');
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Categorize orders into active and history
//   void _categorizeOrders() {
//     activeOrders.clear();
//     historyOrders.clear();
//
//     for (var order in allOrders) {
//       if (_isHistoryOrder(order.orderStatus)) {
//         historyOrders.add(order);
//       } else {
//         activeOrders.add(order);
//       }
//     }
//   }
//
//   // Check if order is history (delivered or cancelled)
//   bool _isHistoryOrder(String status) {
//     final lowerStatus = status.toLowerCase();
//     return lowerStatus == 'delivered' ||
//         lowerStatus == 'cancelled' ||
//         lowerStatus == 'completed';
//   }
//
//   // Check if order is active
//   bool _isActiveOrder(String status) {
//     return !_isHistoryOrder(status);
//   }
//
//   // Get product name from order
//   String getProductName(OrderData order) {
//     if (order.cartItems.isNotEmpty) {
//       return order.cartItems.first.name;
//     }
//     return 'Product';
//   }
//
//   // Get product image from order
//   String getProductImage(OrderData order) {
//     if (order.cartItems.isNotEmpty) {
//       return order.cartItems.first.photo;
//     }
//     return '';
//   }
//
//   // Get product attributes
//   String getProductAttributes(OrderData order) {
//     if (order.cartItems.isNotEmpty) {
//       return order.cartItems.first.attributesString;
//     }
//     return '';
//   }
//
//   // Get total price for display
//   String getDisplayPrice(OrderData order) {
//     return '${order.currencySign}${order.totalPrice.toStringAsFixed(2)}';
//   }
//
//   // Get total quantity
//   int getTotalQuantity(OrderData order) {
//     int total = 0;
//     for (var item in order.cartItems) {
//       total += item.qty;
//     }
//     return total;
//   }
//
//   // Get status display text
//   String getStatusText(String status) {
//     final lowerStatus = status.toLowerCase();
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
//         return status;
//     }
//   }
//
//   // Get status color
//   Color getStatusColor(String status) {
//     final lowerStatus = status.toLowerCase();
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
//   // Clear all data
//   void clearData() {
//     allOrders.clear();
//     activeOrders.clear();
//     historyOrders.clear();
//     errorMessage.value = '';
//   }
// }

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import 'order_detail_apiservices.dart';
import 'order_details_model.dart';

class OrderListController extends GetxController {
  final ApiService _apiService = ApiService();

  // For all orders
  RxList<OrderData> allOrders = <OrderData>[].obs;
  RxList<OrderData> activeOrders = <OrderData>[].obs;
  RxList<OrderData> historyOrders = <OrderData>[].obs;

  // Loading states
  RxBool isLoading = false.obs;
  RxString errorMessage = ''.obs;

  // Track if we've already fetched
  RxBool hasFetched = false.obs;

  @override
  void onInit() {
    super.onInit();
    print('✅ OrderListController initialized');
  }

  // Fetch all orders from API - call this only once
  Future<void> fetchAllOrders() async {
    // Prevent multiple calls
    if (isLoading.value || hasFetched.value) {
      print('⚠️ Already fetching or has fetched, skipping...');
      return;
    }

    try {
      print('🔄 STARTING: Fetching orders...');
      isLoading.value = true;
      errorMessage.value = '';

      final response = await _apiService.fetchOrderList();

      if (response != null && response.status == true) {
        if (response.data.isNotEmpty) {
          // Clear existing data
          allOrders.clear();
          activeOrders.clear();
          historyOrders.clear();

          // Add new data
          allOrders.value = response.data;

          // Separate into active and history orders
          _categorizeOrders();

          print('✅ Orders loaded successfully!');
          print('   Total orders: ${allOrders.length}');
          print('   Active orders: ${activeOrders.length}');
          print('   History orders: ${historyOrders.length}');

          // Mark as fetched
          hasFetched.value = true;
        } else {
          errorMessage.value = 'No orders found';
          print('ℹ️ No orders data received');
        }
      } else {
        errorMessage.value = 'Failed to load orders';
        print('❌ API response status is false or null');
      }
    } catch (e) {
      errorMessage.value = 'Error: $e';
      print('🔥 Exception fetching orders: $e');
    } finally {
      isLoading.value = false;
      print('🏁 COMPLETED: Order fetch finished');
    }
  }

  // Force refresh if needed
  Future<void> refreshOrders() async {
    hasFetched.value = false;
    await fetchAllOrders();
  }

  // ... keep all your other methods exactly as they were
  void _categorizeOrders() {
    activeOrders.clear();
    historyOrders.clear();

    for (var order in allOrders) {
      if (_isHistoryOrder(order.orderStatus)) {
        historyOrders.add(order);
      } else {
        activeOrders.add(order);
      }
    }
  }

  bool _isHistoryOrder(String status) {
    final lowerStatus = status.toLowerCase();
    return lowerStatus == 'delivered' ||
        lowerStatus == 'cancelled' ||
        lowerStatus == 'completed';
  }

  String getProductName(OrderData order) {
    if (order.cartItems.isNotEmpty) {
      return order.cartItems.first.name;
    }
    return 'Product';
  }

  String getProductImage(OrderData order) {
    if (order.cartItems.isNotEmpty) {
      return order.cartItems.first.photo;
    }
    return '';
  }

  String getProductAttributes(OrderData order) {
    if (order.cartItems.isNotEmpty) {
      return order.cartItems.first.attributesString;
    }
    return '';
  }

  String getDisplayPrice(OrderData order) {
    return '${order.currencySign}${order.totalPrice.toStringAsFixed(2)}';
  }

  int getTotalQuantity(OrderData order) {
    int total = 0;
    for (var item in order.cartItems) {
      total += item.qty;
    }
    return total;
  }

  String getStatusText(String status) {
    final lowerStatus = status.toLowerCase();

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
        return status;
    }
  }

  Color getStatusColor(String status) {
    final lowerStatus = status.toLowerCase();

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

  void clearData() {
    allOrders.clear();
    activeOrders.clear();
    historyOrders.clear();
    errorMessage.value = '';
    hasFetched.value = false;
  }
}