import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/dashboard/featured_screen/featured_model.dart';

class apis{

  Dio dio = Dio();


  Future<FeaturedItemsResponse> featuredata(String token) async {
    String baseurl = BaseUrl().baseurl;

    final response = await dio.get("${baseurl}home/featured",
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
      final result = FeaturedItemsResponse.fromJson(response.data);
      return result;
    }
    else {
      throw "Something went wrong";
    }
  }
}