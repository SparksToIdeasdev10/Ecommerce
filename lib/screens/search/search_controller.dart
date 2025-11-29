// search_controller.dart
import 'package:ecommerce/screens/search/search_apiservices.dart';
import 'package:ecommerce/screens/search/search_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class searchController extends GetxController {
  var issearchloading = false.obs;
  var searchresponse = SearchResponse(status: true, message: '', data: [], count: 0).obs;
  var searchList = <SearchProduct>[].obs;

  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token for search: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

  // ADD THIS METHOD FOR SEARCHING
  Future<void> searchProducts(String query) async {
    try {
      issearchloading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for search");
        return;
      }

      final respo = await apiser().searchdata(token, query); // Pass the query
      print("✅ Search API Response status: ${respo.status}");
      print("✅ Search results count: ${respo.count}");

      if (respo.status == true && respo.data != null) {
        searchresponse.value = respo;
        searchList.value = respo.data;
        print("✅ Loaded ${searchList.length} search results from API");
      } else {
        print("❌ API returned false status");
        searchList.clear();
      }
    } catch (e) {
      issearchloading.value = false;
      print("❌ Error in search: $e");
      searchList.clear();
    } finally {
      issearchloading.value = false;
    }
  }

  // Your existing method (keep it if needed)
  Future<void> searchcont() async {
    try {
      issearchloading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for banners");
        return;
      }
      final respo = await apiser().searchdata(token, ""); // Pass empty query or remove this method
      print("✅ API Response status: ${respo.status}");
      print("✅ API Response message: ${respo.message}");

      if (respo.status == true && respo.data != null) {
        searchresponse.value = respo;
        searchList.value = respo.data;
        print("✅ Loaded ${searchList.length} categories from API");
      } else {
        print("❌ API returned false status");
      }
    } catch (e) {
      issearchloading.value = false;
      print("❌ Error in searchcont: $e");
    } finally {
      issearchloading.value = false;
    }
  }
}

