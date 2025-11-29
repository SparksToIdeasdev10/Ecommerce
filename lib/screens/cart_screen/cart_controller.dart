// // controllers/cart_controller.dart
// import 'package:get/get.dart';
//
// import 'cart_model.dart';
//
// class CartController extends GetxController {
//   final RxList<CartItem> _cartItems = <CartItem>[].obs;
//
//   List<CartItem> get cartItems => _cartItems;
//
//   // Total calculations
//   double get subtotal => _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
//   double get shippingFee => _cartItems.isNotEmpty ? 5.00 : 0.0;
//   double get totalAmount => subtotal + shippingFee;
//
//   // Cart item count for badge
//   int get totalItems => _cartItems.fold(0, (sum, item) => sum + item.quantity);
//
//   // Add to cart with proper logic
//   void addToCart(CartItem newItem) {
//     final existingItemIndex = _cartItems.indexWhere(
//           (item) =>
//       item.id == newItem.id &&
//           item.selectedSize == newItem.selectedSize &&
//           item.selectedColor == newItem.selectedColor,
//     );
//
//     if (existingItemIndex != -1) {
//       // Update quantity if same product with same options exists
//       updateQuantity(
//         _cartItems[existingItemIndex].id,
//         _cartItems[existingItemIndex].quantity + newItem.quantity,
//         selectedSize: newItem.selectedSize,
//         selectedColor: newItem.selectedColor,
//       );
//     } else {
//       // Add new item
//       _cartItems.add(newItem);
//     }
//     _cartItems.refresh();
//   }
//
//   // Update quantity
//   void updateQuantity(String itemId, int newQuantity, {String? selectedSize, String? selectedColor}) {
//     final itemIndex = _cartItems.indexWhere(
//           (item) =>
//       item.id == itemId &&
//           item.selectedSize == selectedSize &&
//           item.selectedColor == selectedColor,
//     );
//
//     if (itemIndex != -1) {
//       if (newQuantity <= 0) {
//         removeFromCart(itemId, selectedSize: selectedSize, selectedColor: selectedColor);
//       } else {
//         _cartItems[itemIndex] = _cartItems[itemIndex].copyWith(quantity: newQuantity);
//         _cartItems.refresh();
//       }
//     }
//   }
//
//   // Remove from cart
//   void removeFromCart(String itemId, {String? selectedSize, String? selectedColor}) {
//     _cartItems.removeWhere(
//           (item) =>
//       item.id == itemId &&
//           item.selectedSize == selectedSize &&
//           item.selectedColor == selectedColor,
//     );
//     _cartItems.refresh();
//   }
//
//   // Clear cart
//   void clearCart() {
//     _cartItems.clear();
//   }
//
//   // Check if item exists in cart (for UI states)
//   bool isItemInCart(String itemId, {String? selectedSize, String? selectedColor}) {
//     return _cartItems.any(
//           (item) =>
//       item.id == itemId &&
//           item.selectedSize == selectedSize &&
//           item.selectedColor == selectedColor,
//     );
//   }
//
//   // Get item quantity (for product detail page)
//   int getItemQuantity(String itemId, {String? selectedSize, String? selectedColor}) {
//     final item = _cartItems.firstWhere(
//           (item) =>
//       item.id == itemId &&
//           item.selectedSize == selectedSize &&
//           item.selectedColor == selectedColor,
//       orElse: () => CartItem(
//         id: '',
//         title: '',
//         category: '',
//         price: 0,
//         imageUrl: '',
//         quantity: 0,
//       ),
//     );
//     return item.quantity;
//   }
// }

//
// import 'package:ecommerce/screens/cart_screen/cart_apiservice.dart';
// import 'package:ecommerce/screens/cart_screen/cart_model.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CartController extends GetxController {
//
//
//
//   var iscatsloading = false.obs;
//   var categoriessList = <CartItem>[].obs; // ADD THIS LINE
//
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print("🔑 Retrieved token for banners: $token");
//       return token;
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   Future<void> ecatcont() async {
//     try {
//       iscatsloading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for banners");
//         return;
//       }
//       final respo = await apii().catdata(token);
//       print("✅ API Response status: ${respo.status}");
//
//
//       // DEBUG: Check if data is null
//       print("🔍 Is data null: ${respo.data == null}");
//
//       if (respo.status == true && respo.data != null) {
//
//         categoriessList.value = respo.data; // ADD THIS LINE
//         print("✅ Loaded ${categoriessList.length} categories from API");
//       }
//       else {
//         print("❌ API returned false status");
//       }
//     }
//     catch (e) {
//       iscatsloading.value = false;
//       print("❌ Error in ehomecatcont: $e");
//     } finally {
//       iscatsloading.value = false;
//     }
//   }
// }

// cart_controller.dart

import 'package:ecommerce/screens/cart_screen/cart_apiservice.dart';
import 'package:ecommerce/screens/cart_screen/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartController extends GetxController {
  var isLoading = false.obs;
  var cartItems = <CartItem>[].obs;
  var itemCount = 0.obs;
  var totalAmount = 0.0.obs;

  final CartApiService _cartApiService = CartApiService();

  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token for cart: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

  Future<void> fetchCartItems() async {
    try {
      isLoading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for cart");
        isLoading.value = false;
        return;
      }

      print("🔄 Fetching cart items...");
      final response = await _cartApiService.getCartItems(token);

      if (response.status == true) {
        cartItems.value = response.data;
        print("${cartItems}");
        itemCount.value = response.count;
        print("🎉 Cart items loaded successfully! Count: ${itemCount.value}");
      } else {
        print("❌ Failed to load cart items");
        cartItems.value = [];
        itemCount.value = 0;
      }
    } catch (e) {
      isLoading.value = false;
      print("❌ Error in fetchCartItems: $e");
      Get.snackbar(
        'Error',
        'Failed to load cart items: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }


  Future<String?> _getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

//cart update controller
//   Future<void> updateQuantity(int cartId, int newQuantity) async {
//     try {
//       if (newQuantity <= 0) {
//         await removeFromCart(cartId);
//         return;
//       }
//
//       String? token = await _getToken();
//       if (token == null) return;
//
//       await _cartApiService.updateCartQuantity(token, cartId, newQuantity);
//       // Refresh the cart
//       fetchCartItems();
//     } catch (e) {
//       print("❌ Error updating quantity: $e");
//     }
//   }

  Future<void> updateQuantity(int cartId, int newQuantity) async {
    try {
      if (newQuantity <= 0) {
        await removeFromCart(cartId);
        return;
      }

      String? token = await _getToken();
      if (token == null) return;

      await _cartApiService.updateCartQuantity(token, cartId, newQuantity);
      // Refresh the cart
      fetchCartItems();
    } catch (e) {
      print("❌ Error updating quantity: $e");
    }
  }

  // Future<void> removeFromCart(int cartId) async {
  //   try {
  //     String? token = await _getToken();
  //     if (token == null) return;
  //
  //     await _cartApiService.removeFromCart(token, cartId);
  //     // Refresh the cart
  //     fetchCartItems();
  //   } catch (e) {
  //     print("❌ Error removing from cart: $e");
  //   }
  // }


//remove cart




// Remove item from cart
  Future<void> removeFromCart(int cartId) async {
    try {
      String? token = await _getToken();
      if (token == null) {
        print("❌ No token available for cart removal");
        return;
      }

      print("🗑️ Removing cart item with ID: $cartId");
      await _cartApiService.removeFromCart(token, cartId);

      // Refresh the cart
      await fetchCartItems();

      print("✅ Cart item removed successfully");

    } catch (e) {
      print("❌ Error removing from cart: $e");
      Get.snackbar(
        'Error',
        'Failed to remove item from cart: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }
}