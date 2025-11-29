import 'package:ecommerce/screens/dashboard/home_categories/home_categories_apiservice.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home_categories_model.dart';

class homecategories extends GetxController {

  var ishomecatloading = false.obs;
  var homecatresponse = CategoriesResponse(status: true, message: '', data: [])
      .obs;
  var categoriesList = <Category>[].obs; // ADD THIS LINE

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

  Future<void> ehomecatcont() async {
    try {
      ishomecatloading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for banners");
        return;
      }
      final respo = await apiservice().categorydata(token);
      print("✅ API Response status: ${respo.status}");
      print("✅ API Response message: ${respo.message}");

      // DEBUG: Check if data is null
      print("🔍 Is data null: ${respo.data == null}");

      if (respo.status == true && respo.data != null) {
        homecatresponse.value = respo;
        categoriesList.value = respo.data; // ADD THIS LINE
        print("✅ Loaded ${categoriesList.length} categories from API");
      }
      else {
        print("❌ API returned false status");
      }
    }
    catch (e) {
      ishomecatloading.value = false;
      print("❌ Error in ehomecatcont: $e");
    } finally {
      ishomecatloading.value = false;
    }
  }
}















