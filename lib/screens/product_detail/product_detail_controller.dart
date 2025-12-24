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
//main hai aaj ka
// import 'package:ecommerce/screens/product_detail/product_detail_api.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class ProductDetailsController extends GetxController {
//   var isLoading = false.obs;
//   var productDetails = ProductDetailsResponse(
//     status: false,
//     message: '',
//     data: ProductDetailsData(
//       product: Product(
//         id: 0,
//         categoryId: 0,
//         taxId: 0,
//         name: '',
//         slug: '',
//         sku: '',
//         tags: '',
//         video: '',
//         sortDetails: '',
//         specificationName: '',
//         specificationDescription: '',
//         isSpecification: 0,
//         details: '',
//         photo: '',
//         discountPrice: 0.0,
//         stock: 0,
//         metaKeywords: '',
//         status: 0,
//         isType: '',
//         createdAt: '',
//         updatedAt: '',
//         itemType: '',
//         thumbnail: '',
//       ),
//       gallery: [],
//       reviews: [],
//       avgRating: 0.0,
//     ),
//   ).obs;
//
//   Future<String?> getToken() async {
//     try {
//       SharedPreferences prefs = await SharedPreferences.getInstance();
//       String? token = prefs.getString('token');
//       print("🔑 Retrieved token for product details: $token");
//       return token;
//     } catch (e) {
//       print("❌ Error getting token: $e");
//       return null;
//     }
//   }
//
//   Future<void> fetchProductDetails(int productId) async {
//     try {
//       isLoading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for product details");
//         isLoading.value = false;
//         return;
//       }
//
//       print("🔄 Fetching product details for ID: $productId");
//       final response = await ProductDetailsApiService().getProductDetails(token, productId);
//
//       if (response.status == true) {
//         productDetails.value = response;
//         print("🎉 Product details loaded successfully!");
//       } else {
//         print("❌ Failed to load product details: ${response.message}");
//       }
//     } catch (e) {
//       isLoading.value = false;
//       print("❌ Error in fetchProductDetails: $e");
//       // Show error message to user
//       Get.snackbar(
//         'Error',
//         'Failed to load product details: $e',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//     } finally {
//       isLoading.value = false;
//     }
//   }
//
//   // Clear product details when leaving the screen
//   void clearProductDetails() {
//     productDetails.value = ProductDetailsResponse(
//       status: false,
//       message: '',
//       data: ProductDetailsData(
//         product: Product(
//           id: 0,
//           categoryId: 0,
//           taxId: 0,
//           name: '',
//           slug: '',
//           sku: '',
//           tags: '',
//           video: '',
//           sortDetails: '',
//           specificationName: '',
//           specificationDescription: '',
//           isSpecification: 0,
//           details: '',
//           photo: '',
//           discountPrice: 0.0,
//           stock: 0,
//           metaKeywords: '',
//           status: 0,
//           isType: '',
//           createdAt: '',
//           updatedAt: '',
//           itemType: '',
//           thumbnail: '',
//         ),
//         gallery: [],
//         reviews: [],
//         avgRating: 0.0,
//       ),
//     );
//   }
//   // Add this method to your ProductDetailsController class
//   //Add to Cart controller file
//   // Change the return type from void to bool
//   Future<bool> addToCart(int qty, String size, String color) async {
//     try {
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for adding to cart");
//         Get.snackbar(
//           'Error',
//           'Please login to add items to cart',
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//         return false; // Return false
//       }
//
//       // Get the current product ID
//       int productId = productDetails.value.data.product.id;
//
//       if (productId == 0) {
//         throw "Product not loaded properly";
//       }
//
//       print("🛒 Adding to cart - Product ID: $productId, Qty: $qty, Size: $size, Color: $color");
//
//       // Show loading
//       isLoading.value = true;
//
//       final response = await ProductDetailsApiService().addToCart(
//           token,
//           productId,
//           qty,
//           size,
//           color
//       );
//
//       // Hide loading
//       isLoading.value = false;
//
//       if (response['status'] == true) {
//         print("✅ Item added to cart successfully: ${response['message']}");
//
//         Get.snackbar(
//           'Success!',
//           response['message'] ?? 'Item added to cart',
//           backgroundColor: Colors.green,
//           colorText: Colors.white,
//           duration: Duration(seconds: 2),
//         );
//
//         return true; // Return true for success
//       } else {
//         print("❌ Failed to add item: ${response['message']}");
//         Get.snackbar(
//           'Error',
//           response['message'] ?? 'Failed to add item to cart',
//           backgroundColor: Colors.red,
//           colorText: Colors.white,
//         );
//         return false; // Return false for failure
//       }
//     } catch (e) {
//       isLoading.value = false;
//       print("❌ Error in addToCart: $e");
//       Get.snackbar(
//         'Error',
//         'Failed to add item to cart: $e',
//         backgroundColor: Colors.red,
//         colorText: Colors.white,
//       );
//       return false; // Return false for error
//     }
//   }
// //product related controller
//
//   // Add these variables to your ProductDetailsController class
//   var isRelatedProductsLoading = false.obs;
//   var relatedProducts = <Map<String, dynamic>>[].obs;
//
// // Add this method to your ProductDetailsController class
//   Future<void> fetchRelatedProducts(int productId) async {
//     try {
//       print("🟡 STARTING fetchRelatedProducts for product ID: $productId");
//       isRelatedProductsLoading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for related products");
//         isRelatedProductsLoading.value = false;
//         return;
//       }
//
//       print("🔄 Fetching related products for product ID: $productId");
//       final response = await ProductDetailsApiService().getRelatedProducts(token, productId);
//
//       if (response['status'] == true) {
//         relatedProducts.value = List<Map<String, dynamic>>.from(response['data'] ?? []);
//         print("✅ Related products loaded: ${relatedProducts.length} items");
//         // Debug: Print product names
//         for (var product in relatedProducts) {
//           print("📦 Related Product: ${product['name']} (ID: ${product['id']})");
//       } }else {
//         print("❌ Failed to load related products: ${response['message']}");
//         relatedProducts.clear();
//       }
//     } catch (e) {
//       isRelatedProductsLoading.value = false;
//       print("❌ Error in fetchRelatedProducts: $e");
//     } finally {
//       isRelatedProductsLoading.value = false;
//     }
//   }
//
// // Update clearProductDetails method
//   void clearProductDetailsdata() {
//     productDetails.value = ProductDetailsResponse(
//       status: false,
//       message: '',
//       data: ProductDetailsData(
//         product: Product(
//           id: 0,
//           categoryId: 0,
//           taxId: 0,
//           name: '',
//           slug: '',
//           sku: '',
//           tags: '',
//           video: '',
//           sortDetails: '',
//           specificationName: '',
//           specificationDescription: '',
//           isSpecification: 0,
//           details: '',
//           photo: '',
//           discountPrice: 0.0,
//           stock: 0,
//           metaKeywords: '',
//           status: 0,
//           isType: '',
//           createdAt: '',
//           updatedAt: '',
//           itemType: '',
//           thumbnail: '',
//         ),
//         gallery: [],
//         reviews: [],
//         avgRating: 0.0,
//       ),
//     );
//     relatedProducts.clear(); // Clear related products too
//   }
//
//   // Helper getters
//   Product get product => productDetails.value.data.product;
//   List<GalleryImage> get gallery => productDetails.value.data.gallery;
//   List<Review> get reviews => productDetails.value.data.reviews;
//   double get avgRating => productDetails.value.data.avgRating;
//   bool get hasGallery => gallery.isNotEmpty;
//   bool get hasReviews => reviews.isNotEmpty;
//   bool get hasSpecifications => product.hasSpecifications;
// }

//just updated at 2:40

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
      attributes: [], // NEW: Initialize empty attributes list
      gallery: [],
      reviews: [],
      avgRating: 0.0,
    ),
  ).obs;

  // NEW: For tracking selected attribute options
  final selectedAttributes = <int, AttributeOption?>{}.obs;

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

        // Initialize attribute selections
        _initializeAttributeSelections();
      } else {
        print("❌ Failed to load product details: ${response.message}");
      }
    } catch (e) {
      isLoading.value = false;
      print("❌ Error in fetchProductDetails: $e");
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

  // NEW: Initialize attribute selections
  void _initializeAttributeSelections() {
    selectedAttributes.clear();
    for (var attribute in attributes) {
      if (attribute.options.isNotEmpty) {
        selectedAttributes[attribute.id] = attribute.options.first;
      }
    }
  }

  // NEW: Update attribute selection
  void updateAttributeSelection(int attributeId, AttributeOption option) {
    selectedAttributes[attributeId] = option;
  }

  // NEW: Get selected attribute value by keyword
  String getSelectedAttributeValue(String keyword) {
    final attribute = attributes
        .firstWhere((attr) => attr.keyword == keyword,
        orElse: () => Attribute(
          id: 0,
          itemId: 0,
          name: '',
          keyword: '',
          options: [],
        ));

    final selectedOption = selectedAttributes[attribute.id];
    return selectedOption?.name ?? '';
  }

  // NEW: Calculate total price with attributes
  double getTotalPriceWithAttributes(int quantity) {
    double basePrice = product.discountPrice * quantity;
    double attributeTotal = 0.0;

    selectedAttributes.forEach((attrId, option) {
      if (option != null) {
        attributeTotal += option.price * quantity;
      }
    });

    return basePrice + attributeTotal;
  }

  // NEW: Check if any attribute has additional price - FIXED
  bool get hasAttributePriceAdditions {
    for (var option in selectedAttributes.values) {
      if (option != null && option.price > 0) {
        return true;
      }
    }
    return false;
  }

  // NEW: Get total attribute price - FIXED
  double get attributeTotalPrice {
    double total = 0.0;
    selectedAttributes.forEach((_, option) {
      if (option != null) {
        total += option.price;
      }
    });
    return total;
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
        attributes: [],
        gallery: [],
        reviews: [],
        avgRating: 0.0,
      ),
    );
    selectedAttributes.clear();
    relatedProducts.clear();
  }

  // Add to Cart method
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
        return false;
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

        return true;
      } else {
        print("❌ Failed to add item: ${response['message']}");
        Get.snackbar(
          'Error',
          response['message'] ?? 'Failed to add item to cart',
          backgroundColor: Colors.red,
          colorText: Colors.white,
        );
        return false;
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
      return false;
    }
  }

  // Related Products
  var isRelatedProductsLoading = false.obs;
  var relatedProducts = <Map<String, dynamic>>[].obs;

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
        for (var product in relatedProducts) {
          print("📦 Related Product: ${product['name']} (ID: ${product['id']})");
        }
      } else {
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

  // Helper getters
  Product get product => productDetails.value.data.product;
  List<Attribute> get attributes => productDetails.value.data.attributes; // NEW
  List<GalleryImage> get gallery => productDetails.value.data.gallery;
  List<Review> get reviews => productDetails.value.data.reviews;
  double get avgRating => productDetails.value.data.avgRating;
  bool get hasGallery => gallery.isNotEmpty;
  bool get hasReviews => reviews.isNotEmpty;
  bool get hasSpecifications => product.hasSpecifications;
  bool get hasAttributes => attributes.isNotEmpty; // NEW

  // ================ NEW HELPER METHODS ================

  // Get selected size
  String get selectedSize {
    final sizeAttribute = attributes.firstWhere(
          (attr) => attr.keyword == "size",
      orElse: () => Attribute(
        id: 0,
        itemId: 0,
        name: '',
        keyword: '',
        options: [],
      ),
    );

    final selectedOption = selectedAttributes[sizeAttribute.id];
    return selectedOption?.name ?? "";
  }

  // Get selected color
  String get selectedColor {
    final colorAttribute = attributes.firstWhere(
          (attr) => attr.keyword == "color",
      orElse: () => Attribute(
        id: 0,
        itemId: 0,
        name: '',
        keyword: '',
        options: [],
      ),
    );

    final selectedOption = selectedAttributes[colorAttribute.id];
    return selectedOption?.name ?? "";
  }

  // Get base price with attribute additions (for single item)
  double get priceWithAttributes {
    return product.discountPrice + attributeTotalPrice;
  }

  // Format price with attribute additions (for single item)
  String get formattedPriceWithAttributes {
    double total = product.discountPrice + attributeTotalPrice;
    return '\$${total.toStringAsFixed(2)}';
  }

  // Get formatted total price with attributes and quantity
  String getFormattedTotalPriceWithAttributes(int quantity) {
    double total = getTotalPriceWithAttributes(quantity);
    return '\$${total.toStringAsFixed(2)}';
  }

  // Check if specific attribute option is selected
  bool isAttributeOptionSelected(int attributeId, int optionId) {
    final selectedOption = selectedAttributes[attributeId];
    return selectedOption != null && selectedOption.id == optionId;
  }

  // Get attribute by keyword
  Attribute? getAttributeByKeyword(String keyword) {
    try {
      return attributes.firstWhere((attr) => attr.keyword == keyword);
    } catch (e) {
      return null;
    }
  }

  // Get all selected attribute names
  Map<String, String> getSelectedAttributesMap() {
    final Map<String, String> selectedMap = {};

    for (var attribute in attributes) {
      final selectedOption = selectedAttributes[attribute.id];
      if (selectedOption != null) {
        selectedMap[attribute.name] = selectedOption.name;
      }
    }

    return selectedMap;
  }

  // Check if all required attributes are selected
  bool get areAllAttributesSelected {
    for (var attribute in attributes) {
      if (selectedAttributes[attribute.id] == null) {
        return false;
      }
    }
    return true;
  }
}