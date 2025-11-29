// // services/wishlist_api_service.dart
// import 'package:dio/dio.dart';
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_model.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
//
// class WishlistApiService {
//   final Dio _dio = Dio(BaseOptions(
//     baseUrl: 'https://anniecabs.com/emartnew/api/v1',
//     connectTimeout: const Duration(seconds: 30),
//     receiveTimeout: const Duration(seconds: 30),
//   ));
//
//   WishlistApiService() {
//     _dio.interceptors.add(LogInterceptor(
//       requestBody: true,
//       responseBody: true,
//     ));
//   }
//
//   // Get token from SharedPreferences
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
//   // Get wishlist items
//   Future<WishlistResponse> getWishlist() async {
//     try {
//       final token = await getToken();
//
//       if (token == null) {
//         throw Exception('User not authenticated. Please login first.');
//       }
//
//       final response = await _dio.get(
//         '/wishlist',
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         return WishlistResponse.fromJson(response.data);
//       } else {
//         throw Exception('Failed to load wishlist: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw Exception('Failed to load wishlist: ${e.response?.statusCode} - ${e.response?.data}');
//       } else {
//         throw Exception('Failed to load wishlist: ${e.message}');
//       }
//     }
//   }
//
//   // Add to wishlist
//   // Future<bool> addToWishlist(int productId) async {
//   //   try {
//   //     final token = await _getAuthToken();
//   //
//   //     if (token == null) {
//   //       throw Exception('User not authenticated. Please login first.');
//   //     }
//   //
//   //     final response = await _dio.get(
//   //       '/wishlist',
//   //       data: {
//   //         'product_id': productId,
//   //       },
//   //       options: Options(
//   //         headers: {
//   //           'Content-Type': 'application/json',
//   //           'Accept': 'application/json',
//   //           'Authorization': 'Bearer $token',
//   //         },
//   //       ),
//   //     );
//   //
//   //     if (response.statusCode == 200) {
//   //       return response.data['status'] == true;
//   //     } else {
//   //       throw Exception('Failed to add to wishlist: ${response.statusCode}');
//   //     }
//   //   } on DioException catch (e) {
//   //     if (e.response != null) {
//   //       throw Exception('Failed to add to wishlist: ${e.response?.statusCode} - ${e.response?.data}');
//   //     } else {
//   //       throw Exception('Failed to add to wishlist: ${e.message}');
//   //     }
//   //   }
//   // }
//   // Add to wishlist - WITH DEBUG LOGS
//   Future<bool> addToWishlist(int productId) async {
//     try {
//       print("🔄 API: Adding product $productId to wishlist...");
//
//       final token = await getToken();
//
//       if (token == null) {
//         throw Exception('User not authenticated. Please login first.');
//       }
//
//       print("🔑 Token: ${token != null ? 'Available' : 'Missing'}");
//       print("🎯 Product ID to add: $productId");
//
//       final response = await _dio.get(
//         '/wishlist',
//         data: {
//           'product_id': productId,
//         },
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );
//
//       print("📡 API Response Status: ${response.statusCode}");
//       print("📡 API Response Data: ${response.data}");
//
//       // Check what's in the response
//       if (response.statusCode == 200) {
//         final responseData = response.data;
//         final status = responseData['status'] == true;
//         final count = responseData['count'] ?? 0;
//         final message = responseData['message'] ?? 'No message';
//
//         print("✅ API Status: $status");
//         print("📊 Wishlist Count: $count");
//         print("💬 Message: $message");
//
//         // Check if the new product is in the response
//         final data = responseData['data'] ?? [];
//         if (data is List) {
//           print("📦 Items in wishlist after adding:");
//           for (var item in data) {
//             print("   - Product ID: ${item['id']}, Name: ${item['name']}");
//           }
//
//           // Check if our product was added
//           final isProductAdded = data.any((item) => item['id'] == productId);
//           print("🎯 Was product $productId added? $isProductAdded");
//         }
//
//         return status;
//       } else {
//         throw Exception('Failed to add to wishlist: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       print("❌ API Error: ${e.message}");
//       if (e.response != null) {
//         print("❌ Response Error: ${e.response?.data}");
//         throw Exception('Failed to add to wishlist: ${e.response?.statusCode} - ${e.response?.data}');
//       } else {
//         throw Exception('Failed to add to wishlist: ${e.message}');
//       }
//     }
//   }
//
//   // Remove from wishlist
//   Future<bool> removeFromWishlist(int wishlistId) async {
//     try {
//       final token = await getToken();
//
//       if (token == null) {
//         throw Exception('User not authenticated. Please login first.');
//       }
//
//       final response = await _dio.delete(
//         '/wishlist/$wishlistId',
//         options: Options(
//           headers: {
//             'Content-Type': 'application/json',
//             'Accept': 'application/json',
//             'Authorization': 'Bearer $token',
//           },
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         return response.data['status'] == true;
//       } else {
//         throw Exception('Failed to remove from wishlist: ${response.statusCode}');
//       }
//     } on DioException catch (e) {
//       if (e.response != null) {
//         throw Exception('Failed to remove from wishlist: ${e.response?.statusCode} - ${e.response?.data}');
//       } else {
//         throw Exception('Failed to remove from wishlist: ${e.message}');
//       }
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'wishlist_model.dart';

class ApiServices {
  Dio dio = Dio();

  // Get Wishlist API
  Future<WishlistResponse> getWishlist(String token) async {
    String baseurl = BaseUrl().baseurl;

    final response = await dio.get(
      "${baseurl}wishlist",
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    print("📡 Wishlist API Response received:");
    print("Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    if (response.statusCode == 200) {
      return WishlistResponse.fromJson(response.data);
    } else {
      throw "Failed to load wishlist: ${response.statusCode}";
    }
  }

  // Add to Wishlist API
  Future<AddWishlistResponse> addToWishlist(int productId, String token) async {
    String baseurl = BaseUrl().baseurl;

    final response = await dio.post(
      "${baseurl}wishlist/add",
      data: {
        "item_id": productId, // Based on your API response
      },
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    print("📡 Add to Wishlist API Response:");
    print("Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    if (response.statusCode == 200) {
      return AddWishlistResponse.fromJson(response.data);
    } else {
      throw "Failed to add to wishlist: ${response.statusCode}";
    }
  }

  //REMOVE FROM WISHLIST API METHOD
  Future<AddWishlistResponse> removeFromWishlist(int wishlistId, String token) async {
    String baseurl = BaseUrl().baseurl;

    final response = await dio.delete( // Use DELETE method
      "${baseurl}wishlist/$wishlistId", // URL with wishlist ID
      options: Options(
        headers: {
          'Authorization': 'Bearer $token',
          'Accept': 'application/json',
          'Content-Type': 'application/json',
        },
      ),
    );

    print("🗑️ Remove from Wishlist API Response:");
    print("Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    if (response.statusCode == 200) {
      return AddWishlistResponse.fromJson(response.data);
    } else {
      throw "Failed to remove from wishlist: ${response.statusCode}";
    }
  }

  // Helper method to get token
  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }
}