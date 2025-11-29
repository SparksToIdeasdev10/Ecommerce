// // import 'package:ecommerce/screens/dashboard/banners_model.dart';
// // import 'package:get/get.dart';
// // import 'package:shared_preferences/shared_preferences.dart';
// // import 'banners_apiservice.dart';
// //
// // class bannerController extends GetxController {
// //   var isbannerloading = false.obs;
// //   var bannerresponse = banner(status: true, message: '').obs;
// //   var bannerImages = <String>[].obs; // ADD THIS LINE
// //
// //   // Method to get token from SharedPreferences
// //   Future<String?> getToken() async {
// //     try {
// //       SharedPreferences prefs = await SharedPreferences.getInstance();
// //       String? token = prefs.getString('token');
// //       print("🔑 Retrieved token for banners: $token");
// //       return token;
// //     } catch (e) {
// //       print("❌ Error getting token: $e");
// //       return null;
// //     }
// //   }
// //
// //   Future<void> bannercont() async {
// //     try {
// //       isbannerloading.value = true;
// //
// //       String? token = await getToken();
// //
// //       if (token == null || token.isEmpty) {
// //         print("❌ No token available for banners");
// //         return;
// //       }
// //
// //       final respo = await apiservice().bannerdata(token);
// //
// //       if(respo.status == true){
// //         bannerresponse.value = respo;
// //
// //         // ADD THIS: Extract banner images from response
// //         if (respo.data != null && respo.data!.isNotEmpty) {
// //           bannerImages.value = respo.data!.map((banner) => banner.image).toList();
// //           print("✅ Banner images loaded: ${bannerImages.length}");
// //         }
// //
// //         print("Banners loaded successfully!");
// //       }
// //       else{
// //         bannerresponse.value = respo;
// //         print("❌ Banner API error: ${respo.message}");
// //       }
// //     }
// //     catch(e){
// //       isbannerloading.value = false;
// //       print("Banner Error $e");
// //     }
// //     finally{
// //       isbannerloading.value = false;
// //     }
// //   }
// // }
//
// import 'package:ecommerce/screens/dashboard/banners_model.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'banners_apiservice.dart';
//
// class BannerController extends GetxController {
//   var isbannerloading = false.obs;
//   var bannerresponse = BannerResponse(status: true, message: '').obs;
//   var sliderItems = <SliderItem>[].obs; // Store complete slider objects
//   var bannerImages = <String>[].obs;
//
//   // Method to get token from SharedPreferences
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print("🔑 Retrieved token for banners: $token");
//       return token;
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   Future<void> bannercont() async {
//     try {
//       isbannerloading.value = true;
//       print("🔄 Starting banner data fetch...");
//
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for banners");
//         return;
//       }
//
//       final respo = await ApiService().bannerdata(token);
//       print("✅ API Response received: ${respo.status}");
//
//       if(respo.status == true && respo.data != null){
//         bannerresponse.value = respo;
//
//         // Store complete slider items
//         sliderItems.value = respo.data!.sliders;
//
//         // Extract banner images
//         bannerImages.value = respo.data!.banners.map((banner) => banner.photo).toList();
//
//         print("✅ Slider items loaded: ${sliderItems.length}");
//         print("✅ Banner images loaded: ${bannerImages.length}");
//
//         // Debug: Print slider URLs
//         for (var i = 0; i < sliderItems.length; i++) {
//           print("🖼️ Slider $i: ${sliderItems[i].photo}");
//         }
//
//         print("🎉 Banners loaded successfully!");
//       }
//       else{
//         bannerresponse.value = respo;
//         print("❌ Banner API error: ${respo.message}");
//       }
//     }
//     catch(e){
//       isbannerloading.value = false;
//       print("❌ Banner Error: $e");
//     }
//     finally{
//       isbannerloading.value = false;
//     }
//   }
// }

import 'package:ecommerce/screens/dashboard/banners_model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'banners_apiservice.dart';

class BannerController extends GetxController {
  var isbannerloading = false.obs;
  var bannerresponse = BannerResponse(status: true, message: '').obs;
  var sliderItems = <SliderItem>[].obs;
  var bannerImages = <String>[].obs;

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

  Future<void> bannercont() async {
    try {
      isbannerloading.value = true;
      print("🔄 Starting banner data fetch...");

      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for banners");
        return;
      }

      final response = await ApiService().bannerdata(token);
      print("✅ API Response status: ${response.status}");
      print("✅ API Response message: ${response.message}");

      // DEBUG: Check if data is null
      print("🔍 Is data null: ${response.data == null}");

      if (response.data != null) {
        print("🔍 Hero banner: ${response.data!.heroBanner}");
        print("🔍 Sliders count: ${response.data!.sliders.length}");
        print("🔍 Banners count: ${response.data!.banners.length}");

        // Print all slider URLs for debugging
        for (var slider in response.data!.sliders) {
          print("🖼️ Slider URL: ${slider.photo}");
        }
      }

      if(response.status == true && response.data != null){
        bannerresponse.value = response;
        sliderItems.value = response.data!.sliders;
        bannerImages.value = response.data!.banners.map((banner) => banner.photo).toList();

        print("🎉 SUCCESS: Loaded ${sliderItems.length} sliders");
      } else {
        print("❌ API returned false status");
      }
    } catch(e) {
      print("❌ Banner Error: $e");
      print("❌ Stack trace: ${e.toString()}");
    } finally {
      isbannerloading.value = false;
    }
  }
}