// import 'package:flutter/material.dart';
//
// class profilescreen extends StatefulWidget {
//   const profilescreen({super.key});
//
//   @override
//   State<profilescreen> createState() => _profilescreenState();
// }
//
// class _profilescreenState extends State<profilescreen> {
//   final Color themeColor = const Color(0xFF16423C);
//   final List<Map<String, dynamic>> popular = [
//   {
//   'icon': Icons.home,
//   'searches': 'Home',
//   'arrow':Icons.arrow_forward_ios_outlined,
//
// },
// {
// 'icon': Icons.offline_pin_rounded,
// 'searches': ' My Order',
// 'arrow':Icons.arrow_forward_ios_outlined,
//
//
// },
// {
// 'icon': Icons.person,
// 'searches': 'Edit Profile',
// 'arrow':Icons.arrow_forward_ios_outlined,
//
// },
// {
// 'icon': Icons.people_alt,
// 'searches': 'Change Password',
// 'arrow':Icons.arrow_forward_ios_outlined,
//
// },{
// 'icon': Icons.notifications,
// 'searches': 'Notification',
// 'arrow':Icons.arrow_forward_ios_outlined,
//
// },{
// 'icon': Icons.branding_watermark_sharp,
// 'searches': 'Terms & Conditions',
// 'arrow':Icons.arrow_forward_ios_outlined,
//
// },{
// 'icon': Icons.privacy_tip,
// 'searches': 'Privacy Policy',
// 'arrow':Icons.arrow_forward_ios_outlined,
//
// },{
// 'icon': Icons.logout,
// 'searches': 'Logout',
// 'arrow':Icons.arrow_forward_ios_outlined,
//
// },
// ];
//
//
//   void _showLogoutDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String selected = ''; // Track selected button
//
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               backgroundColor: const Color(0xFFF2E8CF),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               title: const Text(
//                 "Logout",
//                 style: TextStyle(
//                   color: Color(0xFF16423C),
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               content: const Text(
//                 "Are you sure you want to logout?",
//                 style: TextStyle(color: Color(0xFF16423C)),
//                 textAlign: TextAlign.center,
//               ),
//               actions: [
//                 Center(
//                   child: Column(
//                     children: [
//                       // Cancel Button
//                       SizedBox(
//                         width: 220, // 👈 Increase this value to make button wider
//                         child: TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: selected == 'cancel'
//                                 ? const Color(0xFF16423C)
//                                 : Colors.white,
//                             side: const BorderSide(color: Color(0xFF16423C)),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           onPressed: () {
//                             setState(() => selected = 'cancel');
//                           },
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(
//                               color: selected == 'cancel'
//                                   ? Colors.white
//                                   : const Color(0xFF16423C),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 12),
//
//                       // Logout Button
//                       SizedBox(
//                         width: 220, // 👈 Same width as above for consistency
//                         child: TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: selected == 'logout'
//                                 ? const Color(0xFF16423C)
//                                 : Colors.white,
//                             side: const BorderSide(color: Color(0xFF16423C)),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           onPressed: () {
//                             setState(() => selected = 'logout');
//                             print("User logged out");
//                           },
//                           child: Text(
//                             "Logout",
//                             style: TextStyle(
//                               color: selected == 'logout'
//                                   ? Colors.white
//                                   : const Color(0xFF16423C),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: Icon(Icons.arrow_back,color: Colors.white,),
//         backgroundColor: Color(0xFF16423C),
//         title: Text("Profile",style: TextStyle(color: Colors.white),),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: popular.asMap().entries.map((entry) {
//             final index = entry.key;
//             final search = entry.value;
//
//             return Column(
//               children: [
//
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: (){
//             if (search['searches'] == "Logout") {
//                       _showLogoutDialog();
//                     }
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         // Your background color
//                         borderRadius: BorderRadius.circular(0), // Remove border radius for clean lines
//                       ),
//                       child: Row(
//                         children: [
//                            Icon(search['icon'],
//                            color: Color(0xFF16423C),),
//                           SizedBox(width: 25,),
//
//                           // Product Details
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   search['searches'],
//                                   style: const TextStyle(
//                                     color: Color(0xFF16423C),
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//
//
//
//                               ],
//                             ),
//                           ),
//                           Icon(search['arrow'],color: Color(0xFF16423C),),
//
//
//
//
//
//
//
//                         ],
//
//
//
//                       ),
//                     ),
//                   ),
//                 ),
//                 // Add divider line between items (except after the last one)
//
//                   Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: Container(
//                       height: 1,
//                       color: Colors.black, // Line color
//                       margin: const EdgeInsets.symmetric(horizontal: 16), // Optional: add horizontal margin to line
//                     ),
//                   ),
//
//               ],
//             );
//           }).toList(),
//         ),
//       ),
//
//
//
//
//
//     );
//   }
// }

//
// import 'package:ecommerce/screens/edit_Profile/edit_profile_screen.dart';
// import 'package:ecommerce/screens/notifications/notification_screen.dart';
// import 'package:ecommerce/screens/privacy_policy/privacy_policy_screen.dart';
// import 'package:ecommerce/screens/terms_conditions/terms_conditions_screen.dart';
// import 'package:flutter/material.dart';
//
// import '../My_order/my_order_screen.dart';
// import '../change_password/change_password_screen.dart';
// import '../dashboard/dashboard_screen.dart';
//
// class profilescreen extends StatefulWidget {
//   const profilescreen({super.key});
//
//   @override
//   State<profilescreen> createState() => _profilescreenState();
// }
//
// class _profilescreenState extends State<profilescreen> {
//   final Color themeColor = const Color(0xFF16423C);
//   final List<Map<String, dynamic>> popular = [
//     {
//       'icon': Icons.home,
//       'searches': 'Home',
//       'arrow': Icons.arrow_forward_ios_outlined,
//     },
//     {
//       'icon': Icons.offline_pin_rounded,
//       'searches': 'My Order',
//       'arrow': Icons.arrow_forward_ios_outlined,
//     },
//     {
//       'icon': Icons.person,
//       'searches': 'Edit Profile',
//       'arrow': Icons.arrow_forward_ios_outlined,
//     },
//     {
//       'icon': Icons.people_alt,
//       'searches': 'Change Password',
//       'arrow': Icons.arrow_forward_ios_outlined,
//     },
//     {
//       'icon': Icons.notifications,
//       'searches': 'Notification',
//       'arrow': Icons.arrow_forward_ios_outlined,
//     },
//     {
//       'icon': Icons.branding_watermark_sharp,
//       'searches': 'Terms & Conditions',
//       'arrow': Icons.arrow_forward_ios_outlined,
//     },
//     {
//       'icon': Icons.privacy_tip,
//       'searches': 'Privacy Policy',
//       'arrow': Icons.arrow_forward_ios_outlined,
//     },
//     {
//       'icon': Icons.logout,
//       'searches': 'Logout',
//       'arrow': Icons.arrow_forward_ios_outlined,
//     },
//   ];
//
//   // Navigation method for all menu items
//   void _handleMenuItemTap(String menuItem) {
//     switch (menuItem) {
//       case "Home":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => HomeScreen()), // Replace with your actual screen
//         );
//         break;
//       case "My Order":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => MyOrderScreen()), // Replace with your actual screen
//         );
//         break;
//       case "Edit Profile":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => editprofilescreen()), // Replace with your actual screen
//         );
//         break;
//       case "Change Password":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => ChangePasswordScreen()), // Replace with your actual screen
//         );
//         break;
//       case "Notification":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => notificationscreen()), // Replace with your actual screen
//         );
//         break;
//       case "Terms & Conditions":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => termaandconditions()), // Replace with your actual screen
//         );
//         break;
//       case "Privacy Policy":
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => privacypolicy()), // Replace with your actual screen
//         );
//         break;
//       case "Logout":
//         _showLogoutDialog();
//         break;
//     }
//   }
//   void _showLogoutDialog() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String selected = ''; // Track selected button
//
//         return StatefulBuilder(
//           builder: (context, setState) {
//             return AlertDialog(
//               backgroundColor: const Color(0xFFF2E8CF),
//               shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.circular(16),
//               ),
//               title: const Text(
//                 "Logout",
//                 style: TextStyle(
//                   color: Color(0xFF16423C),
//                   fontWeight: FontWeight.bold,
//                 ),
//                 textAlign: TextAlign.center,
//               ),
//               content: const Text(
//                 "Are you sure you want to logout?",
//                 style: TextStyle(color: Color(0xFF16423C)),
//                 textAlign: TextAlign.center,
//               ),
//               actions: [
//                 Center(
//                   child: Column(
//                     children: [
//                       // Cancel Button
//                       SizedBox(
//                         width: 220, // 👈 Increase this value to make button wider
//                         child: TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: selected == 'cancel'
//                                 ? const Color(0xFF16423C)
//                                 : Colors.white,
//                             side: const BorderSide(color: Color(0xFF16423C)),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           onPressed: () {
//                             setState(() => selected = 'cancel');
//                           },
//                           child: Text(
//                             "Cancel",
//                             style: TextStyle(
//                               color: selected == 'cancel'
//                                   ? Colors.white
//                                   : const Color(0xFF16423C),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//
//                       const SizedBox(height: 12),
//
//                       // Logout Button
//                       SizedBox(
//                         width: 220, // 👈 Same width as above for consistency
//                         child: TextButton(
//                           style: TextButton.styleFrom(
//                             backgroundColor: selected == 'logout'
//                                 ? const Color(0xFF16423C)
//                                 : Colors.white,
//                             side: const BorderSide(color: Color(0xFF16423C)),
//                             padding: const EdgeInsets.symmetric(vertical: 14),
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(8),
//                             ),
//                           ),
//                           onPressed: () {
//                             setState(() => selected = 'logout');
//                             print("User logged out");
//                           },
//                           child: Text(
//                             "Logout",
//                             style: TextStyle(
//                               color: selected == 'logout'
//                                   ? Colors.white
//                                   : const Color(0xFF16423C),
//                               fontWeight: FontWeight.bold,
//                               fontSize: 16,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           },
//         );
//       },
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         leading: IconButton(
//           icon: Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.of(context).pop(),
//         ),
//         backgroundColor: Color(0xFF16423C),
//         title: Text("Profile", style: TextStyle(color: Colors.white)),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: popular.asMap().entries.map((entry) {
//             final index = entry.key;
//             final search = entry.value;
//
//             return Column(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: GestureDetector(
//                     onTap: () {
//                       _handleMenuItemTap(search['searches']);
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                       child: Row(
//                         children: [
//                           Icon(search['icon'], color: Color(0xFF16423C)),
//                           SizedBox(width: 25),
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   search['searches'],
//                                   style: const TextStyle(
//                                     color: Color(0xFF16423C),
//                                     fontSize: 18,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                               ],
//                             ),
//                           ),
//                           Icon(search['arrow'], color: Color(0xFF16423C)),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     height: 1,
//                     color: Colors.black,
//                     margin: const EdgeInsets.symmetric(horizontal: 16),
//                   ),
//                 ),
//               ],
//             );
//           }).toList(),
//         ),
//       ),
//     );
//   }
// }

import 'package:ecommerce/screens/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bottom_nav/bottom_nav_screen.dart';
import '../change_password/change_password_screen.dart';
import '../edit_Profile/edit_profile_screen.dart';
import '../notifications/notification_screen.dart';
import '../privacy_policy/privacy_policy_screen.dart';
import '../terms_conditions/terms_conditions_screen.dart';

class profilescreen extends StatelessWidget {
  const profilescreen({super.key});

  void _navigate(BuildContext context, String title) {
    switch (title) {
      case "Home":
        Get.offAll(() => const BottomNavScreen(initialIndex: 0));
        break;

      case "My Order":
        Get.offAll(() => const BottomNavScreen(initialIndex: 3));
        break;
      case "Edit Profile":
        Navigator.push(context, MaterialPageRoute(builder: (_) =>  editprofilescreen()));
        break;
      case "Change Password":
        Navigator.push(context, MaterialPageRoute(builder: (_) =>  ChangePasswordScreen()));
        break;
      case "Notification":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const notificationscreen()));
        break;
      case "Terms & Conditions":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const termaandconditions()));
        break;
      case "Privacy Policy":
        Navigator.push(context, MaterialPageRoute(builder: (_) => const privacypolicy()));
        break;
      case "Logout":
      // your logout logic here
        _showLogoutDialog(context);
        break;
    }
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        final screenWidth = MediaQuery
            .of(context)
            .size
            .width;

        return
          AlertDialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            title: const Text(
              "Logout",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF16423C)),
            ),
            content: const Text(
              "Are you sure you want to logout?",
              style: TextStyle(color: Color(0xFF16423C)),
            ),
            actions: [

              TextButton(
                onPressed: () => Navigator.pop(context),
                child: const Text(
                    "Cancel", style: TextStyle(color: Colors.grey)),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF16423C),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () {
                  Navigator.pop(context);
                  _logoutUser();
                },
                child: const Text(
                    "Logout", style: TextStyle(color: Colors.white,),),
              ),
            ],
          );

      },);
  }

  void _logoutUser() async {
    // ✅ (Optional) Clear local storage if you’re using shared preferences
    // final prefs = await SharedPreferences.getInstance();
    // await prefs.clear();

    // ✅ Navigate to Login and remove all previous routes
    Get.offAll(() =>  LoginScreen());
  }


  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> menu = [
      {'icon': Icons.home, 'title': 'Home'},
      {'icon': Icons.shopping_basket, 'title': 'My Order'},
      {'icon': Icons.person, 'title': 'Edit Profile'},
      {'icon': Icons.lock, 'title': 'Change Password'},
      {'icon': Icons.notifications, 'title': 'Notification'},
      {'icon': Icons.branding_watermark, 'title': 'Terms & Conditions'},
      {'icon': Icons.privacy_tip, 'title': 'Privacy Policy'},
      {'icon': Icons.logout, 'title': 'Logout'},
    ];

    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final isTablet = screenWidth > 600;


    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back,color: Colors.white,),
        title: const Text("Profile", style: TextStyle(color: Colors.white)),
        backgroundColor: const Color(0xFF16423C),
        
      ),
      body: ListView.separated(
        itemCount: menu.length,
        separatorBuilder: (_, __) => const Divider(),
        itemBuilder: (context, index) {
          final item = menu[index];
          return ListTile(
            leading: Icon(item['icon'], color: const Color(0xFF16423C)),
            title: Text(
              item['title'],
              style: const TextStyle(color: Color(0xFF16423C), fontSize: 18),
            ),
            trailing: const Icon(Icons.arrow_forward_ios, color: Color(0xFF16423C), size: 18),
            onTap: () => _navigate(context, item['title']),
          );
        },
      ),
    );
  }
}

