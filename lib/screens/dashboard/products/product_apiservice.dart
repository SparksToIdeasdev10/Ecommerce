import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/products/product_model.dart';

class apiservicess {


  Dio dio = Dio();


    Future<ProductListResponse> productdata(String token) async {
      String baseurl = BaseUrl().baseurl;

      final response = await dio.get("${baseurl}products",
          options: Options(
              headers: {
                'Authorization': 'Bearer $token',
                'Accept': 'application/json',
                'Content-Type': 'application/json',
              }
          )
      );

      print("📡 API Response received:");
      print("Status Code: ${response.statusCode}");


      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        final result = ProductListResponse.fromJson(response.data);
        return result;
      }
      else {
        throw "Something went wrong";
      }
    }
  }
