// import 'package:dio/dio.dart';
//
// import 'order_sub_detail_model.dart';
//
//
// class ApiService {
//   static const String baseUrl = 'https://anniecabs.com/emartnew/api/v1';
//
//   late Dio _dio;
//
//   ApiService() {
//     _dio = Dio(
//       BaseOptions(
//         baseUrl: baseUrl,
//         connectTimeout: const Duration(seconds: 30),
//         receiveTimeout: const Duration(seconds: 30),
//         sendTimeout: const Duration(seconds: 30),
//         headers: {
//           'Content-Type': 'application/json',
//           'Accept': 'application/json',
//         },
//       ),
//     );
//
//     // Optional: Add interceptor for logging
//     _dio.interceptors.add(LogInterceptor(
//       request: true,
//       requestHeader: true,
//       requestBody: true,
//       responseHeader: true,
//       responseBody: true,
//       error: true,
//     ));
//
//     // Or use pretty_dio_logger for better formatting
//     // _dio.interceptors.add(PrettyDioLogger(
//     //   requestHeader: true,
//     //   requestBody: true,
//     //   responseBody: true,
//     //   responseHeader: false,
//     //   error: true,
//     //   compact: false,
//     // ));
//   }
//
//   // Add token to headers
//   void setToken(String token) {
//     _dio.options.headers['Authorization'] = 'Bearer $token';
//   }
//
//   // Your existing token or auth method
//   String? getToken() {
//     // Replace with your actual token retrieval logic
//     // Example: Get from SharedPreferences or secure storage
//     return 'YOUR_TOKEN_HERE';
//   }
//
//   Future<OrderResponse?> fetchOrderDetails(int orderId) async {
//     try {
//       final String? token = getToken();
//
//       // Set token if available
//       if (token != null && token.isNotEmpty) {
//         _dio.options.headers['Authorization'] = 'Bearer $token';
//       }
//
//       final response = await _dio.get('/orders/$orderId');
//
//       if (response.statusCode == 200) {
//         return OrderResponse.fromJson(response.data);
//       } else {
//         print('Failed to load order details: ${response.statusCode}');
//         return null;
//       }
//     } on DioException catch (e) {
//       // Handle Dio specific errors
//       _handleDioError(e);
//       return null;
//     } catch (e) {
//       print('Error fetching order details: $e');
//       return null;
//     }
//   }
//
//   void _handleDioError(DioException e) {
//     switch (e.type) {
//       case DioExceptionType.connectionTimeout:
//         print('Connection timeout');
//         break;
//       case DioExceptionType.sendTimeout:
//         print('Send timeout');
//         break;
//       case DioExceptionType.receiveTimeout:
//         print('Receive timeout');
//         break;
//       case DioExceptionType.badCertificate:
//         print('Bad certificate');
//         break;
//       case DioExceptionType.badResponse:
//         print('Bad response: ${e.response?.statusCode}');
//         if (e.response?.data != null) {
//           print('Response data: ${e.response?.data}');
//         }
//         break;
//       case DioExceptionType.cancel:
//         print('Request cancelled');
//         break;
//       case DioExceptionType.connectionError:
//         print('Connection error');
//         break;
//       case DioExceptionType.unknown:
//         print('Unknown error: ${e.error}');
//         break;
//     }
//   }
//
//   // You can also create more methods for other API calls
//   Future<List<OrderData>?> fetchOrderList() async {
//     try {
//       final String? token = getToken();
//
//       if (token != null && token.isNotEmpty) {
//         _dio.options.headers['Authorization'] = 'Bearer $token';
//       }
//
//       final response = await _dio.get('/orders'); // Adjust endpoint as needed
//
//       if (response.statusCode == 200) {
//         // Parse your order list response here
//         // This depends on your API response structure for order list
//         return [];
//       }
//       return null;
//     } on DioException catch (e) {
//       _handleDioError(e);
//       return null;
//     }
//   }
// }
//
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'order_sub_detail_model.dart';
//
//
// class OrderDetailSingleApiService {
//   final Dio _dio = Dio();
//   final String _baseUrl = 'https://anniecabs.com/emartnew';
//
//   OrderDetailSingleApiService() {
//     _dio.options = BaseOptions(
//       baseUrl: _baseUrl,
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//     );
//   }
//
//   // Get token from SharedPreferences
//   Future<String?> _getToken() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//
//       if (token == null || token.isEmpty) {
//         print('❌ No token found for order details');
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
//   // Fetch single order details by ID
//   Future<OrderDetailSingleResponse> fetchOrderDetails(int orderId) async {
//     try {
//       print('📡 Calling order details API for order ID: $orderId');
//       print('🌐 URL: $_baseUrl/api/v1/orders/$orderId');
//
//       final token = await _getToken();
//
//       if (token == null) {
//         return OrderDetailSingleResponse(
//           status: false,
//           data: null,
//         );
//       }
//
//       // Make the API request
//       final response = await _dio.get(
//         '/api/v1/orders/$orderId',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Accept': 'application/json',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );
//
//       print('📊 Response Status: ${response.statusCode}');
//
//       if (response.statusCode == 200) {
//         final responseData = response.data;
//
//         print('✅ API call successful');
//         print('📦 Response type: ${responseData.runtimeType}');
//
//         if (responseData is Map<String, dynamic>) {
//           print('🎯 Response keys: ${responseData.keys}');
//           print('📋 Response status: ${responseData['status']}');
//
//           return OrderDetailSingleResponse.fromJson(responseData);
//         } else {
//           print('❌ Unexpected response type');
//           return OrderDetailSingleResponse(
//             status: false,
//             data: null,
//           );
//         }
//       } else {
//         print('❌ API Error Status: ${response.statusCode}');
//         print('📄 Error response: ${response.data}');
//
//         return OrderDetailSingleResponse(
//           status: false,
//           data: null,
//         );
//       }
//     } on DioException catch (e) {
//       print('🔥 DioException in fetchOrderDetails:');
//       print('   Type: ${e.type}');
//       print('   Message: ${e.message}');
//
//       if (e.response != null) {
//         print('   Status Code: ${e.response!.statusCode}');
//         print('   Response Data: ${e.response!.data}');
//       }
//
//       return OrderDetailSingleResponse(
//         status: false,
//         data: null,
//       );
//     } catch (e) {
//       print('🔥 Unexpected error in fetchOrderDetails: $e');
//       print('📋 Stack trace: ${e.toString()}');
//
//       return OrderDetailSingleResponse(
//         status: false,
//         data: null,
//       );
//     }
//   }
// }
//
// int min(int a, int b) => a < b ? a : b;
//
// import 'dart:convert';
// import 'package:dio/dio.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'order_sub_detail_model.dart';
//
//
// class OrderDetailSingleApiService {
//   final Dio _dio = Dio();
//   final String _baseUrl = 'https://anniecabs.com/emartnew';
//
//   OrderDetailSingleApiService() {
//     _dio.options = BaseOptions(
//       baseUrl: _baseUrl,
//       connectTimeout: const Duration(seconds: 30),
//       receiveTimeout: const Duration(seconds: 30),
//     );
//
//     // Add logging interceptor
//     _dio.interceptors.add(LogInterceptor(
//       request: true,
//       requestHeader: true,
//       responseHeader: true,
//       responseBody: true, // Set to true to see full response
//     ));
//   }
//
//   // Get token from SharedPreferences
//   Future<String?> _getToken() async {
//     try {
//       final prefs = await SharedPreferences.getInstance();
//       final token = prefs.getString('token');
//
//       if (token == null || token.isEmpty) {
//         print('❌ ORDER DETAILS API: No token found in SharedPreferences');
//         return null;
//       }
//
//       print('✅ ORDER DETAILS API: Token found, length: ${token.length}');
//       print('   Token preview: ${token.substring(0, min(30, token.length))}...');
//       return token;
//     } catch (e) {
//       print('❌ ORDER DETAILS API: Error getting token: $e');
//       return null;
//     }
//   }
//
//   // Fetch single order details by ID
//   Future<OrderDetailSingleResponse> fetchOrderDetails(int orderId) async {
//     print('🚀🚀🚀 ORDER DETAILS API CALL STARTED 🚀🚀🚀');
//     print('📞 Calling API for order ID: $orderId');
//     print('🌐 Full URL: $_baseUrl/api/v1/orders/$orderId');
//
//     try {
//       final token = await _getToken();
//
//       if (token == null) {
//         print('❌ ORDER DETAILS API: Cannot proceed without token');
//         return OrderDetailSingleResponse(
//           status: false,
//           data: null,
//         );
//       }
//
//       print('🕒 Making HTTP GET request...');
//       final startTime = DateTime.now();
//
//       // Make the API request
//       final response = await _dio.get(
//         '/api/v1/orders/$orderId',
//         options: Options(
//           headers: {
//             'Authorization': 'Bearer $token',
//             'Accept': 'application/json',
//             'Content-Type': 'application/json',
//           },
//         ),
//       );
//
//       final endTime = DateTime.now();
//       final duration = endTime.difference(startTime);
//
//       print('✅ ORDER DETAILS API: Response received in ${duration.inMilliseconds}ms');
//       print('📊 Response Status Code: ${response.statusCode}');
//
//       if (response.statusCode == 200) {
//         print('🎉 ORDER DETAILS API: 200 OK Success!');
//         final responseData = response.data;
//
//         print('📦 Response Type: ${responseData.runtimeType}');
//
//         if (responseData is Map<String, dynamic>) {
//           print('🔍 Response Keys: ${responseData.keys}');
//           print('📋 Response status field: ${responseData['status']}');
//
//           // Print all response data for debugging
//           print('📄 FULL API RESPONSE:');
//           print('========================================');
//           print(jsonEncode(responseData));
//           print('========================================');
//
//           return OrderDetailSingleResponse.fromJson(responseData);
//         } else {
//           print('❌ ORDER DETAILS API: Response is not a Map, it\'s ${responseData.runtimeType}');
//           return OrderDetailSingleResponse(
//             status: false,
//             data: null,
//           );
//         }
//       } else {
//         print('❌ ORDER DETAILS API: Error Status Code ${response.statusCode}');
//         print('📄 Error Response: ${response.data}');
//
//         return OrderDetailSingleResponse(
//           status: false,
//           data: null,
//         );
//       }
//     } on DioException catch (e) {
//       print('🔥🔥🔥 ORDER DETAILS API: DIO EXCEPTION 🔥🔥🔥');
//       print('   Error Type: ${e.type}');
//       print('   Error Message: ${e.message}');
//       print('   Stack Trace: ${e.stackTrace}');
//
//       if (e.response != null) {
//         print('   Response Status Code: ${e.response!.statusCode}');
//         print('   Response Data: ${e.response!.data}');
//         print('   Response Headers: ${e.response!.headers}');
//       }
//
//       return OrderDetailSingleResponse(
//         status: false,
//         data: null,
//       );
//     } catch (e, stackTrace) {
//       print('🔥🔥🔥 ORDER DETAILS API: UNEXPECTED ERROR 🔥🔥🔥');
//       print('   Error: $e');
//       print('   Stack Trace: $stackTrace');
//
//       return OrderDetailSingleResponse(
//         status: false,
//         data: null,
//       );
//     } finally {
//       print('🏁🏁🏁 ORDER DETAILS API CALL COMPLETED 🏁🏁🏁\n');
//     }
//   }
// }
//
// int min(int a, int b) => a < b ? a : b;

import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'order_sub_detail_model.dart';

class OrderDetailSingleApiService {
  final Dio _dio = Dio();
  final String _baseUrl = 'https://anniecabs.com/emartnew';

  // Add tracking
  static bool _isApiCalled = false;
  static DateTime? _lastCallTime;
  static int _callCount = 0;

  OrderDetailSingleApiService() {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      connectTimeout: const Duration(seconds: 30),
      receiveTimeout: const Duration(seconds: 30),
    );

    // Add detailed logging interceptor
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        _logRequest(options);
        return handler.next(options);
      },
      onResponse: (response, handler) {
        _logResponse(response);
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        _logError(e);
        return handler.next(e);
      },
    ));

    // Also keep the LogInterceptor for basic logs
    _dio.interceptors.add(LogInterceptor(
      request: true,
      requestHeader: true,
      requestBody: true,  // Added to see request body
      responseHeader: true,
      responseBody: true,
      logPrint: (object) => print(object),
    ));
  }

  // Log request details
  void _logRequest(RequestOptions options) {
    print('📡📡📡 API REQUEST INITIATED 📡📡📡');
    print('🔗 URL: ${options.baseUrl}${options.path}');
    print('📝 Method: ${options.method}');
    print('📦 Headers: ${options.headers}');
    print('🔍 Query Parameters: ${options.queryParameters}');
    print('📄 Request Data: ${options.data}');
    print('⏰ Time: ${DateTime.now()}');
  }

  // Log response details
  void _logResponse(Response response) {
    print('📥📥📥 API RESPONSE RECEIVED 📥📥📥');
    print('✅ Status Code: ${response.statusCode}');
    print('⏱️ Response Time: ${DateTime.now()}');
    print('📏 Response Size: ${response.toString().length} bytes');
  }

  // Log error details
  void _logError(DioException e) {
    print('❌❌❌ API ERROR OCCURRED ❌❌❌');
    print('📛 Error Type: ${e.type}');
    print('💬 Error Message: ${e.message}');
    if (e.response != null) {
      print('📊 Error Status Code: ${e.response!.statusCode}');
      print('📄 Error Response: ${e.response!.data}');
    }
  }

  // Get token from SharedPreferences
  Future<String?> _getToken() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final token = prefs.getString('token');

      if (token == null || token.isEmpty) {
        print('❌ ORDER DETAILS API: No token found in SharedPreferences');
        return null;
      }

      print('✅ ORDER DETAILS API: Token found');
      print('   🔐 Token length: ${token.length}');
      print('   👀 Token preview: ${token.substring(0, min(30, token.length))}...');
      return token;
    } catch (e) {
      print('❌ ORDER DETAILS API: Error getting token: $e');
      return null;
    }
  }

  // Track API call
  void _trackApiCall() {
    _isApiCalled = true;
    _lastCallTime = DateTime.now();
    _callCount++;

    print('\n📊📊📊 API CALL TRACKING 📊📊📊');
    print('   Call #: $_callCount');
    print('   Last Call Time: $_lastCallTime');
    print('   Total Calls: $_callCount');
    print('📊📊📊📊📊📊📊📊📊📊📊📊📊📊\n');
  }

  // Fetch single order details by ID
  Future<OrderDetailSingleResponse> fetchOrderDetails(int orderId) async {
    // Track the API call
    _trackApiCall();

    print('\n🚀🚀🚀 ORDER DETAILS API CALL STARTED 🚀🚀🚀');
    print('📞 Calling API for order ID: $orderId');
    print('🌐 Full URL: $_baseUrl/api/v1/orders/$orderId');
    print('🕒 Timestamp: ${DateTime.now()}');

    try {
      final token = await _getToken();

      if (token == null) {
        print('❌ ORDER DETAILS API: Cannot proceed without token');
        return OrderDetailSingleResponse(
          status: false,
          data: null,
        );
      }

      print('🕒 Making HTTP GET request...');
      final startTime = DateTime.now();

      // Make the API request
      final response = await _dio.get(
        '/api/v1/orders/$orderId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      print('\n✅✅✅ ORDER DETAILS API: SUCCESS ✅✅✅');
      print('   ⏱️ Response Time: ${duration.inMilliseconds}ms');
      print('   📊 Status Code: ${response.statusCode}');
      print('   📦 Response Type: ${response.data.runtimeType}');

      if (response.statusCode == 200) {
        final responseData = response.data;

        if (responseData is Map<String, dynamic>) {
          print('   🔍 Response Keys: ${responseData.keys}');
          print('   📋 Response status field: ${responseData['status']}');

          // Print all response data for debugging
          print('\n📄 FULL API RESPONSE:');
          print('=' * 50);
          final prettyJson = JsonEncoder.withIndent('  ').convert(responseData);
          print(prettyJson);
          print('=' * 50);

          return OrderDetailSingleResponse.fromJson(responseData);
        } else {
          print('❌ ORDER DETAILS API: Response is not a Map, it\'s ${responseData.runtimeType}');
          return OrderDetailSingleResponse(
            status: false,
            data: null,
          );
        }
      } else {
        print('❌ ORDER DETAILS API: Error Status Code ${response.statusCode}');
        print('📄 Error Response: ${response.data}');

        return OrderDetailSingleResponse(
          status: false,
          data: null,
        );
      }
    } on DioException catch (e) {
      print('\n🔥🔥🔥 ORDER DETAILS API: DIO EXCEPTION 🔥🔥🔥');
      print('   Error Type: ${e.type}');
      print('   Error Message: ${e.message}');

      if (e.response != null) {
        print('   Response Status Code: ${e.response!.statusCode}');
        print('   Response Data: ${e.response!.data}');
      }

      return OrderDetailSingleResponse(
        status: false,
        data: null,
      );
    } catch (e, stackTrace) {
      print('\n🔥🔥🔥 ORDER DETAILS API: UNEXPECTED ERROR 🔥🔥🔥');
      print('   Error: $e');
      print('   Stack Trace: $stackTrace');

      return OrderDetailSingleResponse(
        status: false,
        data: null,
      );
    } finally {
      print('\n🏁🏁🏁 ORDER DETAILS API CALL COMPLETED 🏁🏁🏁');
      print('   ✅ API was called: $_isApiCalled');
      print('   🕒 Last call time: $_lastCallTime');
      print('   🔢 Total calls: $_callCount');
      print('\n');
    }



  }

  // Static method to check if API was called
  static bool get isApiCalled => _isApiCalled;
  static DateTime? get lastCallTime => _lastCallTime;
  static int get callCount => _callCount;

  // Reset tracking
  static void resetTracking() {
    _isApiCalled = false;
    _lastCallTime = null;
    _callCount = 0;
    print('🔄 API tracking reset');
  }
  // Add this function to your OrderDetailSingleApiService class
  Future<Map<String, dynamic>> cancelOrder(int orderId) async {
    print('\n🚫🚫🚫 CANCEL ORDER API CALL STARTED 🚫🚫🚫');
    print('📞 Cancelling order ID: $orderId');
    print('🌐 Full URL: $_baseUrl/api/v1/order/$orderId/cancel');
    print('🕒 Timestamp: ${DateTime.now()}');

    try {
      final token = await _getToken();

      if (token == null) {
        print('❌ CANCEL ORDER API: Cannot proceed without token');
        return {
          'success': false,
          'message': 'Authentication token not found',
        };
      }

      print('🕒 Making HTTP POST request...');
      final startTime = DateTime.now();

      // Make the API request
      final response = await _dio.post(
        '/api/v1/order/$orderId/cancel',
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      final endTime = DateTime.now();
      final duration = endTime.difference(startTime);

      print('\n✅✅✅ CANCEL ORDER API: Response received in ${duration.inMilliseconds}ms');
      print('📊 Response Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final responseData = response.data;
        print('🎉 CANCEL ORDER API: 200 OK Success!');

        if (responseData is Map<String, dynamic>) {
          print('🔍 Response Keys: ${responseData.keys}');

          print('\n📄 FULL CANCEL API RESPONSE:');
          print('=' * 50);
          print(jsonEncode(responseData));
          print('=' * 50);

          return {
            'success': responseData['status'] == true,
            'message': responseData['message'] ?? 'Order cancelled successfully',
            'data': responseData,
          };
        } else {
          print('❌ CANCEL ORDER API: Response is not a Map');
          return {
            'success': false,
            'message': 'Invalid response format',
          };
        }
      } else {
        print('❌ CANCEL ORDER API: Error Status Code ${response.statusCode}');
        print('📄 Error Response: ${response.data}');

        return {
          'success': false,
          'message': 'Failed to cancel order',
          'data': response.data,
        };
      }
    } on DioException catch (e) {
      print('\n🔥🔥🔥 CANCEL ORDER API: DIO EXCEPTION 🔥🔥🔥');
      print('   Error Type: ${e.type}');
      print('   Error Message: ${e.message}');

      if (e.response != null) {
        print('   Response Status Code: ${e.response!.statusCode}');
        print('   Response Data: ${e.response!.data}');

        return {
          'success': false,
          'message': e.response!.data['message'] ?? 'Failed to cancel order',
          'data': e.response!.data,
        };
      }

      return {
        'success': false,
        'message': 'Network error: ${e.message}',
      };
    } catch (e, stackTrace) {
      print('\n🔥🔥🔥 CANCEL ORDER API: UNEXPECTED ERROR 🔥🔥🔥');
      print('   Error: $e');
      print('   Stack Trace: $stackTrace');

      return {
        'success': false,
        'message': 'Unexpected error: $e',
      };
    } finally {
      print('\n🏁🏁🏁 CANCEL ORDER API CALL COMPLETED 🏁🏁🏁\n');
    }
  }
}

int min(int a, int b) => a < b ? a : b;