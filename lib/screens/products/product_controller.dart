import 'package:ecommerce/screens/products/product_apiservice.dart';
import 'package:ecommerce/screens/products/product_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class product extends GetxController{

  var isproductloading = false.obs;
  var productresponse = ProductListResponse(status: true, message: '', data: [])
      .obs;
  var categoriesList = <Product>[].obs; // ADD THIS LINE

  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token for banners: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

  Future<void> productcont() async {
    try {
      isproductloading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for banners");
        return;
      }
      final respo = await apiservicess().productdata(token);
      print("✅ API Response status: ${respo.status}");
      print("✅ API Response message: ${respo.message}");

      // DEBUG: Check if data is null
      print("🔍 Is data null: ${respo.data == null}");

      if (respo.status == true && respo.data != null) {
        productresponse.value = respo;
        categoriesList.value = respo.data; // ADD THIS LINE
        print("✅ Loaded ${categoriesList.length} categories from API");
      }
      else {
        print("❌ API returned false status");
      }
    }
    catch (e) {
      isproductloading.value = false;
      print("❌ Error in ehomecatcont: $e");
    } finally {
      isproductloading.value = false;
    }
  }
}

