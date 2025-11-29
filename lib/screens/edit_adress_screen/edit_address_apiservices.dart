// address_api_service.dart
import 'package:dio/dio.dart';
import 'package:ecommerce/Baseurl/baseurl.dart';

import 'edit_address_model.dart';


class AddressApiService {
  Dio dio = Dio();
  String baseurl = BaseUrl().baseurl;

  // Fetch address data
  Future<AddressResponse> fetchAddress(String token) async {
    print("🔑 Token being sent for address: $token");

    try {
      final response = await dio.get(
        "${baseurl}addresses",
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
            'Content-Type': 'application/json',
          },
        ),
      );

      print("✅ Address API Response Status: ${response.statusCode}");
      print("✅ Address API Response Data: ${response.data}");

      if (response.statusCode == 200) {
        final result = AddressResponse.fromJson(response.data);
        return result;
      } else {
        throw "Something went wrong: ${response.statusCode}";
      }
    } catch (e) {
      print("❌ Address API Error: $e");
      throw "Failed to fetch address: $e";
    }
  }

  // Update address data
  Future<UpdateAddressResponse> updateAddress({
    required String token,
    required String shipAddress1,
    required String shipAddress2,
    required String shipZip,
    required String shipCity,
    required String shipCountry,
    required String billAddress1,
    required String billAddress2,
    required String billZip,
    required String billCity,
    required String billCountry,
    String shipCompany = "",
    String billCompany = "",
  }) async {
    // Create FormData
    final addressForm = FormData.fromMap({
      "ship_address1": shipAddress1,
      "ship_address2": shipAddress2,
      "ship_zip": shipZip,
      "ship_city": shipCity,
      "ship_country": shipCountry,
      "bill_address1": billAddress1,
      "bill_address2": billAddress2,
      "bill_zip": billZip,
      "bill_city": billCity,
      "bill_country": billCountry,
      if (shipCompany.isNotEmpty) "ship_company": shipCompany,
      if (billCompany.isNotEmpty) "bill_company": billCompany,
    });

    print("🔑 Token being sent for update address: $token");
    print("📤 Update Address Data:");
    print("   Shipping Address: $shipAddress1, $shipAddress2");
    print("   Shipping: $shipCity, $shipZip, $shipCountry");
    print("   Billing Address: $billAddress1, $billAddress2");
    print("   Billing: $billCity, $billZip, $billCountry");

    try {
      final response = await dio.post(
        "${baseurl}addresses", // Your update address endpoint
        data: addressForm,
        options: Options(
          headers: {
            'Authorization': 'Bearer $token',
            'Accept': 'application/json',
          },
        ),
      );

      print("✅ Update Address API Response Status: ${response.statusCode}");
      print("✅ Update Address API Response Data: ${response.data}");

      if (response.statusCode == 200) {
        final result = UpdateAddressResponse.fromJson(response.data);
        return result;
      } else {
        throw "API Error: ${response.statusCode} - ${response.data}";
      }
    } catch (e) {
      print("❌ Update Address API Error: $e");
      throw "Failed to update address: $e";
    }
  }
}