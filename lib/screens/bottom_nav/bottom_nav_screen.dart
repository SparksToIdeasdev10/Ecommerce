// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:ecommerce/screens/My_order/my_order_screen.dart';
// import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
// import 'package:ecommerce/screens/search/search_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../profile/profile_screen.dart';
//
//
// class BottomNavScreen extends StatefulWidget {
//   const BottomNavScreen({super.key});
//
//   @override
//   State<BottomNavScreen> createState() => _BottomNavScreenState();
// }
//
// class _BottomNavScreenState extends State<BottomNavScreen> {
//   int _selectedIndex = 0;
//
//   // List of screens for bottom navigation
//   final List<Widget> _screens = [
//     const HomeScreen(), // Home screen content
//     const SearchScreen(),     // Search screen
//     const HomeScreen(),    // Profile screen
//     const MyOrderScreen(),    // Profile screen
//     const profilescreen(),    // Profile screen
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // No AppBar here - each screen will have its own AppBar
//       body: _screens[_selectedIndex],
//
//       // Bottom Navigation Bar
//       bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.fixedCircle,
//         backgroundColor: const Color(0xFF16423C),
//         color: Colors.white70,
//         activeColor: const Color(0xFFF5EEDC),
//         items: const [
//           TabItem(icon: Icons.home, title: 'Home'),
//           TabItem(icon: Icons.search, title: 'Search'),
//           TabItem(icon: Icons.shopping_bag, title: 'Search'),
//           TabItem(icon: Icons.shopping_basket, title: 'Bucket'),
//           TabItem(icon: Icons.person, title: 'Profile'),
//         ],
//         initialActiveIndex: _selectedIndex,
//         onTap: (int index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
//
// import 'package:convex_bottom_bar/convex_bottom_bar.dart';
// import 'package:ecommerce/screens/My_order/my_order_screen.dart';
// import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
// import 'package:ecommerce/screens/search/search_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../profile/profile_screen.dart';
//
// class BottomNavScreen extends StatefulWidget {
//   const BottomNavScreen({super.key});
//
//   @override
//   State<BottomNavScreen> createState() => _BottomNavScreenState();
// }
//
// class _BottomNavScreenState extends State<BottomNavScreen> {
//   int _selectedIndex = 0;
//
//   // List of screens for bottom navigation
//   final List<Widget> _screens = [
//     const HomeScreen(),
//     const SearchScreen(),
//     const HomeScreen(), // This seems duplicated - you might want to change this
//     const MyOrderScreen(),
//     const profilescreen(),
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: _screens[_selectedIndex],
//       bottomNavigationBar: ConvexAppBar(
//         style: TabStyle.flip, // This gives upward effect to all tabs
//         backgroundColor: const Color(0xFF16423C),
//         color: Colors.white70,
//         activeColor: const Color(0xFFF5EEDC),
//         items: const [
//           TabItem(icon: Icons.home, title: 'Home'),
//           TabItem(icon: Icons.search, title: 'Search'),
//           TabItem(icon: Icons.shopping_bag, title: 'Cart'), // Changed title
//           TabItem(icon: Icons.shopping_basket, title: 'Orders'),
//           TabItem(icon: Icons.person, title: 'Profile'),
//         ],
//         initialActiveIndex: _selectedIndex,
//         onTap: (int index) {
//           setState(() {
//             _selectedIndex = index;
//           });
//         },
//       ),
//     );
//   }
// }
//
//
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../My_order/my_order_screen.dart';
import '../dashboard/dashboard_screen.dart';
import '../profile/profile_screen.dart';
import '../search/search_screen.dart';

class BottomNavScreen extends StatelessWidget {
  final int initialIndex; // 👈 to open specific tab
  const BottomNavScreen({super.key, this.initialIndex = 0});

  @override
  Widget build(BuildContext context) {
    final NavController navController = Get.put(NavController());
    //navController.selectedIndex.value = initialIndex;

    // ✅ Initialize the index safely using post-frame callback
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (navController.selectedIndex.value != initialIndex) {
        navController.selectedIndex.value = initialIndex;
      }
    });

    final List<Widget> pages = [
      const HomeScreen(),
      const SearchScreen(),
      const Center(child: Text("Cart Screen")), // replace with your cart screen
      const MyOrderScreen(),
      const profilescreen(),
    ];

    return Obx(() => Scaffold(
      body: IndexedStack(
        index: navController.selectedIndex.value,
        children: pages,
      ),
      bottomNavigationBar: ConvexAppBar(
        style: TabStyle.flip,
        backgroundColor: const Color(0xFF16423C),
        color: Colors.white70,
        activeColor: Colors.white,
        items: const [
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.search, title: 'Search'),
          TabItem(icon: Icons.shopping_bag, title: 'Cart'),
          TabItem(icon: Icons.shopping_basket, title: 'Orders'),
          TabItem(icon: Icons.person, title: 'Profile'),
        ],
        initialActiveIndex: navController.selectedIndex.value,
        onTap: (i) => navController.changeTab(i),
      ),
    ));
  }
}




class NavController extends GetxController {
  var selectedIndex = 0.obs;

  void changeTab(int index) {
    selectedIndex.value = index;
  }
}
