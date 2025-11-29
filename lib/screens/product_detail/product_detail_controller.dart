// import 'package:ecommerce/screens/product_detail/product_detail_api.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_model.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class productdetailcontroller extends GetxController
// {
//   var isproductdetailloading = false.obs;
//   var productdataresponse = ProductDetailsResponse().obs;
//
//
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
//   Future<void> productcont() async {
//     try {
//       isproductdetailloading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for banners");
//         return;
//       }
//       final respo = await api().productdetail(token);
//       print("✅ API Response status: ${respo.status}");
//       print("✅ API Response message: ${respo.message}");
//
//       // DEBUG: Check if data is null
//       print("🔍 Is data null: ${respo.data == null}");
//
//       if (respo.status == true && respo.data != null) {
//         productdataresponse.value = respo;
//       }
//       else {
//         print("❌ API returned false status");
//       }
//     }
//     catch (e) {
//       isproductdetailloading.value = false;
//       print("❌ Error in ehomecatcont: $e");
//     } finally {
//       isproductdetailloading.value = false;
//     }
//   }
// }


// product_details_controller.dart

import 'package:ecommerce/screens/product_detail/product_detail_api.dart';
import 'package:ecommerce/screens/product_detail/product_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductDetailsController extends GetxController {
  var isLoading = false.obs;
  var productDetails = ProductDetailsResponse(
    status: false,
    message: '',
    data: ProductDetailsData(
      product: Product(
        id: 0,
        categoryId: 0,
        taxId: 0,
        name: '',
        slug: '',
        sku: '',
        tags: '',
        video: '',
        sortDetails: '',
        specificationName: '',
        specificationDescription: '',
        isSpecification: 0,
        details: '',
        photo: '',
        discountPrice: 0.0,
        stock: 0,
        metaKeywords: '',
        status: 0,
        isType: '',
        createdAt: '',
        updatedAt: '',
        itemType: '',
        thumbnail: '',
      ),
      gallery: [],
      reviews: [],
      avgRating: 0.0,
    ),
  ).obs;

  Future<String?> getToken() async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? token = prefs.getString('token');
      print("🔑 Retrieved token for product details: $token");
      return token;
    } catch (e) {
      print("❌ Error getting token: $e");
      return null;
    }
  }

  Future<void> fetchProductDetails(int productId) async {
    try {
      isLoading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for product details");
        isLoading.value = false;
        return;
      }

      print("🔄 Fetching product details for ID: $productId");
      final response = await ProductDetailsApiService().getProductDetails(token, productId);

      if (response.status == true) {
        productDetails.value = response;
        print("🎉 Product details loaded successfully!");
      } else {
        print("❌ Failed to load product details: ${response.message}");
      }
    } catch (e) {
      isLoading.value = false;
      print("❌ Error in fetchProductDetails: $e");
      // Show error message to user
      Get.snackbar(
        'Error',
        'Failed to load product details: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // Clear product details when leaving the screen
  void clearProductDetails() {
    productDetails.value = ProductDetailsResponse(
      status: false,
      message: '',
      data: ProductDetailsData(
        product: Product(
          id: 0,
          categoryId: 0,
          taxId: 0,
          name: '',
          slug: '',
          sku: '',
          tags: '',
          video: '',
          sortDetails: '',
          specificationName: '',
          specificationDescription: '',
          isSpecification: 0,
          details: '',
          photo: '',
          discountPrice: 0.0,
          stock: 0,
          metaKeywords: '',
          status: 0,
          isType: '',
          createdAt: '',
          updatedAt: '',
          itemType: '',
          thumbnail: '',
        ),
        gallery: [],
        reviews: [],
        avgRating: 0.0,
      ),
    );
  }
  // Add this method to your ProductDetailsController class
  //Add to Cart controller file
  // Change the return type from void to bool
  Future<bool> addToCart(int qty, String size, String color) async {
    try {
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for adding to cart");
        Get.snackbar(
          'Error',
          'Please login to add items to cart',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false; // Return false
      }

      // Get the current product ID
      int productId = productDetails.value.data.product.id;

      if (productId == 0) {
        throw "Product not loaded properly";
      }

      print("🛒 Adding to cart - Product ID: $productId, Qty: $qty, Size: $size, Color: $color");

      // Show loading
      isLoading.value = true;

      final response = await ProductDetailsApiService().addToCart(
          token,
          productId,
          qty,
          size,
          color
      );

      // Hide loading
      isLoading.value = false;

      if (response['status'] == true) {
        print("✅ Item added to cart successfully: ${response['message']}");

        Get.snackbar(
          'Success!',
          response['message'] ?? 'Item added to cart',
          backgroundColor: Colors.green,
          colorText: Colors.white,
          duration: Duration(seconds: 2),
        );

        return true; // Return true for success
      } else {
        print("❌ Failed to add item: ${response['message']}");
        Get.snackbar(
          'Error',
          response['message'] ?? 'Failed to add item to cart',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false; // Return false for failure
      }
    } catch (e) {
      isLoading.value = false;
      print("❌ Error in addToCart: $e");
      Get.snackbar(
        'Error',
        'Failed to add item to cart: $e',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
      return false; // Return false for error
    }
  }
//product related controller

  // Add these variables to your ProductDetailsController class
  var isRelatedProductsLoading = false.obs;
  var relatedProducts = <Map<String, dynamic>>[].obs;

// Add this method to your ProductDetailsController class
  Future<void> fetchRelatedProducts(int productId) async {
    try {
      print("🟡 STARTING fetchRelatedProducts for product ID: $productId");
      isRelatedProductsLoading.value = true;
      String? token = await getToken();

      if (token == null || token.isEmpty) {
        print("❌ No token available for related products");
        isRelatedProductsLoading.value = false;
        return;
      }

      print("🔄 Fetching related products for product ID: $productId");
      final response = await ProductDetailsApiService().getRelatedProducts(token, productId);

      if (response['status'] == true) {
        relatedProducts.value = List<Map<String, dynamic>>.from(response['data'] ?? []);
        print("✅ Related products loaded: ${relatedProducts.length} items");
        // Debug: Print product names
        for (var product in relatedProducts) {
          print("📦 Related Product: ${product['name']} (ID: ${product['id']})");
      } }else {
        print("❌ Failed to load related products: ${response['message']}");
        relatedProducts.clear();
      }
    } catch (e) {
      isRelatedProductsLoading.value = false;
      print("❌ Error in fetchRelatedProducts: $e");
    } finally {
      isRelatedProductsLoading.value = false;
    }
  }

// Update clearProductDetails method
  void clearProductDetailsdata() {
    productDetails.value = ProductDetailsResponse(
      status: false,
      message: '',
      data: ProductDetailsData(
        product: Product(
          id: 0,
          categoryId: 0,
          taxId: 0,
          name: '',
          slug: '',
          sku: '',
          tags: '',
          video: '',
          sortDetails: '',
          specificationName: '',
          specificationDescription: '',
          isSpecification: 0,
          details: '',
          photo: '',
          discountPrice: 0.0,
          stock: 0,
          metaKeywords: '',
          status: 0,
          isType: '',
          createdAt: '',
          updatedAt: '',
          itemType: '',
          thumbnail: '',
        ),
        gallery: [],
        reviews: [],
        avgRating: 0.0,
      ),
    );
    relatedProducts.clear(); // Clear related products too
  }

  // Helper getters
  Product get product => productDetails.value.data.product;
  List<GalleryImage> get gallery => productDetails.value.data.gallery;
  List<Review> get reviews => productDetails.value.data.reviews;
  double get avgRating => productDetails.value.data.avgRating;
  bool get hasGallery => gallery.isNotEmpty;
  bool get hasReviews => reviews.isNotEmpty;
  bool get hasSpecifications => product.hasSpecifications;
}