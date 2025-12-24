// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import 'category_controller.dart';
//
// class categoryscreen extends StatefulWidget {
//   const categoryscreen({super.key});
//
//   @override
//   State<categoryscreen> createState() => _categoryscreenState();
// }
//
// class _categoryscreenState extends State<categoryscreen> {
//   final categorycontroller categoryController = Get.put(categorycontroller());
//
//   final List<Map<String, dynamic>> popularSearches = [
//     {
//       'title': 'Modern Light Clothes',
//       'searches': '1.6k search today',
//     },
//     {
//       'title': 'Modern Light Clothes',
//       'searches': '1.6k search today',
//     },
//     {
//       'title': 'Modern Light Clothes',
//       'searches': '1.6k search today',
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     // Call API when screen loads
//     categoryController.categorycont();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EEDC),
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
//           'Category',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(width * 0.04),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search Bar
//             Container(
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(30),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: height * 0.04),
//
//             // Categories Section
//             const Text(
//               'Categories',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF16423C),
//               ),
//             ),
//
//             SizedBox(height: height * 0.02),
//
//             // API Categories - GridView with 4 items per row
//             Obx(
//                   () => categoryController.iscategoryloading.value
//                   ? const Center(
//                 child: CircularProgressIndicator(),
//               )
//                   : categoryController.categoryresponse.value.data.isEmpty
//                   ? const Center(
//                 child: Text(
//                   'No categories found',
//                   style: TextStyle(color: Colors.grey),
//                 ),
//               )
//                   : GridView.builder(
//                 shrinkWrap: true,
//                 physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 4, // 4 items per row
//                   crossAxisSpacing: width * 0.03,
//                   mainAxisSpacing: height * 0.02,
//                   childAspectRatio: 0.8, // Adjust this for better proportions
//                 ),
//                 itemCount: categoryController.categoryresponse.value.data.length,
//                 itemBuilder: (context, index) {
//                   final category = categoryController.categoryresponse.value.data[index];
//                   return Column(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: const Color(0xFF16423C),
//                         radius: 30,
//                         backgroundImage: NetworkImage(
//                           category.photo,
//                         ),
//                         onBackgroundImageError: (exception, stackTrace) {
//                           // Handle image error - show placeholder
//                         },
//                       ),
//                       SizedBox(height: height * 0.01),
//                       SizedBox(
//                         width: 70, // Fixed width for text
//                         child: Text(
//                           category.name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 12,
//                           ),
//                           textAlign: TextAlign.center,
//                           maxLines: 2,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   );
//                 },
//               ),
//             ),
//
//             SizedBox(height: height * 0.04),
//
//             // category id screen
//
//
//
//
//
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// //
// // import 'category_controller.dart';
// //
// // class categoryscreen extends StatefulWidget {
// //   const categoryscreen({super.key});
// //
// //   @override
// //   State<categoryscreen> createState() => _categoryscreenState();
// // }
// //
// // class _categoryscreenState extends State<categoryscreen> {
// //   final categorycontroller categoryController = Get.put(categorycontroller());
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     categoryController.categorycont();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;
// //     final width = size.width;
// //     final height = size.height;
// //
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5EEDC),
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF16423C),
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         title: const Text(
// //           'Category',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(width * 0.04),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //
// //
// //
// //             SizedBox(height: height * 0.04),
// //
// //             const Text(
// //               'Categories',
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //                 color: Color(0xFF16423C),
// //               ),
// //             ),
// //
// //             SizedBox(height: height * 0.02),
// //
// //             Obx(
// //                   () => categoryController.iscategoryloading.value
// //                   ? const Center(child: CircularProgressIndicator())
// //                   : categoryController.categoryresponse.value.data.isEmpty
// //                   ? const Center(child: Text('No categories found', style: TextStyle(color: Colors.grey)))
// //                   : GridView.builder(
// //                 shrinkWrap: true,
// //                 physics: const NeverScrollableScrollPhysics(),
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 4,
// //                   crossAxisSpacing: width * 0.03,
// //                   mainAxisSpacing: height * 0.02,
// //                   childAspectRatio: 0.8,
// //                 ),
// //                 itemCount: categoryController.categoryresponse.value.data.length,
// //                 itemBuilder: (context, index) {
// //                   final category = categoryController.categoryresponse.value.data[index];
// //                   return GestureDetector(
// //                     onTap: () {
// //                       Get.to(() => CategoryDetailScreen(categoryId: category.id));
// //                     },
// //                     child: Column(
// //                       children: [
// //                         CircleAvatar(
// //                           backgroundColor: const Color(0xFF16423C),
// //                           radius: 30,
// //                           backgroundImage: NetworkImage(category.photo),
// //                         ),
// //                         SizedBox(height: height * 0.01),
// //                         SizedBox(
// //                           width: 70,
// //                           child: Text(
// //                             category.name,
// //                             style: const TextStyle(
// //                               fontWeight: FontWeight.w500,
// //                               fontSize: 12,
// //                             ),
// //                             textAlign: TextAlign.center,
// //                             maxLines: 2,
// //                             overflow: TextOverflow.ellipsis,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class CategoryDetailScreen extends StatefulWidget {
// //   final int categoryId;
// //
// //   const CategoryDetailScreen({super.key, required this.categoryId});
// //
// //   @override
// //   State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
// // }
// //
// // class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
// //   final categorycontroller categoryController = Get.find<categorycontroller>();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     print("🔄 INIT: Loading category details for ID: ${widget.categoryId}");
// //     categoryController.subcategorycont(widget.categoryId);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;
// //     final width = size.width;
// //     final height = size.height;
// //
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5EEDC),
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF16423C),
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () => Get.back(),
// //         ),
// //         title: Obx(() {
// //           final categoryName = categoryController.subcategoryresponse.value.data.category.name;
// //           print("📝 AppBar Title: $categoryName");
// //           return Text(
// //             categoryName.isEmpty ? 'Loading...' : categoryName,
// //             style: const TextStyle(color: Colors.white),
// //           );
// //         }),
// //         centerTitle: true,
// //       ),
// //       body: Obx(() {
// //         final isLoading = categoryController.issubcategoryloading.value;
// //         final categoryData = categoryController.subcategoryresponse.value.data;
// //         final subcategories = categoryData.subcategories;
// //         final products = categoryData.products;
// //
// //         print("🔄 UI STATE - Loading: $isLoading, Subcategories: ${subcategories.length}, Products: ${products.length}");
// //
// //         if (isLoading) {
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //
// //         return SingleChildScrollView(
// //           padding: EdgeInsets.all(width * 0.04),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Category Banner
// //               Container(
// //                 width: double.infinity,
// //                 height: height * 0.2,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(12),
// //                   color: Colors.grey[300],
// //                 ),
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.circular(12),
// //                   child: Image.network(
// //                     categoryData.category.photo,
// //                     fit: BoxFit.cover,
// //                     errorBuilder: (context, error, stackTrace) {
// //                       return Container(
// //                         color: Colors.grey[300],
// //                         child: const Icon(Icons.image, size: 50, color: Colors.grey),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ),
// //
// //               SizedBox(height: height * 0.03),
// //
// //               // Subcategories Section
// //               if (subcategories.isNotEmpty) ...[
// //                 const Text(
// //                   'Subcategories',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Color(0xFF16423C),
// //                   ),
// //                 ),
// //                 SizedBox(height: height * 0.02),
// //                 GridView.builder(
// //                   shrinkWrap: true,
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 3,
// //                     crossAxisSpacing: width * 0.03,
// //                     mainAxisSpacing: height * 0.02,
// //                     childAspectRatio: 0.9,
// //                   ),
// //                   itemCount: subcategories.length,
// //                   itemBuilder: (context, index) {
// //                     final subcategory = subcategories[index];
// //                     return Column(
// //                       children: [
// //                         Container(
// //                           width: 50,
// //                           height: 50,
// //                           decoration: BoxDecoration(
// //                             color: const Color(0xFF16423C),
// //                             borderRadius: BorderRadius.circular(25),
// //                           ),
// //                           child: const Icon(Icons.category, color: Colors.white),
// //                         ),
// //                         SizedBox(height: height * 0.01),
// //                         Text(
// //                           subcategory.name,
// //                           style: const TextStyle(
// //                             fontSize: 11,
// //                             fontWeight: FontWeight.w500,
// //                           ),
// //                           textAlign: TextAlign.center,
// //                           maxLines: 2,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                       ],
// //                     );
// //                   },
// //                 ),
// //                 SizedBox(height: height * 0.03),
// //               ],
// //
// //               // Products Section
// //               if (products.isNotEmpty) ...[
// //                 const Text(
// //                   'Products',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Color(0xFF16423C),
// //                   ),
// //                 ),
// //                 SizedBox(height: height * 0.02),
// //                 ListView.builder(
// //                   shrinkWrap: true,
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   itemCount: products.length,
// //                   itemBuilder: (context, index) {
// //                     final product = products[index];
// //                     return Card(
// //                       margin: EdgeInsets.only(bottom: height * 0.015),
// //                       child: ListTile(
// //                         leading: Container(
// //                           width: 50,
// //                           height: 50,
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(8),
// //                             color: Colors.grey[300],
// //                           ),
// //                           child: ClipRRect(
// //                             borderRadius: BorderRadius.circular(8),
// //                             child: Image.network(
// //                               product.photo,
// //                               fit: BoxFit.cover,
// //                               errorBuilder: (context, error, stackTrace) {
// //                                 return Container(
// //                                   color: Colors.grey[300],
// //                                   child: const Icon(Icons.shopping_bag, color: Colors.grey),
// //                                 );
// //                               },
// //                             ),
// //                           ),
// //                         ),
// //                         title: Text(
// //                           product.name,
// //                           style: const TextStyle(fontWeight: FontWeight.bold),
// //                           maxLines: 2,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                         subtitle: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               '\$${product.discountPrice}',
// //                               style: const TextStyle(
// //                                 color: Colors.green,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 16,
// //                               ),
// //                             ),
// //                             if (product.previousPrice != null && product.previousPrice! > product.discountPrice)
// //                               Text(
// //                                 '\$${product.previousPrice}',
// //                                 style: const TextStyle(
// //                                   color: Colors.red,
// //                                   decoration: TextDecoration.lineThrough,
// //                                   fontSize: 12,
// //                                 ),
// //                               ),
// //                           ],
// //                         ),
// //                         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
// //                         onTap: () {
// //                           print('Product tapped: ${product.name}');
// //                         },
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ],
// //
// //               // Empty State
// //               if (subcategories.isEmpty && products.isEmpty) ...[
// //                 SizedBox(height: height * 0.1),
// //                 const Center(
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(Icons.category, size: 60, color: Colors.grey),
// //                       SizedBox(height: 16),
// //                       Text(
// //                         'No content available',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           color: Colors.grey,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       SizedBox(height: 8),
// //                       Text(
// //                         'This category has no subcategories or products yet.',
// //                         style: TextStyle(color: Colors.grey),
// //                         textAlign: TextAlign.center,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ],
// //           ),
// //         );
// //       }),
// //     );
// //   }
// // }
//
//
// //main hai main hai
// //
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// // import 'package:get/get_core/src/get_main.dart';
// //
// // import 'category_controller.dart';
// //
// // class categoryscreen extends StatefulWidget {
// //   const categoryscreen({super.key});
// //
// //   @override
// //   State<categoryscreen> createState() => _categoryscreenState();
// // }
// //
// // class _categoryscreenState extends State<categoryscreen> {
// //   final categorycontroller categoryController = Get.put(categorycontroller());
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     categoryController.categorycont();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;
// //     final width = size.width;
// //     final height = size.height;
// //
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5EEDC),
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF16423C),
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () {
// //             Navigator.pop(context);
// //           },
// //         ),
// //         title: const Text(
// //           'Category',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(width * 0.04),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             SizedBox(height: height * 0.04),
// //
// //             const Text(
// //               'Categories',
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //                 color: Color(0xFF16423C),
// //               ),
// //             ),
// //
// //             SizedBox(height: height * 0.02),
// //
// //             Obx(
// //                   () => categoryController.iscategoryloading.value
// //                   ? const Center(child: CircularProgressIndicator())
// //                   : categoryController.categoryresponse.value.data.isEmpty
// //                   ? const Center(child: Text('No categories found', style: TextStyle(color: Colors.grey)))
// //                   : GridView.builder(
// //                 shrinkWrap: true,
// //                 physics: const NeverScrollableScrollPhysics(),
// //                 gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                   crossAxisCount: 4,
// //                   crossAxisSpacing: width * 0.03,
// //                   mainAxisSpacing: height * 0.02,
// //                   childAspectRatio: 0.8,
// //                 ),
// //                 itemCount: categoryController.categoryresponse.value.data.length,
// //                 itemBuilder: (context, index) {
// //                   final category = categoryController.categoryresponse.value.data[index];
// //                   return GestureDetector(
// //                     onTap: () {
// //                       Get.to(() => CategoryDetailScreen(categoryId: category.id));
// //                     },
// //                     child: Column(
// //                       children: [
// //                         CircleAvatar(
// //                           backgroundColor: const Color(0xFF16423C),
// //                           radius: 30,
// //                           backgroundImage: NetworkImage(category.photo),
// //                         ),
// //                         SizedBox(height: height * 0.01),
// //                         SizedBox(
// //                           width: 70,
// //                           child: Text(
// //                             category.name,
// //                             style: const TextStyle(
// //                               fontWeight: FontWeight.w500,
// //                               fontSize: 12,
// //                             ),
// //                             textAlign: TextAlign.center,
// //                             maxLines: 2,
// //                             overflow: TextOverflow.ellipsis,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
// //
// // class CategoryDetailScreen extends StatefulWidget {
// //   final int categoryId;
// //
// //   const CategoryDetailScreen({super.key, required this.categoryId});
// //
// //   @override
// //   State<CategoryDetailScreen> createState() => _CategoryDetailScreenState();
// // }
// //
// // class _CategoryDetailScreenState extends State<CategoryDetailScreen> {
// //   final categorycontroller categoryController = Get.find<categorycontroller>();
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     print("🔄 INIT: Loading category details for ID: ${widget.categoryId}");
// //     categoryController.subcategorycont(widget.categoryId);
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     final size = MediaQuery.of(context).size;
// //     final width = size.width;
// //     final height = size.height;
// //
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5EEDC),
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF16423C),
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white),
// //           onPressed: () => Get.back(),
// //         ),
// //         title: Obx(() {
// //           final categoryName = categoryController.subcategoryresponse.value.data.category.name;
// //           print("📝 AppBar Title: $categoryName");
// //           return Text(
// //             categoryName.isEmpty ? 'Loading...' : categoryName,
// //             style: const TextStyle(color: Colors.white),
// //           );
// //         }),
// //         centerTitle: true,
// //       ),
// //       body: Obx(() {
// //         final isLoading = categoryController.issubcategoryloading.value;
// //         final categoryData = categoryController.subcategoryresponse.value.data;
// //         final subcategories = categoryData.subcategories;
// //         final products = categoryData.products;
// //
// //         print("🔄 UI STATE - Loading: $isLoading, Subcategories: ${subcategories.length}, Products: ${products.length}");
// //
// //         if (isLoading) {
// //           return const Center(child: CircularProgressIndicator());
// //         }
// //
// //         return SingleChildScrollView(
// //           padding: EdgeInsets.all(width * 0.04),
// //           child: Column(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Category Banner
// //               Container(
// //                 width: double.infinity,
// //                 height: height * 0.2,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(12),
// //                   color: Colors.grey[300],
// //                 ),
// //                 child: ClipRRect(
// //                   borderRadius: BorderRadius.circular(12),
// //                   child: Image.network(
// //                     categoryData.category.photo,
// //                     fit: BoxFit.cover,
// //                     errorBuilder: (context, error, stackTrace) {
// //                       return Container(
// //                         color: Colors.grey[300],
// //                         child: const Icon(Icons.image, size: 50, color: Colors.grey),
// //                       );
// //                     },
// //                   ),
// //                 ),
// //               ),
// //
// //               SizedBox(height: height * 0.03),
// //
// //               // Subcategories Section
// //               if (subcategories.isNotEmpty) ...[
// //                 const Text(
// //                   'Subcategories',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Color(0xFF16423C),
// //                   ),
// //                 ),
// //                 SizedBox(height: height * 0.02),
// //                 GridView.builder(
// //                   shrinkWrap: true,
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
// //                     crossAxisCount: 3,
// //                     crossAxisSpacing: width * 0.03,
// //                     mainAxisSpacing: height * 0.02,
// //                     childAspectRatio: 0.9,
// //                   ),
// //                   itemCount: subcategories.length,
// //                   itemBuilder: (context, index) {
// //                     final subcategory = subcategories[index];
// //                     return Column(
// //                       children: [
// //                         Container(
// //                           width: 50,
// //                           height: 50,
// //                           decoration: BoxDecoration(
// //                             color: const Color(0xFF16423C),
// //                             borderRadius: BorderRadius.circular(25),
// //                           ),
// //                           child: const Icon(Icons.category, color: Colors.white),
// //                         ),
// //                         SizedBox(height: height * 0.01),
// //                         Text(
// //                           subcategory.name,
// //                           style: const TextStyle(
// //                             fontSize: 11,
// //                             fontWeight: FontWeight.w500,
// //                           ),
// //                           textAlign: TextAlign.center,
// //                           maxLines: 2,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                       ],
// //                     );
// //                   },
// //                 ),
// //                 SizedBox(height: height * 0.03),
// //               ],
// //
// //               // Products Section - NOW INCLUDED
// //               if (products.isNotEmpty) ...[
// //                 const Text(
// //                   'Products',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: Color(0xFF16423C),
// //                   ),
// //                 ),
// //                 SizedBox(height: height * 0.02),
// //                 ListView.builder(
// //                   shrinkWrap: true,
// //                   physics: const NeverScrollableScrollPhysics(),
// //                   itemCount: products.length,
// //                   itemBuilder: (context, index) {
// //                     final product = products[index];
// //                     return Card(
// //                       margin: EdgeInsets.only(bottom: height * 0.015),
// //                       child: ListTile(
// //                         leading: Container(
// //                           width: 50,
// //                           height: 50,
// //                           decoration: BoxDecoration(
// //                             borderRadius: BorderRadius.circular(8),
// //                             color: Colors.grey[300],
// //                           ),
// //                           child: ClipRRect(
// //                             borderRadius: BorderRadius.circular(8),
// //                             child: Image.network(
// //                               product.photo,
// //                               fit: BoxFit.cover,
// //                               errorBuilder: (context, error, stackTrace) {
// //                                 return Container(
// //                                   color: Colors.grey[300],
// //                                   child: const Icon(Icons.shopping_bag, color: Colors.grey),
// //                                 );
// //                               },
// //                             ),
// //                           ),
// //                         ),
// //                         title: Text(
// //                           product.name,
// //                           style: const TextStyle(fontWeight: FontWeight.bold),
// //                           maxLines: 2,
// //                           overflow: TextOverflow.ellipsis,
// //                         ),
// //                         subtitle: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               '\$${product.discountPrice}',
// //                               style: const TextStyle(
// //                                 color: Colors.green,
// //                                 fontWeight: FontWeight.bold,
// //                                 fontSize: 16,
// //                               ),
// //                             ),
// //                             if (product.previousPrice != null && product.previousPrice! > product.discountPrice)
// //                               Text(
// //                                 '\$${product.previousPrice}',
// //                                 style: const TextStyle(
// //                                   color: Colors.red,
// //                                   decoration: TextDecoration.lineThrough,
// //                                   fontSize: 12,
// //                                 ),
// //                               ),
// //                           ],
// //                         ),
// //                         trailing: const Icon(Icons.arrow_forward_ios, size: 16),
// //                         onTap: () {
// //                           print('Product tapped: ${product.name}');
// //                         },
// //                       ),
// //                     );
// //                   },
// //                 ),
// //               ],
// //
// //               // Empty State - Shows when both subcategories and products are empty
// //               if (subcategories.isEmpty && products.isEmpty) ...[
// //                 SizedBox(height: height * 0.1),
// //                 const Center(
// //                   child: Column(
// //                     mainAxisAlignment: MainAxisAlignment.center,
// //                     children: [
// //                       Icon(Icons.category, size: 60, color: Colors.grey),
// //                       SizedBox(height: 16),
// //                       Text(
// //                         'No content available',
// //                         style: TextStyle(
// //                           fontSize: 18,
// //                           color: Colors.grey,
// //                           fontWeight: FontWeight.bold,
// //                         ),
// //                       ),
// //                       SizedBox(height: 8),
// //                       Text(
// //                         'This category has no subcategories or products yet.',
// //                         style: TextStyle(color: Colors.grey),
// //                         textAlign: TextAlign.center,
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ],
// //             ],
// //           ),
// //         );
// //       }),
// //     );
// //   }
// // }
//
//


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import 'category_controller.dart';

class categoryscreen extends StatefulWidget {
  const categoryscreen({super.key});

  @override
  State<categoryscreen> createState() => _categoryscreenState();
}

class _categoryscreenState extends State<categoryscreen> {
  final categorycontroller categoryController = Get.put(categorycontroller());
  int? selectedCategoryId;

  @override
  void initState() {
    super.initState();
    categoryController.categorycont();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(

      // appBar: AppBar(
      //   backgroundColor: const Color(0xFF16423C),
      //
      //   leading: IconButton(
      //     icon: const Icon(Icons.arrow_back, color: Colors.white),
      //     onPressed: () {
      //       Navigator.pop(context);
      //     },
      //   ),
      //   title: Obx(() {
      //     if (selectedCategoryId != null && categoryController.subcategoryresponse.value.data.category.name.isNotEmpty) {
      //       return Text(
      //         categoryController.subcategoryresponse.value.data.category.name,
      //         style: const TextStyle(color: Colors.white),
      //       );
      //     }
      //     return const Text(
      //       'Category',
      //       style: TextStyle(color: Colors.white),
      //     );
      //   }),
      //   centerTitle: true,
      // ),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16423C),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Categories',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: height * 0.04),

            const Text(
              'Categories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16423C),
              ),
            ),

            SizedBox(height: height * 0.02),

            // Categories Grid
            Obx(
                  () => categoryController.iscategoryloading.value
                  ? const Center(child: CircularProgressIndicator())
                  : categoryController.categoryresponse.value.data.isEmpty
                  ? const Center(child: Text('No categories found', style: TextStyle(color: Colors.grey)))
                  : GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 4,
                  crossAxisSpacing: width * 0.03,
                  mainAxisSpacing: height * 0.02,
                  childAspectRatio: 0.8,
                ),
                itemCount: categoryController.categoryresponse.value.data.length,
                itemBuilder: (context, index) {
                  final category = categoryController.categoryresponse.value.data[index];
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedCategoryId = category.id;
                      });
                      categoryController.subcategorycont(category.id);
                    },
                    child: Column(
                      children: [
                        CircleAvatar(
                          backgroundColor: const Color(0xFF16423C),
                          radius: 30,
                          backgroundImage: NetworkImage(category.photo),
                        ),
                        SizedBox(height: height * 0.01),
                        Expanded(
                          child: SizedBox(
                            width: 70,
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 12,
                              ),
                              textAlign: TextAlign.center,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),

            SizedBox(height: height * 0.04),

            // Category Details Section - Shows when a category is selected
            if (selectedCategoryId != null)
              _buildCategoryDetails(size),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryDetails(Size size) {
    final width = size.width;
    final height = size.height;

    return Obx(() {
      if (categoryController.issubcategoryloading.value) {
        return const Center(child: CircularProgressIndicator());
      }

      final categoryData = categoryController.subcategoryresponse.value.data;
      final subcategories = categoryData.subcategories;
      final products = categoryData.products;

      print("🔄 UI STATE - Subcategories: ${subcategories.length}, Products: ${products.length}");

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Divider

          SizedBox(height: height * 0.03),

          // Selected Category Title
          Text(
            categoryData.category.name,
            style: const TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16423C),
            ),
          ),
          SizedBox(height: height * 0.02),

          // Category Banner
          Container(
            width: double.infinity,
            height: height * 0.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[300],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                categoryData.category.photo,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                    color: Colors.grey[300],
                    child: const Icon(Icons.image, size: 50, color: Colors.grey),
                  );
                },
              ),
            ),
          ),

          SizedBox(height: height * 0.03),

          // Subcategories Section
          if (subcategories.isNotEmpty) ...[
            const Text(
              'Subcategories',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16423C),
              ),
            ),
            SizedBox(height: height * 0.02),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: width * 0.03,
                mainAxisSpacing: height * 0.02,
                childAspectRatio: 0.9,
              ),
              itemCount: subcategories.length,
              itemBuilder: (context, index) {
                final subcategory = subcategories[index];
                return Column(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: const Color(0xFF16423C),
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Icon(Icons.category, color: Colors.white),
                    ),
                    SizedBox(height: height * 0.01),
                    Text(
                      subcategory.name,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                );
              },
            ),
            SizedBox(height: height * 0.03),
          ],


          // Empty State
          if (subcategories.isEmpty && products.isEmpty) ...[
            SizedBox(height: height * 0.1),
            const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.category, size: 60, color: Colors.grey),
                  SizedBox(height: 16),
                  Text(
                    'No content available',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'This category has no subcategories or products yet.',
                    style: TextStyle(color: Colors.grey),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ],
        ],
      );
    });
  }
}