//
// import 'package:dio/dio.dart';
// import 'package:ecommerce/Baseurl/baseurl.dart';
// import 'package:ecommerce/screens/cart_screen/cart_model.dart';
//
// class apii{
//   Dio dio =Dio();
//
//   Future<CartResponse>catdata(String token)async{
//
//     String baseurl = BaseUrl().baseurl;
//
//     final response = await dio.get("${baseurl}cart",
//         options: Options(
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Accept': 'application/json',
//               'Content-Type': 'application/json',
//             }
//         )
//     );
//
//     print("📡 API Response received:");
//     print("Status Code: ${response.statusCode}");
//     print("Response Data: ${response.data}");
//
//     if(response.statusCode ==200){
//       final result = CartResponse.fromJson(response.data);
//       return result;
//     }
//     else{
//       throw "Something went wrong";
//     }
//
//
//
//   }
// }


// cart_api_service.dart
import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/cart_screen/cart_model.dart';


class CartApiService {
  Dio dio = Dio();

  Future<CartResponse> getCartItems(String token) async {
    try {
      String baseurl = BaseUrl().baseurl;

      print("🛒 Making Cart API call to: ${baseurl}cart");
      print("🔑 Token: ${token.substring(0, 20)}...");

      final response = await dio.get(
          "${baseurl}cart",
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              }
          )
      );

      print("📡 Cart API Response Status: ${response.statusCode}");
      print("📡 Cart API Response Data: ${response.data}");

      if (response.statusCode == 200) {
        final result = CartResponse.fromJson(response.data);
        print("✅ Cart items loaded successfully");
        print("📊 Cart count: ${result.count}");
        print("📦 Cart items: ${result.data.length}");
        return result;
      } else {
        throw "Failed to load cart items. Status code: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Error in cart API call: $e");
      rethrow;
    }
  }

  // Add item to cart
  Future<dynamic> addToCart(String token, Map<String, dynamic> cartData) async {
    try {
      String baseurl = BaseUrl().baseurl;

      print("➕ Adding item to cart: $cartData");

      final response = await dio.post(
          "${baseurl}cart/add",
          data: cartData,
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              }
          )
      );

      print("📡 Add to Cart Response Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        print("✅ Item added to cart successfully");
        return response.data;
      } else {
        throw "Failed to add item to cart. Status code: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Error in add to cart API call: $e");
      rethrow;
    }
  }

  // Remove item from cart
  // Future<dynamic> removeFromCart(String token, int cartId) async {
  //   try {
  //     String baseurl = BaseUrl().baseurl;
  //
  //     print("🗑️ Removing cart item with ID: $cartId");
  //
  //     final response = await dio.delete(
  //         "${baseurl}cart/remove/$cartId",
  //         options: Options(
  //             headers: {
  //               'Authorization': 'Bearer $token',
  //               'Accept': 'application/json',
  //               'Content-Type': 'application/json',
  //             }
  //         )
  //     );
  //
  //     print("📡 Remove from Cart Response Status: ${response.statusCode}");
  //
  //     if (response.statusCode == 200) {
  //       print("✅ Item removed from cart successfully");
  //       return response.data;
  //     } else {
  //       throw "Failed to remove item from cart. Status code: ${response.statusCode}";
  //     }
  //   } catch (e) {
  //     print("❌ Error in remove from cart API call: $e");
  //     rethrow;
  //   }
  // }
  //cart remove apiservices

  // Remove item from cart with proper structure
  Future<dynamic> removeFromCart(String token, int cartId) async {
    try {
      String baseurl = BaseUrl().baseurl;

      print("🗑️ Removing cart item with ID: $cartId");

      final response = await dio.post(
          "${baseurl}cart/remove",
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              }

          ),
        data: {
          "cart_id":cartId
        }
      );

      print("📡 Remove from Cart Response Status: ${response.statusCode}");
      print("📡 Remove from Cart Response Data: ${response.data}");

      if (response.statusCode == 200) {
        print("✅ Item removed from cart successfully");
        return response.data;
      } else {
        throw "Failed to remove item from cart. Status code: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Error in remove from cart API call: $e");
      rethrow;
    }
  }
//cart update apiservices
  // Update cart item quantity
  // Future<dynamic> updateCartQuantity(String token, int cartId, int quantity) async {
  //   try {
  //     String baseurl = BaseUrl().baseurl;
  //
  //     print("🔄 Updating cart item $cartId quantity to: $quantity");
  //
  //     final response = await dio.post(
  //         "${baseurl}cart/update",
  //         data: {'cart_id': quantity},
  //         options: Options(
  //             headers: {
  //               'Authorization': 'Bearer $token',
  //               'Accept': 'application/json',
  //               'Content-Type': 'application/json',
  //             }
  //         )
  //     );
  //
  //     print("📡 Update Cart Quantity Response Status: ${response.statusCode}");
  //
  //     if (response.statusCode == 200) {
  //       print("✅ Cart quantity updated successfully");
  //       return response.data;
  //     } else {
  //       throw "Failed to update cart quantity. Status code: ${response.statusCode}";
  //     }
  //   } catch (e) {
  //     print("❌ Error in update cart quantity API call: $e");
  //     rethrow;
  //   }
  // }


// Update cart item quantity
  Future<dynamic> updateCartQuantity(String token, int cartId, int quantity) async {
    try {
      String baseurl = BaseUrl().baseurl;

      print("🔄 Updating cart item $cartId quantity to: $quantity");

      final response = await dio.post(
          "${baseurl}cart/update",
          data: {
            'cart_id': cartId,
            'qty': quantity
          },
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              }
          )
      );

      print("📡 Update Cart Quantity Response Status: ${response.statusCode}");
      print("📡 Update Cart Quantity Response Data: ${response.data}");

      if (response.statusCode == 200) {
        print("✅ Cart quantity updated successfully");
        return response.data;
      } else {
        throw "Failed to update cart quantity. Status code: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Error in update cart quantity API call: $e");
      rethrow;
    }
  }
}