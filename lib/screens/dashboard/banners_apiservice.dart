// // import 'package:dio/dio.dart';
// // import 'package:ecommerce/Baseurl/baseurl.dart';
// // import 'package:ecommerce/screens/dashboard/banners_model.dart';
// //
// // class apiservice{
// //   Dio dio = Dio();
// //
// //   Future<banner>bannerdata(String token)async{
// //     print("${token}");
// //
// //
// // String baseurl = BaseUrl().baseurl;
// //     final value_user = await dio.post("${baseurl}home/banners",
// //         options: Options(
// //             headers: {
// //               'Authorization': 'Bearer $token',
// //               'Accept': 'application/json',
// //               'Content-Type': 'application/json',
// //             }
// //         )
// //     );
// //     print("${value_user.data}");
// //
// //
// //
// //     if(value_user.statusCode ==200){
// //
// //       final result_user = banner.fromJson(value_user.data);
// //       print("$result_user");
// //       return result_user;
// //     }
// //     else{
// //       throw "Something went wrong";
// //     }
// //   }
// //
// // }
// import 'package:dio/dio.dart';
// import 'package:ecommerce/Baseurl/baseurl.dart';
// import 'package:ecommerce/screens/dashboard/banners_model.dart';
//
// class ApiService {
//   Dio dio = Dio();
//
//   Future<BannerResponse> bannerdata(String token) async {
//     print("${token}");
//
//     String baseurl = BaseUrl().baseurl;
//     final value_user = await dio.post("${baseurl}home/banners",
//         options: Options(
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Accept': 'application/json',
//               'Content-Type': 'application/json',
//             }
//         )
//     );
//     print("${value_user.data}");
//
//     if(value_user.statusCode == 200){
//       final result_user = BannerResponse.fromJson(value_user.data);
//       print("$result_user");
//       return result_user;
//     }
//     else{
//       throw "Something went wrong";
//     }
//   }
// }

import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';
import 'package:ecommerce/screens/dashboard/banners_model.dart';

class ApiService {
  Dio dio = Dio();

  Future<BannerResponse> bannerdata(String token) async {
    print("🔗 Making API call to banners endpoint...");

    String baseurl = BaseUrl().baseurl;

    try {
      // CHANGE FROM POST TO GET
      final response = await dio.get( // ← CHANGE THIS LINE
          "${baseurl}home/banners",
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

      if(response.statusCode == 200){
        final result = BannerResponse.fromJson(response.data);
        print("✅ Successfully parsed API response");
        return result;
      }
      else{
        print("❌ API Error: ${response.statusCode}");
        throw "API returned status code: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Dio Error: $e");
      rethrow;
    }
  }
}