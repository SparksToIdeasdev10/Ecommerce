import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';


import 'edit_profile_model.dart';

class apiservices {

  Dio dio = Dio();
  String baseurl = BaseUrl().baseurl;

  Future<UserProfileResponse> fetchprofile(String token) async {
    print("🔑 Token being sent: $token");


    final value_user = await dio.get("${baseurl}user/profile",
        options: Options(
            headers: {
              'Authorization': 'Bearer $token',
              'Accept': 'application/json',
              'Content-Type': 'application/json',
            }
        )
    );

    print("✅ API Response Status: ${value_user.statusCode}");
    print("✅ API Response Data: ${value_user.data}");

    if (value_user.statusCode == 200) {
      final result_user = UserProfileResponse.fromJson(value_user.data);
      return result_user;
    }
    else {
      throw "Something went wrong";
    }
  }
//update profile
// In your apiservices.dart - FIX the updateprofile method
  Future<UpdateProfileResponse> updateprofile({
    required String token,
    required String first_name,
    required String last_name,
    required String email,
    required String phone,
    String password = "",
    String photo = "",
  }) async {
    // Create FormData
    final userform = FormData.fromMap({
      "first_name": first_name,
      "last_name": last_name,
      "email": email,
      "phone": phone,
      if (password.isNotEmpty) "password": password,
      if (photo.isNotEmpty) "photo": await MultipartFile.fromFile(photo),
    });

    print("🔑 Token being sent: $token");
    print(
        "📤 Update Data: first_name: $first_name, last_name: $last_name, email: $email, phone: $phone");

    try {
      // CHANGE: Use POST or PUT instead of GET for update
      final response = await dio.post( // or .put() depending on your API
        "${baseurl}user/update", // Your update endpoint
        data: userform,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            // Remove 'Content-Type': 'application/json' for FormData
          },
        ),
      );

      print("✅ Update API Response Status: ${response.statusCode}");
      print("✅ Update API Response Data: ${response.data}");

      if (response.statusCode == 200) {
        final result = UpdateProfileResponse.fromJson(response.data);
        return result;
      } else {
        throw "API Error: ${response.statusCode} - ${response.data}";
      }
    } catch (e) {
      print("❌ Update API Error: $e");
      throw "Failed to update profile: $e";
    }
  }
}