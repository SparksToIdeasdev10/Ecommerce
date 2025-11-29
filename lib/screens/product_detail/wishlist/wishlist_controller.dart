// // controllers/wishlist_controller.dart
// import 'dart:ui';
//
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_apiservices.dart';
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
//
// class WishlistController extends GetxController {
//   final WishlistApiService _apiService = WishlistApiService();
//
//   final RxList<WishlistItem> wishlistItems = <WishlistItem>[].obs;
//   final RxBool isLoading = false.obs;
//   final RxString errorMessage = ''.obs;
//   final RxInt wishlistCount = 0.obs;
//
//   @override
//   void onInit() {
//     super.onInit();
//     fetchWishlist();
//   }
//
//   Future<void> fetchWishlist() async {
//     try {
//       isLoading.value = true;
//       errorMessage.value = '';
//
//       final response = await _apiService.getWishlist();
//
//       wishlistItems.assignAll(response.data);
//       wishlistCount.value = response.count;
//
//       if (response.data.isEmpty) {
//         errorMessage.value = 'Your wishlist is empty';
//       }
//     } catch (e) {
//       errorMessage.value = 'Failed to load wishlist: $e';
//       wishlistItems.clear();
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Future<bool> addToWishlist(int productId) async {
//   //   try {
//   //     final success = await _apiService.addToWishlist(productId);
//   //     if (success) {
//   //       // Refresh the wishlist after adding
//   //       await fetchWishlist();
//   //       Get.snackbar(
//   //         'Success!',
//   //         'Product added to wishlist',
//   //         backgroundColor: const Color(0xFF16423C),
//   //         colorText: Colors.white,
//   //       );
//   //       return true;
//   //     }
//   //     return false;
//   //   } catch (e) {
//   //     String errorMessage = e.toString();
//   //
//   //     if (errorMessage.contains('not authenticated')) {
//   //       Get.snackbar(
//   //         'Login Required',
//   //         'Please login to add items to wishlist',
//   //         backgroundColor: Colors.orange,
//   //         colorText: Colors.white,
//   //       );
//   //     } else {
//   //       Get.snackbar(
//   //         'Error',
//   //         'Failed to add to wishlist: $e',
//   //         backgroundColor: Colors.red,
//   //         colorText: Colors.white,
//   //       );
//   //     }
//   //     return false;
//   //   }
//   // }
//   Future<bool> addToWishlist(int productId) async {
//     try {
//       print("\n🎯 ===== STARTING ADD TO WISHLIST =====");
//       print("🎯 Product ID: $productId");
//       print("📊 Current wishlist before adding:");
//       for (var item in wishlistItems) {
//         print("   - ${item.id}: ${item.name}");
//       }
//
//       final success = await _apiService.addToWishlist(productId);
//       print("📡 API call result: $success");
//
//       if (success) {
//         // Refresh to get updated data
//         await fetchWishlist();
//
//         print("📊 Wishlist after adding:");
//         for (var item in wishlistItems) {
//           print("   - ${item.id}: ${item.name}");
//         }
//
//         final isActuallyAdded = wishlistItems.any((item) => item.id == productId);
//         print("✅ Product $productId actually in wishlist: $isActuallyAdded");
//
//         if (isActuallyAdded) {
//           Get.snackbar(
//             'Success!',
//             'Product added to wishlist',
//             backgroundColor: const Color(0xFF16423C),
//             colorText: Colors.white,
//           );
//           return true;
//         } else {
//           Get.snackbar(
//             'Notice',
//             'Product might already be in wishlist',
//             backgroundColor: Colors.orange,
//             colorText: Colors.white,
//           );
//           return false;
//         }
//       }
//       return false;
//     } catch (e) {
//       print("❌ Error: $e");
//       Get.snackbar(
//         'Error',
//         'Failed to add to wishlist',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return false;
//     }
//   }
//
//   Future<bool> removeFromWishlist(int wishlistId) async {
//     try {
//       final success = await _apiService.removeFromWishlist(wishlistId);
//       if (success) {
//         // Remove item from local list immediately
//         wishlistItems.removeWhere((item) => item.wishlistId == wishlistId);
//         wishlistCount.value = wishlistItems.length;
//
//         Get.snackbar(
//           'Removed',
//           'Product removed from wishlist',
//           backgroundColor: const Color(0xFF16423C),
//           colorText: Colors.white,
//         );
//         return true;
//       }
//       return false;
//     } catch (e) {
//       Get.snackbar(
//         'Error',
//         'Failed to remove from wishlist: $e',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return false;
//     }
//   }
//
//   bool isInWishlist(int productId) {
//     return wishlistItems.any((item) => item.id == productId);
//   }
//
//   void clearWishlist() {
//     wishlistItems.clear();
//     wishlistCount.value = 0;
//     errorMessage.value = 'Your wishlist is empty';
//   }
// }
//
// import 'dart:ui';
//
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_apiservices.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'wishlist_model.dart';
//
// class wishlistcontroller extends GetxController{
//
//   var iswishlistloading = false.obs;
//   var wishlistresponse = WishlistItem().obs;
//
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
// //fetch wishlist controller
//   Future<void> ewishlistcont() async {
//     try {
//       iswishlistloading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for banners");
//         return;
//       }
//       final respo = await apiservicesm().wishlistdata(token);
//
//       // DEBUG: Check if data is null
//
//
//       if (respo.status == true && respo.data != null) {
//
//         wishlistresponse.value = respo; // ADD THIS LINE
//
//       }
//       else {
//         print("❌ API returned false status");
//       }
//     }
//     catch (e) {
//       iswishlistloading.value = false;
//       print("❌ Error in ehomecatcont: $e");
//     } finally {
//       iswishlistloading.value = false;
//     }
//   }
//
//   //addwishlist controller
//
//   Future<bool> addToWishlist(int productId) async {
//     try {
//       final success = await apiservicesm.addToWishlistdata(productId);
//       if (success) {
//         // Refresh the wishlist after adding
//         await ewishlistcont();
//         Get.snackbar(
//           'Success!',
//           'Product added to wishlist',
//           backgroundColor: const Color(0xFF16423C),
//           colorText: Colors.white,
//         );
//         return true;
//       }
//       return false;
//     } catch (e) {
//       String errorMessage = e.toString();
//
//       if (errorMessage.contains('not authenticated')) {
//         Get.snackbar(
//           'Login Required',
//           'Please login to add items to wishlist',
//           backgroundColor: Colors.orange,
//           colorText: Colors.white,
//         );
//       } else {
//         Get.snackbar(
//           'Error',
//           'Failed to add to wishlist: $e',
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//       return false;
//     }
//   }
//
// }
//
// import 'dart:ui';
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_apiservices.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'wishlist_model.dart';
//
// class wishlistcontroller extends GetxController {
//   var iswishlistloading = false.obs;
//   // FIX: Change from WishlistItem to WishlistResponse
//   var wishlistresponse = WishlistResponse(
//     status: false,
//     message: '',
//     count: 0,
//     data: [],
//   ).obs;
//
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print("🔑 Retrieved token for wishlist: $token");
//       return token;
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   // Fetch wishlist controller - FIXED
//   Future<void> ewishlistcont() async {
//     try {
//       iswishlistloading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for wishlist");
//         return;
//       }
//
//       // FIX: This now returns WishlistResponse (not WishlistItem)
//       final WishlistResponse respo = await apiservicesm().wishlistdata(token);
//
//       print("✅ Wishlist API call successful");
//       print("📊 Wishlist count: ${respo.count}");
//       print("📦 Wishlist items: ${respo.data.length}");
//
//       // FIX: Now checking status from WishlistResponse (not WishlistItem)
//       if (respo.status == true) {
//         wishlistresponse.value = respo;
//         print("🎉 Successfully loaded ${respo.data.length} wishlist items");
//       } else {
//         print("❌ API returned false status: ${respo.message}");
//       }
//     } catch (e) {
//       print("❌ Error in ewishlistcont: $e");
//       Get.snackbar(
//         'Error',
//         'Failed to load wishlist: $e',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       iswishlistloading.value = false;
//     }
//   }
//
//   // Add wishlist controller
//   Future<bool> addToWishlist(int productId) async {
//     try {
//       final success = await apiservicesm().addToWishlistdata(productId);
//       if (success) {
//         // Refresh the wishlist after adding
//         await ewishlistcont();
//         Get.snackbar(
//           'Success!',
//           'Product added to wishlist',
//           backgroundColor: const Color(0xFF16423C),
//           colorText: Colors.white,
//         );
//         return true;
//       }
//       return false;
//     } catch (e) {
//       String errorMessage = e.toString();
//
//       if (errorMessage.contains('not authenticated')) {
//         Get.snackbar(
//           'Login Required',
//           'Please login to add items to wishlist',
//           backgroundColor: Colors.orange,
//           colorText: Colors.white,
//         );
//       } else {
//         Get.snackbar(
//           'Error',
//           'Failed to add to wishlist: $e',
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//       }
//       return false;
//     }
//   }
//
//   // Helper method to check if product is in wishlist
//   bool isProductInWishlist(int productId) {
//     return wishlistresponse.value.data.any((item) => item.id == productId);
//   }
//
//   // Get wishlist item count
//   int get wishlistItemCount => wishlistresponse.value.data.length;
//
//   // Remove from wishlist (if you need it)
//   Future<bool> removeFromWishlist(int productId) async {
//     // Implement remove from wishlist logic here
//     // You'll need to create a remove API endpoint
//     return false;
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'wishlist_apiservices.dart';
// import 'wishlist_model.dart';
//
// class WishlistController extends GetxController {
//   var isLoading = false.obs;
//   var wishlistResponse = WishlistResponse(
//     status: false,
//     message: '',
//     count: 0,
//     data: [],
//   ).obs;
//
//   final ApiServices _apiServices = ApiServices();
//
//   // Get token
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       return prefs.getString('token');
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   // Fetch wishlist
//   Future<void> fetchWishlist() async {
//     try {
//       isLoading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available");
//         return;
//       }
//
//       final response = await _apiServices.getWishlist(token);
//       wishlistResponse.value = response;
//
//       if (response.status) {
//         print("✅ Wishlist loaded: ${response.data.length} items");
//       } else {
//         print("❌ Failed to load wishlist: ${response.message}");
//       }
//     } catch (e) {
//       print("❌ Error fetching wishlist: $e");
//       Get.snackbar(
//         'Error',
//         'Failed to load wishlist',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Add to wishlist
//   Future<bool> addToWishlist(int productId) async {
//     try {
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         Get.snackbar(
//           'Login Required',
//           'Please login to add items to wishlist',
//           backgroundColor: Colors.orange,
//           colorText: Colors.white,
//         );
//         return false;
//       }
//
//       final response = await _apiServices.addToWishlist(productId, token);
//
//       if (response.status) {
//         // Refresh wishlist after adding
//         await fetchWishlist();
//         Get.snackbar(
//           'Success!',
//           response.message,
//           backgroundColor: Color(0xFF16423C),
//           colorText: Colors.white,
//         );
//         return true;
//       } else {
//         Get.snackbar(
//           'Error',
//           response.message,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//         return false;
//       }
//     } catch (e) {
//       print("❌ Error adding to wishlist: $e");
//       Get.snackbar(
//         'Error',
//         'Failed to add to wishlist',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return false;
//     }
//   }
//
//   // Check if product is in wishlist
//   bool isInWishlist(int productId) {
//     return wishlistResponse.value.data.any((item) => item.id == productId);
//   }
//
//   // Get wishlist item count
//   int get itemCount => wishlistResponse.value.data.length;
//
//   // Remove from wishlist (if you need it later)
//   Future<bool> removeFromWishlist(int wishlistId) async {
//     // Implement remove functionality when you have the API
//     return false;
//   }
// }


//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'wishlist_apiservices.dart';
// import 'wishlist_model.dart';
//
// class WishlistController extends GetxController {
//   var isLoading = false.obs;
//   var wishlistResponse = WishlistResponse(
//     status: false,
//     message: '',
//     count: 0,
//     data: [],
//   ).obs;
//
//
//
//   // Get token
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       return prefs.getString('token');
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   // Fetch wishlist
//   Future<void> fetchWishlist() async {
//     try {
//       isLoading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available");
//         return;
//       }
//
//       final response = await ApiServices().getWishlist(token);
//       wishlistResponse.value = response;
//
//       if (response.status) {
//         print("✅ Wishlist loaded: ${response.data.length} items");
//       } else {
//         print("❌ Failed to load wishlist: ${response.message}");
//       }
//     } catch (e) {
//       print("❌ Error fetching wishlist: $e");
//       Get.snackbar(
//         'Error',
//         'Failed to load wishlist',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Add to wishlist
//   Future<bool> addToWishlist(int productId) async {
//     try {
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         Get.snackbar(
//           'Login Required',
//           'Please login to add items to wishlist',
//           backgroundColor: Colors.orange,
//           colorText: Colors.white,
//         );
//         return false;
//       }
//
//       final response = await ApiServices().addToWishlist(productId, token);
//
//       if (response.status) {
//         // Refresh wishlist after adding
//         await fetchWishlist();
//         Get.snackbar(
//           'Success!',
//           response.message,
//           backgroundColor: Color(0xFF16423C),
//           colorText: Colors.white,
//         );
//         return true;
//       } else {
//         Get.snackbar(
//           'Error',
//           response.message,
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//         return false;
//       }
//     } catch (e) {
//       print("❌ Error adding to wishlist: $e");
//       Get.snackbar(
//         'Error',
//         'Failed to add to wishlist',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return false;
//     }
//   }
//
//   // Check if product is in wishlist
//   bool isInWishlist(int productId) {
//     return wishlistResponse.value.data.any((item) => item.id == productId);
//   }
//
//   // Get wishlist item count
//   int get itemCount => wishlistResponse.value.data.length;
//
//   // Remove from wishlist (if you need it later)
//   Future<bool> removeFromWishlist(int wishlistId) async {
//     // Implement remove functionality when you have the API
//     return false;
//   }
// }

import 'package:ecommerce/screens/product_detail/wishlist/wishlist_apiservices.dart';
import 'package:ecommerce/screens/product_detail/wishlist/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WishlistController extends GetxController {
  var isLoading = false.obs;
  var wishlistResponse = WishlistResponse(
    status: false,
    message: '',
    count: 0,
    data: [],
  ).obs;

  var hasLoaded = false.obs; // ADD THIS LINE

 // final ApiServices _apiServices = ApiServices();

  // Get token
  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      return prefs.getString('token');
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

  // Fetch wishlist - UPDATED
  Future<void> fetchWishlist() async {
    try {
      // Don't reload if already loading
      if (isLoading.value) return;

      isLoading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available");
        isLoading.value = false;
        return;
      }

      final response = await ApiServices().getWishlist(token);
      wishlistResponse.value = response;
      hasLoaded.value = true; // MARK AS LOADED

      if (response.status) {
        print("✅ Wishlist loaded: ${response.data.length} items");
      } else {
        print("❌ Failed to load wishlist: ${response.message}");
      }
    } catch (e) {
      print("❌ Error fetching wishlist: $e");
      Get.snackbar(
        'Error',
        'Failed to load wishlist',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Add to wishlist - UPDATED
  Future<bool> addToWishlist(int productId) async {
    try {
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        Get.snackbar(
          'Login Required',
          'Please login to add items to wishlist',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return false;
      }

      final response = await ApiServices().addToWishlist(productId, token);

      if (response.status) {
        // Refresh wishlist after adding
        await fetchWishlist();
        Get.snackbar(
          'Success!',
          response.message,
          backgroundColor: Color(0xFF16423C),
          colorText: Colors.white,
        );
        return true;
      } else {
        Get.snackbar(
          'Error',
          response.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    } catch (e) {
      print("❌ Error adding to wishlist: $e");
      Get.snackbar(
        'Error',
        'Failed to add to wishlist',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }



  // Remove from wishlist
  Future<bool> removeFromWishlist(int wishlistId) async {
    try {
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        Get.snackbar(
          'Login Required',
          'Please login to manage wishlist',
          backgroundColor: Colors.orange,
          colorText: Colors.white,
        );
        return false;
      }

      final response = await ApiServices().removeFromWishlist(wishlistId, token);

      if (response.status) {
        // Remove item from local list immediately for better UX
        wishlistResponse.value.data.removeWhere((item) => item.wishlistId == wishlistId);
        wishlistResponse.refresh(); // Force UI update

        // Also refresh from API to ensure consistency
        await fetchWishlist();

        Get.snackbar(
          'Removed!',
          response.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return true;
      } else {
        Get.snackbar(
          'Error',
          response.message,
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
      }
    } catch (e) {
      print("❌ Error removing from wishlist: $e");
      Get.snackbar(
        'Error',
        'Failed to remove from wishlist',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false;
    }
  }

  // Get wishlist ID for a product
  int? getWishlistIdForProduct(int productId) {
    try {
      final item = wishlistResponse.value.data.firstWhere(
            (item) => item.id == productId,
      );
      return item.wishlistId;
    } catch (e) {
      return null;
    }
  }

  // Check if product is in wishlist
  bool isInWishlist(int productId) {
    return wishlistResponse.value.data.any((item) => item.id == productId);
  }

  // Get wishlist item count
  int get itemCount => wishlistResponse.value.data.length;

  // Check if data is loaded
  bool get hasData => hasLoaded.value && wishlistResponse.value.data.isNotEmpty;
}