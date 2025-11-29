// services/api_service.dart
import 'package:dio/dio.dart';
import 'package:ecommerce/api_helper/api_exception_helper.dart';
import 'package:get/get.dart' hide FormData, MultipartFile, Response;

class ApiService extends GetxService {
  static const String baseUrl = "https://anniecabs.com/emartnew/api/v1/";

  late Dio _dio;

  @override
  void onInit() {
    super.onInit();
    _initializeDio();
  }

  void _initializeDio() {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
        connectTimeout: const Duration(seconds: 30),
        receiveTimeout: const Duration(seconds: 30),
        sendTimeout: const Duration(seconds: 30),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    // Add interceptors
    _dio.interceptors.add(LogInterceptor(
      requestBody: true,
      responseBody: true,
      requestHeader: true,
      responseHeader: false,
    ));

    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        // Add auth token if available
        final token = await _getToken();
        if (token != null) {
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (DioException error, handler) async {
        // Handle token expiration
        if (error.response?.statusCode == 401) {
          // Implement token refresh logic here
          final refreshed = await _refreshToken();
          if (refreshed) {
            // Retry the request with new token
            final token = await _getToken();
            error.requestOptions.headers['Authorization'] = 'Bearer $token';
            return handler.resolve(await _dio.fetch(error.requestOptions));
          }
        }
        return handler.next(error);
      },
    ));
  }

  // GET Request
  Future<dynamic> get(
      String endpoint, {
        Map<String, dynamic>? queryParams,
        Options? options,
      }) async {
    try {
      final response = await _dio.get(
        endpoint,
        queryParameters: queryParams,
        options: options,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // POST Request
  Future<dynamic> post(
      String endpoint, {
        dynamic data,
        Options? options,
      }) async {
    try {
      final response = await _dio.post(
        endpoint,
        data: data,
        options: options,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // PUT Request
  Future<dynamic> put(
      String endpoint, {
        dynamic data,
        Options? options,
      }) async {
    try {
      final response = await _dio.put(
        endpoint,
        data: data,
        options: options,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // PATCH Request
  Future<dynamic> patch(
      String endpoint, {
        dynamic data,
        Options? options,
      }) async {
    try {
      final response = await _dio.patch(
        endpoint,
        data: data,
        options: options,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // DELETE Request
  Future<dynamic> delete(
      String endpoint, {
        dynamic data,
        Options? options,
      }) async {
    try {
      final response = await _dio.delete(
        endpoint,
        data: data,
        options: options,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // File Upload
  Future<dynamic> upload(
      String endpoint, {
        required String filePath,
        required String fieldName,
        Map<String, dynamic>? data,
        Options? options,
        ProgressCallback? onSendProgress,
      }) async {
    try {
      final formData = FormData.fromMap({
        ...?data,
        fieldName: await MultipartFile.fromFile(filePath),
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: options,
        onSendProgress: onSendProgress,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Multiple Files Upload
  Future<dynamic> uploadMultiple(
      String endpoint, {
        required List<String> filePaths,
        required String fieldName,
        Map<String, dynamic>? data,
        Options? options,
        ProgressCallback? onSendProgress,
      }) async {
    try {
      final files = await Future.wait(
        filePaths.map((path) => MultipartFile.fromFile(path)),
      );

      final formData = FormData.fromMap({
        ...?data,
        fieldName: files,
      });

      final response = await _dio.post(
        endpoint,
        data: formData,
        options: options,
        onSendProgress: onSendProgress,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Download File
  Future<dynamic> download(
      String endpoint,
      String savePath, {
        Map<String, dynamic>? queryParams,
        Options? options,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final response = await _dio.download(
        endpoint,
        savePath,
        queryParameters: queryParams,
        options: options,
        onReceiveProgress: onReceiveProgress,
      );
      return _handleResponse(response);
    } on DioException catch (e) {
      throw _handleDioException(e);
    }
  }

  // Handle Response
  dynamic _handleResponse(Response response) {
    final statusCode = response.statusCode;
    final responseData = response.data;

    switch (statusCode) {
      case 200:
      case 201:
        return responseData;
      case 400:
        throw BadRequestException(responseData['message'] ?? 'Bad Request');
      case 401:
        throw UnauthorizedException(responseData['message'] ?? 'Unauthorized');
      case 403:
        throw ForbiddenException(responseData['message'] ?? 'Forbidden');
      case 404:
        throw NotFoundException(responseData['message'] ?? 'Not Found');
      case 422:
        throw ValidationException(responseData['errors'] ?? 'Validation Failed');
      case 500:
        throw InternalServerErrorException(responseData['message'] ?? 'Internal Server Error');
      default:
        throw FetchDataException('Error occurred while communicating with server: $statusCode');
    }
  }

  // Handle Dio Exception
  dynamic _handleDioException(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout ||
        e.type == DioExceptionType.sendTimeout ||
        e.type == DioExceptionType.receiveTimeout) {
      throw FetchDataException('Connection timeout. Please check your internet connection.');
    } else if (e.type == DioExceptionType.connectionError) {
      throw FetchDataException('No internet connection. Please check your network.');
    } else if (e.type == DioExceptionType.badResponse) {
      return _handleResponse(e.response!);
    } else if (e.type == DioExceptionType.cancel) {
      throw FetchDataException('Request cancelled');
    } else {
      throw FetchDataException('Something went wrong: ${e.message}');
    }
  }

  // Token management methods (implement according to your storage)
  Future<String?> _getToken() async {
    // Implement your token retrieval logic
    // return await SharedPreferences.getInstance().then((prefs) => prefs.getString('token'));
    return null;
  }

  Future<bool> _refreshToken() async {
    // Implement token refresh logic
    return false;
  }

  // Cancel token for request cancellation
  CancelToken createCancelToken() => CancelToken();

  // Update headers dynamically
  void updateHeaders(Map<String, dynamic> newHeaders) {
    _dio.options.headers.addAll(newHeaders);
  }

  // Clear specific header
  void clearHeader(String key) {
    _dio.options.headers.remove(key);
  }
}