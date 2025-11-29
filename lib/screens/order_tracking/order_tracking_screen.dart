// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
//
// import 'order_tracking_controller.dart';
//
//
// class OrderTrackingScreen extends StatefulWidget {
//   const OrderTrackingScreen({super.key});
//
//   @override
//   State<OrderTrackingScreen> createState() => _OrderTrackingScreenState();
// }
//
// class _OrderTrackingScreenState extends State<OrderTrackingScreen> {
//   final OrderTrackingController controller = Get.put(OrderTrackingController());
//
//   GoogleMapController? mapController;
//   final LatLng deliveryLocation = const LatLng(22.3039, 70.8022); // Example: Rajkot
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2E8CF),
//       appBar: AppBar(
//         backgroundColor: const Color(0xFF004B41),
//         title: const Text("Order Tracking", style: TextStyle(color: Colors.white)),
//         centerTitle: true,
//       ),
//       body: Stack(
//         children: [
//           // Google Map
//           GoogleMap(
//             onMapCreated: (GoogleMapController controller) {
//               mapController = controller;
//             },
//             initialCameraPosition: CameraPosition(
//               target: deliveryLocation,
//               zoom: 13,
//             ),
//             markers: {
//               Marker(
//                 markerId: const MarkerId("deliveryPartner"),
//                 position: deliveryLocation,
//                 infoWindow: const InfoWindow(title: "Alexander JR"),
//               ),
//             },
//           ),
//
//           // Overlay white card (floating)
//           Align(
//             alignment: Alignment.bottomCenter,
//             child: Container(
//               margin: const EdgeInsets.only(bottom: 20),
//               padding: const EdgeInsets.all(20),
//               width: MediaQuery.of(context).size.width * 0.9,
//               decoration: BoxDecoration(
//                 color: Colors.white,
//                 borderRadius: BorderRadius.circular(20),
//                 boxShadow: [
//                   BoxShadow(
//                       color: Colors.black.withOpacity(0.2),
//                       blurRadius: 10,
//                       offset: const Offset(0, 3))
//                 ],
//               ),
//               child: Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   // Top Row (Image + Name + Call)
//                   Row(
//                     children: [
//                       ClipRRect(
//                         borderRadius: BorderRadius.circular(40),
//                         child: Image.asset(
//                           'assets/images/systemlogo.png',
//                           width: 60,
//                           height: 60,
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       const SizedBox(width: 12),
//                       const Expanded(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Text("Alexander JR",
//                                 style: TextStyle(
//                                     fontWeight: FontWeight.bold, fontSize: 16)),
//                             Text("Delivery Partner",
//                                 style: TextStyle(color: Colors.grey)),
//                           ],
//                         ),
//                       ),
//                       Container(
//                         decoration: const BoxDecoration(
//                           color: Color(0xFF004B41),
//                           shape: BoxShape.circle,
//                         ),
//                         padding: const EdgeInsets.all(8),
//                         child: const Icon(Icons.call, color: Colors.white, size: 20),
//                       )
//                     ],
//                   ),
//                   const SizedBox(height: 16),
//
//                   // Status steps (Reactive)
//                   Obx(() {
//                     String current = controller.currentStatus.value;
//                     return Column(
//                       children: [
//                         _buildStatusRow("Order Packed", current == "packed" || current == "shipped" || current == "outForDelivery" || current == "delivered"),
//                         _buildDivider(),
//                         _buildStatusRow("Shipped", current == "shipped" || current == "outForDelivery" || current == "delivered"),
//                         _buildDivider(),
//                         _buildStatusRow("Out for Delivery", current == "outForDelivery" || current == "delivered"),
//                         _buildDivider(),
//                         _buildStatusRow("Delivered", current == "delivered"),
//                       ],
//                     );
//                   }),
//                   const SizedBox(height: 16),
//
//                   // Go To Home Button
//                   SizedBox(
//                     width: double.infinity,
//                     height: 50,
//                     child: ElevatedButton(
//                       onPressed: () {},
//                       style: ElevatedButton.styleFrom(
//                         backgroundColor: const Color(0xFF004B41),
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                       ),
//                       child: const Text("Go To Home",
//                           style: TextStyle(color: Colors.white, fontSize: 16)),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildStatusRow(String title, bool active) {
//     return Row(
//       children: [
//         Container(
//           width: 20,
//           height: 20,
//           decoration: BoxDecoration(
//             color: active ? const Color(0xFF004B41) : Colors.white,
//             border: Border.all(color: const Color(0xFF004B41)),
//             shape: BoxShape.circle,
//           ),
//           child: active
//               ? const Icon(Icons.check, size: 12, color: Colors.white)
//               : const SizedBox(),
//         ),
//         const SizedBox(width: 12),
//         Text(
//           title,
//           style: TextStyle(
//               color: active ? Colors.black : Colors.grey,
//               fontWeight: FontWeight.w500),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildDivider() {
//     return Container(
//       height: 24,
//       width: 2,
//       color: const Color(0xFF004B41),
//       margin: const EdgeInsets.only(left: 9),
//     );
//   }
// }
//
//
// // import 'package:flutter/material.dart';
// //
// // class OrderTrackingScreen extends StatelessWidget {
// //   const OrderTrackingScreen({Key? key}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF2E8CF),
// //       appBar: AppBar(
// //         backgroundColor: const Color(0xFF16423C),
// //         title: const Text(
// //           "Order Tracking",
// //           style: TextStyle(color: Colors.white),
// //         ),
// //         centerTitle: true,
// //         leading: IconButton(
// //           icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
// //           onPressed: () => Navigator.pop(context),
// //         ),
// //       ),
// //
// //       body: Column(
// //         children: [
// //           // 🗺️ Static Map Image Placeholder
// //           Container(
// //             height: MediaQuery.of(context).size.height * 0.4,
// //             width: double.infinity,
// //             decoration: BoxDecoration(
// //               borderRadius: const BorderRadius.only(
// //                 bottomLeft: Radius.circular(20),
// //                 bottomRight: Radius.circular(20),
// //               ),
// //               image: const DecorationImage(
// //                 image: AssetImage('assets/images/static_map.jpg'),
// //                 fit: BoxFit.cover,
// //               ),
// //             ),
// //             child: Stack(
// //               alignment: Alignment.center,
// //               children: [
// //                 // Pin Icon
// //                 Column(
// //                   mainAxisAlignment: MainAxisAlignment.center,
// //                   children: const [
// //                     Icon(Icons.location_on, size: 50, color: Colors.red),
// //                     SizedBox(height: 8),
// //                     Text(
// //                       "Rajkot, India",
// //                       style: TextStyle(
// //                         color: Colors.white,
// //                         fontWeight: FontWeight.bold,
// //                         backgroundColor: Colors.black54,
// //                       ),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //
// //           const SizedBox(height: 20),
// //
// //           // 👨‍💼 Delivery Partner Card
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 16.0),
// //             child: Container(
// //               padding: const EdgeInsets.all(16),
// //               decoration: BoxDecoration(
// //                 color: Colors.white,
// //                 borderRadius: BorderRadius.circular(16),
// //                 boxShadow: [
// //                   BoxShadow(
// //                     color: Colors.black12,
// //                     blurRadius: 6,
// //                     offset: const Offset(0, 3),
// //                   ),
// //                 ],
// //               ),
// //               child: Row(
// //                 children: [
// //                   const CircleAvatar(
// //                     radius: 28,
// //                     backgroundImage: NetworkImage(
// //                       'https://i.imgur.com/BoN9kdC.png',
// //                     ),
// //                   ),
// //                   const SizedBox(width: 16),
// //                   const Expanded(
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         Text(
// //                           'Alexander JR',
// //                           style: TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             color: Color(0xFF16423C),
// //                             fontSize: 16,
// //                           ),
// //                         ),
// //                         SizedBox(height: 4),
// //                         Text(
// //                           'Delivery Partner',
// //                           style: TextStyle(color: Colors.grey, fontSize: 14),
// //                         ),
// //                       ],
// //                     ),
// //                   ),
// //                   Container(
// //                     decoration: BoxDecoration(
// //                       color: const Color(0xFF16423C),
// //                       borderRadius: BorderRadius.circular(8),
// //                     ),
// //                     child: IconButton(
// //                       onPressed: () {},
// //                       icon: const Icon(Icons.call, color: Colors.white),
// //                     ),
// //                   )
// //                 ],
// //               ),
// //             ),
// //           ),
// //
// //           const SizedBox(height: 25),
// //
// //           // 📦 Order Status
// //           Padding(
// //             padding: const EdgeInsets.symmetric(horizontal: 30.0),
// //             child: Column(
// //               children: [
// //                 _buildStatusStep("Order Packaging", true),
// //                 _buildDivider(),
// //                 _buildStatusStep("Shipped", true),
// //                 _buildDivider(),
// //                 _buildStatusStep("Out for Delivery", false),
// //                 _buildDivider(),
// //                 _buildStatusStep("Delivered", false),
// //               ],
// //             ),
// //           ),
// //
// //           const Spacer(),
// //
// //           // 🏠 Go to Home Button
// //           Padding(
// //             padding: const EdgeInsets.all(16.0),
// //             child: SizedBox(
// //               width: double.infinity,
// //               height: 48,
// //               child: ElevatedButton(
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: const Color(0xFF16423C),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                 ),
// //                 onPressed: () => Navigator.pop(context),
// //                 child: const Text(
// //                   "Go To Home",
// //                   style: TextStyle(
// //                     color: Colors.white,
// //                     fontWeight: FontWeight.bold,
// //                   ),
// //                 ),
// //               ),
// //             ),
// //           )
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // ✅ Helper widgets for status steps
// //   Widget _buildStatusStep(String title, bool isDone) {
// //     return Row(
// //       children: [
// //         Icon(
// //           isDone ? Icons.check_circle : Icons.radio_button_unchecked,
// //           color: isDone ? const Color(0xFF16423C) : Colors.grey,
// //         ),
// //         const SizedBox(width: 12),
// //         Text(
// //           title,
// //           style: TextStyle(
// //             color: isDone ? const Color(0xFF16423C) : Colors.grey,
// //             fontWeight: FontWeight.w600,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildDivider() {
// //     return Container(
// //       margin: const EdgeInsets.only(left: 11),
// //       height: 20,
// //       width: 2,
// //       color: Colors.grey.shade400,
// //     );
// //   }
// // }
