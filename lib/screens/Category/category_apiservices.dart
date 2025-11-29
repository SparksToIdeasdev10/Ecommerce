import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/Category/category_model.dart';

class apiservicesm{


  Dio dio = Dio();


  Future<Category> categorydata(String token) async {
    String baseurl = BaseUrl().baseurl;

    final responsee = await dio.get("${baseurl}categories",
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            }
        )
    );

    print("📡 API Response received:");
    print("Status Code: ${responsee.statusCode}");
    print("Response Data: ${responsee.data}");

    if (responsee.statusCode == 200) {
      final result = Category.fromJson(responsee.data);
      return result;
    }
    else {
      throw "Something went wrong";
    }
  }



  // category id apiservices

  Future<CategoryDetailResponse> subcategorydata(String token,int categoryId) async {
    String baseurl = BaseUrl().baseurl;

    final responsees = await dio.get("${baseurl}categories/$categoryId",
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            }
        )
    );

    print("📡 API Response received:");
    print("Status Code: ${responsees.statusCode}");
    print("Response Data: ${responsees.data}");

    if (responsees.statusCode == 200) {
      final result = CategoryDetailResponse.fromJson(responsees.data);
      return result;
    }
    else {
      throw "Something went wrong";
    }
  }

}