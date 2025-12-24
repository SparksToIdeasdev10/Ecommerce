// // import 'package:flutter/material.dart';
// // import 'package:get/get.dart';
// //
// // import 'order_sub_detail_controller.dart';
// // import 'order_sub_detail_model.dart';
// //
// // class OrderDetailScreen extends StatelessWidget {
// //   final int orderId;
// //
// //   const OrderDetailScreen({Key? key, required this.orderId}) : super(key: key);
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       body: SafeArea(
// //         child: Column(
// //           children: [
// //             // Custom App Bar
// //             _buildAppBar(),
// //
// //             // Main Content
// //             Expanded(
// //               child: GetBuilder<OrderDetailSingleController>(
// //                 init: OrderDetailSingleController(),
// //                 builder: (controller) {
// //                   // Fetch order details when screen loads
// //                   WidgetsBinding.instance.addPostFrameCallback((_) {
// //                     if (controller.orderDetail.value == null ||
// //                         controller.currentOrderId != orderId) {
// //                       controller.fetchOrderDetails(orderId);
// //                     }
// //                   });
// //
// //                   // Show loading
// //                   if (controller.isLoading.value) {
// //                     return Center(
// //                       child: CircularProgressIndicator(
// //                         color: const Color(0xFF16423C),
// //                       ),
// //                     );
// //                   }
// //
// //                   // Show error
// //                   if (controller.errorMessage.value.isNotEmpty) {
// //                     return Center(
// //                       child: Column(
// //                         mainAxisAlignment: MainAxisAlignment.center,
// //                         children: [
// //                           Icon(Icons.error_outline, color: Colors.red, size: 50),
// //                           SizedBox(height: 16),
// //                           Padding(
// //                             padding: EdgeInsets.symmetric(horizontal: 20),
// //                             child: Text(
// //                               controller.errorMessage.value,
// //                               textAlign: TextAlign.center,
// //                               style: TextStyle(color: Colors.red),
// //                             ),
// //                           ),
// //                           SizedBox(height: 16),
// //                           ElevatedButton(
// //                             onPressed: () => controller.fetchOrderDetails(orderId),
// //                             style: ElevatedButton.styleFrom(
// //                               backgroundColor: const Color(0xFF16423C),
// //                             ),
// //                             child: Text('Retry', style: TextStyle(color: Colors.white)),
// //                           ),
// //                         ],
// //                       ),
// //                     );
// //                   }
// //
// //                   // Show order details
// //                   final order = controller.orderDetail.value;
// //                   if (order == null) {
// //                     return Center(
// //                       child: Text(
// //                         'No order details found',
// //                         style: TextStyle(color: Colors.grey),
// //                       ),
// //                     );
// //                   }
// //
// //                   return SingleChildScrollView(
// //                     padding: EdgeInsets.all(16),
// //                     child: Column(
// //                       crossAxisAlignment: CrossAxisAlignment.start,
// //                       children: [
// //                         // Order Summary Card
// //                         _buildOrderSummaryCard(order, controller),
// //
// //                         SizedBox(height: 20),
// //
// //                         // Products List
// //                         _buildProductsCard(order, controller),
// //
// //                         SizedBox(height: 20),
// //
// //                         // Price Breakdown
// //                         _buildPriceBreakdownCard(order, controller),
// //
// //                         SizedBox(height: 20),
// //
// //                         // Shipping Info
// //                         _buildShippingInfoCard(order, controller),
// //
// //                         SizedBox(height: 20),
// //
// //                         // Billing Info
// //                         _buildBillingInfoCard(order, controller),
// //
// //                         SizedBox(height: 30),
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
// //
// //   // App Bar
// //   Widget _buildAppBar() {
// //     return Container(
// //       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
// //       decoration: BoxDecoration(
// //         color: const Color(0xFF16423C),
// //         boxShadow: [
// //           BoxShadow(
// //             color: Colors.black12,
// //             blurRadius: 4,
// //             offset: Offset(0, 2),
// //           ),
// //         ],
// //       ),
// //       child: Row(
// //         children: [
// //           IconButton(
// //             icon: Icon(Icons.arrow_back, color: Colors.white),
// //             onPressed: () => Get.back(),
// //           ),
// //           SizedBox(width: 10),
// //           Text(
// //             'Order Details',
// //             style: TextStyle(
// //               color: Colors.white,
// //               fontSize: 20,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //           Spacer(),
// //           GetBuilder<OrderDetailSingleController>(
// //             builder: (controller) {
// //               final order = controller.orderDetail.value;
// //               if (order != null) {
// //                 return Container(
// //                   padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
// //                   decoration: BoxDecoration(
// //                     color: controller.getStatusColor(order.orderStatus).withOpacity(0.2),
// //                     borderRadius: BorderRadius.circular(20),
// //                     border: Border.all(
// //                       color: controller.getStatusColor(order.orderStatus),
// //                     ),
// //                   ),
// //                   child: Text(
// //                     controller.getStatusText(order.orderStatus),
// //                     style: TextStyle(
// //                       color: controller.getStatusColor(order.orderStatus),
// //                       fontWeight: FontWeight.bold,
// //                       fontSize: 12,
// //                     ),
// //                   ),
// //                 );
// //               }
// //               return SizedBox();
// //             },
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Order Summary Card
// //   Widget _buildOrderSummaryCard(OrderDetailData order, OrderDetailSingleController controller) {
// //     return Card(
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: Padding(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //               children: [
// //                 Text(
// //                   'Order #${order.id}',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: const Color(0xFF16423C),
// //                   ),
// //                 ),
// //                 Icon(
// //                   Icons.shopping_bag,
// //                   color: const Color(0xFF16423C),
// //                   size: 24,
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 12),
// //             Divider(),
// //             SizedBox(height: 12),
// //             _buildDetailRow(
// //               icon: Icons.calendar_today,
// //               label: 'Order Date',
// //               value: controller.getFormattedDate(order.createdAt),
// //             ),
// //             SizedBox(height: 8),
// //             _buildDetailRow(
// //               icon: Icons.update,
// //               label: 'Last Updated',
// //               value: controller.getFormattedDate(order.updatedAt),
// //             ),
// //             SizedBox(height: 8),
// //             _buildDetailRow(
// //               icon: Icons.payment,
// //               label: 'Payment Method',
// //               value: order.paymentMethod.toUpperCase(),
// //             ),
// //             SizedBox(height: 8),
// //             _buildDetailRow(
// //               icon: Icons.payment,
// //               label: 'Payment Status',
// //               value: order.paymentStatus,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Products Card
// //   Widget _buildProductsCard(OrderDetailData order, OrderDetailSingleController controller) {
// //     return Card(
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: Padding(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(Icons.shopping_cart, color: const Color(0xFF16423C)),
// //                 SizedBox(width: 10),
// //                 Text(
// //                   'Products',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: const Color(0xFF16423C),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //
// //             // List of products
// //             for (var item in order.cartItems)
// //               Column(
// //                 children: [
// //                   _buildProductItem(item, order, controller),
// //                   if (item != order.cartItems.last) Divider(),
// //                 ],
// //               ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Single Product Item
// //   Widget _buildProductItem(CartItem item, OrderDetailData order, OrderDetailSingleController controller) {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(vertical: 8),
// //       child: Row(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           // Product Image
// //           Container(
// //             width: 60,
// //             height: 60,
// //             decoration: BoxDecoration(
// //               borderRadius: BorderRadius.circular(8),
// //               color: Colors.grey[200],
// //             ),
// //             child: item.photo.isNotEmpty
// //                 ? ClipRRect(
// //               borderRadius: BorderRadius.circular(8),
// //               child: _buildProductImage(item.photo),
// //             )
// //                 : Icon(Icons.shopping_bag, color: Colors.grey),
// //           ),
// //           SizedBox(width: 12),
// //
// //           // Product Details
// //           Expanded(
// //             child: Column(
// //               crossAxisAlignment: CrossAxisAlignment.start,
// //               children: [
// //                 Text(
// //                   item.name,
// //                   style: TextStyle(
// //                     fontWeight: FontWeight.bold,
// //                     fontSize: 16,
// //                   ),
// //                   maxLines: 1,
// //                   overflow: TextOverflow.ellipsis,
// //                 ),
// //                 SizedBox(height: 4),
// //
// //                 if (item.attributesString.isNotEmpty)
// //                   Text(
// //                     item.attributesString,
// //                     style: TextStyle(
// //                       color: Colors.grey,
// //                       fontSize: 12,
// //                     ),
// //                     maxLines: 1,
// //                     overflow: TextOverflow.ellipsis,
// //                   ),
// //
// //                 SizedBox(height: 8),
// //
// //                 Row(
// //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //                   children: [
// //                     Text(
// //                       '${order.currencySign}${item.price.toStringAsFixed(2)}',
// //                       style: TextStyle(
// //                         fontWeight: FontWeight.bold,
// //                         color: const Color(0xFF16423C),
// //                       ),
// //                     ),
// //                     Text(
// //                       'Qty: ${item.qty}',
// //                       style: TextStyle(color: Colors.grey),
// //                     ),
// //                   ],
// //                 ),
// //               ],
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   // Price Breakdown Card
// //   Widget _buildPriceBreakdownCard(OrderDetailData order, OrderDetailSingleController controller) {
// //     final subtotal = order.subtotal;
// //     final shipping = order.shipping.price;
// //     final tax = order.tax;
// //     final stateTax = order.statePrice;
// //     final total = order.totalPrice;
// //
// //     return Card(
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: Padding(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(Icons.receipt, color: const Color(0xFF16423C)),
// //                 SizedBox(width: 10),
// //                 Text(
// //                   'Price Breakdown',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: const Color(0xFF16423C),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //
// //             _buildPriceRow('Subtotal', '${order.currencySign}${subtotal.toStringAsFixed(2)}'),
// //             _buildPriceRow('Shipping (${order.shipping.title})', '${order.currencySign}${shipping.toStringAsFixed(2)}'),
// //             _buildPriceRow('Tax', '${order.currencySign}${tax.toStringAsFixed(2)}'),
// //             _buildPriceRow('State Tax (${order.state.name})', '${order.currencySign}${stateTax.toStringAsFixed(2)}'),
// //
// //             Divider(height: 20),
// //
// //             _buildPriceRow(
// //               'Total',
// //               '${order.currencySign}${total.toStringAsFixed(2)}',
// //               isTotal: true,
// //             ),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Shipping Info Card
// //   Widget _buildShippingInfoCard(OrderDetailData order, OrderDetailSingleController controller) {
// //     return Card(
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: Padding(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(Icons.local_shipping, color: const Color(0xFF16423C)),
// //                 SizedBox(width: 10),
// //                 Text(
// //                   'Shipping Information',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: const Color(0xFF16423C),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //
// //             _buildInfoRow('Name', order.shippingInfo.fullName),
// //             _buildInfoRow('Email', order.shippingInfo.shipEmail),
// //             _buildInfoRow('Phone', order.shippingInfo.shipPhone),
// //             _buildInfoRow('Address', order.shippingInfo.fullAddress),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Billing Info Card
// //   Widget _buildBillingInfoCard(OrderDetailData order, OrderDetailSingleController controller) {
// //     return Card(
// //       elevation: 3,
// //       shape: RoundedRectangleBorder(
// //         borderRadius: BorderRadius.circular(12),
// //       ),
// //       child: Padding(
// //         padding: EdgeInsets.all(16),
// //         child: Column(
// //           crossAxisAlignment: CrossAxisAlignment.start,
// //           children: [
// //             Row(
// //               children: [
// //                 Icon(Icons.home, color: const Color(0xFF16423C)),
// //                 SizedBox(width: 10),
// //                 Text(
// //                   'Billing Information',
// //                   style: TextStyle(
// //                     fontSize: 18,
// //                     fontWeight: FontWeight.bold,
// //                     color: const Color(0xFF16423C),
// //                   ),
// //                 ),
// //               ],
// //             ),
// //             SizedBox(height: 16),
// //
// //             _buildInfoRow('Name', order.billingInfo.fullName),
// //             _buildInfoRow('Email', order.billingInfo.shipEmail),
// //             _buildInfoRow('Phone', order.billingInfo.shipPhone),
// //             _buildInfoRow('Address', order.billingInfo.fullAddress),
// //           ],
// //         ),
// //       ),
// //     );
// //   }
// //
// //   // Helper Widgets
// //   Widget _buildDetailRow({required IconData icon, required String label, required String value}) {
// //     return Row(
// //       children: [
// //         Icon(icon, size: 20, color: Colors.grey),
// //         SizedBox(width: 10),
// //         Expanded(
// //           child: Text(
// //             label,
// //             style: TextStyle(
// //               color: Colors.grey,
// //               fontSize: 14,
// //             ),
// //           ),
// //         ),
// //         Text(
// //           value,
// //           style: TextStyle(
// //             fontWeight: FontWeight.bold,
// //             fontSize: 14,
// //           ),
// //         ),
// //       ],
// //     );
// //   }
// //
// //   Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(vertical: 6),
// //       child: Row(
// //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
// //         children: [
// //           Text(
// //             label,
// //             style: TextStyle(
// //               color: Colors.grey,
// //               fontSize: isTotal ? 16 : 14,
// //               fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
// //             ),
// //           ),
// //           Text(
// //             value,
// //             style: TextStyle(
// //               color: isTotal ? const Color(0xFF16423C) : Colors.black,
// //               fontSize: isTotal ? 18 : 14,
// //               fontWeight: FontWeight.bold,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
// //   Widget _buildInfoRow(String label, String value) {
// //     return Padding(
// //       padding: EdgeInsets.symmetric(vertical: 6),
// //       child: Column(
// //         crossAxisAlignment: CrossAxisAlignment.start,
// //         children: [
// //           Text(
// //             label,
// //             style: TextStyle(
// //               color: Colors.grey,
// //               fontSize: 12,
// //             ),
// //           ),
// //           SizedBox(height: 2),
// //           Text(
// //             value,
// //             style: TextStyle(
// //               fontSize: 14,
// //               fontWeight: FontWeight.w500,
// //             ),
// //           ),
// //         ],
// //       ),
// //     );
// //   }
// //
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
// //               color: const Color(0xFF16423C),
// //             ),
// //           );
// //         },
// //         errorBuilder: (context, error, stackTrace) {
// //           return Icon(Icons.shopping_bag, color: Colors.grey);
// //         },
// //       );
// //     } catch (e) {
// //       return Icon(Icons.shopping_bag, color: Colors.grey);
// //     }
// //   }
// // }
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'order_sub_detail_controller.dart';
// import 'order_sub_detail_model.dart';
//
//
//
// class OrderDetailScreen extends StatefulWidget {
//   final int orderId;
//
//   const OrderDetailScreen({Key? key, required this.orderId}) : super(key: key);
//
//   @override
//   State<OrderDetailScreen> createState() => _OrderDetailScreenState();
// }
//
// class _OrderDetailScreenState extends State<OrderDetailScreen> {
//   late OrderDetailSingleController _controller;
//
//   @override
//   void initState() {
//     super.initState();
//     _controller = Get.put(OrderDetailSingleController());
//
//     // Fetch order details after a small delay
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       _controller.fetchOrderDetails(widget.orderId);
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             // Custom App Bar
//             _buildAppBar(),
//
//             // Main Content - Using Expanded to avoid overflow
//             Expanded(
//               child: Obx(() {
//                 // Show loading
//                 if (_controller.isLoading.value) {
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: const Color(0xFF16423C),
//                     ),
//                   );
//                 }
//
//                 // Show error
//                 if (_controller.errorMessage.value.isNotEmpty) {
//                   return Center(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.error_outline, color: Colors.red, size: 50),
//                         SizedBox(height: 16),
//                         Padding(
//                           padding: EdgeInsets.symmetric(horizontal: 20),
//                           child: Text(
//                             _controller.errorMessage.value,
//                             textAlign: TextAlign.center,
//                             style: TextStyle(color: Colors.red),
//                           ),
//                         ),
//                         SizedBox(height: 16),
//                         ElevatedButton(
//                           onPressed: () => _controller.fetchOrderDetails(widget.orderId),
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xFF16423C),
//                           ),
//                           child: Text('Retry', style: TextStyle(color: Colors.white)),
//                         ),
//                       ],
//                     ),
//                   );
//                 }
//
//                 // Show order details
//                 final order = _controller.orderDetail.value;
//                 if (order == null) {
//                   return Center(
//                     child: Text(
//                       'No order details found',
//                       style: TextStyle(color: Colors.grey),
//                     ),
//                   );
//                 }
//
//                 return SingleChildScrollView(
//                   child: Padding(
//                     padding: EdgeInsets.all(16),
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         // Order Summary Card
//                         _buildOrderSummaryCard(order),
//
//                         SizedBox(height: 20),
//
//                         // Products List
//                         _buildProductsCard(order),
//
//                         SizedBox(height: 20),
//
//                         // Price Breakdown
//                         _buildPriceBreakdownCard(order),
//
//                         SizedBox(height: 20),
//
//                         // Shipping Info
//                         _buildShippingInfoCard(order),
//
//                         SizedBox(height: 20),
//
//                         // Billing Info
//                         _buildBillingInfoCard(order),
//
//                         SizedBox(height: 30),
//                       ],
//                     ),
//                   ),
//                 );
//               }),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // App Bar - Fixed null check
//   Widget _buildAppBar() {
//     return Container(
//       padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
//       decoration: BoxDecoration(
//         color: const Color(0xFF16423C),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.black12,
//             blurRadius: 4,
//             offset: Offset(0, 2),
//           ),
//         ],
//       ),
//       child: Row(
//         children: [
//           IconButton(
//             icon: Icon(Icons.arrow_back, color: Colors.white),
//             onPressed: () => Get.back(),
//           ),
//           SizedBox(width: 10),
//           Text(
//             'Order Details',
//             style: TextStyle(
//               color: Colors.white,
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//           Spacer(),
//           Obx(() {
//             final order = _controller.orderDetail.value;
//             if (order != null) {
//               return Container(
//                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
//                 decoration: BoxDecoration(
//                   color: _controller.getStatusColor(order.orderStatus).withOpacity(0.2),
//                   borderRadius: BorderRadius.circular(20),
//                   border: Border.all(
//                     color: _controller.getStatusColor(order.orderStatus),
//                   ),
//                 ),
//                 child: Text(
//                   _controller.getStatusText(order.orderStatus),
//                   style: TextStyle(
//                     color: _controller.getStatusColor(order.orderStatus),
//                     fontWeight: FontWeight.bold,
//                     fontSize: 12,
//                   ),
//                 ),
//               );
//             }
//             return SizedBox();
//           }),
//         ],
//       ),
//     );
//   }
//
//   // Order Summary Card
//   Widget _buildOrderSummaryCard(OrderDetailData order) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text(
//                   'Order #${order.id}',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: const Color(0xFF16423C),
//                   ),
//                 ),
//                 Icon(
//                   Icons.shopping_bag,
//                   color: const Color(0xFF16423C),
//                   size: 24,
//                 ),
//               ],
//             ),
//             SizedBox(height: 12),
//             Divider(),
//             SizedBox(height: 12),
//             _buildDetailRow(
//               icon: Icons.calendar_today,
//               label: 'Order Date',
//               value: _controller.getFormattedDate(order.createdAt),
//             ),
//             SizedBox(height: 8),
//             _buildDetailRow(
//               icon: Icons.update,
//               label: 'Last Updated',
//               value: _controller.getFormattedDate(order.updatedAt),
//             ),
//             SizedBox(height: 8),
//             _buildDetailRow(
//               icon: Icons.payment,
//               label: 'Payment Method',
//               value: order.paymentMethod.toUpperCase(),
//             ),
//             SizedBox(height: 8),
//             _buildDetailRow(
//               icon: Icons.payment,
//               label: 'Payment Status',
//               value: order.paymentStatus,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Products Card
//   Widget _buildProductsCard(OrderDetailData order) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.shopping_cart, color: const Color(0xFF16423C)),
//                 SizedBox(width: 10),
//                 Text(
//                   'Products',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: const Color(0xFF16423C),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//
//             // List of products
//             if (order.cartItems.isNotEmpty)
//               ...order.cartItems.map((item) => Column(
//                 children: [
//                   _buildProductItem(item, order),
//                   if (item != order.cartItems.last) Divider(),
//                 ],
//               )).toList(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Single Product Item - Fixed image 404 error
//   Widget _buildProductItem(CartItem item, OrderDetailData order) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 8),
//       child: Row(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           // Product Image with error handling
//           Container(
//             width: 60,
//             height: 60,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: Colors.grey[200],
//             ),
//             child: item.photo.isNotEmpty
//                 ? ClipRRect(
//               borderRadius: BorderRadius.circular(8),
//               child: Image.network(
//                 _getImageUrl(item.photo),
//                 fit: BoxFit.cover,
//                 errorBuilder: (context, error, stackTrace) {
//                   return Container(
//                     color: Colors.grey[200],
//                     child: Icon(
//                       Icons.shopping_bag,
//                       color: Colors.grey[400],
//                       size: 30,
//                     ),
//                   );
//                 },
//                 loadingBuilder: (context, child, loadingProgress) {
//                   if (loadingProgress == null) return child;
//                   return Center(
//                     child: CircularProgressIndicator(
//                       color: const Color(0xFF16423C),
//                       value: loadingProgress.expectedTotalBytes != null
//                           ? loadingProgress.cumulativeBytesLoaded /
//                           loadingProgress.expectedTotalBytes!
//                           : null,
//                     ),
//                   );
//                 },
//               ),
//             )
//                 : Container(
//               color: Colors.grey[200],
//               child: Icon(
//                 Icons.shopping_bag,
//                 color: Colors.grey[400],
//                 size: 30,
//               ),
//             ),
//           ),
//           SizedBox(width: 12),
//
//           // Product Details
//           Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   item.name,
//                   style: TextStyle(
//                     fontWeight: FontWeight.bold,
//                     fontSize: 16,
//                   ),
//                   maxLines: 1,
//                   overflow: TextOverflow.ellipsis,
//                 ),
//                 SizedBox(height: 4),
//
//                 if (item.attributesString.isNotEmpty)
//                   Text(
//                     item.attributesString,
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontSize: 12,
//                     ),
//                     maxLines: 1,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//
//                 SizedBox(height: 8),
//
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Text(
//                       '${order.currencySign}${item.price.toStringAsFixed(2)}',
//                       style: TextStyle(
//                         fontWeight: FontWeight.bold,
//                         color: const Color(0xFF16423C),
//                       ),
//                     ),
//                     Text(
//                       'Qty: ${item.qty}',
//                       style: TextStyle(color: Colors.grey),
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
//   // Price Breakdown Card
//   Widget _buildPriceBreakdownCard(OrderDetailData order) {
//     final subtotal = order.subtotal;
//     final shipping = order.shipping.price;
//     final tax = order.tax;
//     final stateTax = order.statePrice;
//     final total = order.totalPrice;
//
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.receipt, color: const Color(0xFF16423C)),
//                 SizedBox(width: 10),
//                 Text(
//                   'Price Breakdown',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: const Color(0xFF16423C),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//
//             _buildPriceRow('Subtotal', '${order.currencySign}${subtotal.toStringAsFixed(2)}'),
//             _buildPriceRow('Shipping (${order.shipping.title})', '${order.currencySign}${shipping.toStringAsFixed(2)}'),
//             _buildPriceRow('Tax', '${order.currencySign}${tax.toStringAsFixed(2)}'),
//             _buildPriceRow('State Tax (${order.state.name})', '${order.currencySign}${stateTax.toStringAsFixed(2)}'),
//
//             Divider(height: 20),
//
//             _buildPriceRow(
//               'Total',
//               '${order.currencySign}${total.toStringAsFixed(2)}',
//               isTotal: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Shipping Info Card
//   Widget _buildShippingInfoCard(OrderDetailData order) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.local_shipping, color: const Color(0xFF16423C)),
//                 SizedBox(width: 10),
//                 Text(
//                   'Shipping Information',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: const Color(0xFF16423C),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//
//             _buildInfoRow('Name', order.shippingInfo.fullName),
//             _buildInfoRow('Email', order.shippingInfo.shipEmail),
//             _buildInfoRow('Phone', order.shippingInfo.shipPhone),
//             _buildInfoRow('Address', order.shippingInfo.fullAddress),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Billing Info Card
//   Widget _buildBillingInfoCard(OrderDetailData order) {
//     return Card(
//       elevation: 3,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: Padding(
//         padding: EdgeInsets.all(16),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Row(
//               children: [
//                 Icon(Icons.home, color: const Color(0xFF16423C)),
//                 SizedBox(width: 10),
//                 Text(
//                   'Billing Information',
//                   style: TextStyle(
//                     fontSize: 18,
//                     fontWeight: FontWeight.bold,
//                     color: const Color(0xFF16423C),
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//
//             _buildInfoRow('Name', order.billingInfo.fullName),
//             _buildInfoRow('Email', order.billingInfo.shipEmail),
//             _buildInfoRow('Phone', order.billingInfo.shipPhone),
//             _buildInfoRow('Address', order.billingInfo.fullAddress),
//           ],
//         ),
//       ),
//     );
//   }
//
//   // Helper methods
//   String _getImageUrl(String photo) {
//     if (photo.isEmpty) return '';
//     if (photo.startsWith('http')) return photo;
//     return 'https://anniecabs.com/emartnew/$photo';
//   }
//
//   Widget _buildDetailRow({required IconData icon, required String label, required String value}) {
//     return Row(
//       children: [
//         Icon(icon, size: 20, color: Colors.grey),
//         SizedBox(width: 10),
//         Expanded(
//           child: Text(
//             label,
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 14,
//             ),
//           ),
//         ),
//         Text(
//           value,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             fontSize: 14,
//           ),
//         ),
//       ],
//     );
//   }
//
//   Widget _buildPriceRow(String label, String value, {bool isTotal = false}) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 6),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: isTotal ? 16 : 14,
//               fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
//             ),
//           ),
//           Text(
//             value,
//             style: TextStyle(
//               color: isTotal ? const Color(0xFF16423C) : Colors.black,
//               fontSize: isTotal ? 18 : 14,
//               fontWeight: FontWeight.bold,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildInfoRow(String label, String value) {
//     return Padding(
//       padding: EdgeInsets.symmetric(vertical: 6),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             label,
//             style: TextStyle(
//               color: Colors.grey,
//               fontSize: 12,
//             ),
//           ),
//           SizedBox(height: 2),
//           Text(
//             value,
//             style: TextStyle(
//               fontSize: 14,
//               fontWeight: FontWeight.w500,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'order_sub_detail_controller.dart';
import 'order_sub_detail_model.dart';


class OrderDetailScreen extends StatelessWidget {
  final int orderId;

  const OrderDetailScreen({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Initialize controller
    final controller = Get.put(OrderDetailSingleController());


    // Fetch data when screen loads
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (controller.currentOrderId != orderId || controller.orderDetail.value == null) {
        controller.fetchOrderDetails(orderId);
      }
    });

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // App Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              color: Color(0xFF16423C),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Get.back(),
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Order Details',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            // Content
            Expanded(
              child: Obx(() {
                if (controller.isLoading.value) {
                  return Center(
                    child: CircularProgressIndicator(
                      color: Color(0xFF16423C),
                    ),
                  );
                }

                if (controller.errorMessage.value.isNotEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error_outline, color: Colors.red, size: 50),
                        SizedBox(height: 16),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          child: Text(
                            controller.errorMessage.value,
                            textAlign: TextAlign.center,
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () => controller.fetchOrderDetails(orderId),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF16423C),
                          ),
                          child: Text('Retry', style: TextStyle(color: Colors.white)),
                        ),
                      ],
                    ),
                  );
                }

                final order = controller.orderDetail.value;
                if (order == null) {
                  return Center(
                    child: Text(
                      'No order details found',
                      style: TextStyle(color: Colors.grey),
                    ),
                  );
                }

                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Order Header
                        _buildOrderHeader(order, controller),

                        SizedBox(height: 20),

                        // Products
                        _buildProductsSection(order),

                        SizedBox(height: 20),

                        // Price Summary
                        _buildPriceSummary(order),

                        SizedBox(height: 20),

                        // Shipping Information
                        _buildShippingInfo(order),

                        SizedBox(height: 20),

                        // Billing Information
                        _buildBillingInfo(order),

                        SizedBox(height: 30),
                      ],
                    ),
                  ),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }



  // Widget _buildOrderHeader(OrderDetailData order, OrderDetailSingleController controller) {
  //   return Card(
  //     elevation: 3,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(12),
  //     ),
  //     child: Padding(
  //       padding: EdgeInsets.all(16),
  //       child: Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //             children: [
  //               Text(
  //                 'Order #${order.id}',
  //                 style: TextStyle(
  //                   fontSize: 18,
  //                   fontWeight: FontWeight.bold,
  //                   color: Color(0xFF16423C),
  //                 ),
  //               ),
  //               Container(
  //                 padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
  //                 decoration: BoxDecoration(
  //                   color: controller.getStatusColor(order.orderStatus).withOpacity(0.1),
  //                   borderRadius: BorderRadius.circular(20),
  //                   border: Border.all(
  //                     color: controller.getStatusColor(order.orderStatus),
  //                   ),
  //                 ),
  //                 child: Text(
  //                   controller.getStatusText(order.orderStatus),
  //                   style: TextStyle(
  //                     color: controller.getStatusColor(order.orderStatus),
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 12,
  //                   ),
  //                 ),
  //               ),
  //             ],
  //           ),
  //           SizedBox(height: 12),
  //           Divider(),
  //           SizedBox(height: 12),
  //           _buildInfoItem('Order Date', controller.getFormattedDate(order.createdAt)),
  //           SizedBox(height: 8),
  //           _buildInfoItem('Last Updated', controller.getFormattedDate(order.updatedAt)),
  //           SizedBox(height: 8),
  //           _buildInfoItem('Payment Method', order.paymentMethod.toUpperCase()),
  //           SizedBox(height: 8),
  //           _buildInfoItem('Payment Status', order.paymentStatus),
  //           SizedBox(height: 8),
  //           InkWell(
  //             child: Container(
  //               height: 50,
  //               width: 100,
  //               decoration: BoxDecoration(
  //                 color: Colors.red,
  //                 borderRadius: BorderRadius.circular(24)
  //               ),
  //               child: Center(child: Text("Cancel",)),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
  Widget _buildOrderHeader(OrderDetailData order, OrderDetailSingleController controller) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Order #${order.id}',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16423C),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: controller.getStatusColor(order.orderStatus).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: controller.getStatusColor(order.orderStatus),
                    ),
                  ),
                  child: Text(
                    controller.getStatusText(order.orderStatus),
                    style: TextStyle(
                      color: controller.getStatusColor(order.orderStatus),
                      fontWeight: FontWeight.bold,
                      fontSize: 12,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Divider(),
            SizedBox(height: 12),
            _buildInfoItem('Order Date', controller.getFormattedDate(order.createdAt)),
            SizedBox(height: 8),
            _buildInfoItem('Last Updated', controller.getFormattedDate(order.updatedAt)),
            SizedBox(height: 8),
            _buildInfoItem('Payment Method', order.paymentMethod.toUpperCase()),
            SizedBox(height: 8),
            _buildInfoItem('Payment Status', order.paymentStatus),
            SizedBox(height: 8),

            // Cancel Button - Check if order can be cancelled
            if (_isOrderCancellable(order.orderStatus)) ...[
              SizedBox(height: 12),
              _buildCancelButton(controller),
            ],
          ],
        ),
      ),
    );
  }

// Add this helper function to check if order can be cancelled
  bool _isOrderCancellable(String? status) {
    final lowerStatus = status?.toLowerCase() ?? '';
    final cancellableStatuses = ['pending', 'processing', 'on progress'];
    return cancellableStatuses.contains(lowerStatus);
  }

// Add this function for the cancel button
  Widget _buildCancelButton(OrderDetailSingleController controller) {
    return Obx(() {
      if (controller.isCancelling.value) {
        return
          Container(
          padding: EdgeInsets.symmetric(vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                color: Colors.red,
                strokeWidth: 2,
              ),
              SizedBox(width: 12),
              Text(
                'Cancelling Order...',
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        );
      }

      return Column(
        children: [
          // Cancel Message if any
          if (controller.cancelMessage.value.isNotEmpty)
            Container(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
              margin: EdgeInsets.only(bottom: 12),
              decoration: BoxDecoration(
                color: Colors.green.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.green.withOpacity(0.3)),
              ),
              child: Row(
                children: [
                  Icon(Icons.check_circle, color: Colors.green, size: 20),
                  SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      controller.cancelMessage.value,
                      style: TextStyle(
                        color: Colors.green,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ),

          // Cancel Button
          InkWell(
            onTap: () {
              _showCancelConfirmationDialog(controller);
            },
            child: Container(
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.red.withOpacity(0.3),
                    blurRadius: 6,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.cancel_outlined,
                    color: Colors.white,
                    size: 22,
                  ),
                  SizedBox(width: 10),
                  Text(
                    "Cancel Order",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
    });
  }

// Add this function for confirmation dialog
  void _showCancelConfirmationDialog(OrderDetailSingleController controller) {
    showDialog(
      context: Get.context!,
      builder: (context) => AlertDialog(
        title: Row(
          children: [
            Icon(Icons.warning_amber, color: Colors.orange),
            SizedBox(width: 10),
            Text(
              'Cancel Order?',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Are you sure you want to cancel this order?'),
            SizedBox(height: 12),
            if (controller.orderDetail.value != null) ...[
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Order Details:',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Text('Order ID: #${controller.orderDetail.value!.id}'),
                    SizedBox(height: 2),
                    Text('Total: ${controller.orderDetail.value!.currencySign}${controller.orderDetail.value!.totalPrice}'),
                    SizedBox(height: 2),
                    Text('Status: ${controller.orderDetail.value!.orderStatus}'),
                  ],
                ),
              ),
              SizedBox(height: 8),
            ],
            Text(
              'Note: This action cannot be undone.',
              style: TextStyle(
                color: Colors.red,
                fontSize: 12,
                fontStyle: FontStyle.italic,
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              'No, Keep It',
              style: TextStyle(color: Color(0xFF16423C)),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Get.back();
              controller.cancelOrder(); // This will call the cancel API
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
            child: Text('Yes, Cancel Order'),
          ),
        ],
      ),
    );
  }

  Widget _buildProductsSection(OrderDetailData order) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Products',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16423C),
              ),
            ),
            SizedBox(height: 16),

            ...order.cartItems.map((item) =>
                Padding(
                  padding: EdgeInsets.only(bottom: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Product Image
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.grey[200],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: _buildProductImage(item.fullImageUrl),
                        ),
                      ),
                      SizedBox(width: 12),

                      // Product Details
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.name,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            SizedBox(height: 4),

                            if (item.attributesString.isNotEmpty)
                              Text(
                                item.attributesString,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),

                            SizedBox(height: 8),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${order.currencySign}${item.price.toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF16423C),
                                  ),
                                ),
                                Text(
                                  'Qty: ${item.qty}',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
            ).toList(),
          ],
        ),
      ),
    );
  }

  Widget _buildPriceSummary(OrderDetailData order) {
    final subtotal = order.subtotal;
    final shipping = order.shipping.price;
    final tax = order.tax;
    final stateTax = order.statePrice;
    final total = order.totalPrice;

    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Price Summary',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16423C),
              ),
            ),
            SizedBox(height: 16),

            _buildPriceItem('Subtotal', '${order.currencySign}${subtotal.toStringAsFixed(2)}'),
            _buildPriceItem('Shipping', '${order.currencySign}${shipping.toStringAsFixed(2)}'),
            _buildPriceItem('Tax', '${order.currencySign}${tax.toStringAsFixed(2)}'),
            _buildPriceItem('State Tax (${order.state.name})', '${order.currencySign}${stateTax.toStringAsFixed(2)}'),

            Divider(height: 20),


            _buildPriceItem(
              'Total',
              '${order.currencySign}${total.toStringAsFixed(2)}',
              isTotal: true,

            ),
          ],
        ),
      ),
    );
  }

  Widget _buildShippingInfo(OrderDetailData order) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Shipping Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16423C),
              ),
            ),
            SizedBox(height: 16),

            _buildAddressItem('Name', order.shippingInfo.fullName),
            _buildAddressItem('Email', order.shippingInfo.shipEmail),
            _buildAddressItem('Phone', order.shippingInfo.shipPhone),
            _buildAddressItem('Address', order.shippingInfo.fullAddress),
          ],
        ),
      ),
    );
  }

  Widget _buildBillingInfo(OrderDetailData order) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Billing Information',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Color(0xFF16423C),
              ),
            ),
            SizedBox(height: 16),

            _buildAddressItem('Name', order.billingInfo.fullName),
            _buildAddressItem('Email', order.billingInfo.billEmail),
            _buildAddressItem('Phone', order.billingInfo.billPhone),
            _buildAddressItem('Address', order.billingInfo.fullAddress),
          ],
        ),
      ),
    );
  }

  // Helper Widgets
  Widget _buildInfoItem(String label, String value) {
    return Row(
      children: [
        Expanded(
          child: Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          value,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  Widget _buildPriceItem(String label, String value, {bool isTotal = false}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: TextStyle(
              color: isTotal ? Color(0xFF16423C) : Colors.grey,
              fontSize: isTotal ? 16 : 14,
              fontWeight: isTotal ? FontWeight.bold : FontWeight.normal,
            ),
          ),
          Text(
            value,
            style: TextStyle(
              color: isTotal ? Color(0xFF16423C) : Colors.black,
              fontSize: isTotal ? 18 : 14,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAddressItem(String label, String value) {
    return Padding(
      padding: EdgeInsets.only(bottom: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProductImage(String imageUrl) {
    return Image.network(
      imageUrl,
      fit: BoxFit.cover,
      loadingBuilder: (context, child, loadingProgress) {
        if (loadingProgress == null) return child;
        return Center(
          child: CircularProgressIndicator(
            value: loadingProgress.expectedTotalBytes != null
                ? loadingProgress.cumulativeBytesLoaded /
                loadingProgress.expectedTotalBytes!
                : null,
            color: Color(0xFF16423C),
          ),
        );
      },
      errorBuilder: (context, error, stackTrace) {
        return Container(
          color: Colors.grey[200],
          child: Center(
            child: Icon(
              Icons.shopping_bag,
              color: Colors.grey[400],
              size: 40,
            ),
          ),
        );
      },
    );
  }
}