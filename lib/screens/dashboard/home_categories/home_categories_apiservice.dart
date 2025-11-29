import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/dashboard/home_categories/home_categories_model.dart';

class apiservice{
  Dio dio =Dio();

  Future<CategoriesResponse>categorydata(String token)async{

    String baseurl = BaseUrl().baseurl;
    
    final response = await dio.get("${baseurl}home/categories",
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

    if(response.statusCode ==200){
      final result = CategoriesResponse.fromJson(response.data);
      return result;
    }
    else{
      throw "Something went wrong";
    }


  }
}