//banners api services
// // import 'package:dio/dio.dart';
// // import 'package:ecommerce/Baseurl/baseurl.dart';
// // import 'package:ecommerce/screens/dashboard/banners_model.dart';
// //
// // class apiservice{
// //   Dio dio = Dio();
// //
// //   Future<banner>bannerdata(String token)async{
// //     print("${token}");
// //
// //
// // String baseurl = BaseUrl().baseurl;
// //     final value_user = await dio.post("${baseurl}home/banners",
// //         options: Options(
// //             headers: {
// //               'Authorization': 'Bearer $token',
// //               'Accept': 'application/json',
// //               'Content-Type': 'application/json',
// //             }
// //         )
// //     );
// //     print("${value_user.data}");
// //
// //
// //
// //     if(value_user.statusCode ==200){
// //
// //       final result_user = banner.fromJson(value_user.data);
// //       print("$result_user");
// //       return result_user;
// //     }
// //     else{
// //       throw "Something went wrong";
// //     }
// //   }
// //
// // }
// import 'package:dio/dio.dart';
// import 'package:ecommerce/Baseurl/baseurl.dart';
// import 'package:ecommerce/screens/dashboard/banners_model.dart';
//
// class ApiService {
//   Dio dio = Dio();
//
//   Future<BannerResponse> bannerdata(String token) async {
//     print("${token}");
//
//     String baseurl = BaseUrl().baseurl;
//     final value_user = await dio.post("${baseurl}home/banners",
//         options: Options(
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Accept': 'application/json',
//               'Content-Type': 'application/json',
//             }
//         )
//     );
//     print("${value_user.data}");
//
//     if(value_user.statusCode == 200){
//       final result_user = BannerResponse.fromJson(value_user.data);
//       print("$result_user");
//       return result_user;
//     }
//     else{
//       throw "Something went wrong";
//     }
//   }
// }

//banners controller
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

//banners screen
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

//product detail apiservices


// import 'package:dio/dio.dart';
// import 'package:ecommerce/Baseurl/baseurl.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_model.dart';
//
// class api{
//
//   Dio dio = Dio();
//
//
//   Future<ProductDetailsResponse> productdetail(String token) async {
//     String baseurl = BaseUrl().baseurl;
//
//     final response = await dio.get("${baseurl}products/586",
//         options: Options(
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Accept': 'application/json',
//               'Content-Type': 'application/json',
//             }
//         )
//     );
//
//     print("📡 API Response received:");
//     print("Status Code: ${response.statusCode}");
//     print("Response Data: ${response.data}");
//
//     if (response.statusCode == 200) {
//       final result = ProductDetailsResponse.fromJson(response.data);
//       return result;
//     }
//     else {
//       throw "Something went wrong";
//     }
//   }
// }



//product detail controller

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


// product_details_screen.dart

// // import 'package:flutter/material.dart';
// //
// // class ProductDetailsScreen extends StatelessWidget {
// //   const ProductDetailsScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     Color themeColor = Color(0xFF16423C);
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
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Product Image Section
// //             Stack(
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(22.0),
// //                   child: Container(
// //                     height: 400,
// //                     width: double.infinity,
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: const BorderRadius.only(
// //                         bottomLeft: Radius.circular(30),
// //                         bottomRight: Radius.circular(30),
// //                       ),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.black.withOpacity(0.1),
// //                           blurRadius: 10,
// //                           offset: const Offset(0, 4),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Image.network(
// //                       'https://i.imgur.com/8Km9tLL.png',
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //                 // Favorite Button
// //                 Positioned(
// //                   top: 50,
// //                   right: 35,
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       color: Color(0xFF16423C),
// //                       borderRadius: BorderRadius.circular(25),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.black.withOpacity(0.1),
// //                           blurRadius: 5,
// //                         ),
// //                       ],
// //                     ),
// //                     child: IconButton(
// //                       icon: const Icon(Icons.favorite_border,color: Colors.white,),
// //                       onPressed: () {},
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //
// //             // Product Details Section
// //             Padding(
// //               padding: const EdgeInsets.all(20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // Product Title and Rating
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Expanded(
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               "Modern Light Clothes",
// //                               style: TextStyle(
// //                                 fontSize: 24,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: const Color(0xFF16423C),
// //                               ),
// //                             ),
// //                             const SizedBox(height: 4),
// //                             Row(
// //                               children: [
// //                                 Text(
// //                                   "T-shirt",
// //                                   style: TextStyle(
// //                                     fontSize: 16,
// //                                     color: Colors.grey[600],
// //                                   ),
// //                                 ),
// //                                 Padding(
// //                                   padding: const EdgeInsets.symmetric(horizontal: 14.0),
// //                                   child: Row(
// //                                     children: [
// //                                       const Icon(
// //                                         Icons.star,
// //                                         color: Colors.amber,
// //                                         size: 20,
// //                                       ),
// //                                       const SizedBox(width: 4),
// //                                       Text(
// //                                         "5.0",
// //                                         style: TextStyle(
// //                                           fontSize: 16,
// //                                           fontWeight: FontWeight.bold,
// //                                           color: const Color(0xFF16423C),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       // Quantity and Price
// //                       Container(
// //                         padding: const EdgeInsets.all(16),
// //                         decoration: BoxDecoration(
// //                           color: Color(0xFFF5EEDC),
// //                         ),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             // Quantity Selector
// //                            Row(
// //                                 children: [
// //                                   Container(
// //                                     decoration: BoxDecoration(
// //                                       border: Border.all(color: themeColor),
// //                                       borderRadius: BorderRadius.circular(25),
// //                                     ),
// //                                     child: IconButton(
// //                                       icon: Icon(Icons.remove,
// //                                           color: themeColor),
// //                                       onPressed: () {},
// //                                     ),
// //                                   ),
// //                                    Padding(
// //                                      padding: const EdgeInsets.all(14.0),
// //                                      child: Container(
// //                                        child: Text(
// //                                         "1",
// //                                         style: TextStyle(
// //                                           color: themeColor,
// //                                           fontWeight: FontWeight.bold,
// //                                           fontSize: 28,
// //                                         ),
// //                                        ),
// //                                      ),
// //                                    ),
// //                                   Container(
// //                                     decoration: BoxDecoration(
// //                                       border: Border.all(color: themeColor),
// //                                       borderRadius: BorderRadius.circular(25),
// //                                     ),
// //                                     child: IconButton(
// //                                       icon: Icon(Icons.add,
// //                                           color: themeColor),
// //                                       onPressed: () {},
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   const SizedBox(height: 20),
// //
// //                   // Description
// //                   Text(
// //                     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       color: Colors.grey[700],
// //                       height: 1.5,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   GestureDetector(
// //                     onTap: () {
// //                       // Handle read more action
// //                     },
// //                     child: Text(
// //                       "Read More...",
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.bold,
// //                         color: const Color(0xFF16423C),
// //                       ),
// //                     ),
// //                   ),
// //
// //                   const SizedBox(height: 30),
// //
// //                   // Size and Color Section
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       // Size
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             "Size",
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.bold,
// //                               color: const Color(0xFF16423C),
// //                             ),
// //                           ),
// //                           const SizedBox(height: 8),
// //                           Row(
// //                             children: [
// //                               _buildSizeOption("M", true),
// //                               const SizedBox(width: 8),
// //                               _buildSizeOption("L", false),
// //                               const SizedBox(width: 8),
// //                               _buildSizeOption("XL", false),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //
// //                       // Color
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             "Color",
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.bold,
// //                               color: const Color(0xFF16423C),
// //                             ),
// //                           ),
// //                           const SizedBox(height: 8),
// //                           Row(
// //                             children: [
// //                               _buildColorOption(Colors.blue, true),
// //                               const SizedBox(width: 8),
// //                               _buildColorOption(Colors.red, false),
// //                               const SizedBox(width: 8),
// //                               _buildColorOption(Colors.green, false),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //
// //                   const SizedBox(height: 30),
// //
// //
// //                   const SizedBox(height: 20),
// //
// //                   // Add to Cart Button
// //                   Container(
// //                     width: double.infinity,
// //                     height: 60,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFF16423C),
// //                       borderRadius: BorderRadius.circular(15),
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         const Icon(
// //                           Icons.shopping_bag_outlined,
// //                           color: Color(0xFFF5EEDC),
// //                         ),
// //                         const SizedBox(width: 10),
// //                         Text(
// //                           "Add To Cart | \$40.00",
// //                           style: TextStyle(
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.bold,
// //                             color: Color(0xFFF5EEDC),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Size Option Widget
// //   Widget _buildSizeOption(String size, bool isSelected) {
// //     return Container(
// //       width: 40,
// //       height: 40,
// //       decoration: BoxDecoration(
// //         color: isSelected ? const Color(0xFF16423C) : Colors.transparent,
// //         border: Border.all(
// //           color: const Color(0xFF16423C),
// //           width: 2,
// //         ),
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       child: Center(
// //         child: Text(
// //           size,
// //           style: TextStyle(
// //             color: isSelected ? Colors.white : const Color(0xFF16423C),
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Color Option Widget
// //   Widget _buildColorOption(Color color, bool isSelected) {
// //     return Container(
// //       width: 30,
// //       height: 30,
// //       decoration: BoxDecoration(
// //         color: color,
// //         shape: BoxShape.circle,
// //         border: isSelected
// //             ? Border.all(
// //           color: const Color(0xFF16423C),
// //           width: 3,
// //         )
// //             : null,
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:ecommerce/screens/cart_screen/cartscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   const ProductDetailsScreen({super.key});
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   // Theme & product base price
//   final Color themeColor = const Color(0xFF16423C);
//   final double basePrice = 40.0;
//
//   // Dynamic state
//   int quantity = 1;
//   String selectedSize = 'M';
//   Color selectedColor = Colors.blue;
//
//   // Available options
//   final List<String> sizes = ['S', 'M', 'L', 'XL'];
//   final List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.black];
//
//   double get totalPrice => basePrice * quantity;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EEDC),
//       appBar: AppBar(
//         backgroundColor: themeColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image Section
//             Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(22.0),
//                   child: Container(
//                     height: 400,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(30),
//                         bottomRight: Radius.circular(30),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 10,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Image.asset("assets/images/img_6.png")
//                   ),
//                 ),
//                 // Favorite Button
//                 Positioned(
//                   top: 50,
//                   right: 35,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: themeColor,
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     child: IconButton(
//                       icon: const Icon(Icons.favorite_border, color: Colors.white),
//                       onPressed: () {
//                         // TODO: toggle favorite
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             // Product Details Section
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title & Rating & Qty/Price
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Left: Title & meta
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Modern Light Clothes",
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: themeColor,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 Text(
//                                   "T-shirt",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                                 const SizedBox(width: 14),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.star, color: Colors.amber, size: 20),
//                                     const SizedBox(width: 4),
//                                     Text(
//                                       "5.0",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: themeColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Right: Quantity Selector
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFF5EEDC),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // Minus
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: themeColor),
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                 icon: Icon(Icons.remove, color: themeColor),
//                                 onPressed: quantity > 1
//                                     ? () => setState(() => quantity--)
//                                     : null,
//                               ),
//                             ),
//
//                             // Quantity number
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                               child: Text(
//                                 quantity.toString(),
//                                 style: TextStyle(
//                                   color: themeColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 22,
//                                 ),
//                               ),
//                             ),
//
//                             // Plus
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: themeColor),
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                 icon: Icon(Icons.add, color: themeColor),
//                                 onPressed: () => setState(() => quantity++),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // Description
//                   Text(
//                     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                       height: 1.5,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   GestureDetector(
//                     onTap: () {
//                       // Expand description if needed
//                     },
//                     child: Text(
//                       "Read More...",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: themeColor,
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   // Size and Color Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Size
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Size",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: themeColor,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: sizes
//                                 .map((s) => Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => selectedSize = s),
//                                 child: _buildSizeOption(s, selectedSize == s),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       ),
//
//                       // Color
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Color",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: themeColor,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: colors
//                                 .map((c) => Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => selectedColor = c),
//                                 child: _buildColorOption(c, selectedColor == c),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   // Price summary and Add to Cart
//                   // Row(
//                   //   children: [
//                   //     // Price block
//                   //     Expanded(
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         children: [
//                   //           const Text(
//                   //             "Total",
//                   //             style: TextStyle(fontSize: 14, color: Colors.grey),
//                   //           ),
//                   //
//                   //           Text(
//                   //             '\$${totalPrice.toStringAsFixed(2)}',
//                   //             style: TextStyle(
//                   //               fontSize: 22,
//                   //               fontWeight: FontWeight.bold,
//                   //               color: themeColor,
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //
//                   //     const SizedBox(width: 12),
//                   //
//                   //     // Add to cart button
//                   //     Expanded(
//                   //       child: GestureDetector(
//                   //         onTap: () {
//                   //           // TODO: add to cart with selected options
//                   //           final snack = SnackBar(
//                   //             content: Text(
//                   //               'Added ${quantity}× Modern Light Clothes ($selectedSize, ${_colorName(selectedColor)}) to cart',
//                   //             ),
//                   //           );
//                   //           ScaffoldMessenger.of(context).showSnackBar(snack);
//                   //         },
//                   //         child: GestureDetector(onTap: (){
//                   //           Navigator.push(context, MaterialPageRoute(builder: (context)=>cartscreen()));
//                   //         },
//                   //           child: Container(
//                   //             height: 60,
//                   //             decoration: BoxDecoration(
//                   //               color: themeColor,
//                   //               borderRadius: BorderRadius.circular(12),
//                   //             ),
//                   //             child: Row(
//                   //               mainAxisAlignment: MainAxisAlignment.center,
//                   //               children: [
//                   //                 const Icon(Icons.shopping_bag_outlined, color: Color(0xFFF5EEDC)),
//                   //                 const SizedBox(width: 10),
//                   //                 Text(
//                   //                   "Add To Cart",
//                   //                   style: TextStyle(
//                   //                     fontSize: 18,
//                   //                     fontWeight: FontWeight.bold,
//                   //                     color: const Color(0xFFF5EEDC),
//                   //                   ),
//                   //                 ),
//                   //               ],
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   Center(
//                     child: GestureDetector(onTap: (){
//                       Get.to(cartscreen());
//                     },
//                       child: Container(
//                         height: 60,
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(horizontal: 20),
//                         decoration: BoxDecoration(
//                           color: themeColor,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Total price text
//
//
//                             // Cart icon
//                             const Icon(Icons.shopping_bag_outlined, color: Color(0xFFF5EEDC)),
//                             const Text(
//                               "Add To Cart",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFFF5EEDC),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//
//                             // Add to cart text
//
//                             Text(
//                               "|\$${totalPrice.toStringAsFixed(2)}   ",
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFFF5EEDC),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Size Option Widget
//   // Widget _buildSizeOption(String size, bool isSelected) {
//   //   return Container(
//   //     width: 44,
//   //     height: 44,
//   //     decoration: BoxDecoration(
//   //       color: isSelected ? themeColor : Colors.transparent,
//   //       border: Border.all(
//   //         color: themeColor,
//   //         width: 2,
//   //       ),
//   //       borderRadius: BorderRadius.circular(8),
//   //     ),
//   //     child: Center(
//   //       child: Text(
//   //         size,
//   //         style: TextStyle(
//   //           color: isSelected ? Colors.white : themeColor,
//   //           fontWeight: FontWeight.bold,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   Widget _buildSizeOption(String size, bool isSelected) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: 44,
//       height: 44,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isSelected ? themeColor : Colors.transparent,
//         border: Border.all(
//           color: themeColor,
//           width: 2,
//         ),
//         boxShadow: isSelected
//             ? [
//           BoxShadow(
//             color: themeColor.withOpacity(0.3),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ]
//             : [],
//       ),
//       child: Center(
//         child: Text(
//           size,
//           style: TextStyle(
//             color: isSelected ? Colors.white : themeColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   // Color Option Widget
//   // Widget _buildColorOption(Color color, bool isSelected) {
//   //   return Container(
//   //     width: 34,
//   //     height: 34,
//   //     decoration: BoxDecoration(
//   //       color: color,
//   //       shape: BoxShape.circle,
//   //       border: isSelected
//   //           ? Border.all(
//   //         color: themeColor,
//   //         width: 3,
//   //       )
//   //           : null,
//   //     ),
//   //   );
//   // }
//
//   Widget _buildColorOption(Color color, bool isSelected) {
//     return Container(
//       width: 34,
//       height: 34,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: isSelected ? themeColor : Colors.transparent,
//           width: 3,
//         ),
//       ),
//       child: isSelected
//           ? const Icon(
//         Icons.check,
//         color: Colors.white,
//         size: 20,
//       )
//           : null,
//     );
//   }
//
//
//   // Helper to display a friendly color name in SnackBar message (optional)
//   String _colorName(Color c) {
//     if (c == Colors.blue) return "Blue";
//     if (c == Colors.red) return "Red";
//     if (c == Colors.green) return "Green";
//     if (c == Colors.black) return "Black";
//     return "Color";
//   }
// }

//
// import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
// import 'package:ecommerce/screens/cart_screen/cart_model.dart';
// import 'package:ecommerce/screens/cart_screen/cartscreen.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   final int productId;
//
//  ProductDetailsScreen({super.key, required this.productId});
//
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   // Theme & product base price
//   final Color themeColor = const Color(0xFF16423C);
//   final double basePrice = 40.0;
//
//
//   // Dynamic state
//   int quantity = 1;
//   String selectedSize = 'M';
//   Color selectedColor = Colors.blue;
//
//   // Available options
//   final List<String> sizes = ['S', 'M', 'L', 'XL'];
//   final List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.black];
//
//   // Get the cart controller
//   final CartController cartController = Get.put(CartController());
//   final ProductDetailsController productDataController = Get.put(ProductDetailsController());
//
//   double get totalPrice => basePrice * quantity;
// @override
//   void initState() {
//   productDataController.fetchProductDetails(widget.productId);
//   }
//   @override
//   void dispose() {
//     // Clear product details when leaving screen
//     productDataController.clearProductDetails();
//     super.dispose();
//   }
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EEDC),
//       appBar: AppBar(
//         backgroundColor: themeColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image Section
//             Stack(
//               children: [
//                 Padding(
//                   //padding: const EdgeInsets.all(22.0),
//                   padding: EdgeInsets.all(screenWidth * 0.055),
//                   child: Container(
//                       //height: 400,
//                       height: screenHeight * 0.4,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(30),
//                           bottomRight: Radius.circular(30),
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 10,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Image.asset("assets/images/img_6.png")
//                   ),
//                 ),
//                 // Favorite Button
//                 Positioned(
//                   //top: 50,
//                   top: screenHeight * 0.06,
//                   //right: 35,
//                   right: screenWidth * 0.08,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: themeColor,
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     child: IconButton(
//                       icon: const Icon(Icons.favorite_border, color: Colors.white),
//                       onPressed: () {
//                         // TODO: toggle favorite
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             // Product Details Section
//             Padding(
//               //padding: const EdgeInsets.all(20),
//               padding: EdgeInsets.all(screenWidth * 0.05),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title & Rating & Qty/Price
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Left: Title & meta
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Modern Light Clothes",
//                               style: TextStyle(
//                                 //fontSize: 24,
//                                 fontSize: screenWidth * 0.065,
//                                 fontWeight: FontWeight.bold,
//                                 color: themeColor,
//                               ),
//                             ),
//                             //const SizedBox(height: 4),
//                             SizedBox(height: screenHeight * 0.005),
//                             Row(
//                               children: [
//                                 Text(
//                                   "T-shirt",
//                                   style: TextStyle(
//                                     //fontSize: 16,
//                                     fontSize: screenWidth * 0.04,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                                 //const SizedBox(width: 14),
//                                 SizedBox(width: screenWidth * 0.035),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.star, color: Colors.amber, size: 20),
//                                     //const SizedBox(width: 4),
//                                     SizedBox(width: screenWidth * 0.01),
//                                     Text(
//                                       "5.0",
//                                       style: TextStyle(
//                                         //fontSize: 16,
//                                         fontSize: screenWidth * 0.04,
//                                         fontWeight: FontWeight.bold,
//                                         color: themeColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Right: Quantity Selector
//                       Container(
//                         //padding: const EdgeInsets.all(8),
//                         padding: EdgeInsets.all(screenWidth * 0.02),
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFF5EEDC),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // Minus
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: themeColor),
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: BoxConstraints(
//                                     //minWidth: 36,
//                                     minWidth: screenWidth * 0.085,
//                                     //minHeight: 36),
//                                     minHeight: screenWidth * 0.085),
//                                 icon: Icon(Icons.remove, color: themeColor),
//                                 onPressed: quantity > 1
//                                     ? () => setState(() => quantity--)
//                                     : null,
//                               ),
//                             ),
//
//                             // Quantity number
//                             Padding(
//                               //padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
//                               child: Text(
//                                 quantity.toString(),
//                                 style: TextStyle(
//                                   color: themeColor,
//                                   fontWeight: FontWeight.bold,
//                                   //fontSize: 22,
//                                   fontSize: screenWidth * 0.055,
//                                 ),
//                               ),
//                             ),
//         SizedBox(width: 10,),
//                             // Plus
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: themeColor),
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: BoxConstraints(
//                                     //minWidth: 36,
//                                     minWidth: screenWidth * 0.085,
//                                     //minHeight: 36),
//                                     minHeight: screenWidth * 0.085),
//                                 icon: Icon(Icons.add, color: themeColor),
//                                 onPressed: () => setState(() => quantity++),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   //const SizedBox(height: 20),
//                   SizedBox(height: screenHeight * 0.02),
//
//                   // Description
//                   Text(
//                     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
//                     style: TextStyle(
//                       //fontSize: 14,
//                       fontSize: screenWidth * 0.035,
//                       color: Colors.grey[700],
//                       height: 1.5,
//                     ),
//                   ),
//                   //const SizedBox(height: 8),
//                   SizedBox(height: screenHeight * 0.008),
//                   GestureDetector(
//                     onTap: () {
//                       // Expand description if needed
//                     },
//                     child: Text(
//                       "Read More...",
//                       style: TextStyle(
//                         //fontSize: 14,
//                         fontSize: screenWidth * 0.035,
//                         fontWeight: FontWeight.bold,
//                         color: themeColor,
//                       ),
//                     ),
//                   ),
//
//                   //const SizedBox(height: 30),
//                   SizedBox(height: screenHeight * 0.03),
//
//                   // Size and Color Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Size
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Size",
//                             style: TextStyle(
//                               //fontSize: 16,
//                               fontSize: screenWidth * 0.04,
//                               fontWeight: FontWeight.bold,
//                               color: themeColor,
//                             ),
//                           ),
//                           //const SizedBox(height: 8),
//                           SizedBox(height: screenHeight * 0.008),
//                           Row(
//                             children: sizes
//                                 .map((s) => Padding(
//                               //padding: const EdgeInsets.only(right: 8.0),
//                               padding: EdgeInsets.only(right: screenWidth * 0.02),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => selectedSize = s),
//                                 child: _buildSizeOption(s, selectedSize == s),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       ),
//
//                       // Color
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Color",
//                             style: TextStyle(
//                               //fontSize: 16,
//                               fontSize: screenWidth * 0.04,
//                               fontWeight: FontWeight.bold,
//                               color: themeColor,
//                             ),
//                           ),
//                           //const SizedBox(height: 8),
//                           SizedBox(height: screenHeight * 0.008),
//                           Row(
//                             children: colors
//                                 .map((c) => Padding(
//                               //padding: const EdgeInsets.only(right: 8.0),
//                               padding: EdgeInsets.only(right: screenWidth * 0.02),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => selectedColor = c),
//                                 child: _buildColorOption(c, selectedColor == c),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   //const SizedBox(height: 30),
//                   SizedBox(height: screenHeight * 0.03),
//
//                   // Updated Add to Cart Button with Cart Integration
//                   Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         // Create cart item
//                         // final cartItem = CartItem(
//                         //   id: "product_1", // You can make this dynamic later
//                         //   title: "Modern Light Clothes",
//                         //   category: "T-shirt",
//                         //   price: basePrice,
//                         //   imageUrl: "assets/images/myorderimage.png",
//                         //   quantity: quantity,
//                         //   selectedSize: selectedSize,
//                         //   selectedColor: _colorName(selectedColor),
//                         // );
//
//                         // Add to cart
//                         // cartController.addToCart(cartItem);
//
//                         // Show success message
//                         Get.snackbar(
//                           'Success!',
//                           'Added $quantity× Modern Light Clothes ($selectedSize, ${_colorName(selectedColor)}) to cart',
//                           backgroundColor: themeColor,
//                           colorText: Colors.white,
//                           duration: const Duration(seconds: 2),
//                         );
//
//                         // Navigate to cart screen
//                         Get.to(() => cartscreen());
//                       },
//                       child: Container(
//                         //height: 60,
//                         height: screenHeight * 0.07,
//                         width: double.infinity,
//                         //margin: const EdgeInsets.symmetric(horizontal: 20),
//                         margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//                         decoration: BoxDecoration(
//                           color: themeColor,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Cart icon
//                             const Icon(Icons.shopping_bag_outlined, color: Color(0xFFF5EEDC)),
//                             //const SizedBox(width: 10),
//                             SizedBox(width: screenWidth * 0.05),
//                             // Add to cart text
//                             Text(
//                               "Add To Cart",
//                               style: TextStyle(
//                                 //fontSize: 18,
//                                 fontSize: screenWidth * 0.045,
//                                 fontWeight: FontWeight.bold,
//                                 color: const Color(0xFFF5EEDC),
//                               ),
//                             ),
//                             //const SizedBox(width: 10),
//                             SizedBox(width: screenWidth * 0.02),
//                             // Total price
//                             Text(
//                               "|\$${totalPrice.toStringAsFixed(2)}   ",
//                               style: TextStyle(
//                                 //fontSize: 18,
//                                 fontSize: screenWidth * 0.045,
//                                 fontWeight: FontWeight.bold,
//                                 color: const Color(0xFFF5EEDC),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Size Option Widget
//   Widget _buildSizeOption(String size, bool isSelected) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: 44,
//       height: 44,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isSelected ? themeColor : Colors.transparent,
//         border: Border.all(
//           color: themeColor,
//           width: 2,
//         ),
//         boxShadow: isSelected
//             ? [
//           BoxShadow(
//             color: themeColor.withOpacity(0.3),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ]
//             : [],
//       ),
//       child: Center(
//         child: Text(
//           size,
//           style: TextStyle(
//             color: isSelected ? Colors.white : themeColor,
//             fontWeight: FontWeight.bold,
//
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Color Option Widget
//   Widget _buildColorOption(Color color, bool isSelected) {
//     return Container(
//       width: 34,
//       height: 34,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: isSelected ? themeColor : Colors.transparent,
//           width: 3,
//         ),
//       ),
//       child: isSelected
//           ? const Icon(
//         Icons.check,
//         color: Colors.white,
//         size: 20,
//       )
//           : null,
//     );
//   }
//
//   // Helper to display a friendly color name
//   String _colorName(Color c) {
//     if (c == Colors.blue) return "Blue";
//     if (c == Colors.red) return "Red";
//     if (c == Colors.green) return "Green";
//     if (c == Colors.black) return "Black";
//     return "Color";
//   }
// }

// cart_api_service.dart
//
// import 'package:dio/dio.dart';
// import 'package:ecommerce/Baseurl/baseurl.dart';
// import 'package:ecommerce/screens/cart_screen/cart_model.dart';
//
// class apii{
//   Dio dio =Dio();
//
//   Future<CartResponse>catdata(String token)async{
//
//     String baseurl = BaseUrl().baseurl;
//
//     final response = await dio.get("${baseurl}cart",
//         options: Options(
//             headers: {
//               'Authorization': 'Bearer $token',
//               'Accept': 'application/json',
//               'Content-Type': 'application/json',
//             }
//         )
//     );
//
//     print("📡 API Response received:");
//     print("Status Code: ${response.statusCode}");
//     print("Response Data: ${response.data}");
//
//     if(response.statusCode ==200){
//       final result = CartResponse.fromJson(response.data);
//       return result;
//     }
//     else{
//       throw "Something went wrong";
//     }
//
//
//
//   }
// }



// // controllers/cart_controller.dart
// import 'package:get/get.dart';
//
// import 'cart_model.dart';
//
// class CartController extends GetxController {
//   final RxList<CartItem> _cartItems = <CartItem>[].obs;
//
//   List<CartItem> get cartItems => _cartItems;
//
//   // Total calculations
//   double get subtotal => _cartItems.fold(0, (sum, item) => sum + item.totalPrice);
//   double get shippingFee => _cartItems.isNotEmpty ? 5.00 : 0.0;
//   double get totalAmount => subtotal + shippingFee;
//
//   // Cart item count for badge
//   int get totalItems => _cartItems.fold(0, (sum, item) => sum + item.quantity);
//
//   // Add to cart with proper logic
//   void addToCart(CartItem newItem) {
//     final existingItemIndex = _cartItems.indexWhere(
//           (item) =>
//       item.id == newItem.id &&
//           item.selectedSize == newItem.selectedSize &&
//           item.selectedColor == newItem.selectedColor,
//     );
//
//     if (existingItemIndex != -1) {
//       // Update quantity if same product with same options exists
//       updateQuantity(
//         _cartItems[existingItemIndex].id,
//         _cartItems[existingItemIndex].quantity + newItem.quantity,
//         selectedSize: newItem.selectedSize,
//         selectedColor: newItem.selectedColor,
//       );
//     } else {
//       // Add new item
//       _cartItems.add(newItem);
//     }
//     _cartItems.refresh();
//   }
//
//   // Update quantity
//   void updateQuantity(String itemId, int newQuantity, {String? selectedSize, String? selectedColor}) {
//     final itemIndex = _cartItems.indexWhere(
//           (item) =>
//       item.id == itemId &&
//           item.selectedSize == selectedSize &&
//           item.selectedColor == selectedColor,
//     );
//
//     if (itemIndex != -1) {
//       if (newQuantity <= 0) {
//         removeFromCart(itemId, selectedSize: selectedSize, selectedColor: selectedColor);
//       } else {
//         _cartItems[itemIndex] = _cartItems[itemIndex].copyWith(quantity: newQuantity);
//         _cartItems.refresh();
//       }
//     }
//   }
//
//   // Remove from cart
//   void removeFromCart(String itemId, {String? selectedSize, String? selectedColor}) {
//     _cartItems.removeWhere(
//           (item) =>
//       item.id == itemId &&
//           item.selectedSize == selectedSize &&
//           item.selectedColor == selectedColor,
//     );
//     _cartItems.refresh();
//   }
//
//   // Clear cart
//   void clearCart() {
//     _cartItems.clear();
//   }
//
//   // Check if item exists in cart (for UI states)
//   bool isItemInCart(String itemId, {String? selectedSize, String? selectedColor}) {
//     return _cartItems.any(
//           (item) =>
//       item.id == itemId &&
//           item.selectedSize == selectedSize &&
//           item.selectedColor == selectedColor,
//     );
//   }
//
//   // Get item quantity (for product detail page)
//   int getItemQuantity(String itemId, {String? selectedSize, String? selectedColor}) {
//     final item = _cartItems.firstWhere(
//           (item) =>
//       item.id == itemId &&
//           item.selectedSize == selectedSize &&
//           item.selectedColor == selectedColor,
//       orElse: () => CartItem(
//         id: '',
//         title: '',
//         category: '',
//         price: 0,
//         imageUrl: '',
//         quantity: 0,
//       ),
//     );
//     return item.quantity;
//   }
// }

// cart_controller.dart
//
// import 'package:ecommerce/screens/cart_screen/cart_apiservice.dart';
// import 'package:ecommerce/screens/cart_screen/cart_model.dart';
// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class CartController extends GetxController {
//
//
//
//   var iscatsloading = false.obs;
//   var categoriessList = <CartItem>[].obs; // ADD THIS LINE
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
//   Future<void> ecatcont() async {
//     try {
//       iscatsloading.value = true;
//       String? token = await getToken();
//
//       if (token == null || token.isEmpty) {
//         print("❌ No token available for banners");
//         return;
//       }
//       final respo = await apii().catdata(token);
//       print("✅ API Response status: ${respo.status}");
//
//
//       // DEBUG: Check if data is null
//       print("🔍 Is data null: ${respo.data == null}");
//
//       if (respo.status == true && respo.data != null) {
//
//         categoriessList.value = respo.data; // ADD THIS LINE
//         print("✅ Loaded ${categoriessList.length} categories from API");
//       }
//       else {
//         print("❌ API returned false status");
//       }
//     }
//     catch (e) {
//       iscatsloading.value = false;
//       print("❌ Error in ehomecatcont: $e");
//     } finally {
//       iscatsloading.value = false;
//     }
//   }
// }



// // import 'package:flutter/material.dart';
// //
// // class ProductDetailsScreen extends StatelessWidget {
// //   const ProductDetailsScreen({super.key});
// //
// //   @override
// //   Widget build(BuildContext context) {
// //
// //     Color themeColor = Color(0xFF16423C);
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
// //       ),
// //       body: SingleChildScrollView(
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             // Product Image Section
// //             Stack(
// //               children: [
// //                 Padding(
// //                   padding: const EdgeInsets.all(22.0),
// //                   child: Container(
// //                     height: 400,
// //                     width: double.infinity,
// //                     decoration: BoxDecoration(
// //                       color: Colors.white,
// //                       borderRadius: const BorderRadius.only(
// //                         bottomLeft: Radius.circular(30),
// //                         bottomRight: Radius.circular(30),
// //                       ),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.black.withOpacity(0.1),
// //                           blurRadius: 10,
// //                           offset: const Offset(0, 4),
// //                         ),
// //                       ],
// //                     ),
// //                     child: Image.network(
// //                       'https://i.imgur.com/8Km9tLL.png',
// //                       fit: BoxFit.cover,
// //                     ),
// //                   ),
// //                 ),
// //                 // Favorite Button
// //                 Positioned(
// //                   top: 50,
// //                   right: 35,
// //                   child: Container(
// //                     decoration: BoxDecoration(
// //                       color: Color(0xFF16423C),
// //                       borderRadius: BorderRadius.circular(25),
// //                       boxShadow: [
// //                         BoxShadow(
// //                           color: Colors.black.withOpacity(0.1),
// //                           blurRadius: 5,
// //                         ),
// //                       ],
// //                     ),
// //                     child: IconButton(
// //                       icon: const Icon(Icons.favorite_border,color: Colors.white,),
// //                       onPressed: () {},
// //                     ),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //
// //             // Product Details Section
// //             Padding(
// //               padding: const EdgeInsets.all(20),
// //               child: Column(
// //                 crossAxisAlignment: CrossAxisAlignment.start,
// //                 children: [
// //                   // Product Title and Rating
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       Expanded(
// //                         child: Column(
// //                           crossAxisAlignment: CrossAxisAlignment.start,
// //                           children: [
// //                             Text(
// //                               "Modern Light Clothes",
// //                               style: TextStyle(
// //                                 fontSize: 24,
// //                                 fontWeight: FontWeight.bold,
// //                                 color: const Color(0xFF16423C),
// //                               ),
// //                             ),
// //                             const SizedBox(height: 4),
// //                             Row(
// //                               children: [
// //                                 Text(
// //                                   "T-shirt",
// //                                   style: TextStyle(
// //                                     fontSize: 16,
// //                                     color: Colors.grey[600],
// //                                   ),
// //                                 ),
// //                                 Padding(
// //                                   padding: const EdgeInsets.symmetric(horizontal: 14.0),
// //                                   child: Row(
// //                                     children: [
// //                                       const Icon(
// //                                         Icons.star,
// //                                         color: Colors.amber,
// //                                         size: 20,
// //                                       ),
// //                                       const SizedBox(width: 4),
// //                                       Text(
// //                                         "5.0",
// //                                         style: TextStyle(
// //                                           fontSize: 16,
// //                                           fontWeight: FontWeight.bold,
// //                                           color: const Color(0xFF16423C),
// //                                         ),
// //                                       ),
// //                                     ],
// //                                   ),
// //                                 ),
// //
// //                               ],
// //                             ),
// //                           ],
// //                         ),
// //                       ),
// //                       // Quantity and Price
// //                       Container(
// //                         padding: const EdgeInsets.all(16),
// //                         decoration: BoxDecoration(
// //                           color: Color(0xFFF5EEDC),
// //                         ),
// //                         child: Row(
// //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                           children: [
// //                             // Quantity Selector
// //                            Row(
// //                                 children: [
// //                                   Container(
// //                                     decoration: BoxDecoration(
// //                                       border: Border.all(color: themeColor),
// //                                       borderRadius: BorderRadius.circular(25),
// //                                     ),
// //                                     child: IconButton(
// //                                       icon: Icon(Icons.remove,
// //                                           color: themeColor),
// //                                       onPressed: () {},
// //                                     ),
// //                                   ),
// //                                    Padding(
// //                                      padding: const EdgeInsets.all(14.0),
// //                                      child: Container(
// //                                        child: Text(
// //                                         "1",
// //                                         style: TextStyle(
// //                                           color: themeColor,
// //                                           fontWeight: FontWeight.bold,
// //                                           fontSize: 28,
// //                                         ),
// //                                        ),
// //                                      ),
// //                                    ),
// //                                   Container(
// //                                     decoration: BoxDecoration(
// //                                       border: Border.all(color: themeColor),
// //                                       borderRadius: BorderRadius.circular(25),
// //                                     ),
// //                                     child: IconButton(
// //                                       icon: Icon(Icons.add,
// //                                           color: themeColor),
// //                                       onPressed: () {},
// //                                     ),
// //                                   ),
// //                                 ],
// //                               ),
// //                           ],
// //                         ),
// //                       ),
// //                     ],
// //                   ),
// //
// //                   const SizedBox(height: 20),
// //
// //                   // Description
// //                   Text(
// //                     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
// //                     style: TextStyle(
// //                       fontSize: 14,
// //                       color: Colors.grey[700],
// //                       height: 1.5,
// //                     ),
// //                   ),
// //                   const SizedBox(height: 8),
// //                   GestureDetector(
// //                     onTap: () {
// //                       // Handle read more action
// //                     },
// //                     child: Text(
// //                       "Read More...",
// //                       style: TextStyle(
// //                         fontSize: 14,
// //                         fontWeight: FontWeight.bold,
// //                         color: const Color(0xFF16423C),
// //                       ),
// //                     ),
// //                   ),
// //
// //                   const SizedBox(height: 30),
// //
// //                   // Size and Color Section
// //                   Row(
// //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                     children: [
// //                       // Size
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             "Size",
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.bold,
// //                               color: const Color(0xFF16423C),
// //                             ),
// //                           ),
// //                           const SizedBox(height: 8),
// //                           Row(
// //                             children: [
// //                               _buildSizeOption("M", true),
// //                               const SizedBox(width: 8),
// //                               _buildSizeOption("L", false),
// //                               const SizedBox(width: 8),
// //                               _buildSizeOption("XL", false),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //
// //                       // Color
// //                       Column(
// //                         crossAxisAlignment: CrossAxisAlignment.start,
// //                         children: [
// //                           Text(
// //                             "Color",
// //                             style: TextStyle(
// //                               fontSize: 16,
// //                               fontWeight: FontWeight.bold,
// //                               color: const Color(0xFF16423C),
// //                             ),
// //                           ),
// //                           const SizedBox(height: 8),
// //                           Row(
// //                             children: [
// //                               _buildColorOption(Colors.blue, true),
// //                               const SizedBox(width: 8),
// //                               _buildColorOption(Colors.red, false),
// //                               const SizedBox(width: 8),
// //                               _buildColorOption(Colors.green, false),
// //                             ],
// //                           ),
// //                         ],
// //                       ),
// //                     ],
// //                   ),
// //
// //                   const SizedBox(height: 30),
// //
// //
// //                   const SizedBox(height: 20),
// //
// //                   // Add to Cart Button
// //                   Container(
// //                     width: double.infinity,
// //                     height: 60,
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFF16423C),
// //                       borderRadius: BorderRadius.circular(15),
// //                     ),
// //                     child: Row(
// //                       mainAxisAlignment: MainAxisAlignment.center,
// //                       children: [
// //                         const Icon(
// //                           Icons.shopping_bag_outlined,
// //                           color: Color(0xFFF5EEDC),
// //                         ),
// //                         const SizedBox(width: 10),
// //                         Text(
// //                           "Add To Cart | \$40.00",
// //                           style: TextStyle(
// //                             fontSize: 18,
// //                             fontWeight: FontWeight.bold,
// //                             color: Color(0xFFF5EEDC),
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                 ],
// //               ),
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Size Option Widget
// //   Widget _buildSizeOption(String size, bool isSelected) {
// //     return Container(
// //       width: 40,
// //       height: 40,
// //       decoration: BoxDecoration(
// //         color: isSelected ? const Color(0xFF16423C) : Colors.transparent,
// //         border: Border.all(
// //           color: const Color(0xFF16423C),
// //           width: 2,
// //         ),
// //         borderRadius: BorderRadius.circular(8),
// //       ),
// //       child: Center(
// //         child: Text(
// //           size,
// //           style: TextStyle(
// //             color: isSelected ? Colors.white : const Color(0xFF16423C),
// //             fontWeight: FontWeight.bold,
// //           ),
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Color Option Widget
// //   Widget _buildColorOption(Color color, bool isSelected) {
// //     return Container(
// //       width: 30,
// //       height: 30,
// //       decoration: BoxDecoration(
// //         color: color,
// //         shape: BoxShape.circle,
// //         border: isSelected
// //             ? Border.all(
// //           color: const Color(0xFF16423C),
// //           width: 3,
// //         )
// //             : null,
// //       ),
// //     );
// //   }
// // }
//
//
// import 'package:ecommerce/screens/cart_screen/cartscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   const ProductDetailsScreen({super.key});
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   // Theme & product base price
//   final Color themeColor = const Color(0xFF16423C);
//   final double basePrice = 40.0;
//
//   // Dynamic state
//   int quantity = 1;
//   String selectedSize = 'M';
//   Color selectedColor = Colors.blue;
//
//   // Available options
//   final List<String> sizes = ['S', 'M', 'L', 'XL'];
//   final List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.black];
//
//   double get totalPrice => basePrice * quantity;
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EEDC),
//       appBar: AppBar(
//         backgroundColor: themeColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image Section
//             Stack(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(22.0),
//                   child: Container(
//                     height: 400,
//                     width: double.infinity,
//                     decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: const BorderRadius.only(
//                         bottomLeft: Radius.circular(30),
//                         bottomRight: Radius.circular(30),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 10,
//                           offset: const Offset(0, 4),
//                         ),
//                       ],
//                     ),
//                     child: Image.asset("assets/images/img_6.png")
//                   ),
//                 ),
//                 // Favorite Button
//                 Positioned(
//                   top: 50,
//                   right: 35,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: themeColor,
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     child: IconButton(
//                       icon: const Icon(Icons.favorite_border, color: Colors.white),
//                       onPressed: () {
//                         // TODO: toggle favorite
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             // Product Details Section
//             Padding(
//               padding: const EdgeInsets.all(20),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title & Rating & Qty/Price
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Left: Title & meta
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Modern Light Clothes",
//                               style: TextStyle(
//                                 fontSize: 24,
//                                 fontWeight: FontWeight.bold,
//                                 color: themeColor,
//                               ),
//                             ),
//                             const SizedBox(height: 4),
//                             Row(
//                               children: [
//                                 Text(
//                                   "T-shirt",
//                                   style: TextStyle(
//                                     fontSize: 16,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                                 const SizedBox(width: 14),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.star, color: Colors.amber, size: 20),
//                                     const SizedBox(width: 4),
//                                     Text(
//                                       "5.0",
//                                       style: TextStyle(
//                                         fontSize: 16,
//                                         fontWeight: FontWeight.bold,
//                                         color: themeColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Right: Quantity Selector
//                       Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFF5EEDC),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // Minus
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: themeColor),
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                 icon: Icon(Icons.remove, color: themeColor),
//                                 onPressed: quantity > 1
//                                     ? () => setState(() => quantity--)
//                                     : null,
//                               ),
//                             ),
//
//                             // Quantity number
//                             Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                               child: Text(
//                                 quantity.toString(),
//                                 style: TextStyle(
//                                   color: themeColor,
//                                   fontWeight: FontWeight.bold,
//                                   fontSize: 22,
//                                 ),
//                               ),
//                             ),
//
//                             // Plus
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: themeColor),
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                 icon: Icon(Icons.add, color: themeColor),
//                                 onPressed: () => setState(() => quantity++),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 20),
//
//                   // Description
//                   Text(
//                     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
//                     style: TextStyle(
//                       fontSize: 14,
//                       color: Colors.grey[700],
//                       height: 1.5,
//                     ),
//                   ),
//                   const SizedBox(height: 8),
//                   GestureDetector(
//                     onTap: () {
//                       // Expand description if needed
//                     },
//                     child: Text(
//                       "Read More...",
//                       style: TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.bold,
//                         color: themeColor,
//                       ),
//                     ),
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   // Size and Color Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Size
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Size",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: themeColor,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: sizes
//                                 .map((s) => Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => selectedSize = s),
//                                 child: _buildSizeOption(s, selectedSize == s),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       ),
//
//                       // Color
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Color",
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold,
//                               color: themeColor,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           Row(
//                             children: colors
//                                 .map((c) => Padding(
//                               padding: const EdgeInsets.only(right: 8.0),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => selectedColor = c),
//                                 child: _buildColorOption(c, selectedColor == c),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   const SizedBox(height: 30),
//
//                   // Price summary and Add to Cart
//                   // Row(
//                   //   children: [
//                   //     // Price block
//                   //     Expanded(
//                   //       child: Column(
//                   //         crossAxisAlignment: CrossAxisAlignment.start,
//                   //         children: [
//                   //           const Text(
//                   //             "Total",
//                   //             style: TextStyle(fontSize: 14, color: Colors.grey),
//                   //           ),
//                   //
//                   //           Text(
//                   //             '\$${totalPrice.toStringAsFixed(2)}',
//                   //             style: TextStyle(
//                   //               fontSize: 22,
//                   //               fontWeight: FontWeight.bold,
//                   //               color: themeColor,
//                   //             ),
//                   //           ),
//                   //         ],
//                   //       ),
//                   //     ),
//                   //
//                   //     const SizedBox(width: 12),
//                   //
//                   //     // Add to cart button
//                   //     Expanded(
//                   //       child: GestureDetector(
//                   //         onTap: () {
//                   //           // TODO: add to cart with selected options
//                   //           final snack = SnackBar(
//                   //             content: Text(
//                   //               'Added ${quantity}× Modern Light Clothes ($selectedSize, ${_colorName(selectedColor)}) to cart',
//                   //             ),
//                   //           );
//                   //           ScaffoldMessenger.of(context).showSnackBar(snack);
//                   //         },
//                   //         child: GestureDetector(onTap: (){
//                   //           Navigator.push(context, MaterialPageRoute(builder: (context)=>cartscreen()));
//                   //         },
//                   //           child: Container(
//                   //             height: 60,
//                   //             decoration: BoxDecoration(
//                   //               color: themeColor,
//                   //               borderRadius: BorderRadius.circular(12),
//                   //             ),
//                   //             child: Row(
//                   //               mainAxisAlignment: MainAxisAlignment.center,
//                   //               children: [
//                   //                 const Icon(Icons.shopping_bag_outlined, color: Color(0xFFF5EEDC)),
//                   //                 const SizedBox(width: 10),
//                   //                 Text(
//                   //                   "Add To Cart",
//                   //                   style: TextStyle(
//                   //                     fontSize: 18,
//                   //                     fontWeight: FontWeight.bold,
//                   //                     color: const Color(0xFFF5EEDC),
//                   //                   ),
//                   //                 ),
//                   //               ],
//                   //             ),
//                   //           ),
//                   //         ),
//                   //       ),
//                   //     ),
//                   //   ],
//                   // ),
//                   Center(
//                     child: GestureDetector(onTap: (){
//                       Get.to(cartscreen());
//                     },
//                       child: Container(
//                         height: 60,
//                         width: double.infinity,
//                         margin: const EdgeInsets.symmetric(horizontal: 20),
//                         decoration: BoxDecoration(
//                           color: themeColor,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Total price text
//
//
//                             // Cart icon
//                             const Icon(Icons.shopping_bag_outlined, color: Color(0xFFF5EEDC)),
//                             const Text(
//                               "Add To Cart",
//                               style: TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFFF5EEDC),
//                               ),
//                             ),
//                             const SizedBox(width: 10),
//
//                             // Add to cart text
//
//                             Text(
//                               "|\$${totalPrice.toStringAsFixed(2)}   ",
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                                 color: Color(0xFFF5EEDC),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Size Option Widget
//   // Widget _buildSizeOption(String size, bool isSelected) {
//   //   return Container(
//   //     width: 44,
//   //     height: 44,
//   //     decoration: BoxDecoration(
//   //       color: isSelected ? themeColor : Colors.transparent,
//   //       border: Border.all(
//   //         color: themeColor,
//   //         width: 2,
//   //       ),
//   //       borderRadius: BorderRadius.circular(8),
//   //     ),
//   //     child: Center(
//   //       child: Text(
//   //         size,
//   //         style: TextStyle(
//   //           color: isSelected ? Colors.white : themeColor,
//   //           fontWeight: FontWeight.bold,
//   //         ),
//   //       ),
//   //     ),
//   //   );
//   // }
//   Widget _buildSizeOption(String size, bool isSelected) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: 44,
//       height: 44,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isSelected ? themeColor : Colors.transparent,
//         border: Border.all(
//           color: themeColor,
//           width: 2,
//         ),
//         boxShadow: isSelected
//             ? [
//           BoxShadow(
//             color: themeColor.withOpacity(0.3),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ]
//             : [],
//       ),
//       child: Center(
//         child: Text(
//           size,
//           style: TextStyle(
//             color: isSelected ? Colors.white : themeColor,
//             fontWeight: FontWeight.bold,
//           ),
//         ),
//       ),
//     );
//   }
//
//
//   // Color Option Widget
//   // Widget _buildColorOption(Color color, bool isSelected) {
//   //   return Container(
//   //     width: 34,
//   //     height: 34,
//   //     decoration: BoxDecoration(
//   //       color: color,
//   //       shape: BoxShape.circle,
//   //       border: isSelected
//   //           ? Border.all(
//   //         color: themeColor,
//   //         width: 3,
//   //       )
//   //           : null,
//   //     ),
//   //   );
//   // }
//
//   Widget _buildColorOption(Color color, bool isSelected) {
//     return Container(
//       width: 34,
//       height: 34,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: isSelected ? themeColor : Colors.transparent,
//           width: 3,
//         ),
//       ),
//       child: isSelected
//           ? const Icon(
//         Icons.check,
//         color: Colors.white,
//         size: 20,
//       )
//           : null,
//     );
//   }
//
//
//   // Helper to display a friendly color name in SnackBar message (optional)
//   String _colorName(Color c) {
//     if (c == Colors.blue) return "Blue";
//     if (c == Colors.red) return "Red";
//     if (c == Colors.green) return "Green";
//     if (c == Colors.black) return "Black";
//     return "Color";
//   }
// }

//
// import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
// import 'package:ecommerce/screens/cart_screen/cart_model.dart';
// import 'package:ecommerce/screens/cart_screen/cartscreen.dart';
// import 'package:ecommerce/screens/product_detail/product_detail_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// class ProductDetailsScreen extends StatefulWidget {
//   final int productId;
//
//  ProductDetailsScreen({super.key, required this.productId});
//
//
//   @override
//   State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
// }
//
//
// class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
//   // Theme & product base price
//   final Color themeColor = const Color(0xFF16423C);
//   final double basePrice = 40.0;
//
//
//   // Dynamic state
//   int quantity = 1;
//   String selectedSize = 'M';
//   Color selectedColor = Colors.blue;
//
//   // Available options
//   final List<String> sizes = ['S', 'M', 'L', 'XL'];
//   final List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.black];
//
//   // Get the cart controller
//   final CartController cartController = Get.put(CartController());
//   final ProductDetailsController productDataController = Get.put(ProductDetailsController());
//
//   double get totalPrice => basePrice * quantity;
// @override
//   void initState() {
//   productDataController.fetchProductDetails(widget.productId);
//   }
//   @override
//   void dispose() {
//     // Clear product details when leaving screen
//     productDataController.clearProductDetails();
//     super.dispose();
//   }
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EEDC),
//       appBar: AppBar(
//         backgroundColor: themeColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             // Product Image Section
//             Stack(
//               children: [
//                 Padding(
//                   //padding: const EdgeInsets.all(22.0),
//                   padding: EdgeInsets.all(screenWidth * 0.055),
//                   child: Container(
//                       //height: 400,
//                       height: screenHeight * 0.4,
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: const BorderRadius.only(
//                           bottomLeft: Radius.circular(30),
//                           bottomRight: Radius.circular(30),
//                         ),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 10,
//                             offset: const Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Image.asset("assets/images/img_6.png")
//                   ),
//                 ),
//                 // Favorite Button
//                 Positioned(
//                   //top: 50,
//                   top: screenHeight * 0.06,
//                   //right: 35,
//                   right: screenWidth * 0.08,
//                   child: Container(
//                     decoration: BoxDecoration(
//                       color: themeColor,
//                       borderRadius: BorderRadius.circular(25),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black.withOpacity(0.1),
//                           blurRadius: 5,
//                         ),
//                       ],
//                     ),
//                     child: IconButton(
//                       icon: const Icon(Icons.favorite_border, color: Colors.white),
//                       onPressed: () {
//                         // TODO: toggle favorite
//                       },
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//
//             // Product Details Section
//             Padding(
//               //padding: const EdgeInsets.all(20),
//               padding: EdgeInsets.all(screenWidth * 0.05),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   // Title & Rating & Qty/Price
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       // Left: Title & meta
//                       Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text(
//                               "Modern Light Clothes",
//                               style: TextStyle(
//                                 //fontSize: 24,
//                                 fontSize: screenWidth * 0.065,
//                                 fontWeight: FontWeight.bold,
//                                 color: themeColor,
//                               ),
//                             ),
//                             //const SizedBox(height: 4),
//                             SizedBox(height: screenHeight * 0.005),
//                             Row(
//                               children: [
//                                 Text(
//                                   "T-shirt",
//                                   style: TextStyle(
//                                     //fontSize: 16,
//                                     fontSize: screenWidth * 0.04,
//                                     color: Colors.grey[600],
//                                   ),
//                                 ),
//                                 //const SizedBox(width: 14),
//                                 SizedBox(width: screenWidth * 0.035),
//                                 Row(
//                                   children: [
//                                     const Icon(Icons.star, color: Colors.amber, size: 20),
//                                     //const SizedBox(width: 4),
//                                     SizedBox(width: screenWidth * 0.01),
//                                     Text(
//                                       "5.0",
//                                       style: TextStyle(
//                                         //fontSize: 16,
//                                         fontSize: screenWidth * 0.04,
//                                         fontWeight: FontWeight.bold,
//                                         color: themeColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//
//                       // Right: Quantity Selector
//                       Container(
//                         //padding: const EdgeInsets.all(8),
//                         padding: EdgeInsets.all(screenWidth * 0.02),
//                         decoration: const BoxDecoration(
//                           color: Color(0xFFF5EEDC),
//                         ),
//                         child: Row(
//                           mainAxisSize: MainAxisSize.min,
//                           children: [
//                             // Minus
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: themeColor),
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: BoxConstraints(
//                                     //minWidth: 36,
//                                     minWidth: screenWidth * 0.085,
//                                     //minHeight: 36),
//                                     minHeight: screenWidth * 0.085),
//                                 icon: Icon(Icons.remove, color: themeColor),
//                                 onPressed: quantity > 1
//                                     ? () => setState(() => quantity--)
//                                     : null,
//                               ),
//                             ),
//
//                             // Quantity number
//                             Padding(
//                               //padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                               padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.0),
//                               child: Text(
//                                 quantity.toString(),
//                                 style: TextStyle(
//                                   color: themeColor,
//                                   fontWeight: FontWeight.bold,
//                                   //fontSize: 22,
//                                   fontSize: screenWidth * 0.055,
//                                 ),
//                               ),
//                             ),
//         SizedBox(width: 10,),
//                             // Plus
//                             Container(
//                               decoration: BoxDecoration(
//                                 border: Border.all(color: themeColor),
//                                 borderRadius: BorderRadius.circular(25),
//                               ),
//                               child: IconButton(
//                                 padding: EdgeInsets.zero,
//                                 constraints: BoxConstraints(
//                                     //minWidth: 36,
//                                     minWidth: screenWidth * 0.085,
//                                     //minHeight: 36),
//                                     minHeight: screenWidth * 0.085),
//                                 icon: Icon(Icons.add, color: themeColor),
//                                 onPressed: () => setState(() => quantity++),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ],
//                   ),
//
//                   //const SizedBox(height: 20),
//                   SizedBox(height: screenHeight * 0.02),
//
//                   // Description
//                   Text(
//                     "Lorem Ipsum has been the industry's standard dummy text ever since the 1500s.",
//                     style: TextStyle(
//                       //fontSize: 14,
//                       fontSize: screenWidth * 0.035,
//                       color: Colors.grey[700],
//                       height: 1.5,
//                     ),
//                   ),
//                   //const SizedBox(height: 8),
//                   SizedBox(height: screenHeight * 0.008),
//                   GestureDetector(
//                     onTap: () {
//                       // Expand description if needed
//                     },
//                     child: Text(
//                       "Read More...",
//                       style: TextStyle(
//                         //fontSize: 14,
//                         fontSize: screenWidth * 0.035,
//                         fontWeight: FontWeight.bold,
//                         color: themeColor,
//                       ),
//                     ),
//                   ),
//
//                   //const SizedBox(height: 30),
//                   SizedBox(height: screenHeight * 0.03),
//
//                   // Size and Color Section
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       // Size
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Size",
//                             style: TextStyle(
//                               //fontSize: 16,
//                               fontSize: screenWidth * 0.04,
//                               fontWeight: FontWeight.bold,
//                               color: themeColor,
//                             ),
//                           ),
//                           //const SizedBox(height: 8),
//                           SizedBox(height: screenHeight * 0.008),
//                           Row(
//                             children: sizes
//                                 .map((s) => Padding(
//                               //padding: const EdgeInsets.only(right: 8.0),
//                               padding: EdgeInsets.only(right: screenWidth * 0.02),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => selectedSize = s),
//                                 child: _buildSizeOption(s, selectedSize == s),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       ),
//
//                       // Color
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text(
//                             "Color",
//                             style: TextStyle(
//                               //fontSize: 16,
//                               fontSize: screenWidth * 0.04,
//                               fontWeight: FontWeight.bold,
//                               color: themeColor,
//                             ),
//                           ),
//                           //const SizedBox(height: 8),
//                           SizedBox(height: screenHeight * 0.008),
//                           Row(
//                             children: colors
//                                 .map((c) => Padding(
//                               //padding: const EdgeInsets.only(right: 8.0),
//                               padding: EdgeInsets.only(right: screenWidth * 0.02),
//                               child: GestureDetector(
//                                 onTap: () => setState(() => selectedColor = c),
//                                 child: _buildColorOption(c, selectedColor == c),
//                               ),
//                             ))
//                                 .toList(),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//
//                   //const SizedBox(height: 30),
//                   SizedBox(height: screenHeight * 0.03),
//
//                   // Updated Add to Cart Button with Cart Integration
//                   Center(
//                     child: GestureDetector(
//                       onTap: () {
//                         // Create cart item
//                         // final cartItem = CartItem(
//                         //   id: "product_1", // You can make this dynamic later
//                         //   title: "Modern Light Clothes",
//                         //   category: "T-shirt",
//                         //   price: basePrice,
//                         //   imageUrl: "assets/images/myorderimage.png",
//                         //   quantity: quantity,
//                         //   selectedSize: selectedSize,
//                         //   selectedColor: _colorName(selectedColor),
//                         // );
//
//                         // Add to cart
//                         // cartController.addToCart(cartItem);
//
//                         // Show success message
//                         Get.snackbar(
//                           'Success!',
//                           'Added $quantity× Modern Light Clothes ($selectedSize, ${_colorName(selectedColor)}) to cart',
//                           backgroundColor: themeColor,
//                           colorText: Colors.white,
//                           duration: const Duration(seconds: 2),
//                         );
//
//                         // Navigate to cart screen
//                         Get.to(() => cartscreen());
//                       },
//                       child: Container(
//                         //height: 60,
//                         height: screenHeight * 0.07,
//                         width: double.infinity,
//                         //margin: const EdgeInsets.symmetric(horizontal: 20),
//                         margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
//                         decoration: BoxDecoration(
//                           color: themeColor,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             // Cart icon
//                             const Icon(Icons.shopping_bag_outlined, color: Color(0xFFF5EEDC)),
//                             //const SizedBox(width: 10),
//                             SizedBox(width: screenWidth * 0.05),
//                             // Add to cart text
//                             Text(
//                               "Add To Cart",
//                               style: TextStyle(
//                                 //fontSize: 18,
//                                 fontSize: screenWidth * 0.045,
//                                 fontWeight: FontWeight.bold,
//                                 color: const Color(0xFFF5EEDC),
//                               ),
//                             ),
//                             //const SizedBox(width: 10),
//                             SizedBox(width: screenWidth * 0.02),
//                             // Total price
//                             Text(
//                               "|\$${totalPrice.toStringAsFixed(2)}   ",
//                               style: TextStyle(
//                                 //fontSize: 18,
//                                 fontSize: screenWidth * 0.045,
//                                 fontWeight: FontWeight.bold,
//                                 color: const Color(0xFFF5EEDC),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Size Option Widget
//   Widget _buildSizeOption(String size, bool isSelected) {
//     return AnimatedContainer(
//       duration: const Duration(milliseconds: 200),
//       width: 44,
//       height: 44,
//       decoration: BoxDecoration(
//         shape: BoxShape.circle,
//         color: isSelected ? themeColor : Colors.transparent,
//         border: Border.all(
//           color: themeColor,
//           width: 2,
//         ),
//         boxShadow: isSelected
//             ? [
//           BoxShadow(
//             color: themeColor.withOpacity(0.3),
//             blurRadius: 6,
//             offset: const Offset(0, 3),
//           ),
//         ]
//             : [],
//       ),
//       child: Center(
//         child: Text(
//           size,
//           style: TextStyle(
//             color: isSelected ? Colors.white : themeColor,
//             fontWeight: FontWeight.bold,
//
//           ),
//         ),
//       ),
//     );
//   }
//
//   // Color Option Widget
//   Widget _buildColorOption(Color color, bool isSelected) {
//     return Container(
//       width: 34,
//       height: 34,
//       decoration: BoxDecoration(
//         color: color,
//         shape: BoxShape.circle,
//         border: Border.all(
//           color: isSelected ? themeColor : Colors.transparent,
//           width: 3,
//         ),
//       ),
//       child: isSelected
//           ? const Icon(
//         Icons.check,
//         color: Colors.white,
//         size: 20,
//       )
//           : null,
//     );
//   }
//
//   // Helper to display a friendly color name
//   String _colorName(Color c) {
//     if (c == Colors.blue) return "Blue";
//     if (c == Colors.red) return "Red";
//     if (c == Colors.green) return "Green";
//     if (c == Colors.black) return "Black";
//     return "Color";
//   }
// }




//cart screen
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// import '../../customs/buttonscreen.dart';
// import '../payment_screeen/paymentscreen.dart';
// import 'cart_controller.dart';
//
// class cartscreen extends StatefulWidget {
//   const cartscreen({super.key});
//
//   @override
//   State<cartscreen> createState() => _cartscreenState();
// }
//
// class _cartscreenState extends State<cartscreen> {
//   final Color themeColor = const Color(0xFF16423C);
//
//   final List<Map<String, dynamic>> popular = [
//     {
//       'title': 'Modern Light Clothes',
//       'searches': 'T-shirt',
//       'price':'40.00',
//       'quantity':1
//     },
//     {
//       'title': 'Modern Light Clothes',
//       'searches': 'T-shirt',
//       'price':'40.00',
//       'quantity':1
//
//     },
//     {
//       'title': 'Modern Light Clothes',
//       'searches': 'T-shirt',
//       'price':'40.00',
//       'quantity':1
//     },
//     {
//       'title': 'Modern Light Clothes',
//       'searches': 'T-shirt',
//       'price':'40.00',
//       'quantity':1
//     },{
//       'title': 'Modern Light Clothes',
//       'searches': 'T-shirt',
//       'price':'40.00',
//       'quantity':1
//
//     },
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF16423C),
//         leading: InkWell(onTap: (){
//           Get.back();
//         },
//             child: Icon(Icons.arrow_back,color: Colors.white,)),title:Text("Cart",style: TextStyle(color: Colors.white,fontWeight:
//       FontWeight.bold),) ,),
//       body: SingleChildScrollView(
//         child: Column(
//
//           children: [
//             Column(
//               children: popular.asMap().entries.map((entry) {
//                 final index = entry.key;
//                 final search = entry.value;
//
//                 return Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                        // Your background color
//                         borderRadius: BorderRadius.circular(0), // Remove border radius for clean lines
//                       ),
//                       child: Row(
//                         children: [
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                             child:Image.asset("assets/images/myorderimage.png",height: 60,width: 50,)
//                           ),
//
//                           // Product Details
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   search['title'],
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17,
//                                     color: Color(0xFF16423C),
//                                   ),
//                                 ),
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   search['searches'],
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text(
//                                   '\$${search['price']}',
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                     color: Color(0xFF16423C),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Row(
//
//                                   children: [
//                                     // Minus
//                                     Container(
//                                       height:30,
//                                       width:30,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: themeColor),
//                                         borderRadius: BorderRadius.circular(25),
//                                       ),
//
//                                       child: IconButton(
//                                         padding: EdgeInsets.zero,
//                                         constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                         icon: Icon(Icons.remove, color: themeColor,size: 14,),
//                                         onPressed: search['quantity'] > 1
//                                             ? () => setState(() => search['quantity']--)
//                                             : null,
//                                       ),
//                                     ),
//
//                                     // Quantity number
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                                       child: Text(
//                                         search['quantity'].toString(),
//                                         style: TextStyle(
//                                           color: themeColor,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 22,
//                                         ),
//                                       ),
//                                     ),
//
//                                     // Plus
//                                     Container(
//                                       height:30,
//                                       width:30,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: themeColor),
//                                         borderRadius: BorderRadius.circular(25),
//                                       ),
//                                       child: IconButton(
//                                         padding: EdgeInsets.zero,
//                                         constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                         icon: Icon(Icons.add,size: 14, color: themeColor),
//                                         onPressed: () => setState(() => search['quantity']++),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//
//
//                           // Column(
//                           //   children: [
//                           //     Text(
//                           //       search['title'],
//                           //       style: const TextStyle(
//                           //         fontWeight: FontWeight.w600,
//                           //         fontSize: 16,
//                           //         color: Color(0xFF16423C),
//                           //       ),
//                           //     ),
//                           //     const SizedBox(height: 4),
//                           //
//                           //    Row(
//                           //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //      children: [
//                           //        Column(
//                           //          children: [
//                           //            Text(
//                           //              search['searches'],
//                           //              style: const TextStyle(
//                           //                color: Colors.grey,
//                           //                fontSize: 14,
//                           //              ),
//                           //            ),
//                           //            const SizedBox(height: 4),
//                           //            Text(
//                           //              search['price'],
//                           //              style: const TextStyle(
//                           //                fontWeight: FontWeight.w600,
//                           //                fontSize: 16,
//                           //                color: Color(0xFF16423C),
//                           //              ),
//                           //            ),
//                           //          ],
//                           //        ),
//                           //
//                           //        Row(
//                           //
//                           //          children: [
//                           //            // Minus
//                           //            Container(
//                           //              height:30,
//                           //              width:30,
//                           //              decoration: BoxDecoration(
//                           //                border: Border.all(color: themeColor),
//                           //                borderRadius: BorderRadius.circular(25),
//                           //              ),
//                           //
//                           //              child: IconButton(
//                           //                padding: EdgeInsets.zero,
//                           //                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                           //                icon: Icon(Icons.remove, color: themeColor,size: 14,),
//                           //                onPressed: search['quantity'] > 1
//                           //                    ? () => setState(() => search['quantity']--)
//                           //                    : null,
//                           //              ),
//                           //            ),
//                           //
//                           //            // Quantity number
//                           //            Padding(
//                           //              padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                           //              child: Text(
//                           //                search['quantity'].toString(),
//                           //                style: TextStyle(
//                           //                  color: themeColor,
//                           //                  fontWeight: FontWeight.bold,
//                           //                  fontSize: 22,
//                           //                ),
//                           //              ),
//                           //            ),
//                           //
//                           //            // Plus
//                           //            Container(
//                           //              height:30,
//                           //              width:30,
//                           //              decoration: BoxDecoration(
//                           //                border: Border.all(color: themeColor),
//                           //                borderRadius: BorderRadius.circular(25),
//                           //              ),
//                           //              child: IconButton(
//                           //                padding: EdgeInsets.zero,
//                           //                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                           //                icon: Icon(Icons.add,size: 14, color: themeColor),
//                           //                onPressed: () => setState(() => search['quantity']++),
//                           //              ),
//                           //            ),
//                           //          ],
//                           //        ),
//                           //      ],
//                           //    )
//                           //
//                           //
//                           //   ],
//                           // ),
//
//
//                             ],
//
//
//
//                       ),
//                     ),
//                     // Add divider line between items (except after the last one)
//                     //if (index < popular.length - 1)
//                       Container(
//                         height: 1,
//                         color: Colors.black, // Line color
//                         margin: const EdgeInsets.symmetric(horizontal: 16), // Optional: add horizontal margin to line
//                       ),
//
//                   ],
//                 );
//               }).toList(),
//             ),
//             SizedBox(
//               height: 20,
//             ),
//             Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
//               child: const Align(
//                 alignment: Alignment.centerLeft,
//                 child: Text(
//                   'Shipping information',
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: Color(0xFF16423C),
//                   ),
//                 ),
//               ),
//             ),
//             SizedBox(height: 10,),
//
//             Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20),
//                 color: Colors.white,
//               ),
//               height: 60,
//               width: 380,
//               child:Align(
//                 alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Row(
//
//                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Image.asset("assets/icons/img.png",height: 28,),
//                         Text("Enter your Promocode",style: TextStyle(fontSize: 18),),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 10),
//                           child: Icon(Icons.arrow_forward_ios_outlined),
//                         )
//                       ],
//                     ),
//                   ))
//
//
//             ),
//             SizedBox(height: 20,),
//
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Text("Shipping",style: TextStyle(color: Color(0xFF16423C),fontWeight: FontWeight.bold),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Text("40.00",style: TextStyle(color: Color(0xFF16423C),
//                       fontWeight: FontWeight.bold),),
//                     )
//                   ],
//                 ),
//
//               ],
//             ),
//             SizedBox(height: 10,),
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Text("Total Amount",style: TextStyle(color: Color(0xFF16423C),
//                       fontWeight: FontWeight.bold),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Text("5.00",style: TextStyle(color: Color(0xFF16423C),
//                       fontWeight: FontWeight.bold),),
//                     )
//                   ],
//                 ),
//
//               ],
//             ),
//             SizedBox(height: 10,),
//             const Text(
//               '- - - - - - - - - - - - - - - - - - - - - -',
//               style: TextStyle(
//                 color: Colors.grey,
//                 fontSize: 18,
//                 letterSpacing: 2,
//                 fontWeight: FontWeight.bold
//               ),
//             ),
//
//             Column(
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(left: 20),
//                       child: Text("Sub Total",style: TextStyle(color: Color(0xFF16423C),
//                       fontWeight: FontWeight.bold),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Text("45.00",style: TextStyle(color: Color(0xFF16423C),
//                       fontWeight: FontWeight.bold),),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 30,),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 20,left: 20), // Match left padding
//                   child: CustomButton(
//                     text: "Checkout",
//                     onPressed: () {
//                       Get.to(paymentscreen());
//                       // Add your button action here
//                       print("Get Started button pressed!");
//                       // You can add navigation or other logic here
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20,)
//
//               ],
//             )
//           ],
//
//         ),
//       ),
//
//     );
//   }
// }
//