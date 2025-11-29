// import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
// import 'package:ecommerce/screens/products/product_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class AllProductsScreen extends StatefulWidget {
//   const AllProductsScreen({super.key});
//
//   @override
//   State<AllProductsScreen> createState() => _AllProductsScreenState();
// }
//
// class _AllProductsScreenState extends State<AllProductsScreen> {
//   @override
//   void initState() {
//     super.initState();
//     // Try to reload data when screen opens
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       final controller = Get.put(product());
//       if (controller.productresponse.value.data.isEmpty) {
//         print("🔄 No products found, attempting to reload...");
//         controller.productcont();
//       }
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final product productController = Get.find<product>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('All Products'),
//         backgroundColor: const Color(0xFF16423C),
//         foregroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh),
//             onPressed: () {
//               productController.productcont();
//             },
//           ),
//         ],
//       ),
//       body: Obx(
//             () {
//           if (productController.isproductloading.value) {
//             return const Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircularProgressIndicator(),
//                   SizedBox(height: 10),
//                   Text('Loading products...'),
//                 ],
//               ),
//             );
//           }
//
//           final products = productController.productresponse.value.data;
//
//           if (products.isEmpty) {
//             return Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Icon(Icons.inventory_2, size: 60, color: Colors.grey),
//                   const SizedBox(height: 16),
//                   const Text(
//                     'No Products Available',
//                     style: TextStyle(fontSize: 18, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Please check your connection and try again',
//                     textAlign: TextAlign.center,
//                     style: TextStyle(color: Colors.grey),
//                   ),
//                   const SizedBox(height: 20),
//                   ElevatedButton(
//                     onPressed: () {
//                       productController.productcont();
//                     },
//                     child: const Text('Retry'),
//                   ),
//                 ],
//               ),
//             );
//           }
//
//           return GridView.builder(
//             padding: const EdgeInsets.all(16),
//             gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2,
//               crossAxisSpacing: 16,
//               mainAxisSpacing: 16,
//               childAspectRatio: 0.7,
//             ),
//             itemCount: products.length,
//             itemBuilder: (context, index) {
//               final product = products[index];
//               return GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) => ProductDetailsScreen(productId: product.id),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.05),
//                         blurRadius: 4,
//                         offset: const Offset(0, 2),
//                       )
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius: const BorderRadius.vertical(
//                           top: Radius.circular(12),
//                         ),
//                         child: Image.network(
//                           product.photo,
//                           height: 120,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Container(
//                               height: 120,
//                               color: Colors.grey[200],
//                               child: const Column(
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   Icon(Icons.error, color: Colors.grey),
//                                   SizedBox(height: 4),
//                                   Text('No Image', style: TextStyle(fontSize: 10)),
//                                 ],
//                               ),
//                             );
//                           },
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               product.name,
//                               style: const TextStyle(
//                                 fontWeight: FontWeight.w600,
//                                 fontSize: 12,
//                               ),
//                               maxLines: 2,
//                               overflow: TextOverflow.ellipsis,
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   "\$${product.previousPrice?.toStringAsFixed(2) ?? product.discountPrice.toStringAsFixed(2)}",
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 10,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.star, color: Colors.amber, size: 14),
//                                     Text(
//                                       product.brandId?.toString() ?? "5.0",
//                                       style: const TextStyle(fontSize: 10),
//                                     )
//                                   ],
//                                 ),
//                               ],
//                             ),
//                             const SizedBox(height: 6),
//                             Container(
//                               alignment: Alignment.center,
//                               width: double.infinity,
//                               padding: const EdgeInsets.symmetric(vertical: 6),
//                               decoration: BoxDecoration(
//                                 color: const Color(0xFF16423C),
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                               child: Text(
//                                 "\$${product.discountPrice.toStringAsFixed(2)}",
//                                 style: const TextStyle(
//                                   color: Colors.white,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 12,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/screens/products/product_controller.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
//
// class AllProductsScreen extends StatelessWidget {
//   const AllProductsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final product _productcontroller = Get.put(product());
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('All Products'),
//         backgroundColor: const Color(0xFF16423C),
//         foregroundColor: Colors.white,
//       ),
//       body: _productcontroller.productresponse.value.data.isEmpty
//           ? const Center(child: Text('No products available'))
//           : GridView.builder(
//         padding: const EdgeInsets.all(16),
//         gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//           crossAxisCount: 2,
//           crossAxisSpacing: 16,
//           mainAxisSpacing: 16,
//           childAspectRatio: 0.7,
//         ),
//         itemCount: _productcontroller.productresponse.value.data.length,
//         itemBuilder: (context, index) {
//           final product = _productcontroller.productresponse.value.data[index];
//           return GestureDetector(
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => ProductDetailsScreen(productId: product.id),
//                 ),
//               );
//             },
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(12),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   )
//                 ],
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   ClipRRect(
//                     borderRadius: const BorderRadius.vertical(
//                       top: Radius.circular(12),
//                     ),
//                     child: Image.network(
//                       product.photo,
//                       height: 120,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                       errorBuilder: (context, error, stackTrace) {
//                         return Container(
//                           height: 120,
//                           color: Colors.grey[200],
//                           child: const Icon(Icons.error),
//                         );
//                       },
//                     ),
//                   ),
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Text(
//                           product.name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w600,
//                             fontSize: 12,
//                           ),
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                         const SizedBox(height: 4),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "\$${product.previousPrice?.toStringAsFixed(2) ?? product.discountPrice.toStringAsFixed(2)}",
//                               style: const TextStyle(
//                                 color: Colors.grey,
//                                 fontSize: 10,
//                               ),
//                             ),
//                             Row(
//                               children: [
//                                 const Icon(Icons.star, color: Colors.amber, size: 14),
//                                 Text(
//                                   product.brandId?.toString() ?? "5.0",
//                                   style: const TextStyle(fontSize: 10),
//                                 )
//                               ],
//                             ),
//                           ],
//                         ),
//                         const SizedBox(height: 6),
//                         Container(
//                           alignment: Alignment.center,
//                           width: double.infinity,
//                           padding: const EdgeInsets.symmetric(vertical: 6),
//                           decoration: BoxDecoration(
//                             color: const Color(0xFF16423C),
//                             borderRadius: BorderRadius.circular(8),
//                           ),
//                           child: Text(
//                             "\$${product.discountPrice.toStringAsFixed(2)}",
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 12,
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/screens/products/product_controller.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
//
// class AllProductsScreen extends StatelessWidget {
//   const AllProductsScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final product _productcontroller = Get.find<product>();
//
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('All Products'),
//         backgroundColor: const Color(0xFF16423C),
//         foregroundColor: Colors.white,
//       ),
//       body: Obx(
//             () => _productcontroller.isproductloading.value
//             ? const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               CircularProgressIndicator(),
//               SizedBox(height: 10),
//               Text('Loading products...'),
//             ],
//           ),
//         )
//             : _productcontroller.productresponse.value.data.isEmpty
//             ? const Center(
//           child: Text("No products available"),
//         )
//             : GridView.builder(
//           padding: const EdgeInsets.all(16),
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//             crossAxisCount: 2,
//             crossAxisSpacing: 16,
//             mainAxisSpacing: 16,
//             childAspectRatio: 0.7,
//           ),
//           itemCount: _productcontroller.productresponse.value.data.length,
//           itemBuilder: (context, index) {
//             final product = _productcontroller.productresponse.value.data[index];
//             return GestureDetector(
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductDetailsScreen(productId: product.id),
//                   ),
//                 );
//               },
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     )
//                   ],
//                 ),
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     ClipRRect(
//                       borderRadius: const BorderRadius.vertical(
//                         top: Radius.circular(12),
//                       ),
//                       child: Image.network(
//                         product.photo,
//                         height: 120,
//                         width: double.infinity,
//                         fit: BoxFit.cover,
//                         errorBuilder: (context, error, stackTrace) {
//                           return Container(
//                             height: 120,
//                             color: Colors.grey[200],
//                             child: const Icon(Icons.error),
//                           );
//                         },
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.all(8.0),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             product.name,
//                             style: const TextStyle(
//                               fontWeight: FontWeight.w600,
//                               fontSize: 12,
//                             ),
//                             maxLines: 2,
//                             overflow: TextOverflow.ellipsis,
//                           ),
//                           const SizedBox(height: 4),
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               Text(
//                                 "\$${product.previousPrice?.toStringAsFixed(2) ?? product.discountPrice.toStringAsFixed(2)}",
//                                 style: const TextStyle(
//                                   color: Colors.grey,
//                                   fontSize: 10,
//                                 ),
//                               ),
//                               Row(
//                                 children: [
//                                   const Icon(Icons.star, color: Colors.amber, size: 14),
//                                   Text(
//                                     product.brandId?.toString() ?? "5.0",
//                                     style: const TextStyle(fontSize: 10),
//                                   )
//                                 ],
//                               ),
//                             ],
//                           ),
//                           const SizedBox(height: 6),
//                           Container(
//                             alignment: Alignment.center,
//                             width: double.infinity,
//                             padding: const EdgeInsets.symmetric(vertical: 6),
//                             decoration: BoxDecoration(
//                               color: const Color(0xFF16423C),
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                             child: Text(
//                               "\$${product.discountPrice.toStringAsFixed(2)}",
//                               style: const TextStyle(
//                                 color: Colors.white,
//                                 fontWeight: FontWeight.bold,
//                                 fontSize: 12,
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/screens/products/product_controller.dart';
import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';

class AllProductsScreen extends StatelessWidget {
  const AllProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // ✅ YA TO YE USE KARO:
    final product _productcontroller = Get.put(product());

    // ✅ YA PHIR YE USE KARO:
    // final product _productcontroller = Get.find<product>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('All Products'),
        backgroundColor: const Color(0xFF16423C),
        foregroundColor: Colors.white,
      ),
      body: Obx(
            () => _productcontroller.isproductloading.value
            ? const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(),
              SizedBox(height: 10),
              Text('Loading products...'),
            ],
          ),
        )
            : _productcontroller.productresponse.value.data.isEmpty
            ? const Center(
          child: Text("No products available"),
        )
            : GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemCount: _productcontroller.productresponse.value.data.length,
          itemBuilder: (context, index) {
            final product = _productcontroller.productresponse.value.data[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(productId: product.id),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        product.photo,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 120,
                            color: Colors.grey[200],
                            child: const Icon(Icons.error),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${product.previousPrice?.toStringAsFixed(2) ?? product.discountPrice.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 14),
                                  Text(
                                    product.brandId?.toString() ?? "5.0",
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF16423C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "\$${product.discountPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}