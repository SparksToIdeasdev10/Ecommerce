// import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import '../products/product_controller.dart';
//
//
// class ProductListScreen extends StatefulWidget {
//   const ProductListScreen({super.key});
//
//   @override
//   State<ProductListScreen> createState() => _ProductListScreenState();
// }
//
// class _ProductListScreenState extends State<ProductListScreen> {
//   // Use the EXACT SAME controller from home screen
//   final productdatalist productController = Get.find<productdatalist>();
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;
//
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF16423C),
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         title: const Text(
//           'All Products',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(width * 0.04),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: height * 0.04),
//
//             // Header - SAME as category screen
//             const Text(
//               'All Products',
//               style: TextStyle(
//                 fontSize: 22,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF16423C),
//               ),
//             ),
//
//             SizedBox(height: height * 0.02),
//
//             // Products Grid - SAME PATTERN as category grid
//             Obx(
//                   () => productController.isproductloading.value
//                   ? const Center(child: CircularProgressIndicator())
//                   : productController.productresponse.value.data.isEmpty
//                   ? const Center(child: Text('No products found', style: TextStyle(color: Colors.grey)))
//                   : GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2, // 2 columns for products
//                   crossAxisSpacing: width * 0.03,
//                   mainAxisSpacing: height * 0.02,
//                   childAspectRatio: 0.7, // Slightly different ratio for product cards
//                 ),
//                 itemCount: productController.productresponse.value.data.length,
//                 itemBuilder: (context, index) {
//                   final productItem = productController.productresponse.value.data[index];
//                   return GestureDetector(
//                     onTap: () {
//                       // Navigate to product details - SAME as home screen
//                       Get.to(() => ProductDetailsScreen(productId: productItem.id));
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(12),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 4,
//                             offset: const Offset(0, 2),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           // Product Image
//                           ClipRRect(
//                             borderRadius: const BorderRadius.vertical(
//                               top: Radius.circular(12),
//                             ),
//                             child: Image.network(
//                               productItem.photo,
//                               height: 140,
//                               width: double.infinity,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Container(
//                                   height: 140,
//                                   color: Colors.grey[200],
//                                   child: const Icon(Icons.image, color: Colors.grey),
//                                 );
//                               },
//                             ),
//                           ),
//
//                           // Product Details
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 // Product Name
//                                 Text(
//                                   productItem.name,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.w600,
//                                     fontSize: 12,
//                                   ),
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                                 const SizedBox(height: 4),
//
//                                 // Price and Rating - SAME as home screen
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         if (productItem.previousPrice != null)
//                                           Text(
//                                             "\$${productItem.previousPrice!.toStringAsFixed(2)}",
//                                             style: const TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 10,
//                                               decoration: TextDecoration.lineThrough,
//                                             ),
//                                           ),
//                                         Text(
//                                           "\$${productItem.discountPrice.toStringAsFixed(2)}",
//                                           style: const TextStyle(
//                                             color: Color(0xFF16423C),
//                                             fontWeight: FontWeight.bold,
//                                             fontSize: 14,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     Row(
//                                       children: [
//                                         const Icon(Icons.star, color: Colors.amber, size: 14),
//                                         Text(
//                                           productItem.brandId?.toString() ?? "5.0",
//                                           style: const TextStyle(fontSize: 10),
//                                         )
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//
//                                 const SizedBox(height: 6),
//
//                                 // Add to Cart Button - SAME as home screen
//                                 Container(
//                                   alignment: Alignment.center,
//                                   width: double.infinity,
//                                   padding: const EdgeInsets.symmetric(vertical: 6),
//                                   decoration: BoxDecoration(
//                                     color: const Color(0xFF16423C),
//                                     borderRadius: BorderRadius.circular(8),
//                                   ),
//                                   child: const Text(
//                                     "Add to Cart",
//                                     style: TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 12,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }