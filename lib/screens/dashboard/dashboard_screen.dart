// // import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// // import 'package:ecommerce/screens/dashboard/banners_controller.dart';
// // import 'package:ecommerce/screens/notifications/notification_screen.dart';
// // import 'package:ecommerce/screens/search/search_screen.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// // import 'banners_controller.dart';
// //
// // class HomeScreen extends StatefulWidget {
// //   const HomeScreen({super.key});
// //
// //   @override
// //   State<HomeScreen> createState() => _HomeScreenState();
// // }
// //
// // class _HomeScreenState extends State<HomeScreen> {
// //   int _selectedIndex = 0;
// //   final bannerController bannercontroller = Get.put(bannerController());
// //   @override
// //   void initState() {
// //    bannercontroller.bannercont();
// //   }
// //
// //   final List<Map<String, String>> categories = [
// //     {'name': 'Fashion', 'icon': '👕'},
// //     {'name': 'Electronics', 'icon': '💻'},
// //     {'name': 'Footwear', 'icon': '👟'},
// //     {'name': 'Watches', 'icon': '⌚'},
// //   ];
// //
// //   final List<Map<String, dynamic>> products = [
// //     {
// //       'name': 'Modern Light Clothes',
// //       'type': 'T-shirt',
// //       'price': 40.00,
// //       'rating': 5.0,
// //       'image': 'https://i.imgur.com/8Km9tLL.png'
// //     },
// //     {
// //       'name': 'Modern Light Clothes',
// //       'type': 'T-shirt',
// //       'price': 40.00,
// //       'rating': 5.0,
// //       'image': 'https://i.imgur.com/8Km9tLL.png'
// //     },
// //     {
// //       'name': 'Modern Light Clothes',
// //       'type': 'T-shirt',
// //       'price': 40.00,
// //       'rating': 5.0,
// //       'image': 'https://i.imgur.com/8Km9tLL.png'
// //     },
// //   ];
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF5EEDC),
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF16423C),
// //         elevation: 0,
// //         leading: Image.asset("assets/images/Drawer.png"),
// //         // leading: IconButton(
// //         //   icon: const Icon(Icons.menu, color: Colors.white),
// //         //   onPressed: () {},
// //         // ),
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.notifications_none, color: Colors.white),
// //             onPressed: () {
// //               Navigator.push(context, MaterialPageRoute(builder: (context)=>notificationscreen()));
// //             },
// //           ),
// //         ],
// //         title: const Text(''),
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // 🔍 Search Bar
// // // 🔍 Search Bar (Updated version)
// //             Container(
// //               color: const Color(0xFF16423C),
// //               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //               child: GestureDetector(
// //                 onTap: () {
// //                   Navigator.push(
// //                     context,
// //                     MaterialPageRoute(builder: (context) => const SearchScreen()),
// //                   );
// //                 },
// //                 child: Container(
// //                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(30),
// //                   ),
// //                   child: const Row(
// //                     children: [
// //                       Icon(Icons.search, color: Colors.grey),
// //                       SizedBox(width: 10),
// //                       Text(
// //                         'Search...',
// //                         style: TextStyle(color: Colors.grey),
// //                       ),
// //                     ],
// //                   ),
// //                 ),
// //               ),
// //             ),
// //             // 🧧 Offer Banner
// //             Padding(
// //               padding: const EdgeInsets.all(16),
// //               child: Container(
// //                 height: 130,
// //                 decoration: BoxDecoration(
// //                   color: const Color(0xFF16423C),
// //                   borderRadius: BorderRadius.circular(20),
// //                 ),
// //                 child: Stack(
// //                   children: [
// //                     Positioned(
// //                       left: 16,
// //                       top: 16,
// //                       child: Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: const [
// //                           Text(
// //                             "NEW OFFERS",
// //                             style: TextStyle(
// //                               color: Colors.white70,
// //                               letterSpacing: 1.5,
// //                             ),
// //                           ),
// //                           SizedBox(height: 8),
// //                           Text(
// //                             "Save 20% OFF",
// //                             style: TextStyle(
// //                                 color: Colors.white,
// //                                 fontSize: 22,
// //                                 fontWeight: FontWeight.bold),
// //                           ),
// //                           Text(
// //                             "Your First Order",
// //                             style: TextStyle(color: Colors.white70),
// //                           ),
// //                         ],
// //                       ),
// //                     ),
// //                     Positioned(
// //                       right: 0,
// //                       bottom: 0,
// //                       child: Image.network(
// //                         'https://i.imgur.com/QwhZRyL.png',
// //                         width: 120,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ),
// //
// //             // 🏷 Categories
// //             Padding(
// //               padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //               child: Row(
// //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                 children: const [
// //                   Text("Categories",
// //                       style:
// //                       TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
// //                   Text("View All",
// //                       style: TextStyle(
// //                           color: Colors.teal, fontWeight: FontWeight.w500)),
// //                 ],
// //               ),
// //             ),
// //             const SizedBox(height: 10),
// //             SizedBox(
// //               height: 90,
// //               child: ListView.builder(
// //                 scrollDirection: Axis.horizontal,
// //                 padding: const EdgeInsets.symmetric(horizontal: 16),
// //                 itemCount: categories.length,
// //                 itemBuilder: (context, index) {
// //                   final cat = categories[index];
// //                   return Padding(
// //                     padding: const EdgeInsets.only(right: 16.0),
// //                     child: Column(
// //                       children: [
// //                         CircleAvatar(
// //                           backgroundColor: const Color(0xFF16423C),
// //                           radius: 28,
// //                           child: Text(cat['icon']!,
// //                               style: const TextStyle(fontSize: 24)),
// //                         ),
// //                         const SizedBox(height: 6),
// //                         Text(cat['name']!,
// //                             style: const TextStyle(fontWeight: FontWeight.w500)),
// //
// //                       ],
// //                     ),
// //                   );
// //                 },
// //               ),
// //             ),
// //
// //             // 🆕 New Arrivals
// //             _buildSection("New Arrivals", products),
// //
// //             // 💖 Customer Favourites
// //             _buildSection("Customer Favourites", products),
// //
// //
// //             const SizedBox(height: 80),
// //           ],
// //         ),
// //       ),
// //
// //       // 🔽 Bottom Navigation
// //       // bottomNavigationBar: ConvexAppBar(
// //       //   style: TabStyle.fixedCircle,
// //       //   backgroundColor: const Color(0xFF16423C),
// //       //   color: Colors.white70,
// //       //   activeColor: const Color(0xFFF5EEDC),
// //       //   items: const [
// //       //     TabItem(icon: Icons.home, title: 'Home'),
// //       //     // TabItem(icon: Icons.search_outlined, title: 'Search'),
// //       //     TabItem(icon: Icons.shopping_bag, title: 'Cart'),
// //       //     TabItem(icon: Icons.person, title: 'Profile'),
// //       //   ],
// //       //   initialActiveIndex: 0,
// //       //   onTap: (int i) => print('Selected tab: $i'),
// //       // ),
// //     );
// //   }
// //
// //   Widget _buildSection(String title, List<Map<String, dynamic>> items) {
// //     return Padding(
// //       padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(title,
// //                   style: const TextStyle(
// //                       fontWeight: FontWeight.bold, fontSize: 18)),
// //               const Text("View All",
// //                   style: TextStyle(
// //                       color: Colors.teal, fontWeight: FontWeight.w500)),
// //             ],
// //           ),
// //           const SizedBox(height: 10),
// //           SizedBox(
// //             height: 260,
// //             child: ListView.builder(
// //               scrollDirection: Axis.horizontal,
// //               itemCount: items.length,
// //               itemBuilder: (context, index) {
// //                 final product = items[index];
// //                 return Container(
// //                   width: 160,
// //                   margin: const EdgeInsets.only(right: 16),
// //                   decoration: BoxDecoration(
// //                     color: Colors.white,
// //                     borderRadius: BorderRadius.circular(12),
// //                     boxShadow: [
// //                       BoxShadow(
// //                           color: Colors.black.withOpacity(0.05),
// //                           blurRadius: 4,
// //                           offset: const Offset(0, 2))
// //                     ],
// //                   ),
// //                   child: Column(
// //                     crossAxisAlignment: CrossAxisAlignment.start,
// //                     children: [
// //                       ClipRRect(
// //                         borderRadius:
// //                         const BorderRadius.vertical(top: Radius.circular(12)),
// //                         child: Image.network(
// //                           product['image'],
// //                           height: 140,
// //                           width: double.infinity,
// //                           fit: BoxFit.cover,
// //                         ),
// //                       ),
// //                       Padding(
// //                         padding: const EdgeInsets.all(8.0),
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(product['name'],
// //                                 style: const TextStyle(
// //                                     fontWeight: FontWeight.w600, fontSize: 14)),
// //                             Row(
// //                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                               children: [
// //                                 Text(product['type'],
// //                                     style: const TextStyle(color: Colors.grey)),
// //
// //                                 Row(
// //                                   children: [
// //                                     const Icon(Icons.star,
// //                                         color: Colors.amber, size: 16),
// //                                     Text(product['rating'].toString(),
// //                                         style: const TextStyle(fontSize: 12))
// //                                   ],
// //                                 ),
// //                               ],
// //                             ),
// //                             const SizedBox(height: 6),
// //                             Container(
// //                               alignment: Alignment.center,
// //                               width: double.infinity,
// //                               padding: const EdgeInsets.symmetric(vertical: 6),
// //                               decoration: BoxDecoration(
// //                                 color: const Color(0xFF16423C),
// //                                 borderRadius: BorderRadius.circular(8),
// //                               ),
// //                               child: Text("\$${product['price']}",
// //                                   style: const TextStyle(
// //                                       color: Colors.white,
// //                                       fontWeight: FontWeight.bold)),
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //                 );
// //               },
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:ecommerce/screens/dashboard/banners_controller.dart';
// import 'package:ecommerce/screens/notifications/notification_screen.dart';
// import 'package:ecommerce/screens/search/search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   final bannerController bannercontroller = Get.put(bannerController());
//   final PageController _pageController = PageController();
//   int _currentBannerIndex = 0;
//
//   @override
//   void initState() {
//     super.initState();
//     bannercontroller.bannercont();
//
//     // Auto-scroll carousel
//     _startAutoScroll();
//   }
//
//   void _startAutoScroll() {
//     Future.delayed(const Duration(seconds: 3), () {
//       if (_pageController.hasClients && bannercontroller.bannerImages.isNotEmpty) {
//         final nextPage = (_currentBannerIndex + 1) % bannercontroller.bannerImages.length;
//         _pageController.animateToPage(
//           nextPage,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//         _startAutoScroll();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   final List<Map<String, String>> categories = [
//     {'name': 'Fashion', 'icon': '👕'},
//     {'name': 'Electronics', 'icon': '💻'},
//     {'name': 'Footwear', 'icon': '👟'},
//     {'name': 'Watches', 'icon': '⌚'},
//   ];
//
//   final List<Map<String, dynamic>> products = [
//     {
//       'name': 'Modern Light Clothes',
//       'type': 'T-shirt',
//       'price': 40.00,
//       'rating': 5.0,
//       'image': 'https://i.imgur.com/8Km9tLL.png'
//     },
//     {
//       'name': 'Modern Light Clothes',
//       'type': 'T-shirt',
//       'price': 40.00,
//       'rating': 5.0,
//       'image': 'https://i.imgur.com/8Km9tLL.png'
//     },
//     {
//       'name': 'Modern Light Clothes',
//       'type': 'T-shirt',
//       'price': 40.00,
//       'rating': 5.0,
//       'image': 'https://i.imgur.com/8Km9tLL.png'
//     },
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EEDC),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF16423C),
//         elevation: 0,
//         leading: Image.asset("assets/images/Drawer.png"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>notificationscreen()));
//             },
//           ),
//         ],
//         title: const Text(''),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔍 Search Bar
//             Container(
//               color: const Color(0xFF16423C),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SearchScreen()),
//                   );
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: const Row(
//                     children: [
//                       Icon(Icons.search, color: Colors.grey),
//                       SizedBox(width: 10),
//                       Text(
//                         'Search...',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             // 🎯 CUSTOM CAROUSEL SLIDER
//             _buildCustomCarousel(),
//
//             // 🏷 Categories
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text("Categories",
//                       style:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//                   Text("View All",
//                       style: TextStyle(
//                           color: Colors.teal, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             SizedBox(
//               height: 90,
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: categories.length,
//                 itemBuilder: (context, index) {
//                   final cat = categories[index];
//                   return Padding(
//                     padding: const EdgeInsets.only(right: 16.0),
//                     child: Column(
//                       children: [
//                         CircleAvatar(
//                           backgroundColor: const Color(0xFF16423C),
//                           radius: 28,
//                           child: Text(cat['icon']!,
//                               style: const TextStyle(fontSize: 24)),
//                         ),
//                         const SizedBox(height: 6),
//                         Text(cat['name']!,
//                             style: const TextStyle(fontWeight: FontWeight.w500)),
//                       ],
//                     ),
//                   );
//                 },
//               ),
//             ),
//
//             // 🆕 New Arrivals
//             _buildSection("New Arrivals", products),
//
//             // 💖 Customer Favourites
//             _buildSection("Customer Favourites", products),
//
//             const SizedBox(height: 80),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Custom Carousel using PageView
//   Widget _buildCustomCarousel() {
//     return Obx(() {
//       if (bannercontroller.isbannerloading.value) {
//         return Container(
//           height: 180,
//           margin: const EdgeInsets.all(16),
//           child: const Center(
//             child: CircularProgressIndicator(),
//           ),
//         );
//       }
//
//       final banners = bannercontroller.bannerImages.isNotEmpty
//           ? bannercontroller.bannerImages
//           : [
//         'https://i.imgur.com/QwhZRyL.png',
//         'https://via.placeholder.com/400x200/16423C/FFFFFF?text=Special+Offers',
//         'https://via.placeholder.com/400x200/16423C/FFFFFF?text=New+Arrivals',
//       ];
//
//       return Column(
//         children: [
//           Container(
//             height: 180,
//             margin: const EdgeInsets.all(16),
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: banners.length,
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentBannerIndex = index;
//                 });
//               },
//               itemBuilder: (context, index) {
//                 return Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: const Color(0xFF16423C),
//                     image: DecorationImage(
//                       image: NetworkImage(banners[index]),
//                       fit: BoxFit.cover,
//                     ),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(15),
//                       gradient: LinearGradient(
//                         begin: Alignment.bottomCenter,
//                         end: Alignment.topCenter,
//                         colors: [
//                           Colors.black.withOpacity(0.5),
//                           Colors.transparent,
//                         ],
//                       ),
//                     ),
//                     child: banners[index].contains('placeholder')
//                         ? Center(
//                       child: Text(
//                         banners[index].split('text=')[1].replaceAll('+', ' '),
//                         style: const TextStyle(
//                           color: Colors.white,
//                           fontSize: 24,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     )
//                         : null,
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 10),
//           // Indicator Dots
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(banners.length, (index) {
//               return Container(
//                 width: 8.0,
//                 height: 8.0,
//                 margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _currentBannerIndex == index
//                       ? const Color(0xFF16423C)
//                       : Colors.grey.shade300,
//                 ),
//               );
//             }),
//           ),
//         ],
//       );
//     });
//   }
//
//   Widget _buildSection(String title, List<Map<String, dynamic>> items) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 18)),
//               const Text("View All",
//                   style: TextStyle(
//                       color: Colors.teal, fontWeight: FontWeight.w500)),
//             ],
//           ),
//           const SizedBox(height: 10),
//           SizedBox(
//             height: 260,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: items.length,
//               itemBuilder: (context, index) {
//                 final product = items[index];
//                 return Container(
//                   width: 160,
//                   margin: const EdgeInsets.only(right: 16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: 4,
//                           offset: const Offset(0, 2))
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius:
//                         const BorderRadius.vertical(top: Radius.circular(12)),
//                         child: Image.network(
//                           product['image'],
//                           height: 140,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(product['name'],
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w600, fontSize: 14)),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(product['type'],
//                                     style: const TextStyle(color: Colors.grey)),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.star,
//                                         color: Colors.amber, size: 16),
//                                     Text(product['rating'].toString(),
//                                         style: const TextStyle(fontSize: 12))
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
//                               child: Text("\$${product['price']}",
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

//
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:ecommerce/screens/dashboard/banners_controller.dart';
// import 'package:ecommerce/screens/dashboard/featured_screen/featured_controller.dart';
// import 'package:ecommerce/screens/dashboard/home_categories/home_categories_controller.dart';
// import 'package:ecommerce/screens/notifications/notification_screen.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
// import 'package:ecommerce/screens/products/product_controller.dart';
// import 'package:ecommerce/screens/search/search_screen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'banners_model.dart';
//
// class HomeScreen extends StatefulWidget {
//   const HomeScreen({super.key});
//
//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }
//
// class _HomeScreenState extends State<HomeScreen> {
//   int _selectedIndex = 0;
//   final BannerController bannercontroller = Get.put(BannerController());
//   final PageController _pageController = PageController();
//   final homecategories _controller = Get.put(homecategories());
//   final product _productcontroller = Get.put(product());
//   final featureController controller = Get.put(featureController());
//   int _currentBannerIndex = 0;
//
//   // Add your categories list here
//   final List<Map<String, String>> categories = [
//     {'name': 'Fashion', 'icon': '👕'},
//     {'name': 'Electronics', 'icon': '💻'},
//     {'name': 'Footwear', 'icon': '👟'},
//     {'name': 'Watches', 'icon': '⌚'},
//   ];
//
//   // Add your products list here
//   final List<Map<String, dynamic>> products = [
//     {
//       'name': 'Modern Light Clothes',
//       'type': 'T-shirt',
//       'price': 40.00,
//       'rating': 5.0,
//       'image': 'https://i.imgur.com/8Km9tLL.png'
//     },
//     {
//       'name': 'Modern Light Clothes',
//       'type': 'T-shirt',
//       'price': 40.00,
//       'rating': 5.0,
//       'image': 'https://i.imgur.com/8Km9tLL.png'
//     },
//     {
//       'name': 'Modern Light Clothes',
//       'type': 'T-shirt',
//       'price': 40.00,
//       'rating': 5.0,
//       'image': 'https://i.imgur.com/8Km9tLL.png'
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     bannercontroller.bannercont();
//     _controller.ehomecatcont();
//     _productcontroller.productcont();
//     controller.featurecont();
//
//     // Auto-scroll carousel
//     _startAutoScroll();
//   }
//
//   void _startAutoScroll() {
//     Future.delayed(const Duration(seconds: 3), () {
//       if (_pageController.hasClients && bannercontroller.sliderItems.isNotEmpty) {
//         final nextPage = (_currentBannerIndex + 1) % bannercontroller.sliderItems.length;
//         _pageController.animateToPage(
//           nextPage,
//           duration: const Duration(milliseconds: 500),
//           curve: Curves.easeInOut,
//         );
//         _startAutoScroll();
//       }
//     });
//   }
//
//   @override
//   void dispose() {
//     _pageController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EEDC),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF16423C),
//         elevation: 0,
//         leading: Image.asset("assets/images/Drawer.png"),
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.notifications_none, color: Colors.white),
//             onPressed: () {
//               Navigator.push(context, MaterialPageRoute(builder: (context)=>const notificationscreen()));
//             },
//           ),
//         ],
//         title: const Text(''),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // 🔍 Search Bar
//             Container(
//               color: const Color(0xFF16423C),
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//               child: GestureDetector(
//                 onTap: () {
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(builder: (context) => const SearchScreen()),
//                   );
//                 },
//                 child: Container(
//                   padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: const Row(
//                     children: [
//                       Icon(Icons.search, color: Colors.grey),
//                       SizedBox(width: 10),
//                       Text(
//                         'Search...',
//                         style: TextStyle(color: Colors.grey),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//
//             // 🎯 DYNAMIC CAROUSEL SLIDER FROM API
//             _buildDynamicCarousel(),
//
//             // 🏷 Categories
//
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16.0),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: const [
//                   Text("Categories",
//                       style:
//                       TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
//                   Text("View All",
//                       style: TextStyle(
//                           color: Colors.teal, fontWeight: FontWeight.w500)),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 10),
//             // SizedBox(
//             //   height: 90,
//             //   child: ListView.builder(
//             //     scrollDirection: Axis.horizontal,
//             //     padding: const EdgeInsets.symmetric(horizontal: 16),
//             //     itemCount: categories.length,
//             //     itemBuilder: (context, index) {
//             //       final cat = categories[index];
//             //       return Padding(
//             //         padding: const EdgeInsets.only(right: 16.0),
//             //         child: Column(
//             //           children: [
//             //             CircleAvatar(
//             //               backgroundColor: const Color(0xFF16423C),
//             //               radius: 28,
//             //               child: Text(cat['icon']!,
//             //                   style: const TextStyle(fontSize: 24)),
//             //             ),
//             //             const SizedBox(height: 6),
//             //             Text(cat['name']!,
//             //                 style: const TextStyle(fontWeight: FontWeight.w500)),
//             //           ],
//             //         ),
//             //       );
//             //     },
//             //   ),
//             // ),
//         Obx(
//               () => _controller.ishomecatloading.value
//               ? const Center(
//             child: CircularProgressIndicator(),
//           )
//               : SizedBox(
//             height: 90,
//             child: ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemCount: _controller.homecatresponse.value.data.length,
//               itemBuilder: (context, index) {
//                 final category = _controller.homecatresponse.value.data[index];
//                 return Padding(
//                   padding: const EdgeInsets.only(right: 16.0),
//                   child: Column(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: const Color(0xFF16423C),
//                         radius: 28,
//                         backgroundImage: NetworkImage(
//                           category.photo!,
//                         ),
//                       ),
//                       const SizedBox(height: 6),
//                       SizedBox(
//                         width: 80,
//                         child: Text(
//                           category.name,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.w500,
//                             fontSize: 10,
//                           ),
//                           maxLines: 2,
//                           textAlign: TextAlign.center,
//                           overflow: TextOverflow.ellipsis,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               },
//             ),
//           ),
//         ),
//
//
//             // 🆕 New Arrivals
//             _buildSection("New Arrivals", products),
//
//             // 💖 Customer Favourites
//             _buildSection("Customer Favourites", products),
//
//
//             const SizedBox(height: 80),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Dynamic Carousel using API data
//
//   // Dynamic Carousel using API data - FIXED VERSION
//   // Dynamic Carousel using API data - SIMPLIFIED VERSION
//   Widget _buildDynamicCarousel() {
//     return Obx(() {
//       print("🔄 Carousel rebuild triggered");
//       print("📊 Loading state: ${bannercontroller.isbannerloading.value}");
//       print("📦 Slider items count: ${bannercontroller.sliderItems.length}");
//
//       if (bannercontroller.isbannerloading.value) {
//         return Container(
//           height: 200,
//           margin: const EdgeInsets.all(16),
//           child: const Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 10),
//                 Text("Loading banners..."),
//               ],
//             ),
//           ),
//         );
//       }
//
//       final sliderItems = bannercontroller.sliderItems;
//
//       if (sliderItems.isEmpty) {
//         return Container(
//           height: 200,
//           margin: const EdgeInsets.all(16),
//           child: Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
//                 const SizedBox(height: 10),
//                 const Text("No banners available"),
//                 const SizedBox(height: 10),
//                 ElevatedButton(
//                   onPressed: () {
//                     bannercontroller.bannercont();
//                   },
//                   child: const Text("Retry Load Banners"),
//                 ),
//               ],
//             ),
//           ),
//         );
//       }
//
//       return Column(
//         children: [
//           Container(
//             height: 200,
//             margin: const EdgeInsets.all(16),
//             child: PageView.builder(
//               controller: _pageController,
//               itemCount: sliderItems.length,
//               onPageChanged: (index) {
//                 setState(() {
//                   _currentBannerIndex = index;
//                 });
//               },
//               itemBuilder: (context, index) {
//                 final slider = sliderItems[index];
//
//                 return Container(
//                   margin: const EdgeInsets.symmetric(horizontal: 8),
//                   decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(15),
//                     color: const Color(0xFF16423C),
//                     boxShadow: [
//                       BoxShadow(
//                         color: Colors.black.withOpacity(0.3),
//                         blurRadius: 8,
//                         offset: const Offset(0, 4),
//                       ),
//                     ],
//                   ),
//                   child: ClipRRect(
//                     borderRadius: BorderRadius.circular(15),
//                     child: Stack(
//                       children: [
//                         // Background Image
//                         Image.network(
//                           slider.photo,
//                           width: double.infinity,
//                           height: double.infinity,
//                           fit: BoxFit.cover,
//                           errorBuilder: (context, error, stackTrace) {
//                             return Container(
//                               color: const Color(0xFF16423C),
//                               child: const Center(
//                                 child: Icon(Icons.error, color: Colors.white, size: 50),
//                               ),
//                             );
//                           },
//                         ),
//
//                         // Gradient Overlay
//                         Container(
//                           decoration: BoxDecoration(
//                             gradient: LinearGradient(
//                               begin: Alignment.bottomCenter,
//                               end: Alignment.topCenter,
//                               colors: [
//                                 Colors.black.withOpacity(0.7),
//                                 Colors.transparent,
//                               ],
//                             ),
//                           ),
//                         ),
//
//                         // Text Content - SIMPLIFIED without Positioned widget
//                         Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Container(
//                             padding: const EdgeInsets.all(16),
//                             child: Column(
//                               mainAxisSize: MainAxisSize.min,
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   slider.title,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 20,
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   slider.details,
//                                   style: const TextStyle(
//                                     color: Colors.white,
//                                     fontSize: 14,
//                                   ),
//                                   maxLines: 2,
//                                   overflow: TextOverflow.ellipsis,
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 );
//               },
//             ),
//           ),
//           const SizedBox(height: 10),
//           // Indicator Dots
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: List.generate(sliderItems.length, (index) {
//               return Container(
//                 width: 8.0,
//                 height: 8.0,
//                 margin: const EdgeInsets.symmetric(horizontal: 4.0),
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   color: _currentBannerIndex == index
//                       ? const Color(0xFF16423C)
//                       : Colors.grey.shade300,
//                 ),
//               );
//             }),
//           ),
//         ],
//       );
//     });
//   }
//
//   Widget _buildSection(String title, List<Map<String, dynamic>> items) {
//     return Padding(
//       padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(title,
//                   style: const TextStyle(
//                       fontWeight: FontWeight.bold, fontSize: 18)),
//               const Text("View All",
//                   style: TextStyle(
//                       color: Colors.teal, fontWeight: FontWeight.w500)),
//             ],
//           ),
//           const SizedBox(height: 10),
//           // SizedBox(
//           //   height: 260,
//           //   child: ListView.builder(
//           //     scrollDirection: Axis.horizontal,
//           //     itemCount: items.length,
//           //     itemBuilder: (context, index) {
//           //       final product = items[index];
//           //       return Container(
//           //         width: 160,
//           //         margin: const EdgeInsets.only(right: 16),
//           //         decoration: BoxDecoration(
//           //           color: Colors.white,
//           //           borderRadius: BorderRadius.circular(12),
//           //           boxShadow: [
//           //             BoxShadow(
//           //                 color: Colors.black.withOpacity(0.05),
//           //                 blurRadius: 4,
//           //                 offset: const Offset(0, 2))
//           //           ],
//           //         ),
//           //         child: Column(
//           //           crossAxisAlignment: CrossAxisAlignment.start,
//           //           children: [
//           //             ClipRRect(
//           //               borderRadius:
//           //               const BorderRadius.vertical(top: Radius.circular(12)),
//           //               child: Image.network(
//           //                 product['image'],
//           //                 height: 140,
//           //                 width: double.infinity,
//           //                 fit: BoxFit.cover,
//           //               ),
//           //             ),
//           //             Padding(
//           //               padding: const EdgeInsets.all(8.0),
//           //               child: Column(
//           //                 crossAxisAlignment: CrossAxisAlignment.start,
//           //                 children: [
//           //                   Text(product['name'],
//           //                       style: const TextStyle(
//           //                           fontWeight: FontWeight.w600, fontSize: 14)),
//           //                   Row(
//           //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           //                     children: [
//           //                       Text(product['type'],
//           //                           style: const TextStyle(color: Colors.grey)),
//           //                       Row(
//           //                         children: [
//           //                           const Icon(Icons.star,
//           //                               color: Colors.amber, size: 16),
//           //                           Text(product['rating'].toString(),
//           //                               style: const TextStyle(fontSize: 12))
//           //                         ],
//           //                       ),
//           //                     ],
//           //                   ),
//           //                   const SizedBox(height: 6),
//           //                   Container(
//           //                     alignment: Alignment.center,
//           //                     width: double.infinity,
//           //                     padding: const EdgeInsets.symmetric(vertical: 6),
//           //                     decoration: BoxDecoration(
//           //                       color: const Color(0xFF16423C),
//           //                       borderRadius: BorderRadius.circular(8),
//           //                     ),
//           //                     child: Text("\$${product['price']}",
//           //                         style: const TextStyle(
//           //                             color: Colors.white,
//           //                             fontWeight: FontWeight.bold)),
//           //                   ),
//           //                 ],
//           //               ),
//           //             ),
//           //           ],
//           //         ),
//           //
//           //       );
//           //     },
//           //   ),
//           // )
//
//       Obx(
//             () => _productcontroller.isproductloading.value
//             ? const Center(
//           child: CircularProgressIndicator(),
//         )
//             : SizedBox(
//           height: 260,
//           child: ListView.builder(
//             scrollDirection: Axis.horizontal,
//             itemCount: _productcontroller.productresponse.value.data.length,
//             itemBuilder: (context, index) {
//               final repo = _productcontroller.productresponse.value.data[index];
//               return GestureDetector(onTap: (){
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) => ProductDetailsScreen(productId: repo.id),
//                   ),
//                 );
//               },
//                 child: Container(
//                   width: 160,
//                   margin: const EdgeInsets.only(right: 16),
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(12),
//                     boxShadow: [
//                       BoxShadow(
//                           color: Colors.black.withOpacity(0.05),
//                           blurRadius: 4,
//                           offset: const Offset(0, 2))
//                     ],
//                   ),
//                   child: Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       ClipRRect(
//                         borderRadius:
//                         const BorderRadius.vertical(top: Radius.circular(12)),
//                         child: Image.network(repo.photo,
//                           height: 140,
//                           width: double.infinity,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(repo.name,
//                                 style: const TextStyle(
//                                     fontWeight: FontWeight.w600, fontSize: 8)),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(repo.previousPrice.toString(),
//                                     style: const TextStyle(color: Colors.grey)),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.star,
//                                         color: Colors.amber, size: 16),
//                                     Text(repo.brandId.toString(),
//                                         style: const TextStyle(fontSize: 12))
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
//                               child: Text(repo.discountPrice.toString(),
//                                   style: const TextStyle(
//                                       color: Colors.white,
//                                       fontWeight: FontWeight.bold)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//
//         ],
//       ),
//     );
//   }
//}



import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:ecommerce/screens/Category/category_screen.dart';
import 'package:ecommerce/screens/dashboard/banners_controller.dart';
import 'package:ecommerce/screens/dashboard/featured_screen/featured_controller.dart';
import 'package:ecommerce/screens/dashboard/home_categories/home_categories_controller.dart';
import 'package:ecommerce/screens/dashboard/products/AllFeaturesScreen.dart';
import 'package:ecommerce/screens/dashboard/products/AllProductsScreen.dart';
import 'package:ecommerce/screens/dashboard/products/ProductListScreen.dart';
import 'package:ecommerce/screens/notifications/notification_screen.dart';
import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';
import 'package:ecommerce/screens/product_detail/wishlist/wishlist_screen.dart';
import 'package:ecommerce/screens/products/product_controller.dart';
import 'package:ecommerce/screens/search/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'banners_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  final BannerController bannercontroller = Get.put(BannerController());
  final PageController _pageController = PageController();
  final homecategories _controller = Get.put(homecategories());
  final product _productcontroller = Get.put(product());
  final featureController _featurecontroller = Get.put(featureController()); // FIXED: Added underscore
  int _currentBannerIndex = 0;

  @override
  void initState() {
    super.initState();
    //Get.delete<product>(force: true);
    bannercontroller.bannercont();
    _controller.ehomecatcont();
    _productcontroller.productcont();
    _featurecontroller.featurecont(); // FIXED: Call feature API

    _startAutoScroll();
  }

  void _startAutoScroll() {
    Future.delayed(const Duration(seconds: 3), () {
      if (_pageController.hasClients && bannercontroller.sliderItems.isNotEmpty) {
        final nextPage = (_currentBannerIndex + 1) % bannercontroller.sliderItems.length;
        _pageController.animateToPage(
          nextPage,
          duration: const Duration(milliseconds: 500),
          curve: Curves.easeInOut,
        );
        _startAutoScroll();
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5EEDC),
      appBar: AppBar(
        backgroundColor: const Color(0xFF16423C),
        elevation: 0,
        leading: Image.asset("assets/images/Drawer.png"),
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications_none, color: Colors.white),
            onPressed: ()async {
              SharedPreferences prefs = await SharedPreferences.getInstance();
              final token= await prefs.getString('token');

              print("$token}");
              Navigator.push(context, MaterialPageRoute(builder: (context)=>notificationscreen()));

            },
          ),
          InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=>WishlistScreen()));
          },
              child: Icon(Icons.favorite,color: Colors.white,))
        ],
        title: const Text(''),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 🔍 Search Bar
            Container(
              color: const Color(0xFF16423C),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SearchScreen()),
                  );
                },
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: const Row(
                    children: [
                      Icon(Icons.search, color: Colors.grey),
                      SizedBox(width: 10),
                      Text(
                        'Search...',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // 🎯 DYNAMIC CAROUSEL SLIDER FROM API
            _buildDynamicCarousel(),

            // 🏷 Categories
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:  [
                  Text("Categories",
                      style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                  InkWell(onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>categoryscreen()));

                  },
                    child: Text("View All",
                        style: TextStyle(
                            color: Colors.teal, fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            Obx(
                  () => _controller.ishomecatloading.value
                  ? const Center(
                child: CircularProgressIndicator(),
              )
                  : SizedBox(
                height: 90,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: _controller.homecatresponse.value.data.length,
                  itemBuilder: (context, index) {
                    final category = _controller.homecatresponse.value.data[index];
                    return Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Column(
                        children: [
                          CircleAvatar(
                            backgroundColor: const Color(0xFF16423C),
                            radius: 28,
                            backgroundImage: NetworkImage(
                              category.photo!,
                            ),
                          ),
                          const SizedBox(height: 6),
                          SizedBox(
                            width: 80,
                            child: Text(
                              category.name,
                              style: const TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 10,
                              ),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),

            // 🆕 New Arrivals - Uses product controller
            _buildNewArrivalsSection(),

            // 💖 Customer Favourites - Uses feature controller
            _buildCustomerFavouritesSection(),

            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  // Dynamic Carousel using API data
  Widget _buildDynamicCarousel() {
    return Obx(() {
      if (bannercontroller.isbannerloading.value) {
        return Container(
          height: 200,
          margin: const EdgeInsets.all(16),
          child: const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text("Loading banners..."),
              ],
            ),
          ),
        );
      }

      final sliderItems = bannercontroller.sliderItems;

      if (sliderItems.isEmpty) {
        return Container(
          height: 200,
          margin: const EdgeInsets.all(16),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.image_not_supported, size: 50, color: Colors.grey),
                const SizedBox(height: 10),
                const Text("No banners available"),
                const SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    bannercontroller.bannercont();
                  },
                  child: const Text("Retry Load Banners"),
                ),
              ],
            ),
          ),
        );
      }

      return Column(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.all(16),
            child: PageView.builder(
              controller: _pageController,
              itemCount: sliderItems.length,
              onPageChanged: (index) {
                setState(() {
                  _currentBannerIndex = index;
                });
              },
              itemBuilder: (context, index) {
                final slider = sliderItems[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: const Color(0xFF16423C),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Stack(
                      children: [
                        // Background Image
                        Image.network(
                          slider.photo,
                          width: double.infinity,
                          height: double.infinity,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              color: const Color(0xFF16423C),
                              child: const Center(
                                child: Icon(Icons.error, color: Colors.white, size: 50),
                              ),
                            );
                          },
                        ),

                        // Gradient Overlay
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.bottomCenter,
                              end: Alignment.topCenter,
                              colors: [
                                Colors.black.withOpacity(0.7),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        ),

                        // Text Content
                        Align(
                          alignment: Alignment.bottomLeft,
                          child: Container(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  slider.title,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  slider.details,
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 10),
          // Indicator Dots
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(sliderItems.length, (index) {
              return Container(
                width: 8.0,
                height: 8.0,
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: _currentBannerIndex == index
                      ? const Color(0xFF16423C)
                      : Colors.grey.shade300,
                ),
              );
            }),
          ),
        ],
      );
    });
  }

  // // 🆕 NEW ARRIVALS SECTION - Uses product controller

  // Widget _buildNewArrivalsSection() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text("New Arrivals",
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.bold, fontSize: 18)),
  //             const Text("View All",
  //                 style: TextStyle(
  //                     color: Colors.teal, fontWeight: FontWeight.w500)),
  //           ],
  //         ),
  //         const SizedBox(height: 10),
  //
  //         Obx(
  //               () => _productcontroller.isproductloading.value
  //               ? const Center(
  //             child: CircularProgressIndicator(),
  //           )
  //               : SizedBox(
  //             height: 260,
  //             child: ListView.builder(
  //               scrollDirection: Axis.horizontal,
  //               itemCount: _productcontroller.productresponse.value.data.length,
  //               itemBuilder: (context, index) {
  //                 final repo = _productcontroller.productresponse.value.data[index];
  //                 return GestureDetector(
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => ProductDetailsScreen(productId: repo.id),
  //                       ),
  //                     );
  //                   },
  //                   child: Container(
  //                     width: 160,
  //                     margin: const EdgeInsets.only(right: 16),
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(12),
  //                       boxShadow: [
  //                         BoxShadow(
  //                             color: Colors.black.withOpacity(0.05),
  //                             blurRadius: 4,
  //                             offset: const Offset(0, 2))
  //                       ],
  //                     ),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         ClipRRect(
  //                           borderRadius:
  //                           const BorderRadius.vertical(top: Radius.circular(12)),
  //                           child: Image.network(
  //                             repo.photo,
  //                             height: 140,
  //                             width: double.infinity,
  //                             fit: BoxFit.cover,
  //                             errorBuilder: (context, error, stackTrace) {
  //                               return Container(
  //                                 height: 140,
  //                                 color: Colors.grey[200],
  //                                 child: const Icon(Icons.error),
  //                               );
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 repo.name,
  //                                 style: const TextStyle(
  //                                     fontWeight: FontWeight.w600, fontSize: 12),
  //                                 maxLines: 2,
  //                                 overflow: TextOverflow.ellipsis,
  //                               ),
  //                               const SizedBox(height: 4),
  //                               Row(
  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Text(
  //                                     "\$${repo.previousPrice?.toStringAsFixed(2) ?? repo.discountPrice.toStringAsFixed(2)}",
  //                                     style: const TextStyle(color: Colors.grey, fontSize: 10),
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       const Icon(Icons.star,
  //                                           color: Colors.amber, size: 14),
  //                                       Text(
  //                                         repo.brandId?.toString() ?? "5.0",
  //                                         style: const TextStyle(fontSize: 10),
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                               const SizedBox(height: 6),
  //                               Container(
  //                                 alignment: Alignment.center,
  //                                 width: double.infinity,
  //                                 padding: const EdgeInsets.symmetric(vertical: 6),
  //                                 decoration: BoxDecoration(
  //                                   color: const Color(0xFF16423C),
  //                                   borderRadius: BorderRadius.circular(8),
  //                                 ),
  //                                 child: Text(
  //                                   "\$${repo.discountPrice.toStringAsFixed(2)}",
  //                                   style: const TextStyle(
  //                                       color: Colors.white,
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 12),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // 🆕 NEW ARRIVALS SECTION - Shows only 4 products, "View All" opens new screen
  Widget _buildNewArrivalsSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "New Arrivals",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              InkWell(
                onTap: () {
                 // ✅ NAVIGATE TO ALL PRODUCTS SCREEN
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AllProductsScreen()),
                  );
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Obx(
                () => _productcontroller.isproductloading.value
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // ✅ Show only first 4 products
                itemCount: _productcontroller.productresponse.value.data.length < 4
                    ? _productcontroller.productresponse.value.data.length
                    : 4,
                itemBuilder: (context, index) {
                  final repo = _productcontroller.productresponse.value.data[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(productId: repo.id),
                        ),
                      );
                    },
                    child: Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 16),
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
                              repo.photo,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 140,
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
                                  repo.name,
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
                                      "\$${repo.previousPrice?.toStringAsFixed(2) ?? repo.discountPrice.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 14),
                                        Text(
                                          repo.brandId?.toString() ?? "5.0",
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
                                    "\$${repo.discountPrice.toStringAsFixed(2)}",
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
          ),
        ],
      ),
    );
  }

  // 🆕 NEW ARRIVALS SECTION - Uses product controller
  // Widget _buildNewArrivalsSection() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             const Text("New Arrivals",
  //                 style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
  //             InkWell(
  //               onTap: () {
  //                 // Navigate to All Products Screen - SAME PATTERN as categories
  //                 // Navigator.push(
  //                 //     context,
  //                 //     MaterialPageRoute(builder: (context) => const ProductListScreen())
  //                 // );
  //               },
  //               child: const Text("View All",
  //                   style: TextStyle(
  //                       color: Colors.teal, fontWeight: FontWeight.w500)),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 10),
  //
  //         Obx(
  //               () => _productcontroller.isproductloading.value
  //               ? const Center(
  //             child: CircularProgressIndicator(),
  //           )
  //               : SizedBox(
  //             height: 260,
  //             child: ListView.builder(
  //               scrollDirection: Axis.horizontal,
  //               itemCount: _productcontroller.productresponse.value.data.length,
  //               itemBuilder: (context, index) {
  //                 final repo = _productcontroller.productresponse.value.data[index];
  //                 return GestureDetector(
  //                   onTap: () {
  //                     Get.to(() => ProductDetailsScreen(productId: repo.id));
  //                   },
  //                   child: Container(
  //                     width: 160,
  //                     margin: const EdgeInsets.only(right: 16),
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(12),
  //                       boxShadow: [
  //                         BoxShadow(
  //                             color: Colors.black.withOpacity(0.05),
  //                             blurRadius: 4,
  //                             offset: const Offset(0, 2))
  //                       ],
  //                     ),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         ClipRRect(
  //                           borderRadius:
  //                           const BorderRadius.vertical(top: Radius.circular(12)),
  //                           child: Image.network(
  //                             repo.photo,
  //                             height: 140,
  //                             width: double.infinity,
  //                             fit: BoxFit.cover,
  //                             errorBuilder: (context, error, stackTrace) {
  //                               return Container(
  //                                 height: 140,
  //                                 color: Colors.grey[200],
  //                                 child: const Icon(Icons.error),
  //                               );
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 repo.name,
  //                                 style: const TextStyle(
  //                                     fontWeight: FontWeight.w600, fontSize: 12),
  //                                 maxLines: 2,
  //                                 overflow: TextOverflow.ellipsis,
  //                               ),
  //                               const SizedBox(height: 4),
  //                               Row(
  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Text(
  //                                     "\$${repo.previousPrice?.toStringAsFixed(2) ?? repo.discountPrice.toStringAsFixed(2)}",
  //                                     style: const TextStyle(color: Colors.grey, fontSize: 10),
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       const Icon(Icons.star,
  //                                           color: Colors.amber, size: 14),
  //                                       Text(
  //                                         repo.brandId?.toString() ?? "5.0",
  //                                         style: const TextStyle(fontSize: 10),
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                               const SizedBox(height: 6),
  //                               Container(
  //                                 alignment: Alignment.center,
  //                                 width: double.infinity,
  //                                 padding: const EdgeInsets.symmetric(vertical: 6),
  //                                 decoration: BoxDecoration(
  //                                   color: const Color(0xFF16423C),
  //                                   borderRadius: BorderRadius.circular(8),
  //                                 ),
  //                                 child: Text(
  //                                   "\$${repo.discountPrice.toStringAsFixed(2)}",
  //                                   style: const TextStyle(
  //                                       color: Colors.white,
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 12),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }
  // 🆕 NEW ARRIVALS SECTION - Uses product controller
  // Widget _buildNewArrivalsSection() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text("New Arrivals",
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.bold, fontSize: 18)),
  //             InkWell(
  //               onTap: () {
  //                 // Navigate to Product List Screen
  //                 Get.to(() => const ProductListScreen());
  //               },
  //               child: Text("View All",
  //                   style: TextStyle(
  //                       color: Colors.teal, fontWeight: FontWeight.w500)),
  //             ),
  //           ],
  //         ),
  //         const SizedBox(height: 10),
  //
  //         Obx(
  //               () => _productcontroller.isproductloading.value
  //               ? const Center(
  //             child: CircularProgressIndicator(),
  //           )
  //               : SizedBox(
  //             height: 260,
  //             child: ListView.builder(
  //               scrollDirection: Axis.horizontal,
  //               itemCount: _productcontroller.productresponse.value.data.length,
  //               itemBuilder: (context, index) {
  //                 final repo = _productcontroller.productresponse.value.data[index];
  //                 return GestureDetector(
  //                   onTap: () {
  //                     Get.to(() => ProductDetailsScreen(productId: repo.id));
  //                   },
  //                   child: Container(
  //                     width: 160,
  //                     margin: const EdgeInsets.only(right: 16),
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(12),
  //                       boxShadow: [
  //                         BoxShadow(
  //                             color: Colors.black.withOpacity(0.05),
  //                             blurRadius: 4,
  //                             offset: const Offset(0, 2))
  //                       ],
  //                     ),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         ClipRRect(
  //                           borderRadius:
  //                           const BorderRadius.vertical(top: Radius.circular(12)),
  //                           child: Image.network(
  //                             repo.photo,
  //                             height: 140,
  //                             width: double.infinity,
  //                             fit: BoxFit.cover,
  //                             errorBuilder: (context, error, stackTrace) {
  //                               return Container(
  //                                 height: 140,
  //                                 color: Colors.grey[200],
  //                                 child: const Icon(Icons.error),
  //                               );
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 repo.name,
  //                                 style: const TextStyle(
  //                                     fontWeight: FontWeight.w600, fontSize: 12),
  //                                 maxLines: 2,
  //                                 overflow: TextOverflow.ellipsis,
  //                               ),
  //                               const SizedBox(height: 4),
  //                               Row(
  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Text(
  //                                     "\$${repo.previousPrice?.toStringAsFixed(2) ?? repo.discountPrice.toStringAsFixed(2)}",
  //                                     style: const TextStyle(color: Colors.grey, fontSize: 10),
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       const Icon(Icons.star,
  //                                           color: Colors.amber, size: 14),
  //                                       Text(
  //                                         repo.brandId?.toString() ?? "5.0",
  //                                         style: const TextStyle(fontSize: 10),
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                               const SizedBox(height: 6),
  //                               Container(
  //                                 alignment: Alignment.center,
  //                                 width: double.infinity,
  //                                 padding: const EdgeInsets.symmetric(vertical: 6),
  //                                 decoration: BoxDecoration(
  //                                   color: const Color(0xFF16423C),
  //                                   borderRadius: BorderRadius.circular(8),
  //                                 ),
  //                                 child: Text(
  //                                   "\$${repo.discountPrice.toStringAsFixed(2)}",
  //                                   style: const TextStyle(
  //                                       color: Colors.white,
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 12),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  // 💖 CUSTOMER FAVOURITES SECTION - Uses feature controller
  // Widget _buildCustomerFavouritesSection() {
  //   return Padding(
  //     padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //           children: [
  //             Text("Customer Favourites",
  //                 style: const TextStyle(
  //                     fontWeight: FontWeight.bold, fontSize: 18)),
  //             const Text("View All",
  //                 style: TextStyle(
  //                     color: Colors.teal, fontWeight: FontWeight.w500)),
  //           ],
  //         ),
  //         const SizedBox(height: 10),
  //
  //         Obx(
  //               () => _featurecontroller.isfeatureloading.value
  //               ? const Center(
  //             child: CircularProgressIndicator(),
  //           )
  //               : _featurecontroller.featureList.isEmpty
  //               ? const Center(
  //             child: Text("No favourites available"),
  //           )
  //               : SizedBox(
  //             height: 260,
  //             child: ListView.builder(
  //               scrollDirection: Axis.horizontal,
  //               itemCount: _featurecontroller.featureList.length,
  //               itemBuilder: (context, index) {
  //                 final repos = _featurecontroller.featureList[index];
  //                 return GestureDetector(
  //                   onTap: () {
  //                     Navigator.push(
  //                       context,
  //                       MaterialPageRoute(
  //                         builder: (context) => ProductDetailsScreen(productId: repos.id),
  //                       ),
  //                     );
  //                   },
  //                   child: Container(
  //                     width: 160,
  //                     margin: const EdgeInsets.only(right: 16),
  //                     decoration: BoxDecoration(
  //                       color: Colors.white,
  //                       borderRadius: BorderRadius.circular(12),
  //                       boxShadow: [
  //                         BoxShadow(
  //                             color: Colors.black.withOpacity(0.05),
  //                             blurRadius: 4,
  //                             offset: const Offset(0, 2))
  //                       ],
  //                     ),
  //                     child: Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         ClipRRect(
  //                           borderRadius:
  //                           const BorderRadius.vertical(top: Radius.circular(12)),
  //                           child: Image.network(
  //                             repos.photo,
  //                             height: 140,
  //                             width: double.infinity,
  //                             fit: BoxFit.cover,
  //                             errorBuilder: (context, error, stackTrace) {
  //                               return Container(
  //                                 height: 140,
  //                                 color: Colors.grey[200],
  //                                 child: const Icon(Icons.error),
  //                               );
  //                             },
  //                           ),
  //                         ),
  //                         Padding(
  //                           padding: const EdgeInsets.all(8.0),
  //                           child: Column(
  //                             crossAxisAlignment: CrossAxisAlignment.start,
  //                             children: [
  //                               Text(
  //                                 repos.name,
  //                                 style: const TextStyle(
  //                                     fontWeight: FontWeight.w600, fontSize: 12),
  //                                 maxLines: 2,
  //                                 overflow: TextOverflow.ellipsis,
  //                               ),
  //                               const SizedBox(height: 4),
  //                               Row(
  //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                                 children: [
  //                                   Text(
  //                                     "\$${repos.previousPrice?.toStringAsFixed(2) ?? repos.discountPrice.toStringAsFixed(2)}",
  //                                     style: const TextStyle(color: Colors.grey, fontSize: 10),
  //                                   ),
  //                                   Row(
  //                                     children: [
  //                                       const Icon(Icons.star,
  //                                           color: Colors.amber, size: 14),
  //                                       Text(
  //                                         repos.brandId?.toString() ?? "5.0",
  //                                         style: const TextStyle(fontSize: 10),
  //                                       )
  //                                     ],
  //                                   ),
  //                                 ],
  //                               ),
  //                               const SizedBox(height: 6),
  //                               Container(
  //                                 alignment: Alignment.center,
  //                                 width: double.infinity,
  //                                 padding: const EdgeInsets.symmetric(vertical: 6),
  //                                 decoration: BoxDecoration(
  //                                   color: const Color(0xFF16423C),
  //                                   borderRadius: BorderRadius.circular(8),
  //                                 ),
  //                                 child: Text(
  //                                   "\$${repos.discountPrice.toStringAsFixed(2)}",
  //                                   style: const TextStyle(
  //                                       color: Colors.white,
  //                                       fontWeight: FontWeight.bold,
  //                                       fontSize: 12),
  //                                 ),
  //                               ),
  //                             ],
  //                           ),
  //                         ),
  //                       ],
  //                     ),
  //                   ),
  //                 );
  //               },
  //             ),
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

// 💖 CUSTOMER FAVOURITES SECTION - Shows only 4 features, "View All" opens new screen
  Widget _buildCustomerFavouritesSection() {
    return Padding(
      padding: const EdgeInsets.only(top: 10, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                "Customer Favourites",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              InkWell(
                onTap: () {
                  // ✅ NAVIGATE TO ALL FEATURES SCREEN
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const AllFeaturesScreen()),
                  );
                },
                child: const Text(
                  "View All",
                  style: TextStyle(
                    color: Colors.teal,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),

          Obx(
                () => _featurecontroller.isfeatureloading.value
                ? const Center(child: CircularProgressIndicator())
                : _featurecontroller.featureList.isEmpty
                ? const Center(child: Text("No favourites available"))
                : SizedBox(
              height: 260,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                // ✅ Show only first 4 features
                itemCount: _featurecontroller.featureList.length < 4
                    ? _featurecontroller.featureList.length
                    : 4,
                itemBuilder: (context, index) {
                  final repos = _featurecontroller.featureList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailsScreen(productId: repos.id),
                        ),
                      );
                    },
                    child: Container(
                      width: 160,
                      margin: const EdgeInsets.only(right: 16),
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
                              repos.photo,
                              height: 140,
                              width: double.infinity,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  height: 140,
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
                                  repos.name,
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
                                      "\$${repos.previousPrice?.toStringAsFixed(2) ?? repos.discountPrice.toStringAsFixed(2)}",
                                      style: const TextStyle(
                                        color: Colors.grey,
                                        fontSize: 10,
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 14),
                                        Text(
                                          repos.brandId?.toString() ?? "5.0",
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
                                    "\$${repos.discountPrice.toStringAsFixed(2)}",
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
          ),
        ],
      ),
    );
  }
}