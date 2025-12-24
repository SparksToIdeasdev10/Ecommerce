// // // order_details_apiservice.dart
// // import 'package:dio/dio.dart';
// // import 'order_details_model.dart';
// //
// // class OrderDetailsApiService {
// //   final Dio _dio = Dio();
// //
// //   Future<OrderDetailsResponse> fetchOrderDetails(String token) async {
// //     try {
// //       print('🔗 Fetching order details...');
// //
// //       final String url = 'https://anniecabs.com/emartnew/api/v1/order/user/orders';
// //
// //       print('📡 URL: $url');
// //       print('🔑 Token: $token');
// //
// //
// //       final response = await _dio.get(
// //         url,
// //         options: Options(
// //           headers: {
// //             'Authorization': 'Bearer $token',
// //             'Accept': 'application/json',
// //           },
// //         ),
// //       );
// //
// //       print('✅ Order Details Response Status: ${response.statusCode}');
// //       print('📦 Order Details Response Data: ${response.data}');
// //
// //       if (response.statusCode == 200) {
// //         return OrderDetailsResponse.fromJson(response.data);
// //       } else {
// //         throw Exception('Failed to load order details: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print('❌ Error fetching order details: $e');
// //       rethrow;
// //     }
// //   }
// //
// //   // Optional: Fetch single order by ID
// //   Future<OrderData> fetchOrderById(String token, int orderId) async {
// //     try {
// //       print('🔗 Fetching order #$orderId details...');
// //
// //       final String url = 'https://anniecabs.com/emartnew/api/v1/order/$orderId';
// //
// //       final response = await _dio.get(
// //         url,
// //         options: Options(
// //           headers: {
// //             'Authorization': 'Bearer $token',
// //             'Accept': 'application/json',
// //           },
// //         ),
// //       );
// //
// //       print('✅ Single Order Response: ${response.data}');
// //
// //       if (response.statusCode == 200) {
// //         // Assuming the API returns single order in 'data' field
// //         return OrderData.fromJson(response.data['data'] ?? {});
// //       } else {
// //         throw Exception('Failed to load order: ${response.statusCode}');
// //       }
// //     } catch (e) {
// //       print('❌ Error fetching order by ID: $e');
// //       rethrow;
// //     }
// //   }
// // }
// //
// // import 'package:dio/dio.dart';
// //
// // import 'order_details_model.dart';
// //
// //
// // class ApiService {
// //   static const String baseUrl = 'https://anniecabs.com/emartnew/api/v1';
// //
// //   late Dio _dio;
// //
// //   ApiService() {
// //     _dio = Dio(
// //       BaseOptions(
// //         baseUrl: baseUrl,
// //         connectTimeout: const Duration(seconds: 30),
// //         receiveTimeout: const Duration(seconds: 30),
// //         headers: {
// //           'Content-Type': 'application/json',
// //           'Accept': 'application/json',
// //         },
// //       ),
// //     );
// //
// //     // Add logging
// //     _dio.interceptors.add(LogInterceptor(
// //       request: true,
// //       requestHeader: true,
// //       responseHeader: true,
// //       responseBody: true,
// //     ));
// //   }
// //
// //   // Add token to headers
// //   void setToken(String token) {
// //     _dio.options.headers['Authorization'] = 'Bearer $token';
// //   }
// //
// //   // Your existing token method
// //   String? getToken() {
// //     // Replace with your actual token retrieval logic
// //     return 'YOUR_TOKEN_HERE';
// //   }
// //
// //   // Fetch order list (for My Orders screen)
// //   Future<OrderDetailsResponse?> fetchOrderList() async {
// //     try {
// //       final String? token = getToken();
// //
// //       if (token != null && token.isNotEmpty) {
// //         _dio.options.headers['Authorization'] = 'Bearer $token';
// //       }
// //
// //       final response = await _dio.get('/orders'); // Adjust endpoint if needed
// //
// //       if (response.statusCode == 200) {
// //         return OrderDetailsResponse.fromJson(response.data);
// //       } else {
// //         print('Failed to load orders: ${response.statusCode}');
// //         return null;
// //       }
// //     } on DioException catch (e) {
// //       print('Dio Error fetching orders: ${e.message}');
// //       return null;
// //     } catch (e) {
// //       print('Error fetching orders: $e');
// //       return null;
// //     }
// //   }
// //
// //   // Your existing single order details method
// //   // Future<OrderDetailsResponse?> fetchOrderDetails(int orderId) async {
// //   //   try {
// //   //     final String? token = getToken();
// //   //
// //   //     if (token != null && token.isNotEmpty) {
// //   //       _dio.options.headers['Authorization'] = 'Bearer $token';
// //   //     }
// //   //
// //   //     final response = await _dio.get('/orders/$orderId');
// //   //
// //   //     if (response.statusCode == 200) {
// //   //       return OrderDetailsResponse.fromJson(response.data);
// //   //     }
// //   //     return null;
// //   //   } on DioException catch (e) {
// //   //     print('Dio Error: ${e.message}');
// //   //     return null;
// //   //   }
// //   // }
// //   Future<OrderDetailsResponse?> fetchOrderDetails() async {
// //     try {
// //       final String? token = getToken();
// //
// //       if (token != null && token.isNotEmpty) {
// //         _dio.options.headers['Authorization'] = 'Bearer $token';
// //       }
// //
// //       final response = await _dio.get('/orders');
// //
// //       if (response.statusCode == 200) {
// //         return OrderDetailsResponse.fromJson(response.data);
// //       } else {
// //         print('Failed to load orders: ${response.statusCode}');
// //         return null;
// //       }
// //     } on DioException catch (e) {
// //       print('Dio Error fetching orders: ${e.message}');
// //       return null;
// //     } catch (e) {
// //       print('Error fetching orders: $e');
// //       return null;
// //     }
// //   }
// //
// // }
//
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'order_details_model.dart';
//
// class ApiService {
//   final Dio _dio = Dio();
//   final String _baseUrl = 'https://anniecabs.com/emartnew';
//
//   ApiService() {
//     _dio.options = BaseOptions(
//       baseUrl: _baseUrl,
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//       responseType: ResponseType.plain, // Get raw response to check
//     );
//
//     _dio.interceptors.add(LogInterceptor(
//       request: true,
//       requestHeader: true,
//       responseHeader: true,
//       responseBody: false, // Set to true for debugging
//     ));
//   }
//
//   // Get token from SharedPreferences
//   Future<String?> getToken() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//
//       if (token == null || token.isEmpty) {
//         print('❌ No token found in SharedPreferences');
//         return null;
//       }
//
//       print('✅ Token found: ${token.substring(0, min(20, token.length))}...');
//       return token;
//     } catch (e) {
//       print('❌ Error getting token: $e');
//       return null;
//     }
//   }
//
//   // Fetch all orders
//   Future<OrderListResponse> fetchOrderList() async {
//     try {
//       print('📡 Calling orders API...');
//
//       final token = await getToken();
//
//       if (token == null) {
//         return OrderListResponse(
//           status: false,
//           data: [],
//         );
//       }
//
//       // Make the request
//       final response = await _dio.get(
//         '/api/v1/orders', // IMPORTANT: Use v1 endpoint
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Accept': 'application/json',
//             'Content-Type': 'application/json',
//           },
//           responseType: ResponseType.plain, // Get raw response first
//         ),
//       );
//
//       print('📊 Response Status: ${response.statusCode}');
//       print('📊 Response Type: ${response.data.runtimeType}');
//
//       // Check if response is HTML
//       final responseText = response.data.toString();
//       if (responseText.contains('<!DOCTYPE') ||
//           responseText.contains('<html>') ||
//           responseText.contains('</html>')) {
//
//         print('❌ API returned HTML!');
//         print('📄 Response preview: ${responseText.substring(0, min(300, responseText.length))}');
//
//         if (responseText.toLowerCase().contains('login') ||
//             responseText.toLowerCase().contains('token')) {
//           return OrderListResponse(
//             status: false,
//             data: [],
//           );
//         }
//
//         return OrderListResponse(
//           status: false,
//           data: [],
//         );
//       }
//
//       // Try to parse JSON
//       try {
//         final jsonData = json.decode(responseText);
//         print('✅ Successfully parsed JSON response');
//
//         if (jsonData is Map<String, dynamic>) {
//           return OrderListResponse.fromJson(jsonData);
//         } else {
//           print('❌ JSON is not a Map, type: ${jsonData.runtimeType}');
//           return OrderListResponse(
//             status: false,
//             data: [],
//           );
//         }
//       } catch (e) {
//         print('❌ JSON parsing error: $e');
//         print('📋 Raw response: $responseText');
//         return OrderListResponse(
//           status: false,
//           data: [],
//         );
//       }
//
//     } on DioException catch (e) {
//       print('🔥 DioException in fetchOrderList:');
//       print('   Type: ${e.type}');
//       print('   Message: ${e.message}');
//       print('   Response: ${e.response?.data}');
//
//       return OrderListResponse(
//         status: false,
//         data: [],
//       );
//     } catch (e) {
//       print('🔥 Unexpected error in fetchOrderList: $e');
//       return OrderListResponse(
//         status: false,
//         data: [],
//       );
//     }
//   }
//
//   // For single order details (if needed)
//   Future<OrderData?> fetchOrderDetails(int orderId) async {
//     try {
//       final token = await getToken();
//
//       if (token == null) {
//         return null;
//       }
//
//       final response = await _dio.get(
//         '/api/v1/orders/$orderId',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Accept': 'application/json',
//           },
//         ),
//       );
//
//       if (response.statusCode == 200) {
//         final jsonData = response.data;
//         if (jsonData is Map<String, dynamic>) {
//           return OrderData.fromJson(jsonData);
//         }
//       }
//       return null;
//     } catch (e) {
//       print('Error fetching order details: $e');
//       return null;
//     }
//   }
// }
//
// int min(int a, int b) => a < b ? a : b;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'order_details_model.dart';

class ApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://anniecabs.com/emartnew';

  ApiService() {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    // Add logging interceptor
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      responseHeader: true,
      responseBody: false,
    ));
  }

  // Get token from SharedPreferences
  Future<String?> _getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        print('❌ No token found');
        return null;
      }

      return token;
    } catch (e) {
      print('❌ Error getting token: $e');
      return null;
    }
  }

  // Fetch all orders
  Future<OrderDetailsResponse> fetchOrderList() async {
    try {
      print('📡 Calling orders API...');

      final token = await _getToken();

      if (token == null) {
        return OrderDetailsResponse(
          status: false,
          data: [],
        );
      }

      // Make the API request
      final response = await _dio.get(
        '/api/v1/orders',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      print('📊 Response Status: ${response.statusCode}');

      if (response.statusCode == 200) {
        // Parse the response
        final responseData = response.data;

        if (responseData is Map<String, dynamic>) {
          return OrderDetailsResponse.fromJson(responseData);
        } else if (responseData is String) {
          // If response is string, parse it as JSON
          try {
            final jsonData = json.decode(responseData);
            return OrderDetailsResponse.fromJson(jsonData);
          } catch (e) {
            print('❌ Error parsing response string: $e');
            return OrderDetailsResponse(
              status: false,
              data: [],
            );
          }
        } else {
          print('❌ Unexpected response type: ${responseData.runtimeType}');
          return OrderDetailsResponse(
            status: false,
            data: [],
          );
        }
      } else {
        print('❌ API Error Status: ${response.statusCode}');
        return OrderDetailsResponse(
          status: false,
          data: [],
        );
      }
    } on DioException catch (e) {
      print('🔥 DioException in fetchOrderList:');
      print('   Type: ${e.type}');
      print('   Message: ${e.message}');

      if (e.response != null) {
        print('   Status Code: ${e.response!.statusCode}');
        print('   Response Data: ${e.response!.data}');
      }

      return OrderDetailsResponse(
        status: false,
        data: [],
      );
    } catch (e) {
      print('🔥 Unexpected error in fetchOrderList: $e');
      return OrderDetailsResponse(
        status: false,
        data: [],
      );
    }
  }

  // Fetch single order details
  Future<OrderData?> fetchOrderDetails(int orderId) async {
    try {
      final token = await _getToken();

      if (token == null) {
        return null;
      }

      final response = await _dio.get(
        '/api/v1/orders/$orderId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      if (response.statusCode == 200) {
        final jsonData = response.data;
        if (jsonData is Map<String, dynamic>) {
          return OrderData.fromJson(jsonData);
        }
      }
      return null;
    } catch (e) {
      print('❌ Error fetching order details: $e');
      return null;
    }
  }
}