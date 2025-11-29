import 'package:ecommerce/screens/dashboard/featured_screen/featured_apiservices.dart';
import 'package:ecommerce/screens/dashboard/featured_screen/featured_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class featureController extends GetxController
{
  var isfeatureloading = false.obs;
  var featureresponse = FeaturedItemsResponse(status: true, message: '', data: [])
      .obs;
  var featureList = <FeaturedItem>[].obs; // ADD THIS LINE

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

  Future<void> featurecont() async {
    try {
      isfeatureloading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for banners");
        return;
      }
      final respo = await apis().featuredata(token);
      print("✅ API Response status: ${respo.status}");
      print("✅ API Response message: ${respo.message}");

      // DEBUG: Check if data is null
      print("🔍 Is data null: ${respo.data == null}");

      if (respo.status == true && respo.data != null) {
        featureresponse.value = respo;
        featureList.value = respo.data; // ADD THIS LINE
        print("✅ Loaded ${featureList.length} categories from API");
      }
      else {
        print("❌ API returned false status");
      }
    }
    catch (e) {
      isfeatureloading.value = false;
      print("❌ Error in ehomecatcont: $e");
    } finally {
      isfeatureloading.value = false;
    }
  }
}