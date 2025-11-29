// import 'package:dio/dio.dart';
// import 'package:ecommerce/Baseurl/baseurl.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_model.dart';
//
// class api{
//
//   Dio dio = Dio();
//
//
//   Future<ProductDetailsResponse> productdetail(String token) async {
//     String baseurl = BaseUrl().baseurl;
//
//     final response = await dio.get("${baseurl}products/586",
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
//     if (response.statusCode == 200) {
//       final result = ProductDetailsResponse.fromJson(response.data);
//       return result;
//     }
//     else {
//       throw "Something went wrong";
//     }
//   }
// }

// product_details_api_service.dart
import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/product_detail/product_detail_model.dart';


class ProductDetailsApiService {
  Dio dio = Dio();

  Future<ProductDetailsResponse> getProductDetails(String token, int productId) async {
    try {
      String baseurl = BaseUrl().baseurl;

      print("🌐 Making Product Details API call to: ${baseurl}products/$productId");
      print("🔑 Token: ${token.substring(0, 20)}...");
      print("🆔 Product ID: $productId");

      final response = await dio.get(
          "${baseurl}products/$productId",
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              }
          )
      );

      print("📡 Product Details API Response Status: ${response.statusCode}");

      if (response.statusCode == 200) {
        final result = ProductDetailsResponse.fromJson(response.data);
        print("✅ Product details loaded successfully");
        print("📊 Product name: ${result.data.product.name}");
        print("📊 Gallery images: ${result.data.gallery.length}");
        print("📊 Reviews: ${result.data.reviews.length}");
        print("📊 Average rating: ${result.data.avgRating}");
        return result;
      } else {
        throw "Failed to load product details. Status code: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Error in product details API call: $e");
      rethrow;
    }
  }


  // Add this method to your ProductDetailsApiService class
  //Add to Cart apiservices file
  Future<Map<String, dynamic>> addToCart(
      String token,
      int itemId,
      int qty,
      String size,
      String color
      ) async {
    try {
      String baseurl = BaseUrl().baseurl;

      print("🛒 Making Add to Cart API call to: ${baseurl}cart/add");
      print("🔑 Token: ${token.substring(0, 20)}...");
      print("📦 Cart Data: {item_id: $itemId, qty: $qty, size: $size, color: $color}");

      final response = await dio.post(
          "${baseurl}cart/add",
          data: {
            "item_id": itemId,
            "qty": qty,
            "size": size,
            "color": color,
          },
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              }
          )
      );

      print("📡 Add to Cart Response Status: ${response.statusCode}");
      print("📡 Add to Cart Response Data: ${response.data}");

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

  //product related apiservices

// Add this method to your ProductDetailsApiService class
  Future<Map<String, dynamic>> getRelatedProducts(String token, int productId) async {
    try {
      String baseurl = BaseUrl().baseurl;

      print("🔄 Making Related Products API call to: ${baseurl}products/$productId/related");
      print("🔑 Token: ${token.substring(0, 20)}...");
      print("🆔 Product ID: $productId");

      final response = await dio.get(
          "${baseurl}products/$productId/related",
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              }
          )
      );

      print("📡 Related Products API Response Status: ${response.statusCode}");
      print("📡 Related Products API Response Data: ${response.data}");

      if (response.statusCode == 200) {
        print("✅ Related products loaded successfully");
        return response.data;
      } else {
        throw "Failed to load related products. Status code: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Error in related products API call: $e");
      rethrow;
    }
  }


}