// // import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// // class SearchScreen extends StatefulWidget {
// //   const SearchScreen({super.key});
// //
// //   @override
// //   State<SearchScreen> createState() => _SearchScreenState();
// // }
// //
// // class _SearchScreenState extends State<SearchScreen> {
// //   final List<String> lastSearches = [
// //     'Electronics',
// //     'Pants',
// //     'Jackets',
// //     'Shirts',
// //   ];
// //
// //   final List<Map<String, dynamic>> popularSearches = [
// //     {
// //       'title': 'Modern Light Clothes',
// //       'searches': '1.6k search today',
// //     },
// //     {
// //       'title': 'Modern Light Clothes',
// //       'searches': '1.6k search today',
// //     },
// //     {
// //       'title': 'Modern Light Clothes',
// //       'searches': '1.6k search today',
// //     },
// //
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     // ✅ Responsive helpers
// //     final size = MediaQuery.of(context).size;
// //     final width = size.width;
// //     final height = size.height;
// //     final isTablet = width > 600;
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5EEDC),
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF16423C),
// //         elevation: 0,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () {
// //
// //           Navigator.pop(context);
// //         },
// //         ),
// //         title: const Text(
// //           'Search',
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         centerTitle: true,
// //       ),
// //       body: SingleChildScrollView(
// //         padding: EdgeInsets.all(width * 0.04),// ✅ dynamic padding
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Search Bar
// //             Container(
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(30),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black.withOpacity(0.05),
// //                     blurRadius: 4,
// //                     offset: const Offset(0, 2),
// //                   ),
// //                 ],
// //               ),
// //               child: TextField(
// //                 decoration: InputDecoration(
// //                   hintText: 'Search...',
// //                   prefixIcon: const Icon(Icons.search, color: Colors.grey),
// //                   border: InputBorder.none,
// //                   //contentPadding: const EdgeInsets.symmetric(vertical: 15),
// //                   contentPadding: EdgeInsets.symmetric( vertical: height * 0.02),
// //                 ),
// //               ),
// //             ),
// //
// //             SizedBox(height: height * 0.04),
// //
// //             // Last Search Section
// //             const Text(
// //               'Last Search',
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //                 color: Color(0xFF16423C),
// //               ),
// //             ),
// //
// //             const SizedBox(height: 16),
// //             SizedBox(height: height * 0.02),
// //
// //             // Last Search Items
// //             Wrap(
// //               spacing: width * 0.03,
// //               runSpacing: width * 0.03,
// //               children: lastSearches.map((search) {
// //                 return Container(
// //                   //padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //                   padding: EdgeInsets.symmetric(horizontal: width * 0.04,
// //                     vertical: height * 0.012,),
// //                   decoration: BoxDecoration(
// //                     color: const Color(0xFFF5EEDC),
// //                     borderRadius: BorderRadius.circular(5),
// //                     border: Border.all(
// //                       color: Colors.grey
// //                     ),
// //                     boxShadow: [
// //                       BoxShadow(
// //                         color: Colors.black.withOpacity(0.05),
// //                         blurRadius: 4,
// //                         offset: const Offset(0, 2),
// //                       ),
// //                     ],
// //                   ),
// //                   child: Row(
// //                     mainAxisSize: MainAxisSize.min,
// //                     children: [
// //                       Text(
// //                         search,
// //                         style: const TextStyle(
// //                           fontWeight: FontWeight.w500,
// //                           color: Colors.black87,
// //                         ),
// //                       ),
// //                      // const SizedBox(width: 8),
// //                       SizedBox(width: width * 0.02),
// //                       GestureDetector(
// //                         onTap: () {
// //                           setState(() {
// //                             lastSearches.remove(search);
// //                           });
// //                         },
// //                         child: const Icon(
// //                           Icons.close,
// //                           size: 18,
// //                           color: Colors.grey,
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               }).toList(),
// //             ),
// //
// //             //const SizedBox(height: 30),
// //             SizedBox(height: height * 0.01),
// //
// //             // Divider
// //             Container(
// //               height: 1,
// //               color: Colors.grey[300],
// //             ),
// //
// //             //const SizedBox(height: 30),
// //             SizedBox(height: height * 0.04),
// //
// //             // Popular Search Section
// //             const Text(
// //               'Popular Search',
// //               style: TextStyle(
// //                 fontSize: 18,
// //                 fontWeight: FontWeight.bold,
// //                 color: Color(0xFF16423C),
// //               ),
// //             ),
// //
// //             //const SizedBox(height: 20),
// //             SizedBox(height: height * 0.03),
// //
// //             // Popular Search Items
// //             InkWell(
// //               onTap: (){
// //                 //Get.to(ProductDetailsScreen());
// //               },
// //               child: Column(
// //                 children: popularSearches.asMap().entries.map((entry) {
// //                   final index = entry.key;
// //                   final search = entry.value;
// //
// //                   return Column(
// //                     children: [
// //                       Container(
// //                         decoration: BoxDecoration(
// //                           color: const Color(0xFFF5EEDC), // Your background color
// //                           borderRadius: BorderRadius.circular(0), // Remove border radius for clean lines
// //                         ),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.start,
// //                           children: [
// //                             Padding(
// //                               padding: const EdgeInsets.symmetric(horizontal: 12.0),
// //                               child:
// //                               // Image.network('https://i.imgur.com/8Km9tLL.png',
// //                               //   height: 100,
// //                               //   width: 50,
// //                               // // color: Colors.grey,
// //                               // ),
// //                               Image.asset("assets/images/myorderimage.png",height: 80,width: 80,)
// //                             ),
// //                             Column(
// //                               crossAxisAlignment: CrossAxisAlignment.start,
// //                               children: [
// //                                 Text(
// //                                   search['title'],
// //                                   style: const TextStyle(
// //                                     fontWeight: FontWeight.w600,
// //                                     fontSize: 16,
// //                                     color: Color(0xFF16423C),
// //                                   ),
// //                                 ),
// //                                 //const SizedBox(height: 4),
// //                                 SizedBox(height: width * 0.01),
// //                                 Text(
// //                                   search['searches'],
// //                                   style: const TextStyle(
// //                                     color: Colors.grey,
// //                                     fontSize: 14,
// //                                   ),
// //                                 ),
// //                               ],
// //                             ),
// //
// //                           ],
// //                         ),
// //                       ),
// //                       //SizedBox(height: 20,),
// //                       SizedBox(height: height * 0.01,),
// //                       // Add divider line between items (except after the last one)
// //                       if (index < popularSearches.length - 1)
// //                         Container(
// //                           height: 1,
// //                           color: Colors.black, // Line color
// //                           //margin: const EdgeInsets.symmetric(horizontal: 16), // Optional: add horizontal margin to line
// //                           margin: EdgeInsets.symmetric(vertical: height * 0.025,
// //                             horizontal: width * 0.05,), // Optional: add horizontal margin to line
// //                         ),
// //                       SizedBox(height: 20,)
// //                     ],
// //                   );
// //                 }).toList(),
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// // }
//
//
//
//
//
//
// import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
// import 'package:ecommerce/screens/search/search_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/screens/search/search_controller.dart';
//
// import 'search_controller.dart'; // Your controller
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   final controller = Get.find<searchController>(); // Your exact controller name
//   final TextEditingController _searchController = TextEditingController();
//
//   final List<String> lastSearches = [
//     'Electronics',
//     'Pants',
//     'Jackets',
//     'Shirts',
//   ];
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
//           'Search',
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
//               child: TextField(
//                 controller: _searchController,
//                 decoration: InputDecoration(
//                   hintText: 'Search...',
//                   prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                   border: InputBorder.none,
//                   contentPadding: EdgeInsets.symmetric(vertical: height * 0.02),
//                 ),
//                 onSubmitted: (value) {
//                   if (value.isNotEmpty) {
//                     // You'll need to add search method to your controller
//                     // searchController.searchProducts(value);
//                   }
//                 },
//               ),
//             ),
//
//             SizedBox(height: height * 0.04),
//
//             // Show content based on search state
//             _buildContent(width, height),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildContent(double width, double height) {
//     // For now, show your existing content
//     // When you implement search, you can use Obx() to show results
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Last Search Section
//         const Text(
//           'Last Search',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF16423C),
//           ),
//         ),
//
//         const SizedBox(height: 16),
//         SizedBox(height: height * 0.02),
//
//         // Last Search Items
//         Wrap(
//           spacing: width * 0.03,
//           runSpacing: width * 0.03,
//           children: lastSearches.map((search) {
//             return Container(
//               padding: EdgeInsets.symmetric(
//                 horizontal: width * 0.04,
//                 vertical: height * 0.012,
//               ),
//               decoration: BoxDecoration(
//                 color: const Color(0xFFF5EEDC),
//                 borderRadius: BorderRadius.circular(5),
//                 border: Border.all(color: Colors.grey),
//                 boxShadow: [
//                   BoxShadow(
//                     color: Colors.black.withOpacity(0.05),
//                     blurRadius: 4,
//                     offset: const Offset(0, 2),
//                   ),
//                 ],
//               ),
//               child: Row(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   Text(
//                     search,
//                     style: const TextStyle(
//                       fontWeight: FontWeight.w500,
//                       color: Colors.black87,
//                     ),
//                   ),
//                   SizedBox(width: width * 0.02),
//                   GestureDetector(
//                     onTap: () {
//                       setState(() {
//                         lastSearches.remove(search);
//                       });
//                     },
//                     child: const Icon(
//                       Icons.close,
//                       size: 18,
//                       color: Colors.grey,
//                     ),
//                   ),
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//
//         SizedBox(height: height * 0.01),
//
//         // Divider
//         Container(
//           height: 1,
//           color: Colors.grey[300],
//         ),
//
//         SizedBox(height: height * 0.04),
//
//         // Popular Search Section
//         const Text(
//           'Popular Search',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF16423C),
//           ),
//         ),
//
//         SizedBox(height: height * 0.03),
//
//         // Popular Search Items - Using your existing data
//         Column(
//           children: [
//             _buildPopularSearchItem('Modern Light Clothes', '1.6k search today'),
//             _buildPopularSearchItem('Modern Light Clothes', '1.6k search today'),
//             _buildPopularSearchItem('Modern Light Clothes', '1.6k search today'),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPopularSearchItem(String title, String subtitle) {
//     return InkWell(
//       onTap: (){
//         // Get.to(ProductDetailsScreen());
//       },
//       child: Column(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               color: Color(0xFFF5EEDC),
//               borderRadius: BorderRadius.zero,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Image.asset("assets/images/myorderimage.png", height: 80, width: 80),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: Color(0xFF16423C),
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       subtitle,
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }

//
// import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/screens/search/search_controller.dart';
//
// class SearchScreen extends StatefulWidget {
//   const SearchScreen({super.key});
//
//   @override
//   State<SearchScreen> createState() => _SearchScreenState();
// }
//
// class _SearchScreenState extends State<SearchScreen> {
//   late final searchController controller;
//   final TextEditingController _searchController = TextEditingController();
//
//   final List<String> lastSearches = [
//     'Electronics',
//     'Pants',
//     'Jackets',
//     'Shirts',
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     // TEMPORARY FIX: Create controller if it doesn't exist
//     if (!Get.isRegistered<searchController>()) {
//       Get.put(searchController());
//     }
//     controller = Get.find<searchController>();
//   }
//
//   void _performSearch(String query) {
//     if (query.isNotEmpty) {
//       _searchController.text = query; // Set the search text
//       controller.searchProducts(query); // Call the search method
//     }
//   }
//
//   void _clearSearch() {
//     _searchController.clear();
//     controller.searchList.clear(); // Clear search results
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
//           'Search',
//           style: TextStyle(color: Colors.white),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         padding: EdgeInsets.all(width * 0.04),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Search Bar with Clear Button
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
//               child: Row(
//                 children: [
//                   Expanded(
//                     child: TextField(
//                       controller: _searchController,
//                       decoration: InputDecoration(
//                         hintText: 'Search for shirts, electronics, etc...',
//                         prefixIcon: const Icon(Icons.search, color: Colors.grey),
//                         border: InputBorder.none,
//                         contentPadding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: 16),
//                       ),
//                       onSubmitted: (value) {
//                         if (value.isNotEmpty) {
//                           _performSearch(value);
//                         }
//                       },
//                       onChanged: (value) {
//                         // Optional: You can add real-time search here
//                         // if (value.length > 2) {
//                         //   _performSearch(value);
//                         // }
//                       },
//                     ),
//                   ),
//                   if (_searchController.text.isNotEmpty)
//                     IconButton(
//                       icon: const Icon(Icons.clear, color: Colors.grey),
//                       onPressed: _clearSearch,
//                     ),
//                   Padding(
//                     padding: const EdgeInsets.only(right: 8.0),
//                     child: IconButton(
//                       icon: const Icon(Icons.search, color: Color(0xFF16423C)),
//                       onPressed: () {
//                         if (_searchController.text.isNotEmpty) {
//                           _performSearch(_searchController.text);
//                         }
//                       },
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             SizedBox(height: height * 0.04),
//
//             // Show search results or default content
//             Obx(() {
//               if (controller.issearchloading.value) {
//                 return const Center(child: CircularProgressIndicator());
//               } else if (controller.searchList.isNotEmpty) {
//                 return _buildSearchResults();
//               } else if (_searchController.text.isNotEmpty) {
//                 return Center(
//                   child: Text(
//                     'No results found for "${_searchController.text}"',
//                     style: const TextStyle(fontSize: 16, color: Colors.grey),
//                   ),
//                 );
//               } else {
//                 return _buildDefaultContent(width, height);
//               }
//             }),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildSearchResults() {
//     final size = MediaQuery.of(context).size;
//     final width = size.width;
//     final height = size.height;
//
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Text(
//               'Search Results for "${_searchController.text}" (${controller.searchList.length})',
//               style: const TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Color(0xFF16423C),
//               ),
//             ),
//             TextButton(
//               onPressed: _clearSearch,
//               child: const Text(
//                 'Clear',
//                 style: TextStyle(
//                   color: Colors.red,
//                   fontSize: 14,
//                 ),
//               ),
//             ),
//           ],
//         ),
//         SizedBox(height: height * 0.02),
//
//         // Search Results List
//         Column(
//           children: controller.searchList.asMap().entries.map((entry) {
//             final index = entry.key;
//             final product = entry.value;
//
//             return InkWell(
//               onTap: () {
//                 Get.to(ProductDetailsScreen(productId: product.id)); // Pass actual product ID
//               },
//               child: Column(
//                 children: [
//                   Container(
//                     decoration: const BoxDecoration(
//                       color: Color(0xFFF5EEDC),
//                       borderRadius: BorderRadius.zero,
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       children: [
//                         Padding(
//                           padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(8),
//                             child: Image.network(
//                               product.photo,
//                               height: 80,
//                               width: 80,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Image.asset(
//                                   "assets/images/myorderimage.png",
//                                   height: 80,
//                                   width: 80,
//                                   fit: BoxFit.cover,
//                                 );
//                               },
//                             ),
//                           ),
//                         ),
//                         Expanded(
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Text(
//                                 product.name,
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.w600,
//                                   fontSize: 16,
//                                   color: Color(0xFF16423C),
//                                 ),
//                                 maxLines: 2,
//                                 overflow: TextOverflow.ellipsis,
//                               ),
//                               SizedBox(height: width * 0.01),
//                               Text(
//                                 '\$${product.discountPrice.toStringAsFixed(2)}',
//                                 style: const TextStyle(
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 16,
//                                   color: Colors.green,
//                                 ),
//                               ),
//                               if (product.hasDiscount)
//                                 Text(
//                                   '\$${product.previousPrice?.toStringAsFixed(2)}',
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                     decoration: TextDecoration.lineThrough,
//                                   ),
//                                 ),
//                             ],
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(height: height * 0.01),
//                   if (index < controller.searchList.length - 1)
//                     Container(
//                       height: 1,
//                       color: Colors.black,
//                       margin: EdgeInsets.symmetric(
//                         vertical: height * 0.025,
//                         horizontal: width * 0.05,
//                       ),
//                     ),
//                   SizedBox(height: height * 0.02),
//                 ],
//               ),
//             );
//           }).toList(),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDefaultContent(double width, double height) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         // Last Search Section
//         const Text(
//           'Last Search',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF16423C),
//           ),
//         ),
//
//         const SizedBox(height: 16),
//         SizedBox(height: height * 0.02),
//
//         // Last Search Items - Make them clickable
//         Wrap(
//           spacing: width * 0.03,
//           runSpacing: width * 0.03,
//           children: lastSearches.map((search) {
//             return GestureDetector(
//               onTap: () {
//                 _performSearch(search); // Search when clicked
//               },
//               child: Container(
//                 padding: EdgeInsets.symmetric(
//                   horizontal: width * 0.04,
//                   vertical: height * 0.012,
//                 ),
//                 decoration: BoxDecoration(
//                   color: const Color(0xFFF5EEDC),
//                   borderRadius: BorderRadius.circular(5),
//                   border: Border.all(color: Colors.grey),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black.withOpacity(0.05),
//                       blurRadius: 4,
//                       offset: const Offset(0, 2),
//                     ),
//                   ],
//                 ),
//                 child: Row(
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     Text(
//                       search,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w500,
//                         color: Colors.black87,
//                       ),
//                     ),
//                     SizedBox(width: width * 0.02),
//                     GestureDetector(
//                       onTap: () {
//                         setState(() {
//                           lastSearches.remove(search);
//                         });
//                       },
//                       child: const Icon(
//                         Icons.close,
//                         size: 18,
//                         color: Colors.grey,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             );
//           }).toList(),
//         ),
//
//         SizedBox(height: height * 0.01),
//
//         // Divider
//         Container(
//           height: 1,
//           color: Colors.grey[300],
//         ),
//
//         SizedBox(height: height * 0.04),
//
//         // Popular Search Section
//         const Text(
//           'Popular Search',
//           style: TextStyle(
//             fontSize: 18,
//             fontWeight: FontWeight.bold,
//             color: Color(0xFF16423C),
//           ),
//         ),
//
//         SizedBox(height: height * 0.03),
//
//         // Popular Search Items - Make them clickable
//         Column(
//           children: [
//             _buildPopularSearchItem('Shirts', 'Most searched today', 'Shirts'),
//             _buildPopularSearchItem('Electronics', 'Trending now', 'Electronics'),
//             _buildPopularSearchItem('Dresses', 'Popular category', 'Dresses'),
//           ],
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPopularSearchItem(String title, String subtitle, String searchTerm) {
//     return GestureDetector(
//       onTap: () {
//         _performSearch(searchTerm); // Search when clicked
//       },
//       child: Column(
//         children: [
//           Container(
//             decoration: const BoxDecoration(
//               color: Color(0xFFF5EEDC),
//               borderRadius: BorderRadius.zero,
//             ),
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.start,
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                   child: Image.asset("assets/images/myorderimage.png", height: 80, width: 80),
//                 ),
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       title,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.w600,
//                         fontSize: 16,
//                         color: Color(0xFF16423C),
//                       ),
//                     ),
//                     const SizedBox(height: 4),
//                     Text(
//                       subtitle,
//                       style: const TextStyle(
//                         color: Colors.grey,
//                         fontSize: 14,
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//           const SizedBox(height: 20),
//         ],
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     _searchController.dispose();
//     super.dispose();
//   }
// }




import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/screens/search/search_controller.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  late final searchController controller;
  final TextEditingController _searchController = TextEditingController();
  final FocusNode _searchFocusNode = FocusNode();

  final List<String> lastSearches = [
    'Electronics',
    'Pants',
    'Jackets',
    'Shirts',
  ];

  // Search suggestions
  final List<String> searchSuggestions = [
    'Shirts for men',
    'Shirts for women',
    'Casual shirts',
    'Formal shirts',
    'T-shirts',
    'Electronics',
    'Mobile phones',
    'Laptops',
    'Headphones',
  ];

  // Filter options
  String _selectedCategory = 'All';
  String _selectedSort = 'Relevance';
  double _minPrice = 0;
  double _maxPrice = 5000;

  final List<String> categories = [
    'All',
    'Clothing',
    'Electronics',
    'Shoes',
    'Accessories'
  ];

  final List<String> sortOptions = [
    'Relevance',
    'Price: Low to High',
    'Price: High to Low',
    'Newest',
  ];

  @override
  void initState() {
    super.initState();
    if (!Get.isRegistered<searchController>()) {
      Get.put(searchController());
    }
    controller = Get.find<searchController>();

    _searchController.addListener(_onSearchTextChanged);
  }

  void _onSearchTextChanged() {
    setState(() {});
  }

  void _performSearch(String query) {
    if (query.isNotEmpty) {
      _searchController.text = query;
      controller.searchProducts(query);
      _searchFocusNode.unfocus();
    }
  }

  void _clearSearch() {
    _searchController.clear();
    controller.searchList.clear();
  }

  void _showFilterBottomSheet() {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height * 0.7,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        'Filter Products',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF16423C),
                        ),
                      ),
                      IconButton(
                        icon: const Icon(Icons.close),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Category Filter
                  const Text(
                    'Category',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: categories.map((category) {
                      return FilterChip(
                        label: Text(category),
                        selected: _selectedCategory == category,
                        onSelected: (selected) {
                          setState(() {
                            _selectedCategory = category;
                          });
                        },
                        backgroundColor: Colors.grey[200],
                        selectedColor: const Color(0xFF16423C),
                        labelStyle: TextStyle(
                          color: _selectedCategory == category
                              ? Colors.white
                              : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),

                  const SizedBox(height: 20),

                  // Price Range Filter
                  const Text(
                    'Price Range',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  RangeSlider(
                    values: RangeValues(_minPrice, _maxPrice),
                    min: 0,
                    max: 5000,
                    divisions: 50,
                    labels: RangeLabels(
                      '\$$_minPrice',
                      '\$$_maxPrice',
                    ),
                    onChanged: (values) {
                      setState(() {
                        _minPrice = values.start;
                        _maxPrice = values.end;
                      });
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('\$$_minPrice'),
                      Text('\$$_maxPrice'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  // Sort Options
                  const Text(
                    'Sort By',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Wrap(
                    spacing: 8,
                    runSpacing: 8,
                    children: sortOptions.map((sort) {
                      return FilterChip(
                        label: Text(sort),
                        selected: _selectedSort == sort,
                        onSelected: (selected) {
                          setState(() {
                            _selectedSort = sort;
                          });
                        },
                        backgroundColor: Colors.grey[200],
                        selectedColor: const Color(0xFF16423C),
                        labelStyle: TextStyle(
                          color: _selectedSort == sort
                              ? Colors.white
                              : Colors.black,
                        ),
                      );
                    }).toList(),
                  ),

                  const Spacer(),

                  // Apply Filters Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16423C),
                        padding: const EdgeInsets.symmetric(vertical: 15),
                      ),
                      onPressed: () {
                        if (_searchController.text.isNotEmpty) {
                          _performSearch(_searchController.text);
                        }
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'Apply Filters',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  // Get filtered search suggestions
  List<String> get _filteredSuggestions {
    if (_searchController.text.isEmpty) {
      return [];
    }
    return searchSuggestions
        .where((suggestion) =>
        suggestion.toLowerCase().contains(_searchController.text.toLowerCase()))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5EEDC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16423C),
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Search',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
        actions: [
          if (_searchController.text.isNotEmpty || controller.searchList.isNotEmpty)
            IconButton(
              icon: const Icon(Icons.filter_list, color: Colors.white),
              onPressed: _showFilterBottomSheet,
            ),
        ],
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(width * 0.04),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar with Clear Button
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 4,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _searchController,
                          focusNode: _searchFocusNode,
                          decoration: InputDecoration(
                            hintText: 'Search...',
                            prefixIcon: const Icon(Icons.search, color: Colors.grey),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(vertical: height * 0.02, horizontal: 16),
                          ),
                          onSubmitted: (value) {
                            if (value.isNotEmpty) {
                              _performSearch(value);
                            }
                          },
                        ),
                      ),
                      if (_searchController.text.isNotEmpty)
                        IconButton(
                          icon: const Icon(Icons.clear, color: Colors.grey),
                          onPressed: _clearSearch,
                        ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: IconButton(
                          icon: const Icon(Icons.search, color: Color(0xFF16423C)),
                          onPressed: () {
                            if (_searchController.text.isNotEmpty) {
                              _performSearch(_searchController.text);
                            }
                          },
                        ),
                      ),
                    ],
                  ),

                  // Search Suggestions
                  if (_filteredSuggestions.isNotEmpty && _searchFocusNode.hasFocus)
                    Container(
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        children: _filteredSuggestions.map((suggestion) => ListTile(
                          leading: const Icon(Icons.search, size: 20, color: Colors.grey),
                          title: Text(suggestion),
                          onTap: () {
                            _performSearch(suggestion);
                          },
                          dense: true,
                        )).toList(),
                      ),
                    ),
                ],
              ),
            ),

            SizedBox(height: height * 0.04),

            // Show search results or default content
            Obx(() {
              if (controller.issearchloading.value) {
                return const Center(child: CircularProgressIndicator());
              } else if (controller.searchList.isNotEmpty) {
                return _buildSearchResults(width, height);
              } else if (_searchController.text.isNotEmpty) {
                return const Center(
                  child: Text(
                    'No results found',
                    style: TextStyle(fontSize: 16, color: Colors.grey),
                  ),
                );
              } else {
                return _buildDefaultContent(width, height);
              }
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchResults(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Search Results for "${_searchController.text}" (${controller.searchList.length})',
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16423C),
              ),
            ),
            TextButton(
              onPressed: _clearSearch,
              child: const Text(
                'Clear',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 14,
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: height * 0.02),

        // Search Results List - EXACTLY YOUR ORIGINAL UI
        Column(
          children: controller.searchList.asMap().entries.map((entry) {
            final index = entry.key;
            final product = entry.value;

            return InkWell(
              onTap: () {
                Get.to(ProductDetailsScreen(productId: product.id));
              },
              child: Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: Color(0xFFF5EEDC),
                      borderRadius: BorderRadius.zero,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              product.photo,
                              height: 80,
                              width: 80,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/images/myorderimage.png",
                                  height: 80,
                                  width: 80,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  color: Color(0xFF16423C),
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: width * 0.01),
                              Text(
                                '\$${product.discountPrice.toStringAsFixed(2)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                  color: Colors.green,
                                ),
                              ),
                              if (product.hasDiscount)
                                Text(
                                  '\$${product.previousPrice?.toStringAsFixed(2)}',
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: height * 0.01),
                  if (index < controller.searchList.length - 1)
                    Container(
                      height: 1,
                      color: Colors.black,
                      margin: EdgeInsets.symmetric(
                        vertical: height * 0.025,
                        horizontal: width * 0.05,
                      ),
                    ),
                  SizedBox(height: height * 0.02),
                ],
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildDefaultContent(double width, double height) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Last Search Section - EXACTLY YOUR ORIGINAL UI
        const Text(
          'Last Search',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF16423C),
          ),
        ),

        const SizedBox(height: 16),
        SizedBox(height: height * 0.02),

        // Last Search Items - EXACTLY YOUR ORIGINAL UI
        Wrap(
          spacing: width * 0.03,
          runSpacing: width * 0.03,
          children: lastSearches.map((search) {
            return GestureDetector(
              onTap: () {
                _performSearch(search);
              },
              child: Container(
                padding: EdgeInsets.symmetric(
                  horizontal: width * 0.04,
                  vertical: height * 0.012,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xFFF5EEDC),
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(color: Colors.grey),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      search,
                      style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black87,
                      ),
                    ),
                    SizedBox(width: width * 0.02),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          lastSearches.remove(search);
                        });
                      },
                      child: const Icon(
                        Icons.close,
                        size: 18,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            );
          }).toList(),
        ),

        SizedBox(height: height * 0.01),

        // Divider - EXACTLY YOUR ORIGINAL UI
        Container(
          height: 1,
          color: Colors.grey[300],
        ),

        SizedBox(height: height * 0.04),

        // Popular Search Section - EXACTLY YOUR ORIGINAL UI
        const Text(
          'Popular Search',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Color(0xFF16423C),
          ),
        ),

        SizedBox(height: height * 0.03),

        // Popular Search Items - EXACTLY YOUR ORIGINAL UI
        Column(
          children: [
            _buildPopularSearchItem('Modern Light Clothes', '1.6k search today', 'Shirts'),
            _buildPopularSearchItem('Modern Light Clothes', '1.6k search today', 'Electronics'),
            _buildPopularSearchItem('Modern Light Clothes', '1.6k search today', 'Dresses'),
          ],
        ),
      ],
    );
  }

  Widget _buildPopularSearchItem(String title, String subtitle, String searchTerm) {
    return GestureDetector(
      onTap: () {
        _performSearch(searchTerm);
      },
      child: Column(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Color(0xFFF5EEDC),
              borderRadius: BorderRadius.zero,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Image.asset("assets/images/myorderimage.png", height: 80, width: 80),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                        color: Color(0xFF16423C),
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: const TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchTextChanged);
    _searchController.dispose();
    _searchFocusNode.dispose();
    super.dispose();
  }
}