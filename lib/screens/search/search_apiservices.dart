// // search_apiservices.dart
// import 'package:dio/dio.dart';
// import 'package:ecommerce/Baseurl/baseurl.dart';
// import 'package:ecommerce/screens/search/search_model.dart';
//
// class apiser {
//   Dio dio = Dio();
//
//   Future<SearchResponse> searchdata(String token, String query) async {
//     String baseurl = BaseUrl().baseurl;
//
//     final response = await dio.get(
//         "${baseurl}search?keyword=$query", // Add query parameter
//         options: Options(
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Accept': 'application/json',
//               'Content-Type': 'application/json',
//             }
//         )
//     );
//
//     print("📡 Search API Response received:");
//     print("Query: $query");
//     print("Status Code: ${response.statusCode}");
//     print("Response Data: ${response.data}");
//
//     if (response.statusCode == 200) {
//       final result = SearchResponse.fromJson(response.data);
//       return result;
//     } else {
//       throw "Something went wrong";
//     }
//   }
// }


// search_apiservices.dart
import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/search/search_model.dart';
class  apiser{

  Dio dio =Dio();
  Future<SearchResponse> searchdata(String token, String query) async {
    String baseurl = BaseUrl().baseurl;

    final response = await dio.get(
        "${baseurl}search?keyword=$query", // Make sure query parameter is included
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            }
        )
    );

    print("📡 Search API Response received:");
    print("Query: $query");
    print("Status Code: ${response.statusCode}");
    print("Response Data: ${response.data}");

    if (response.statusCode == 200) {
      final result = SearchResponse.fromJson(response.data);
      return result;
    } else {
      throw "Something went wrong";
    }
  }
}