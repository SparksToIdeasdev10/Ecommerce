// // // import 'package:dio/dio.dart';
// // // import 'package:ecommerce/Baseurl/baseurl.dart';
// // // import 'package:shared_preferences/shared_preferences.dart';
// // //
// // // import 'order_model.dart';
// // //
// // // class apio{
// // //   Dio dio = Dio();
// // //
// // //   Future<OrderResponse> orderdata(String token) async {
// // //     print("🔗 Making API call to orders endpoint...");
// // //     final prefs = await SharedPreferences.getInstance();
// // //     final token = prefs.getString('token'); // Get token from shared preferences
// // //
// // //     if (token == null || token.isEmpty) {
// // //       throw Exception("User not authenticated. Please login again.");
// // //     }
// // //
// // //     String baseurl = BaseUrl().baseurl;
// // //
// // //     try {
// // //       // CHANGE FROM POST TO GET
// // //       final response = await dio.post( // ← CHANGE THIS LINE
// // //           "${baseurl}/order/create",
// // //           options: Options(
// // //               headers: {
// // //                 'Authorization': 'Bearer $token',
// // //                 'Accept': 'application/json',
// // //                 'Content-Type': 'application/json',
// // //               }
// // //           )
// // //       );
// // //
// // //       print("📡 API Response received:");
// // //       print("Status Code: ${response.statusCode}");
// // //       print("Response Data: ${response.data}");
// // //
// // //       if(response.statusCode == 200){
// // //         final result = OrderResponse.fromJson(response.data);
// // //         print("✅ Successfully parsed API response");
// // //         print("✅ Order placed successfully - Order ID: ${result.orderId}");
// // //         return result;
// // //       }
// // //       else{
// // //         print("❌ API Error: ${response.statusCode}");
// // //         throw "API returned status code: ${response.statusCode}";
// // //       }
// // //     } catch (e) {
// // //       print("❌ Dio Error: $e");
// // //       rethrow;
// // //     }
// // //   }
// // // }
// //
// // // order_detail_apiservices.dart
// // import 'package:dio/dio.dart';
// // import 'package:ecommerce/Baseurl/baseurl.dart';
// // import 'order_model.dart';
// //
// // class apio {
// //   Dio dio = Dio();
// //
// //   // UPDATED: Method to accept token and order request
// //   Future<OrderResponse> orderdata(String token, OrderRequest orderRequest) async {
// //     print("🔗 Making API call to create order...");
// //
// //     String baseurl = BaseUrl().baseurl;
// //
// //     try {
// //       print("📦 Sending order data:");
// //       print(orderRequest.toJson());
// //
// //       final response = await dio.post(
// //           "${baseurl}/order/create",
// //           data: orderRequest.toJson(), // Send order data in body
// //           options: Options(
// //               headers: {
// //                 'Authorization': 'Bearer $token',
// //                 'Accept': 'application/json',
// //                 'Content-Type': 'application/json',
// //               }
// //           )
// //       );
// //
// //       print("📡 API Response received:");
// //       print("Status Code: ${response.statusCode}");
// //       print("Response Data: ${response.data}");
// //
// //       if (response.statusCode == 200) {
// //         final result = OrderResponse.fromJson(response.data);
// //         print("✅ Order placed successfully!");
// //         return result;
// //       } else {
// //         print("❌ API Error: ${response.statusCode}");
// //         throw "API returned status code: ${response.statusCode}";
// //       }
// //     } catch (e) {
// //       print("❌ Dio Error: $e");
// //       rethrow;
// //     }
// //   }
// // }
// // order_detail_apiservices.dart
// import 'package:dio/dio.dart';
// import 'package:ecommerce/Baseurl/baseurl.dart';
// import 'order_model.dart';
//
// class apio {
//   Dio dio = Dio();
//
//   // Method to place order
//   // Future<OrderResponse> orderdata(String token, OrderRequest orderRequest) async {
//   //   print("🔗 Making API call to create order...");
//   //
//   //   String baseurl = BaseUrl().baseurl;
//   //
//   //   try {
//   //     print("📦 Sending order data:");
//   //     print(orderRequest.toJson());
//   //
//   //     final response = await dio.post(
//   //         "${baseurl}/order/create",
//   //         data: orderRequest.toJson(), // Send order data in body
//   //         options: Options(
//   //             headers: {
//   //               'Authorization': 'Bearer $token',
//   //               'Accept': 'application/json',
//   //               'Content-Type': 'application/json',
//   //             }
//   //         )
//   //     );
//   //
//   //     print("📡 API Response received:");
//   //     print("Status Code: ${response.statusCode}");
//   //     print("Response Data: ${response.data}");
//   //
//   //     if (response.statusCode == 200) {
//   //       final result = OrderResponse.fromJson(response.data);
//   //       print("✅ Order placed successfully!");
//   //       return result;
//   //     } else {
//   //       print("❌ API Error: ${response.statusCode}");
//   //       throw "API returned status code: ${response.statusCode}";
//   //     }
//   //   } catch (e) {
//   //     print("❌ Dio Error: $e");
//   //     rethrow;
//   //   }
//   // }
// // order_detail_apiservices.dart - Add debug prints
// //   Future<OrderResponse> orderdata(String token, OrderRequest orderRequest) async {
// //     print("🔗 Making API call to create order...");
// //
// //     String baseurl = BaseUrl().baseurl;
// //     print("📡 URL: ${baseurl}/order/create");
// //
// //     try {
// //       print("📦 Sending order data:");
// //       print(orderRequest.toJson());
// //
// //       final response = await dio.post(
// //           "${baseurl}/order/create",
// //           data: orderRequest.toJson(),
// //           options: Options(
// //               headers: {
// //                 'Authorization': 'Bearer $token',
// //                 'Accept': 'application/json',
// //                 'Content-Type': 'application/json',
// //               }
// //           )
// //       );
// //
// //       print("✅ API Response received:");
// //       print("   Status Code: ${response.statusCode}");
// //       print("   Response Data: ${response.data}");
// //
// //       if (response.statusCode == 200) {
// //         final result = OrderResponse.fromJson(response.data);
// //         print("🎉 Order placed successfully!");
// //         print("   Order ID: ${result.orderId}");
// //         print("   Status: ${result.status}");
// //         print("   Message: ${result.message}");
// //         return result;
// //       } else {
// //         print("❌ API Error: ${response.statusCode}");
// //         print("   Response: ${response.data}");
// //         throw "API returned status code: ${response.statusCode}";
// //       }
// //     } catch (e) {
// //       print("🔥 Dio Error: $e");
// //       rethrow;
// //     }
// //   }
//
//   Future<OrderResponse> orderdata(String token, OrderRequest orderRequest) async {
//   try {
//   // ❌ PROBLEM: If you're doing this:
//   // String baseUrl = 'https://anniecabs.com/emartnew/api/v1/'; // WITH trailing slash
//   // String endpoint = '/order/create'; // WITH starting slash
//   // String url = baseUrl + endpoint; // Creates double slash!
//
//   // ✅ SOLUTION 1: Remove trailing slash from base
//   String baseUrl = 'https://anniecabs.com/emartnew/api/v1'; // NO trailing slash
//   String endpoint = 'order/create'; // NO starting slash
//   String url = '$baseUrl/$endpoint'; // Single slash
//
//   // ✅ SOLUTION 2: Or use full URL directly
//
//   print('✅ CORRECT URL: $url');
//
//   final response = await dio.post(
//   url,
//   data: orderRequest.toJson(),
//   options: Options(
//   headers: {
//   'Authorization': 'Bearer $token',
//   'Accept': 'application/json',
//   },
//   ),
//   );
//
//   return OrderResponse.fromJson(response.data);
//   } catch (e) {
//   print('❌ API Error: $e');
//   rethrow;
//   }
//   }
//   }
// order_detail_apiservices.dart
import 'package:dio/dio.dart';
import 'order_model.dart';

class apio {
  Dio dio = Dio();

  Future<OrderResponse> orderdata(String token, OrderRequest orderRequest) async {
    try {
      // ✅ CORRECT URL - NO DOUBLE SLASH
      final String url = 'https://anniecabs.com/emartnew/api/v1/order/create';

      print('✅ FINAL URL: $url');

      print('📦 Sending order data: ${orderRequest.toJson()}');

      final response = await dio.post(
        url,
        data: orderRequest.toJson(),
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      print('✅ API Response: ${response.data}');
      return OrderResponse.fromJson(response.data);


    } catch (e) {
      print('❌ API Error: $e');
      rethrow;
    }
  }
}