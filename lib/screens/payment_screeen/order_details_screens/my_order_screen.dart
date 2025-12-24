// // // import 'package:ecommerce/screens/payment_screeen/order_sub_Details_screen/order_sub_detail_controller.dart';
// // // import 'package:flutter/material.dart';
// // // import 'package:get/get.dart';
// // // import 'package:get/get_core/src/get_main.dart';
// // //
// // // class MyOrderScreen extends StatefulWidget {
// // //   const MyOrderScreen({super.key});
// // //
// // //   @override
// // //   State<MyOrderScreen> createState() => _MyOrderScreenState();
// // // }
// // //
// // // class _MyOrderScreenState extends State<MyOrderScreen>
// // //     with SingleTickerProviderStateMixin {
// // //   late TabController _tabController;
// // //   //final OrderSubdetailController orderController = Get.put(OrderSubdetailController()); // Add this
// // //
// // //
// // //   final Color primaryColor = const Color(0xFF16423C);
// // //   final Color backgroundColor = const Color(0xFFF8F3E7);
// // //
// // //   @override
// // //   void initState() {
// // //     super.initState();
// // //     _tabController = TabController(length: 2, vsync: this);
// // //   }
// // //
// // //   @override
// // //   void dispose() {
// // //     _tabController.dispose();
// // //     super.dispose();
// // //   }
// // //
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       //backgroundColor: backgroundColor,
// // //       backgroundColor: Color(0xFFF2E8CF),
// // //       appBar: AppBar(
// // //         backgroundColor: primaryColor,
// // //         leading: InkWell(onTap: (){
// // //           Get.back();
// // //         },
// // //             child: const Icon(Icons.arrow_back, color: Colors.white)),
// // //         title: const Text(
// // //           "My Order",
// // //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// // //         ),
// // //         centerTitle: true,
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           const SizedBox(height: 20),
// // //           _buildTabBar(),
// // //           const SizedBox(height: 20),
// // //           Expanded(
// // //             child: TabBarView(
// // //               controller: _tabController,
// // //               children: [
// // //                 _buildOrderList(), // My Order tab
// // //                 _buildOrderList(isHistory: true), // History tab
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildTabBar() {
// // //     return Padding(
// // //       padding: const EdgeInsets.symmetric(horizontal: 16),
// // //       child: Container(
// // //         height: 50,
// // //         decoration: BoxDecoration(
// // //           color: Color(0xFFF2E8CF),
// // //           borderRadius: BorderRadius.circular(12),
// // //           border: Border.all()
// // //         ),
// // //         child: TabBar(
// // //           controller: _tabController,
// // //           indicator: BoxDecoration(
// // //             color: primaryColor,
// // //             borderRadius: BorderRadius.circular(10),
// // //           ),
// // //           labelColor: Colors.white,
// // //           unselectedLabelColor: primaryColor,
// // //           indicatorSize: TabBarIndicatorSize.tab,
// // //           labelStyle:
// // //           const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // //           tabs: const [
// // //             Tab(text: 'My Order'),
// // //             Tab(text: 'History'),
// // //           ],
// // //         ),
// // //       ),
// // //     );
// // //   }
// // //
// // //   Widget _buildOrderList({bool isHistory = false}) {
// // //     return ListView.builder(
// // //       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // //       itemCount: 2,
// // //       itemBuilder: (context, index) {
// // //         return _buildOrderCard(isHistory: isHistory);
// // //       },
// // //     );
// // //   }
// // //
// // //   Widget _buildOrderCard({bool isHistory = false}) {
// // //     return Container(
// // //       margin: const EdgeInsets.only(bottom: 20),
// // //       padding: const EdgeInsets.all(12),
// // //       decoration: BoxDecoration(
// // //         color: Color(0xFFF2E8CF),
// // //         borderRadius: BorderRadius.circular(12),
// // //         border: Border.all(color: Colors.grey),
// // //       ),
// // //       child: Row(
// // //         crossAxisAlignment: CrossAxisAlignment.start,
// // //         children: [
// // //           ClipRRect(
// // //             borderRadius: BorderRadius.circular(8),
// // //             child: Image.asset(
// // //               "assets/images/myorderimage.png",
// // //               height: 70,
// // //               width: 70,
// // //               fit: BoxFit.cover,
// // //             ),
// // //           ),
// // //           const SizedBox(width: 12),
// // //           Expanded(
// // //             child: Column(
// // //               crossAxisAlignment: CrossAxisAlignment.start,
// // //               children: [
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: [
// // //                     Expanded(
// // //                       child: const Text(
// // //                         "Modern Light Clothes",
// // //                         style:
// // //                         TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
// // //                       ),
// // //                     ),
// // //                     Container(
// // //                       padding: const EdgeInsets.symmetric(
// // //                           horizontal: 10, vertical: 4),
// // //                       decoration: BoxDecoration(
// // //                         borderRadius: BorderRadius.circular(20),
// // //                         border: Border.all(color: primaryColor),
// // //                       ),
// // //                       child: Text(
// // //                         isHistory ? "Delivered" : "On Progress",
// // //                         style: TextStyle(
// // //                           fontSize: 12,
// // //                           color: primaryColor,
// // //                           fontWeight: FontWeight.w600,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 4),
// // //                 const Text(
// // //                   "T-shirt",
// // //                   style: TextStyle(color: Colors.grey, fontSize: 14),
// // //                 ),
// // //                 const SizedBox(height: 6),
// // //                 Row(
// // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // //                   children: const [
// // //                     Expanded(
// // //                       child: Text(
// // //                         "\$40.00",
// // //                         style: TextStyle(
// // //                           fontWeight: FontWeight.bold,
// // //                           fontSize: 16,
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     Text(
// // //                       "Qty : 1",
// // //                       style: TextStyle(color: Colors.black87, fontSize: 14),
// // //                     ),
// // //                   ],
// // //                 ),
// // //                 const SizedBox(height: 10),
// // //                 Row(
// // //                   children: [
// // //                     Expanded(
// // //                       child: OutlinedButton(
// // //                         onPressed: () {},
// // //                         style: OutlinedButton.styleFrom(
// // //                           side: BorderSide(color: primaryColor),
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(10),
// // //                           ),
// // //                           backgroundColor: const Color(0xFFF2E8CF),
// // //                         ),
// // //                         child: const Text(
// // //                           "Details",
// // //                           style: TextStyle(color: Colors.black),
// // //                         ),
// // //                       ),
// // //                     ),
// // //                     const SizedBox(width: 12),
// // //                     Expanded(
// // //                       child: ElevatedButton(
// // //                         onPressed: () {},
// // //                         style: ElevatedButton.styleFrom(
// // //                           backgroundColor: primaryColor,
// // //                           shape: RoundedRectangleBorder(
// // //                             borderRadius: BorderRadius.circular(10),
// // //                           ),
// // //                         ),
// // //                         child: const Text("Tracking",style: TextStyle(color: Colors.white),),
// // //                       ),
// // //                     ),
// // //                   ],
// // //                 ),
// // //               ],
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// // //
// // //
// // // //
// // // // import 'package:flutter/material.dart';
// // // // import 'package:get/get.dart';
// // // //
// // // // import 'order_detail_controllers.dart';
// // // // import 'order_details_model.dart' show OrderData;
// // // //
// // // //
// // // // class MyOrderScreen extends StatefulWidget {
// // // //   const MyOrderScreen({super.key});
// // // //
// // // //   @override
// // // //   State<MyOrderScreen> createState() => _MyOrderScreenState();
// // // // }
// // // //
// // // // class _MyOrderScreenState extends State<MyOrderScreen>
// // // //     with SingleTickerProviderStateMixin {
// // // //   late TabController _tabController;
// // // //   final OrderListController orderController = Get.put(OrderListController());
// // // //
// // // //   final Color primaryColor = const Color(0xFF16423C);
// // // //
// // // //   @override
// // // //   void initState() {
// // // //     super.initState();
// // // //     _tabController = TabController(length: 2, vsync: this);
// // // //
// // // //     // Fetch orders when screen loads
// // // //     WidgetsBinding.instance.addPostFrameCallback((_) {
// // // //       orderController.fetchAllOrders();
// // // //     });
// // // //   }
// // // //
// // // //   @override
// // // //   void dispose() {
// // // //     _tabController.dispose();
// // // //     super.dispose();
// // // //   }
// // // //
// // // //   @override
// // // //   Widget build(BuildContext context) {
// // // //     return Scaffold(
// // // //       backgroundColor: const Color(0xFFF2E8CF),
// // // //       appBar: AppBar(
// // // //         backgroundColor: primaryColor,
// // // //         leading: InkWell(
// // // //           onTap: () => Get.back(),
// // // //           child: const Icon(Icons.arrow_back, color: Colors.white),
// // // //         ),
// // // //         title: const Text(
// // // //           "My Order",
// // // //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// // // //         ),
// // // //         centerTitle: true,
// // // //       ),
// // // //       body: Column(
// // // //         children: [
// // // //           const SizedBox(height: 20),
// // // //           _buildTabBar(),
// // // //           const SizedBox(height: 20),
// // // //           Expanded(
// // // //             child: TabBarView(
// // // //               controller: _tabController,
// // // //               children: [
// // // //                 _buildActiveOrdersList(), // My Order tab
// // // //                 _buildHistoryOrdersList(), // History tab
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildTabBar() {
// // // //     return Padding(
// // // //       padding: const EdgeInsets.symmetric(horizontal: 16),
// // // //       child: Container(
// // // //         height: 50,
// // // //         decoration: BoxDecoration(
// // // //           color: const Color(0xFFF2E8CF),
// // // //           borderRadius: BorderRadius.circular(12),
// // // //           border: Border.all(),
// // // //         ),
// // // //         child: TabBar(
// // // //           controller: _tabController,
// // // //           indicator: BoxDecoration(
// // // //             color: primaryColor,
// // // //             borderRadius: BorderRadius.circular(10),
// // // //           ),
// // // //           labelColor: Colors.white,
// // // //           unselectedLabelColor: primaryColor,
// // // //           indicatorSize: TabBarIndicatorSize.tab,
// // // //           labelStyle:
// // // //           const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// // // //           tabs: const [
// // // //             Tab(text: 'My Order'),
// // // //             Tab(text: 'History'),
// // // //           ],
// // // //         ),
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   Widget _buildActiveOrdersList() {
// // // //     return Obx(() {
// // // //       if (orderController.isLoading.value) {
// // // //         return const Center(
// // // //           child: CircularProgressIndicator(),
// // // //         );
// // // //       }
// // // //
// // // //       if (orderController.errorMessage.isNotEmpty) {
// // // //         return Center(
// // // //           child: Padding(
// // // //             padding: const EdgeInsets.all(20),
// // // //             child: Column(
// // // //               mainAxisAlignment: MainAxisAlignment.center,
// // // //               children: [
// // // //                 const Icon(Icons.error, color: Colors.red, size: 50),
// // // //                 const SizedBox(height: 16),
// // // //                 Text(
// // // //                   orderController.errorMessage.value,
// // // //                   textAlign: TextAlign.center,
// // // //                   style: const TextStyle(color: Colors.red, fontSize: 16),
// // // //                 ),
// // // //                 const SizedBox(height: 20),
// // // //                 ElevatedButton(
// // // //                   onPressed: () => orderController.fetchAllOrders(),
// // // //                   style: ElevatedButton.styleFrom(
// // // //                     backgroundColor: primaryColor,
// // // //                   ),
// // // //                   child: const Text('Retry'),
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         );
// // // //       }
// // // //
// // // //       if (orderController.activeOrders.isEmpty) {
// // // //         return const Center(
// // // //           child: Column(
// // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // //             children: [
// // // //               Icon(Icons.shopping_bag, size: 60, color: Colors.grey),
// // // //               SizedBox(height: 16),
// // // //               Text(
// // // //                 'No active orders',
// // // //                 style: TextStyle(fontSize: 18, color: Colors.grey),
// // // //               ),
// // // //               SizedBox(height: 8),
// // // //               Text(
// // // //                 'Your active orders will appear here',
// // // //                 style: TextStyle(fontSize: 14, color: Colors.grey),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         );
// // // //       }
// // // //
// // // //       return RefreshIndicator(
// // // //         onRefresh: () => orderController.fetchAllOrders(),
// // // //         color: primaryColor,
// // // //         child: ListView.builder(
// // // //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // //           itemCount: orderController.activeOrders.length,
// // // //           itemBuilder: (context, index) {
// // // //             final order = orderController.activeOrders[index];
// // // //             return _buildOrderCard(order, false);
// // // //           },
// // // //         ),
// // // //       );
// // // //     });
// // // //   }
// // // //
// // // //   Widget _buildHistoryOrdersList() {
// // // //     return Obx(() {
// // // //       if (orderController.isLoading.value) {
// // // //         return const Center(
// // // //           child: CircularProgressIndicator(),
// // // //         );
// // // //       }
// // // //
// // // //       if (orderController.errorMessage.isNotEmpty) {
// // // //         return Center(
// // // //           child: Text(
// // // //             orderController.errorMessage.value,
// // // //             style: const TextStyle(color: Colors.red),
// // // //           ),
// // // //         );
// // // //       }
// // // //
// // // //       if (orderController.historyOrders.isEmpty) {
// // // //         return const Center(
// // // //           child: Column(
// // // //             mainAxisAlignment: MainAxisAlignment.center,
// // // //             children: [
// // // //               Icon(Icons.history, size: 60, color: Colors.grey),
// // // //               SizedBox(height: 16),
// // // //               Text(
// // // //                 'No order history',
// // // //                 style: TextStyle(fontSize: 18, color: Colors.grey),
// // // //               ),
// // // //               SizedBox(height: 8),
// // // //               Text(
// // // //                 'Your completed orders will appear here',
// // // //                 style: TextStyle(fontSize: 14, color: Colors.grey),
// // // //               ),
// // // //             ],
// // // //           ),
// // // //         );
// // // //       }
// // // //
// // // //       return RefreshIndicator(
// // // //         onRefresh: () => orderController.fetchAllOrders(),
// // // //         color: primaryColor,
// // // //         child: ListView.builder(
// // // //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// // // //           itemCount: orderController.historyOrders.length,
// // // //           itemBuilder: (context, index) {
// // // //             final order = orderController.historyOrders[index];
// // // //             return _buildOrderCard(order, true);
// // // //           },
// // // //         ),
// // // //       );
// // // //     });
// // // //   }
// // // //
// // // //   Widget _buildOrderCard(OrderData order, bool isHistory) {
// // // //     final productName = orderController.getProductName(order);
// // // //     final productImage = orderController.getProductImage(order);
// // // //     final productAttributes = orderController.getProductAttributes(order);
// // // //     final displayPrice = orderController.getDisplayPrice(order);
// // // //     final totalQuantity = orderController.getTotalQuantity(order);
// // // //     final statusText = orderController.getStatusText(order.orderStatus);
// // // //     final statusColor = orderController.getStatusColor(order.orderStatus);
// // // //
// // // //     return Container(
// // // //       margin: const EdgeInsets.only(bottom: 20),
// // // //       padding: const EdgeInsets.all(12),
// // // //       decoration: BoxDecoration(
// // // //         color: const Color(0xFFF2E8CF),
// // // //         borderRadius: BorderRadius.circular(12),
// // // //         border: Border.all(color: Colors.grey),
// // // //       ),
// // // //       child: Row(
// // // //         crossAxisAlignment: CrossAxisAlignment.start,
// // // //         children: [
// // // //           // Product Image
// // // //           ClipRRect(
// // // //             borderRadius: BorderRadius.circular(8),
// // // //             child: productImage.isNotEmpty
// // // //                 ? Image.network(
// // // //               'https://anniecabs.com/emartnew/assets/images/$productImage',
// // // //               height: 70,
// // // //               width: 70,
// // // //               fit: BoxFit.cover,
// // // //               errorBuilder: (context, error, stackTrace) {
// // // //                 return Image.asset(
// // // //                   "assets/images/myorderimage.png",
// // // //                   height: 70,
// // // //                   width: 70,
// // // //                   fit: BoxFit.cover,
// // // //                 );
// // // //               },
// // // //               loadingBuilder: (context, child, loadingProgress) {
// // // //                 if (loadingProgress == null) return child;
// // // //                 return Container(
// // // //                   height: 70,
// // // //                   width: 70,
// // // //                   color: Colors.grey[200],
// // // //                   child: const Center(
// // // //                     child: CircularProgressIndicator(),
// // // //                   ),
// // // //                 );
// // // //               },
// // // //             )
// // // //                 : Image.asset(
// // // //               "assets/images/myorderimage.png",
// // // //               height: 70,
// // // //               width: 70,
// // // //               fit: BoxFit.cover,
// // // //             ),
// // // //           ),
// // // //           const SizedBox(width: 12),
// // // //           Expanded(
// // // //             child: Column(
// // // //               crossAxisAlignment: CrossAxisAlignment.start,
// // // //               children: [
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Expanded(
// // // //                       child: Text(
// // // //                         productName,
// // // //                         style: const TextStyle(
// // // //                           fontWeight: FontWeight.bold,
// // // //                           fontSize: 16,
// // // //                         ),
// // // //                         maxLines: 1,
// // // //                         overflow: TextOverflow.ellipsis,
// // // //                       ),
// // // //                     ),
// // // //                     Container(
// // // //                       padding: const EdgeInsets.symmetric(
// // // //                           horizontal: 10, vertical: 4),
// // // //                       decoration: BoxDecoration(
// // // //                         borderRadius: BorderRadius.circular(20),
// // // //                         border: Border.all(color: statusColor),
// // // //                       ),
// // // //                       child: Text(
// // // //                         statusText,
// // // //                         style: TextStyle(
// // // //                           fontSize: 12,
// // // //                           color: statusColor,
// // // //                           fontWeight: FontWeight.w600,
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 const SizedBox(height: 4),
// // // //                 if (productAttributes.isNotEmpty)
// // // //                   Text(
// // // //                     productAttributes,
// // // //                     style: const TextStyle(color: Colors.grey, fontSize: 14),
// // // //                   ),
// // // //                 const SizedBox(height: 4),
// // // //                 Text(
// // // //                   'Order ID: #${order.id}',
// // // //                   style: const TextStyle(color: Colors.grey, fontSize: 12),
// // // //                 ),
// // // //                 const SizedBox(height: 6),
// // // //                 Row(
// // // //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // // //                   children: [
// // // //                     Expanded(
// // // //                       child: Text(
// // // //                         displayPrice,
// // // //                         style: const TextStyle(
// // // //                           fontWeight: FontWeight.bold,
// // // //                           fontSize: 16,
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                     Text(
// // // //                       "Qty : $totalQuantity",
// // // //                       style: const TextStyle(color: Colors.black87, fontSize: 14),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //                 const SizedBox(height: 10),
// // // //                 Row(
// // // //                   children: [
// // // //                     Expanded(
// // // //                       child: OutlinedButton(
// // // //                         onPressed: () => _showOrderDetails(order.id),
// // // //                         style: OutlinedButton.styleFrom(
// // // //                           side: BorderSide(color: primaryColor),
// // // //                           shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(10),
// // // //                           ),
// // // //                           backgroundColor: const Color(0xFFF2E8CF),
// // // //                         ),
// // // //                         child: const Text(
// // // //                           "Details",
// // // //                           style: TextStyle(color: Colors.black),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                     const SizedBox(width: 12),
// // // //                     Expanded(
// // // //                       child: ElevatedButton(
// // // //                         onPressed: () {
// // // //                           _showTrackingInfo(order);
// // // //                         },
// // // //                         style: ElevatedButton.styleFrom(
// // // //                           backgroundColor: primaryColor,
// // // //                           shape: RoundedRectangleBorder(
// // // //                             borderRadius: BorderRadius.circular(10),
// // // //                           ),
// // // //                         ),
// // // //                         child: const Text(
// // // //                           "Tracking",
// // // //                           style: TextStyle(color: Colors.white),
// // // //                         ),
// // // //                       ),
// // // //                     ),
// // // //                   ],
// // // //                 ),
// // // //               ],
// // // //             ),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   void _showOrderDetails(int orderId) {
// // // //     // You can navigate to a detailed order screen or show a dialog
// // // //     Get.dialog(
// // // //       AlertDialog(
// // // //         title: const Text('Order Details'),
// // // //         content: Text('Showing details for order #$orderId'),
// // // //         actions: [
// // // //           TextButton(
// // // //             onPressed: () => Get.back(),
// // // //             child: const Text('Close'),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // //
// // // //   void _showTrackingInfo(OrderData order) {
// // // //     Get.dialog(
// // // //       AlertDialog(
// // // //         title: const Text('Order Tracking'),
// // // //         content: SingleChildScrollView(
// // // //           child: Column(
// // // //             crossAxisAlignment: CrossAxisAlignment.start,
// // // //             mainAxisSize: MainAxisSize.min,
// // // //             children: [
// // // //               Text('Order ID: #${order.id}'),
// // // //               const SizedBox(height: 10),
// // // //               Text('Status: ${order.orderStatus}'),
// // // //               const SizedBox(height: 10),
// // // //               Text('Order Date: ${order.createdAt}'),
// // // //               const SizedBox(height: 10),
// // // //               Text('Last Updated: ${order.updatedAt}'),
// // // //               const SizedBox(height: 20),
// // // //               const Text('Shipping Address:', style: TextStyle(fontWeight: FontWeight.bold)),
// // // //               Text(order.shippingInfo.fullName),
// // // //               Text(order.shippingInfo.shipEmail),
// // // //               Text(order.shippingInfo.shipPhone),
// // // //               Text(order.shippingInfo.fullAddress),
// // // //             ],
// // // //           ),
// // // //         ),
// // // //         actions: [
// // // //           TextButton(
// // // //             onPressed: () => Get.back(),
// // // //             child: const Text('Close'),
// // // //           ),
// // // //         ],
// // // //       ),
// // // //     );
// // // //   }
// // // // }
// //
// //
// // import 'package:ecommerce/screens/payment_screeen/order_details_screens/order_details_model.dart';
// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// // import 'order_detail_controllers.dart';
// //
// //
// //
// // class MyOrderScreen extends StatefulWidget {
// //   const MyOrderScreen({super.key});
// //
// //   @override
// //   State<MyOrderScreen> createState() => _MyOrderScreenState();
// // }
// //
// // class _MyOrderScreenState extends State<MyOrderScreen>
// //     with SingleTickerProviderStateMixin {
// //   late TabController _tabController;
// //   final OrderListController orderController = Get.put(OrderListController());
// //   final Color primaryColor = const Color(0xFF16423C);
// //
// //   @override
// //   void initState() {
// //     super.initState();
// //     _tabController = TabController(length: 2, vsync: this);
// //
// //     // Fetch orders when screen loads
// //     WidgetsBinding.instance.addPostFrameCallback((_) {
// //       orderController.fetchAllOrders();
// //     });
// //   }
// //
// //   @override
// //   void dispose() {
// //     _tabController.dispose();
// //     super.dispose();
// //   }
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       backgroundColor: const Color(0xFFF2E8CF),
// //       appBar: AppBar(
// //         backgroundColor: primaryColor,
// //         leading: InkWell(
// //           onTap: () => Get.back(),
// //           child: const Icon(Icons.arrow_back, color: Colors.white),
// //         ),
// //         title: const Text(
// //           "My Orders",
// //           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
// //         ),
// //         centerTitle: true,
// //         actions: [
// //           IconButton(
// //             icon: const Icon(Icons.refresh, color: Colors.white),
// //             onPressed: () {
// //               orderController.fetchAllOrders();
// //             },
// //           ),
// //         ],
// //       ),
// //       body: Column(
// //         children: [
// //           const SizedBox(height: 20),
// //           _buildTabBar(),
// //           const SizedBox(height: 20),
// //           Expanded(
// //             child: TabBarView(
// //               controller: _tabController,
// //               children: [
// //                 _buildActiveOrders(),
// //                 _buildHistoryOrders(),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildTabBar() {
// //     return Padding(
// //       padding: const EdgeInsets.symmetric(horizontal: 16),
// //       child: Container(
// //         height: 50,
// //         decoration: BoxDecoration(
// //           color: const Color(0xFFF2E8CF),
// //           borderRadius: BorderRadius.circular(12),
// //           border: Border.all(),
// //         ),
// //         child: TabBar(
// //           controller: _tabController,
// //           indicator: BoxDecoration(
// //             color: primaryColor,
// //             borderRadius: BorderRadius.circular(10),
// //           ),
// //           labelColor: Colors.white,
// //           unselectedLabelColor: primaryColor,
// //           indicatorSize: TabBarIndicatorSize.tab,
// //           labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
// //           tabs: const [
// //             Tab(text: 'Active Orders'),
// //             Tab(text: 'Order History'),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   Widget _buildActiveOrders() {
// //     return Obx(() {
// //       if (orderController.isLoading.value) {
// //         return const Center(child: CircularProgressIndicator());
// //       }
// //
// //       if (orderController.errorMessage.value.isNotEmpty) {
// //         return Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const Icon(Icons.error_outline, color: Colors.red, size: 50),
// //               const SizedBox(height: 16),
// //               Padding(
// //                 padding: const EdgeInsets.symmetric(horizontal: 20),
// //                 child: Text(
// //                   orderController.errorMessage.value,
// //                   textAlign: TextAlign.center,
// //                   style: const TextStyle(color: Colors.red),
// //                 ),
// //               ),
// //               const SizedBox(height: 16),
// //               ElevatedButton(
// //                 onPressed: () => orderController.fetchAllOrders(),
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: primaryColor,
// //                 ),
// //                 child: const Text('Retry', style: TextStyle(color: Colors.white)),
// //               ),
// //             ],
// //           ),
// //         );
// //       }
// //
// //       if (orderController.activeOrders.isEmpty) {
// //         return Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
// //               const SizedBox(height: 16),
// //               const Text(
// //                 'No active orders',
// //                 style: TextStyle(fontSize: 18, color: Colors.grey),
// //               ),
// //               const SizedBox(height: 8),
// //               const Text(
// //                 'Your active orders will appear here',
// //                 style: TextStyle(color: Colors.grey),
// //               ),
// //               const SizedBox(height: 20),
// //               ElevatedButton(
// //                 onPressed: () => Get.offAllNamed('/home'),
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: primaryColor,
// //                 ),
// //                 child: const Text('Continue Shopping', style: TextStyle(color: Colors.white)),
// //               ),
// //             ],
// //           ),
// //         );
// //       }
// //
// //       return RefreshIndicator(
// //         onRefresh: () => orderController.fetchAllOrders(),
// //         child: ListView.builder(
// //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //           itemCount: orderController.activeOrders.length,
// //           itemBuilder: (context, index) {
// //             final order = orderController.activeOrders[index];
// //             return _buildOrderCard(order: order, isHistory: false);
// //           },
// //         ),
// //       );
// //     });
// //   }
// //
// //   Widget _buildHistoryOrders() {
// //     return Obx(() {
// //       if (orderController.isLoading.value) {
// //         return const Center(child: CircularProgressIndicator());
// //       }
// //
// //       if (orderController.historyOrders.isEmpty) {
// //         return Center(
// //           child: Column(
// //             mainAxisAlignment: MainAxisAlignment.center,
// //             children: [
// //               const Icon(Icons.history, size: 80, color: Colors.grey),
// //               const SizedBox(height: 16),
// //               const Text(
// //                 'No order history',
// //                 style: TextStyle(fontSize: 18, color: Colors.grey),
// //               ),
// //               const SizedBox(height: 8),
// //               const Text(
// //                 'Your completed and cancelled orders will appear here',
// //                 style: TextStyle(color: Colors.grey),
// //               ),
// //             ],
// //           ),
// //         );
// //       }
// //
// //       return RefreshIndicator(
// //         onRefresh: () => orderController.fetchAllOrders(),
// //         child: ListView.builder(
// //           padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
// //           itemCount: orderController.historyOrders.length,
// //           itemBuilder: (context, index) {
// //             final order = orderController.historyOrders[index];
// //             return _buildOrderCard(order: order, isHistory: true);
// //           },
// //         ),
// //       );
// //     });
// //   }
// //
// //   Widget _buildOrderCard({required OrderData order, required bool isHistory}) {
// //     final productImage = orderController.getProductImage(order);
// //     final productName = orderController.getProductName(order);
// //     final attributes = orderController.getProductAttributes(order);
// //     final price = orderController.getDisplayPrice(order);
// //     final quantity = orderController.getTotalQuantity(order);
// //     final status = orderController.getStatusText(order.orderStatus);
// //     final statusColor = orderController.getStatusColor(order.orderStatus);
// //     final orderDate = order.createdAt.split(' ')[0]; // Get date only
// //
// //     return Container(
// //       margin: const EdgeInsets.only(bottom: 20),
// //       padding: const EdgeInsets.all(12),
// //       decoration: BoxDecoration(
// //         color: Colors.white,
// //         borderRadius: BorderRadius.circular(12),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.grey.withOpacity(0.2),
// //             blurRadius: 5,
// //             offset: const Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Order header
// //           Row(
// //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //             children: [
// //               Text(
// //                 'Order #${order.id}',
// //                 style: const TextStyle(
// //                   fontWeight: FontWeight.bold,
// //                   fontSize: 16,
// //                   color: Colors.black87,
// //                 ),
// //               ),
// //               Text(
// //                 orderDate,
// //                 style: const TextStyle(
// //                   color: Colors.grey,
// //                   fontSize: 12,
// //                 ),
// //               ),
// //             ],
// //           ),
// //           const SizedBox(height: 8),
// //
// //           // Order details
// //           Row(
// //             crossAxisAlignment: CrossAxisAlignment.start,
// //             children: [
// //               // Product Image
// //               Container(
// //                 width: 70,
// //                 height: 70,
// //                 decoration: BoxDecoration(
// //                   borderRadius: BorderRadius.circular(8),
// //                   color: Colors.grey[200],
// //                 ),
// //                 child: productImage.isNotEmpty
// //                     ? ClipRRect(
// //                   borderRadius: BorderRadius.circular(8),
// //                   child: _buildProductImage(productImage),
// //                 )
// //                     : const Icon(
// //                   Icons.shopping_bag,
// //                   color: Colors.grey,
// //                   size: 30,
// //                 ),
// //               ),
// //               const SizedBox(width: 12),
// //
// //               // Product Info
// //               Expanded(
// //                 child: Column(
// //                   crossAxisAlignment: CrossAxisAlignment.start,
// //                   children: [
// //                     Text(
// //                       productName,
// //                       style: const TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         fontSize: 16,
// //                       ),
// //                       maxLines: 1,
// //                       overflow: TextOverflow.ellipsis,
// //                     ),
// //                     const SizedBox(height: 4),
// //
// //                     if (attributes.isNotEmpty)
// //                       Text(
// //                         attributes,
// //                         style: const TextStyle(
// //                           color: Colors.grey,
// //                           fontSize: 12,
// //                         ),
// //                         maxLines: 1,
// //                         overflow: TextOverflow.ellipsis,
// //                       ),
// //
// //                     const SizedBox(height: 8),
// //
// //                     Row(
// //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                       children: [
// //                         Text(
// //                           price,
// //                           style: const TextStyle(
// //                             fontWeight: FontWeight.bold,
// //                             fontSize: 16,
// //                             color: Colors.black87,
// //                           ),
// //                         ),
// //                         Text(
// //                           'Qty: $quantity',
// //                           style: const TextStyle(
// //                             color: Colors.grey,
// //                             fontSize: 14,
// //                           ),
// //                         ),
// //                       ],
// //                     ),
// //                   ],
// //                 ),
// //               ),
// //             ],
// //           ),
// //
// //           const SizedBox(height: 12),
// //
// //           // Status and actions
// //           Row(
// //             children: [
// //               Container(
// //                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
// //                 decoration: BoxDecoration(
// //                   color: statusColor.withOpacity(0.1),
// //                   borderRadius: BorderRadius.circular(20),
// //                   border: Border.all(color: statusColor),
// //                 ),
// //                 child: Text(
// //                   status,
// //                   style: TextStyle(
// //                     fontSize: 12,
// //                     color: statusColor,
// //                     fontWeight: FontWeight.w600,
// //                   ),
// //                 ),
// //               ),
// //               const Spacer(),
// //
// //               OutlinedButton(
// //                 onPressed: () {
// //                   // Navigate to order details
// //                   Get.snackbar(
// //                     'Details',
// //                     'Order details for #${order.id}',
// //                     backgroundColor: primaryColor,
// //                     colorText: Colors.white,
// //                   );
// //                 },
// //                 style: OutlinedButton.styleFrom(
// //                   side: BorderSide(color: primaryColor),
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                 ),
// //                 child: const Text(
// //                   "Details",
// //                   style: TextStyle(color: Colors.black87),
// //                 ),
// //               ),
// //               const SizedBox(width: 12),
// //
// //               ElevatedButton(
// //                 onPressed: () {
// //                   // Navigate to tracking
// //                   Get.snackbar(
// //                     'Tracking',
// //                     'Tracking order #${order.id}',
// //                     backgroundColor: primaryColor,
// //                     colorText: Colors.white,
// //                   );
// //                 },
// //                 style: ElevatedButton.styleFrom(
// //                   backgroundColor: primaryColor,
// //                   shape: RoundedRectangleBorder(
// //                     borderRadius: BorderRadius.circular(10),
// //                   ),
// //                 ),
// //                 child: const Text(
// //                   "Track",
// //                   style: TextStyle(color: Colors.white),
// //                 ),
// //               ),
// //             ],
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Helper method for image (without cached_network_image dependency)
// //   Widget _buildProductImage(String imageUrl) {
// //     try {
// //       final url = imageUrl.startsWith('http')
// //           ? imageUrl
// //           : 'https://anniecabs.com/emartnew/$imageUrl';
// //
// //       return Image.network(
// //         url,
// //         fit: BoxFit.cover,
// //         loadingBuilder: (context, child, loadingProgress) {
// //           if (loadingProgress == null) return child;
// //           return Center(
// //             child: CircularProgressIndicator(
// //               value: loadingProgress.expectedTotalBytes != null
// //                   ? loadingProgress.cumulativeBytesLoaded /
// //                   loadingProgress.expectedTotalBytes!
// //                   : null,
// //               color: primaryColor,
// //             ),
// //           );
// //         },
// //         errorBuilder: (context, error, stackTrace) {
// //           return const Icon(
// //             Icons.shopping_bag,
// //             color: Colors.grey,
// //             size: 30,
// //           );
// //         },
// //       );
// //     } catch (e) {
// //       return const Icon(
// //         Icons.shopping_bag,
// //         color: Colors.grey,
// //         size: 30,
// //       );
// //     }
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'order_detail_controllers.dart';
// import 'order_details_model.dart';   // Your model
//
// class MyOrderScreen extends StatefulWidget {
//   const MyOrderScreen({Key? key}) : super(key: key);
//
//   @override
//   State<MyOrderScreen> createState() => _MyOrderScreenState();
// }
//
// class _MyOrderScreenState extends State<MyOrderScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final OrderListController orderController = Get.put(OrderListController());
//   final Color primaryColor = const Color(0xFF16423C);
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//
//     // Fetch orders when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       orderController.fetchAllOrders();
//     });
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFFF2E8CF),
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Get.back(),
//         ),
//         title: const Text(
//           "My Orders",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.refresh, color: Colors.white),
//             onPressed: () {
//               orderController.fetchAllOrders();
//             },
//           ),
//         ],
//         bottom: PreferredSize(
//           preferredSize: const Size.fromHeight(60),
//           child: _buildTabBar(),
//         ),
//       ),
//       body: TabBarView(
//         controller: _tabController,
//         children: [
//           _buildActiveOrders(),
//           _buildHistoryOrders(),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabBar() {
//     return Container(
//       height: 50,
//       margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       decoration: BoxDecoration(
//         color: const Color(0xFFF2E8CF),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(),
//       ),
//       child: TabBar(
//         controller: _tabController,
//         indicator: BoxDecoration(
//           color: primaryColor,
//           borderRadius: BorderRadius.circular(10),
//         ),
//         labelColor: Colors.white,
//         unselectedLabelColor: primaryColor,
//         indicatorSize: TabBarIndicatorSize.tab,
//         labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//         tabs: const [
//           Tab(text: 'Active Orders'),
//           Tab(text: 'Order History'),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildActiveOrders() {
//     return Obx(() {
//       if (orderController.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }
//
//       if (orderController.errorMessage.value.isNotEmpty) {
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               const Icon(Icons.error_outline, color: Colors.red, size: 50),
//               const SizedBox(height: 16),
//               Padding(
//                 padding: const EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   orderController.errorMessage.value,
//                   textAlign: TextAlign.center,
//                   style: const TextStyle(color: Colors.red),
//                 ),
//               ),
//               const SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () => orderController.fetchAllOrders(),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                 ),
//                 child: const Text('Retry', style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ),
//         );
//       }
//
//       if (orderController.activeOrders.isEmpty) {
//         return const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.shopping_bag_outlined, size: 80, color: Colors.grey),
//               SizedBox(height: 16),
//               Text(
//                 'No active orders',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'Your active orders will appear here',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         );
//       }
//
//       return ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: orderController.activeOrders.length,
//         itemBuilder: (context, index) {
//           final order = orderController.activeOrders[index];
//           return _buildOrderCard(order: order, isHistory: false);
//         },
//       );
//     });
//   }
//
//   Widget _buildHistoryOrders() {
//     return Obx(() {
//       if (orderController.isLoading.value) {
//         return const Center(child: CircularProgressIndicator());
//       }
//
//       if (orderController.historyOrders.isEmpty) {
//         return const Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.history, size: 80, color: Colors.grey),
//               SizedBox(height: 16),
//               Text(
//                 'No order history',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 'Your completed and cancelled orders will appear here',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         );
//       }
//
//       return ListView.builder(
//         padding: const EdgeInsets.all(16),
//         itemCount: orderController.historyOrders.length,
//         itemBuilder: (context, index) {
//           final order = orderController.historyOrders[index];
//           return _buildOrderCard(order: order, isHistory: true);
//         },
//       );
//     });
//   }
//
//   Widget _buildOrderCard({required OrderData order, required bool isHistory}) {
//     final productImage = orderController.getProductImage(order);
//     final productName = orderController.getProductName(order);
//     final attributes = orderController.getProductAttributes(order);
//     final price = orderController.getDisplayPrice(order);
//     final quantity = orderController.getTotalQuantity(order);
//     final status = orderController.getStatusText(order.orderStatus);
//     final statusColor = orderController.getStatusColor(order.orderStatus);
//     final orderDate = order.createdAt.split(' ')[0];
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.2),
//             blurRadius: 5,
//             offset: const Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Order header
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 'Order #${order.id}',
//                 style: const TextStyle(
//                   fontWeight: FontWeight.bold,
//                   fontSize: 16,
//                   color: Colors.black87,
//                 ),
//               ),
//               Text(
//                 orderDate,
//                 style: const TextStyle(
//                   color: Colors.grey,
//                   fontSize: 12,
//                 ),
//               ),
//             ],
//           ),
//           const SizedBox(height: 8),
//
//           // Order details
//           Row(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               // Product Image
//               Container(
//                 width: 70,
//                 height: 70,
//                 decoration: BoxDecoration(
//                   borderRadius: BorderRadius.circular(8),
//                   color: Colors.grey[200],
//                 ),
//                 child: productImage.isNotEmpty
//                     ? ClipRRect(
//                   borderRadius: BorderRadius.circular(8),
//                   child: _buildProductImage(productImage),
//                 )
//                     : const Icon(
//                   Icons.shopping_bag,
//                   color: Colors.grey,
//                   size: 30,
//                 ),
//               ),
//               const SizedBox(width: 12),
//
//               // Product Info
//               Expanded(
//                 child: Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       productName,
//                       style: const TextStyle(
//                         fontWeight: FontWeight.bold,
//                         fontSize: 16,
//                       ),
//                       maxLines: 1,
//                       overflow: TextOverflow.ellipsis,
//                     ),
//                     const SizedBox(height: 4),
//
//                     if (attributes.isNotEmpty)
//                       Text(
//                         attributes,
//                         style: const TextStyle(
//                           color: Colors.grey,
//                           fontSize: 12,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//
//                     const SizedBox(height: 8),
//
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Text(
//                           price,
//                           style: const TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 16,
//                             color: Colors.black87,
//                           ),
//                         ),
//                         Text(
//                           'Qty: $quantity',
//                           style: const TextStyle(
//                             color: Colors.grey,
//                             fontSize: 14,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//
//           const SizedBox(height: 12),
//
//           // Status and actions
//           Row(
//             children: [
//               Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                 decoration: BoxDecoration(
//                   color: Color.fromRGBO(
//                     statusColor.red,
//                     statusColor.green,
//                     statusColor.blue,
//                     0.1,
//                   ),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(color: statusColor),
//                 ),
//                 child: Text(
//                   status,
//                   style: TextStyle(
//                     fontSize: 12,
//                     color: statusColor,
//                     fontWeight: FontWeight.w600,
//                   ),
//                 ),
//               ),
//               const Spacer(),
//
//               OutlinedButton(
//                 onPressed: () {
//                   Get.snackbar(
//                     'Order Details',
//                     'Showing details for order #${order.id}',
//                     backgroundColor: primaryColor,
//                     colorText: Colors.white,
//                   );
//                 },
//                 style: OutlinedButton.styleFrom(
//                   side: BorderSide(color: primaryColor),
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   "Details",
//                   style: TextStyle(color: Colors.black87),
//                 ),
//               ),
//               const SizedBox(width: 12),
//
//               ElevatedButton(
//                 onPressed: () {
//                   Get.snackbar(
//                     'Order Tracking',
//                     'Tracking order #${order.id}',
//                     backgroundColor: primaryColor,
//                     colorText: Colors.white,
//                   );
//                 },
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                 ),
//                 child: const Text(
//                   "Track",
//                   style: TextStyle(color: Colors.white),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProductImage(String imageUrl) {
//     try {
//       final url = imageUrl.startsWith('http')
//           ? imageUrl
//           : 'https://anniecabs.com/emartnew/$imageUrl';
//
//       return Image.network(
//         url,
//         fit: BoxFit.cover,
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) return child;
//           return Center(
//             child: CircularProgressIndicator(
//               value: loadingProgress.expectedTotalBytes != null
//                   ? loadingProgress.cumulativeBytesLoaded /
//                   loadingProgress.expectedTotalBytes!
//                   : null,
//               color: primaryColor,
//             ),
//           );
//         },
//         errorBuilder: (context, error, stackTrace) {
//           return const Icon(
//             Icons.shopping_bag,
//             color: Colors.grey,
//             size: 30,
//           );
//         },
//       );
//     } catch (e) {
//       return const Icon(
//         Icons.shopping_bag,
//         color: Colors.grey,
//         size: 30,
//       );
//     }
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../order_sub_Details_screen/order_sub_details_screen.dart';
// import 'order_detail_controllers.dart';
// import 'order_details_model.dart';   // Your model
//
// class MyOrderScreen extends StatefulWidget {
//   const MyOrderScreen({super.key});
//
//   @override
//   State<MyOrderScreen> createState() => _MyOrderScreenState();
// }
//
// class _MyOrderScreenState extends State<MyOrderScreen>
//     with SingleTickerProviderStateMixin {
//   late TabController _tabController;
//   final OrderListController orderController = Get.put(OrderListController());
//
//   final Color primaryColor = const Color(0xFF16423C);
//   final Color backgroundColor = const Color(0xFFF8F3E7);
//
//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 2, vsync: this);
//
//     // Call API only once when screen loads
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       orderController.fetchAllOrders();
//     });
//   }
//
//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFFF2E8CF),
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: const Icon(Icons.arrow_back, color: Colors.white),
//         ),
//         title: const Text(
//           "My Order",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           const SizedBox(height: 20),
//           _buildTabBar(),
//           const SizedBox(height: 20),
//           Expanded(
//             child: TabBarView(
//               controller: _tabController,
//               children: [
//                 _buildOrderList(isHistory: false), // My Order tab
//                 _buildOrderList(isHistory: true),  // History tab
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildTabBar() {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16),
//       child: Container(
//         height: 50,
//         decoration: BoxDecoration(
//           color: Color(0xFFF2E8CF),
//           borderRadius: BorderRadius.circular(12),
//           border: Border.all(),
//         ),
//         child: TabBar(
//           controller: _tabController,
//           indicator: BoxDecoration(
//             color: primaryColor,
//             borderRadius: BorderRadius.circular(10),
//           ),
//           labelColor: Colors.white,
//           unselectedLabelColor: primaryColor,
//           indicatorSize: TabBarIndicatorSize.tab,
//           labelStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
//           tabs: const [
//             Tab(text: 'My Order'),
//             Tab(text: 'History'),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildOrderList({bool isHistory = false}) {
//     return Obx(() {
//       // Show loading
//       if (orderController.isLoading.value) {
//         return Center(
//           child: CircularProgressIndicator(color: primaryColor),
//         );
//       }
//
//       // Show error
//       if (orderController.errorMessage.value.isNotEmpty) {
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(Icons.error_outline, color: Colors.red, size: 50),
//               SizedBox(height: 16),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 20),
//                 child: Text(
//                   orderController.errorMessage.value,
//                   textAlign: TextAlign.center,
//                   style: TextStyle(color: Colors.red),
//                 ),
//               ),
//               SizedBox(height: 16),
//               ElevatedButton(
//                 onPressed: () => orderController.fetchAllOrders(),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: primaryColor,
//                 ),
//                 child: Text('Retry', style: TextStyle(color: Colors.white)),
//               ),
//             ],
//           ),
//         );
//       }
//
//       // Get the right list based on tab
//       final orderList = isHistory
//           ? orderController.historyOrders
//           : orderController.activeOrders;
//
//       // Show empty state
//       if (orderList.isEmpty) {
//         return Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Icon(
//                 isHistory ? Icons.history : Icons.shopping_bag_outlined,
//                 size: 80,
//                 color: Colors.grey,
//               ),
//               SizedBox(height: 16),
//               Text(
//                 isHistory ? 'No order history' : 'No active orders',
//                 style: TextStyle(fontSize: 18, color: Colors.grey),
//               ),
//               SizedBox(height: 8),
//               Text(
//                 isHistory
//                     ? 'Your completed and cancelled orders will appear here'
//                     : 'Your active orders will appear here',
//                 style: TextStyle(color: Colors.grey),
//               ),
//             ],
//           ),
//         );
//       }
//
//       // Show orders list
//       return ListView.builder(
//         padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//         itemCount: orderList.length,
//         itemBuilder: (context, index) {
//           final order = orderList[index];
//           return _buildOrderCard(order: order, isHistory: isHistory);
//         },
//       );
//     });
//   }
//
//   Widget _buildOrderCard({required OrderData order, required bool isHistory}) {
//     final productImage = orderController.getProductImage(order);
//     final productName = orderController.getProductName(order);
//     final attributes = orderController.getProductAttributes(order);
//     final price = orderController.getDisplayPrice(order);
//     final quantity = orderController.getTotalQuantity(order);
//     final status = orderController.getStatusText(order.orderStatus);
//     final statusColor = orderController.getStatusColor(order.orderStatus);
//
//     return Container(
//       margin: const EdgeInsets.only(bottom: 20),
//       padding: const EdgeInsets.all(12),
//       decoration: BoxDecoration(
//         color: Color(0xFFF2E8CF),
//         borderRadius: BorderRadius.circular(12),
//         border: Border.all(color: Colors.grey),
//       ),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Product Image
//           Container(
//             width: 70,
//             height: 70,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.grey[200],
//             ),
//             child: productImage.isNotEmpty
//                 ? ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: _buildProductImage(productImage),
//             )
//                 : Image.asset(
//               "assets/images/myorderimage.png",
//               fit: BoxFit.cover,
//             ),
//           ),
//           const SizedBox(width: 12),
//
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         productName,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                         maxLines: 1,
//                         overflow: TextOverflow.ellipsis,
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(20),
//                         border: Border.all(color: statusColor),
//                       ),
//                       child: Text(
//                         status,
//                         style: TextStyle(
//                           fontSize: 12,
//                           color: statusColor,
//                           fontWeight: FontWeight.w600,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 4),
//
//                 if (attributes.isNotEmpty)
//                   Text(
//                     attributes,
//                     style: const TextStyle(color: Colors.grey, fontSize: 14),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//
//                 const SizedBox(height: 6),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Expanded(
//                       child: Text(
//                         price,
//                         style: const TextStyle(
//                           fontWeight: FontWeight.bold,
//                           fontSize: 16,
//                         ),
//                       ),
//                     ),
//                     Text(
//                       "Qty : $quantity",
//                       style: const TextStyle(color: Colors.black87, fontSize: 14),
//                     ),
//                   ],
//                 ),
//                 const SizedBox(height: 10),
//                 Row(
//                   children: [
//                     // Expanded(
//                     //   child: OutlinedButton(
//                     //     onPressed: () {
//                     //       // Show order details
//                     //       Get.snackbar(
//                     //         'Order Details',
//                     //         'Showing details for order #${order.id}',
//                     //         backgroundColor: primaryColor,
//                     //         colorText: Colors.white,
//                     //       );
//                     //     },
//                     //     style: OutlinedButton.styleFrom(
//                     //       side: BorderSide(color: primaryColor),
//                     //       shape: RoundedRectangleBorder(
//                     //         borderRadius: BorderRadius.circular(10),
//                     //       ),
//                     //       backgroundColor: const Color(0xFFF2E8CF),
//                     //     ),
//                     //     child: const Text(
//                     //       "Details",
//                     //       style: TextStyle(color: Colors.black),
//                     //     ),
//                     //   ),
//     // In _buildOrderCard method, update the Details button:
//     Expanded(
//     child: OutlinedButton(
//     onPressed: () {
//     // Navigate to Order Details Screen with order ID
//     Get.to(() => OrderDetailScreen(orderId: order.id));
//     },
//     style: OutlinedButton.styleFrom(
//     side: BorderSide(color: primaryColor),
//     shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.circular(10),
//     ),
//     backgroundColor: const Color(0xFFF2E8CF),
//     ),
//     child: const Text(
//     "Details",
//     style: TextStyle(color: Colors.black),
//     ),
//     ),
//     ),
//
//                     const SizedBox(width: 12),
//                     Expanded(
//                       child: ElevatedButton(
//                         onPressed: () {
//                           // Show order tracking
//                           Get.snackbar(
//                             'Order Tracking',
//                             'Tracking order #${order.id}',
//                             backgroundColor: primaryColor,
//                             colorText: Colors.white,
//                           );
//                         },
//                         style: ElevatedButton.styleFrom(
//                           backgroundColor: primaryColor,
//                           shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10),
//                           ),
//                         ),
//                         child: const Text(
//                           "Tracking",
//                           style: TextStyle(color: Colors.white),
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildProductImage(String imageUrl) {
//     try {
//       final url = imageUrl.startsWith('http')
//           ? imageUrl
//           : 'https://anniecabs.com/emartnew/$imageUrl';
//
//       return Image.network(
//         url,
//         fit: BoxFit.cover,
//         loadingBuilder: (context, child, loadingProgress) {
//           if (loadingProgress == null) return child;
//           return Center(
//             child: CircularProgressIndicator(
//               value: loadingProgress.expectedTotalBytes != null
//                   ? loadingProgress.cumulativeBytesLoaded /
//                   loadingProgress.expectedTotalBytes!
//                   : null,
//               color: primaryColor,
//             ),
//           );
//         },
//         errorBuilder: (context, error, stackTrace) {
//           return Image.asset(
//             "assets/images/myorderimage.png",
//             fit: BoxFit.cover,
//           );
//         },
//       );
//     } catch (e) {
//       return Image.asset(
//         "assets/images/myorderimage.png",
//         fit: BoxFit.cover,
//       );
//     }
//   }
// }
import 'package:ecommerce/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:ecommerce/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../order_sub_Details_screen/order_sub_details_screen.dart';
import 'order_detail_controllers.dart';
import 'order_details_model.dart';

class MyOrderScreen extends StatefulWidget {
  const MyOrderScreen({super.key});

  @override
  State<MyOrderScreen> createState() => _MyOrderScreenState();
}

class _MyOrderScreenState extends State<MyOrderScreen> {
  final OrderListController orderController = Get.put(OrderListController());
  final Color primaryColor = const Color(0xFF16423C);
  // Function to handle hardware back button
  Future<bool> _onWillPop() async {
    // Navigate to DashboardScreen when hardware back button is pressed
    Get.offAll(() => BottomNavScreen(initialIndex: 0,)); // This will clear stack and go to dashboard

    // Return false to prevent default back behavior (which would exit app)
    return true;
  }

  @override
  void initState() {
    super.initState();

    // Call API only once when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      orderController.fetchAllOrders();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        onWillPop: _onWillPop, // Handle hardware back button
        child:Scaffold(
      backgroundColor: Color(0xFFF2E8CF),
      appBar: AppBar(
        backgroundColor: primaryColor,
        leading: InkWell(
          onTap: () {
            Get.back();



          },
          child: const Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: const Text(
          "My Orders",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh, color: Colors.white),
            onPressed: () {
              orderController.fetchAllOrders();
            },
          ),
        ],
      ),
      body: _buildOrderList(),
        )  );
  }


  Widget _buildOrderList() {
    return Obx(() {
      // Show loading
      if (orderController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(color: primaryColor),
        );
      }

      // Show error
      if (orderController.errorMessage.value.isNotEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, color: Colors.red, size: 50),
              SizedBox(height: 16),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  orderController.errorMessage.value,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.red),
                ),
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () => orderController.fetchAllOrders(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryColor,
                ),
                child: Text('Retry', style: TextStyle(color: Colors.white)),
              ),
            ],
          ),
        );
      }

      // Show all orders (no history filter)
      final orderList = orderController.allOrders;

      // Show empty state
      if (orderList.isEmpty) {
        return Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.shopping_bag_outlined,
                size: 80,
                color: Colors.grey,
              ),
              SizedBox(height: 16),
              Text(
                'No orders found',
                style: TextStyle(fontSize: 18, color: Colors.grey),
              ),
              SizedBox(height: 8),
              Text(
                'Your orders will appear here',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        );
      }

      // Show orders list
      return RefreshIndicator(
        onRefresh: () => orderController.fetchAllOrders(),
        child: ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
          itemCount: orderList.length,
          itemBuilder: (context, index) {
            final order = orderList[index];
            return _buildOrderCard(order: order);
          },
        ),
      );
    });
  }

  Widget _buildOrderCard({required OrderData order}) {
    final productImage = orderController.getProductImage(order);
    final productName = orderController.getProductName(order);
    final attributes = orderController.getProductAttributes(order);
    final price = orderController.getDisplayPrice(order);
    final quantity = orderController.getTotalQuantity(order);
    final status = orderController.getStatusText(order.orderStatus);
    final statusColor = orderController.getStatusColor(order.orderStatus);
    final orderDate = order.createdAt.split(' ')[0]; // Get just the date part

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Color(0xFFF2E8CF),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Product Image
          Container(
            width: 70,
            height: 70,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Colors.grey[200],
            ),
            child: productImage.isNotEmpty
                ? ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: _buildProductImage(productImage),
            )
                : Image.asset(
              "assets/images/myorderimage.png",
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Order ID and Date
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Order #${order.id}',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                    Text(
                      orderDate,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 4),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        productName,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: statusColor),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          fontSize: 12,
                          color: statusColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),

                if (attributes.isNotEmpty)
                  Text(
                    attributes,
                    style: const TextStyle(color: Colors.grey, fontSize: 14),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                const SizedBox(height: 6),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        price,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    Text(
                      "Qty: $quantity",
                      style: const TextStyle(color: Colors.black87, fontSize: 14),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {
                          // Navigate to Order Details Screen with order ID
                          Get.to(() => OrderDetailScreen(orderId: order.id));
                        },
                        style: OutlinedButton.styleFrom(
                          side: BorderSide(color: primaryColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          backgroundColor: const Color(0xFFF2E8CF),
                        ),
                        child: const Text(
                          "Details",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          // Show order tracking
                          Get.snackbar(
                            'Order Tracking',
                            'Tracking order #${order.id}',
                            backgroundColor: primaryColor,
                            colorText: Colors.white,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: const Text(
                          "Tracking",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    try {
      final url = imageUrl.startsWith('http')
          ? imageUrl
          : 'https://anniecabs.com/emartnew/$imageUrl';

      return Image.network(
        url,
        fit: BoxFit.cover,
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          return Center(
            child: CircularProgressIndicator(
              value: loadingProgress.expectedTotalBytes != null
                  ? loadingProgress.cumulativeBytesLoaded /
                  loadingProgress.expectedTotalBytes!
                  : null,
              color: primaryColor,
            ),
          );
        },
        errorBuilder: (context, error, stackTrace) {
          return Image.asset(
            "assets/images/myorderimage.png",
            fit: BoxFit.cover,
          );
        },
      );
    } catch (e) {
      return Image.asset(
        "assets/images/myorderimage.png",
        fit: BoxFit.cover,
      );
    }
  }
}
