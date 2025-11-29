import 'package:ecommerce/screens/Category/category_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category_apiservices.dart';

class categorycontroller extends GetxController{

  var iscategoryloading = false.obs;
  var categoryresponse = Category(status: false,
    message: '',
    data: [],).obs;

  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token for banners: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      // return null;
    }
  }

  Future<void> categorycont() async {
    try {
      iscategoryloading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for banners");
        return;
      }
      final respo = await apiservicesm().categorydata(token);
      print("✅ API Response status: ${respo.status}");
      print("✅ API Response message: ${respo.message}");
      print("✅ Loaded ${respo.data.length} categories");

      if(respo.status == true){
        categoryresponse.value=respo;
        print("🎉 SUCCESS: Categories data updated in controller");
      } else {
        print("❌ API returned false status");
      }
    }


    catch (e) {
      iscategoryloading.value = false;
      print("❌ Error in ehomecatcont: $e");
    } finally {
      iscategoryloading.value = false;
    }
  }





  //category id controller


  var issubcategoryloading = false.obs;
  var subcategoryresponse = CategoryDetailResponse(status: false,
    message: '',
    data: CategoryDetailData( // FIX: Use CategoryDetailData, not List
      category: CategoryItem( // Use your existing CategoryItem with required fields
        id: 0,
        name: '',
        slug: '',
        photo: '',
        metaKeywords: null,
        metaDescriptions: null,
        status: 0,
        isFeature: 0,
        serial: 0,
        createdAt: null,
        updatedAt: null,
      ),
      subcategories: [],
      childcategories: [],
      products: [],
    ),
  ).obs;


  Future<void> subcategorycont(categoryId) async {
    try {
      issubcategoryloading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for banners");
        return;
      }
      final respo = await apiservicesm().subcategorydata(token,categoryId);
      print("✅ API Response status: ${respo.status}");
      print("✅ API Response message: ${respo.message}");


      if(respo.status == true){
        subcategoryresponse.value=respo;
        print("🎉 SUCCESS: Categories data updated in controller");
      } else {
        print("❌ API returned false status");
      }
    }


    catch (e) {
      issubcategoryloading.value = false;
      print("❌ Error in ehomecatcont: $e");
    } finally {
      issubcategoryloading.value = false;
    }
  }
}