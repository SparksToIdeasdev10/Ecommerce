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

//main hai aaj ka
// import 'package:ecommerce/screens/cart_screen/cart_apiservice.dart';
// import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
// import 'package:ecommerce/screens/cart_screen/cart_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import '../../customs/buttonscreen.dart';
// import '../payment_screeen/paymentscreen.dart';
//
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
//   final CartApiService _cartApiService = CartApiService();
//   final CartController cartController = Get.put(CartController());
//
//   // Your existing dummy data
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
//     },
//   ];
//
//   @override
//   void initState() {
//     super.initState();
//     cartController.fetchCartItems();
//   }
//
//
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
//           children: [
//             // Show API data if available, otherwise show your dummy data
//             Obx(()=>cartController.isLoading.value
//                 ? Center(child: CircularProgressIndicator())
//                 : cartController.cartItems.isNotEmpty
//                 ? Column(
//               children: cartController.cartItems.asMap().entries.map((entry) {
//                 final index = entry.key;
//                 final cartItem = entry.value;
//
//                 return Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                       child: Row(
//                         children: [
//                           Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                               child: Image.network(
//                                 cartItem.photo,
//                                 height: 60,
//                                 width: 50,
//                                 errorBuilder: (context, error, stackTrace) {
//                                   return Image.asset(
//                                     "assets/images/myorderimage.png",
//                                     height: 60,
//                                     width: 50,
//                                   );
//                                 },
//                               )
//                           ),
//
//                           // Product Details
//                           Expanded(
//                             child: Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   cartItem.name,
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 17,
//                                     color: Color(0xFF16423C),
//                                   ),
//                                 ),
//
//                                 const SizedBox(height: 4),
//                                 Text(
//                                   "${cartItem.size} • ${cartItem.color}",
//                                   style: const TextStyle(
//                                     color: Colors.grey,
//                                     fontSize: 14,
//                                   ),
//                                 ),
//                                 const SizedBox(height: 8),
//                                 Text("${cartItem.discount_price}",
//                                   style: const TextStyle(
//                                     fontWeight: FontWeight.bold,
//                                     fontSize: 16,
//                                     color: Color(0xFF16423C),
//                                   ),
//                                 ),
//
//                               ],
//                             ),
//                           ),
//
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     // Minus
//                                     // Container(
//                                     //   height:30,
//                                     //   width:30,
//                                     //   decoration: BoxDecoration(
//                                     //     border: Border.all(color: themeColor),
//                                     //     borderRadius: BorderRadius.circular(25),
//                                     //   ),
//                                     //   child: IconButton(
//                                     //     padding: EdgeInsets.zero,
//                                     //     constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                     //     icon: Icon(Icons.remove, color: themeColor,size: 14,),
//                                     //     onPressed: cartItem.qty > 1
//                                     //         ? () => cartController.updateQuantity(cartItem.cartId, cartItem.qty - 1)
//                                     //         : null,
//                                     //   ),
//                                     // ),
//                                     // Minus button - Remove immediately without confirmation
//                                     // Container(
//                                     //   height:30,
//                                     //   width:30,
//                                     //   decoration: BoxDecoration(
//                                     //     border: Border.all(color: themeColor),
//                                     //     borderRadius: BorderRadius.circular(25),
//                                     //   ),
//                                     //   child: IconButton(
//                                     //     padding: EdgeInsets.zero,
//                                     //     constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                     //     icon: Icon(Icons.remove, color: themeColor,size: 14,),
//                                     //     onPressed: () => cartController.removeFromCart(cartItem.cartId),
//                                     //   ),
//                                     // ),
//                                     // Minus button - Decrease quantity
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
//                                         icon: Icon(Icons.remove, color: themeColor,size: 14,),
//                                         onPressed: () {
//                                           if (cartItem.qty > 1) {
//                                             // Decrease quantity by 1
//                                             cartController.updateQuantity(cartItem.cartId, cartItem.qty - 1);
//                                           } else {
//                                             // Remove item only when quantity is 1
//                                             cartController.removeFromCart(cartItem.cartId);
//                                           }
//                                         },
//                                       ),
//                                     ),
//
//                                     // Quantity number
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                                       child: Text(
//                                         cartItem.qty.toString(),
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
//                                         onPressed: () => cartController.updateQuantity(cartItem.cartId, cartItem.qty + 1),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Add divider line between items
//                     Container(
//                       height: 1,
//                       color: Colors.black,
//                       margin: const EdgeInsets.symmetric(horizontal: 16),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             )
//                 : Column(
//               children: popular.asMap().entries.map((entry) {
//                 final index = entry.key;
//                 final search = entry.value;
//
//                 return Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                       child: Row(
//                         children: [
//                           Padding(
//                               padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                               child:Image.asset("assets/images/myorderimage.png",height: 60,width: 50,)
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
//                                   children: [
//                                     // Minus
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
//                         ],
//                       ),
//                     ),
//                     // Add divider line between items
//                     Container(
//                       height: 1,
//                       color: Colors.black,
//                       margin: const EdgeInsets.symmetric(horizontal: 16),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             ),
//             ),
//
//
//             SizedBox(height: 20,),
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
//                   alignment: Alignment.centerLeft,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         Image.asset("assets/icons/img.png",height: 28,),
//                         Text("Enter your Promocode",style: TextStyle(fontSize: 18),),
//                         Padding(
//                           padding: const EdgeInsets.only(right: 10),
//                           child: Icon(Icons.arrow_forward_ios_outlined),
//                         )
//                       ],
//                     ),
//                   )),
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
//                           fontWeight: FontWeight.bold),),
//                     )
//                   ],
//                 ),
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
//                           fontWeight: FontWeight.bold),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Text("5.00",style: TextStyle(color: Color(0xFF16423C),
//                           fontWeight: FontWeight.bold),),
//                     )
//                   ],
//                 ),
//               ],
//             ),
//             SizedBox(height: 10,),
//             const Text(
//               '- - - - - - - - - - - - - - - - - - - - - -',
//               style: TextStyle(
//                   color: Colors.grey,
//                   fontSize: 18,
//                   letterSpacing: 2,
//                   fontWeight: FontWeight.bold
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
//                           fontWeight: FontWeight.bold),),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(right: 20),
//                       child: Text("45.00",style: TextStyle(color: Color(0xFF16423C),
//                           fontWeight: FontWeight.bold),),
//                     )
//                   ],
//                 ),
//                 SizedBox(height: 30,),
//                 Padding(
//                   padding: const EdgeInsets.only(right: 20,left: 20),
//                   child: CustomButton(
//                     text: "Checkout",
//                     onPressed: () {
//                       Get.to(paymentscreen());
//                       print("Get Started button pressed!");
//                     },
//                   ),
//                 ),
//                 SizedBox(height: 20,)
//               ],
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

//just updated 24-12-25
// import 'package:ecommerce/screens/cart_screen/cart_apiservice.dart';
// import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
// import 'package:ecommerce/screens/payment_screeen/paymentscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import 'cart_model.dart';
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
//   final CartApiService _cartApiService = CartApiService();
//   final CartController cartController = Get.put(CartController());
//
//   @override
//   void initState() {
//     super.initState();
//     cartController.fetchCartItems();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Color(0xFF16423C),
//         leading: InkWell(
//           onTap: () {
//             Get.back();
//           },
//           child: Icon(Icons.arrow_back, color: Colors.white),
//         ),
//         title: Obx(() => Text(
//           "Cart (${cartController.itemCount.value})",
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         )),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             // Cart Items
//             Obx(() => cartController.isLoading.value
//                 ? Center(child: CircularProgressIndicator())
//                 : cartController.cartItems.isNotEmpty
//                 ? Column(
//               children: cartController.cartItems.asMap().entries.map((entry) {
//                 final index = entry.key;
//                 final cartItem = entry.value;
//
//                 return Column(
//                   children: [
//                     Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(0),
//                       ),
//                       child: Row(
//                         children: [
//                           // Product Image
//                           Padding(
//                             padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                             child: Image.network(
//                               cartItem.photo,
//                               height: 80,
//                               width: 70,
//                               fit: BoxFit.cover,
//                               errorBuilder: (context, error, stackTrace) {
//                                 return Image.asset(
//                                   "assets/images/myorderimage.png",
//                                   height: 80,
//                                   width: 70,
//                                   fit: BoxFit.cover,
//                                 );
//                               },
//                             ),
//                           ),
//
//                           // Product Details
//                           Expanded(
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(vertical: 8.0),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     cartItem.formattedName,
//                                     style: const TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 16,
//                                       color: Color(0xFF16423C),
//                                     ),
//                                     maxLines: 2,
//                                     overflow: TextOverflow.ellipsis,
//                                   ),
//
//                                   const SizedBox(height: 4),
//
//                                   // Display Size and Color
//                                   if (cartItem.size.isNotEmpty || cartItem.color.isNotEmpty)
//                                     Column(
//                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                       children: [
//                                         if (cartItem.size.isNotEmpty)
//                                           Text(
//                                             "Size: ${cartItem.size}",
//                                             style: const TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 14,
//                                             ),
//                                           ),
//                                         if (cartItem.color.isNotEmpty)
//                                           Text(
//                                             "Color: ${cartItem.color}",
//                                             style: const TextStyle(
//                                               color: Colors.grey,
//                                               fontSize: 14,
//                                             ),
//                                           ),
//                                       ],
//                                     ),
//
//                                   const SizedBox(height: 8),
//
//                                   // Price with attribute additions
//                                   Column(
//                                     crossAxisAlignment: CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         cartItem.formattedPriceWithAttributes,
//                                         style: const TextStyle(
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 16,
//                                           color: Color(0xFF16423C),
//                                         ),
//                                       ),
//
//                                       // Show attribute price addition if any
//                                       if (cartItem.attributeAdditionalPrice > 0)
//                                         Text(
//                                           "(Includes +\$${cartItem.attributeAdditionalPrice.toStringAsFixed(2)} for options)",
//                                           style: TextStyle(
//                                             fontSize: 12,
//                                             color: Colors.green[700],
//                                           ),
//                                         ),
//                                     ],
//                                   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//
//                           // Quantity Controls
//                           Padding(
//                             padding: const EdgeInsets.all(8.0),
//                             child: Column(
//                               children: [
//                                 Row(
//                                   children: [
//                                     // Minus button
//                                     Container(
//                                       height: 30,
//                                       width: 30,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: themeColor),
//                                         borderRadius: BorderRadius.circular(25),
//                                       ),
//                                       child: IconButton(
//                                         padding: EdgeInsets.zero,
//                                         constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                         icon: Icon(Icons.remove, color: themeColor, size: 14),
//                                         onPressed: () {
//                                           if (cartItem.qty > 1) {
//                                             cartController.updateQuantity(cartItem.cartId, cartItem.qty - 1);
//                                           } else {
//                                             // Show confirmation before removing
//                                             _showRemoveConfirmation(cartItem);
//                                           }
//                                         },
//                                       ),
//                                     ),
//
//                                     // Quantity number
//                                     Padding(
//                                       padding: const EdgeInsets.symmetric(horizontal: 12.0),
//                                       child: Text(
//                                         cartItem.qty.toString(),
//                                         style: TextStyle(
//                                           color: themeColor,
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 18,
//                                         ),
//                                       ),
//                                     ),
//
//                                     // Plus button
//                                     Container(
//                                       height: 30,
//                                       width: 30,
//                                       decoration: BoxDecoration(
//                                         border: Border.all(color: themeColor),
//                                         borderRadius: BorderRadius.circular(25),
//                                       ),
//                                       child: IconButton(
//                                         padding: EdgeInsets.zero,
//                                         constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
//                                         icon: Icon(Icons.add, size: 14, color: themeColor),
//                                         onPressed: () => cartController.updateQuantity(cartItem.cartId, cartItem.qty + 1),
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//
//                                 // Total for this item
//                                 Padding(
//                                   padding: const EdgeInsets.only(top: 8.0),
//                                   child: Text(
//                                     "Total: \$${cartItem.totalPriceWithAttributes.toStringAsFixed(2)}",
//                                     style: TextStyle(
//                                       fontWeight: FontWeight.bold,
//                                       fontSize: 14,
//                                       color: themeColor,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // Divider line between items
//                     Container(
//                       height: 1,
//                       color: Colors.grey[300],
//                       margin: const EdgeInsets.symmetric(horizontal: 16),
//                     ),
//                   ],
//                 );
//               }).toList(),
//             )
//                 : _buildEmptyCart(),
//             ),
//
//             SizedBox(height: 20),
//
//             // Order Summary
//             if (cartController.cartItems.isNotEmpty)
//               _buildOrderSummary(),
//
//             SizedBox(height: 20),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEmptyCart() {
//     return Padding(
//       padding: const EdgeInsets.all(40.0),
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Icon(
//             Icons.shopping_cart_outlined,
//             size: 80,
//             color: Colors.grey[400],
//           ),
//           SizedBox(height: 20),
//           Text(
//             "Your cart is empty",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: Colors.grey[600],
//             ),
//           ),
//           SizedBox(height: 10),
//           Text(
//             "Add some products to your cart",
//             style: TextStyle(
//               fontSize: 16,
//               color: Colors.grey[500],
//             ),
//           ),
//           SizedBox(height: 30),
//           ElevatedButton(
//             onPressed: () {
//               Get.back(); // Go back to products
//             },
//             style: ElevatedButton.styleFrom(
//               backgroundColor: themeColor,
//               padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
//             ),
//             child: Text(
//               "Continue Shopping",
//               style: TextStyle(
//                 color: Colors.white,
//                 fontSize: 16,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildOrderSummary() {
//     return Container(
//       margin: EdgeInsets.all(16),
//       padding: EdgeInsets.all(16),
//       decoration: BoxDecoration(
//         color: Colors.white,
//         borderRadius: BorderRadius.circular(12),
//         boxShadow: [
//           BoxShadow(
//             color: Colors.grey.withOpacity(0.1),
//             blurRadius: 10,
//             offset: Offset(0, 4),
//           ),
//         ],
//       ),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Text(
//             "Order Summary",
//             style: TextStyle(
//               fontSize: 20,
//               fontWeight: FontWeight.bold,
//               color: themeColor,
//             ),
//           ),
//           SizedBox(height: 16),
//
//           // Subtotal
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Subtotal",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[700],
//                 ),
//               ),
//               Obx(() => Text(
//                 "\$${cartController.totalAmount.value.toStringAsFixed(2)}",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               )),
//             ],
//           ),
//
//           SizedBox(height: 8),
//
//           // Attribute additions
//           Obx(() {
//             double attributeTotal = cartController.totalAmountWithAttributes.value - cartController.totalAmount.value;
//             if (attributeTotal > 0) {
//               return Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     "Attribute Additions",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.grey[700],
//                     ),
//                   ),
//                   Text(
//                     "+\$${attributeTotal.toStringAsFixed(2)}",
//                     style: TextStyle(
//                       fontSize: 16,
//                       color: Colors.green[700],
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ],
//               );
//             }
//             return SizedBox();
//           }),
//
//           SizedBox(height: 8),
//
//           // Shipping
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Shipping",
//                 style: TextStyle(
//                   fontSize: 16,
//                   color: Colors.grey[700],
//                 ),
//               ),
//               Text(
//                 "\$40.00",
//                 style: TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                 ),
//               ),
//             ],
//           ),
//
//           Divider(height: 30),
//
//           // Total
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Text(
//                 "Total",
//                 style: TextStyle(
//                   fontSize: 20,
//                   fontWeight: FontWeight.bold,
//                   color: themeColor,
//                 ),
//               ),
//               Obx(() {
//                 double total = cartController.totalAmountWithAttributes.value + 40.0;
//                 return Text(
//                   "\$${total.toStringAsFixed(2)}",
//                   style: TextStyle(
//                     fontSize: 20,
//                     fontWeight: FontWeight.bold,
//                     color: themeColor,
//                   ),
//                 );
//               }),
//             ],
//           ),
//
//           SizedBox(height: 20),
//
//           // Checkout Button
//           SizedBox(
//             width: double.infinity,
//             child: ElevatedButton(
//               onPressed: () {
//                 Get.to(() => paymentscreen());
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: themeColor,
//                 padding: EdgeInsets.symmetric(vertical: 16),
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//               ),
//               child: Text(
//                 "Proceed to Checkout",
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//
//     );
//   }
//
//
//   void _showRemoveConfirmation(CartItem cartItem) {
//     Get.defaultDialog(
//       title: "Remove Item",
//       titleStyle: TextStyle(color: themeColor, fontWeight: FontWeight.bold),
//       content: Column(
//         children: [
//           Text("Are you sure you want to remove"),
//           Text(
//             cartItem.formattedName,
//             style: TextStyle(fontWeight: FontWeight.bold),
//             textAlign: TextAlign.center,
//           ),
//           Text("from your cart?"),
//         ],
//       ),
//       confirm: ElevatedButton(
//         onPressed: () {
//           Get.back();
//           cartController.removeFromCart(cartItem.cartId);
//         },
//         style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
//         child: Text("Remove"),
//       ),
//       cancel: OutlinedButton(
//         onPressed: () => Get.back(),
//         child: Text("Cancel"),
//
//       ),
//     );
//   }
// }

import 'package:ecommerce/screens/cart_screen/cart_apiservice.dart';
import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
import 'package:ecommerce/screens/payment_screeen/paymentscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'cart_model.dart';

class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  final Color themeColor = const Color(0xFF16423C);
  final CartApiService _cartApiService = CartApiService();
  final CartController cartController = Get.put(CartController());

  @override
  void initState() {
    super.initState();
    cartController.fetchCartItems();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF16423C),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Icon(Icons.arrow_back, color: Colors.white),
        ),
        title: Obx(() => Text(
          "Cart (${cartController.itemCount.value})",
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Cart Items
            Obx(() => cartController.isLoading.value
                ? Center(child: CircularProgressIndicator())
                : cartController.cartItems.isNotEmpty
                ? Column(
              children: cartController.cartItems.asMap().entries.map((entry) {
                final index = entry.key;
                final cartItem = entry.value;

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Row(
                        children: [
                          // Product Image
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Image.network(
                              cartItem.photo,
                              height: 80,
                              width: 70,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Image.asset(
                                  "assets/images/myorderimage.png",
                                  height: 80,
                                  width: 70,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),

                          // Product Details
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    cartItem.formattedName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Color(0xFF16423C),
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),

                                  const SizedBox(height: 4),

                                  // Display Size and Color
                                  if (cartItem.size.isNotEmpty || cartItem.color.isNotEmpty)
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        if (cartItem.size.isNotEmpty)
                                          Text(
                                            "Size: ${cartItem.size}",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                        if (cartItem.color.isNotEmpty)
                                          Text(
                                            "Color: ${cartItem.color}",
                                            style: const TextStyle(
                                              color: Colors.grey,
                                              fontSize: 14,
                                            ),
                                          ),
                                      ],
                                    ),

                                  const SizedBox(height: 8),

                                  // Price with attribute additions
                                  Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        cartItem.formattedPriceWithAttributes,
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16,
                                          color: Color(0xFF16423C),
                                        ),
                                      ),

                                      // Show attribute price addition if any
                                      if (cartItem.attributeAdditionalPrice > 0)
                                        Text(
                                          "(Includes +\$${cartItem.attributeAdditionalPrice.toStringAsFixed(2)} for options)",
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.green[700],
                                          ),
                                        ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),

                          // Quantity Controls
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // Minus button
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: themeColor),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                        icon: Icon(Icons.remove, color: themeColor, size: 14),
                                        onPressed: () {
                                          if (cartItem.qty > 1) {
                                            cartController.updateQuantity(cartItem.cartId, cartItem.qty - 1);
                                          } else {
                                            // Show confirmation before removing
                                            _showRemoveConfirmation(cartItem);
                                          }
                                        },
                                      ),
                                    ),

                                    // Quantity number
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Text(
                                        cartItem.qty.toString(),
                                        style: TextStyle(
                                          color: themeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),

                                    // Plus button
                                    Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: themeColor),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                        icon: Icon(Icons.add, size: 14, color: themeColor),
                                        onPressed: () => cartController.updateQuantity(cartItem.cartId, cartItem.qty + 1),
                                      ),
                                    ),
                                  ],
                                ),

                                // Total for this item
                                Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    "Total: \$${cartItem.totalPriceWithAttributes.toStringAsFixed(2)}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: themeColor,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Divider line between items
                    Container(
                      height: 1,
                      color: Colors.grey[300],
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ],
                );
              }).toList(),
            )
                : _buildEmptyCart(),
            ),

            // ============ YOUR ORIGINAL UI STRUCTURE ============
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Shipping information',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF16423C),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 60,
              width: 380,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset("assets/icons/img.png", height: 28),
                      Text("Enter your Promocode", style: TextStyle(fontSize: 18)),
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(Icons.arrow_forward_ios_outlined),
                      )
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),

            // Dynamic Price Calculation Section
            Obx(() {
              // Calculate totals
              double subtotal = 0.0;
              double attributeTotal = 0.0;

              for (var item in cartController.cartItems) {
                subtotal += item.totalPrice;
                attributeTotal += item.attributeAdditionalPrice * item.qty;
              }

              double shipping = 40.0;
              double totalWithAttributes = subtotal + attributeTotal;
              double totalAmount = totalWithAttributes + shipping;

              return Column(
                children: [
                  // Shipping
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Shipping",
                          style: TextStyle(
                              color: Color(0xFF16423C),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "\$${shipping.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Color(0xFF16423C),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),

                  // Total Amount (Subtotal + Attribute additions)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text(
                          "Total Amount",
                          style: TextStyle(
                              color: Color(0xFF16423C),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text(
                          "\$${totalWithAttributes.toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Color(0xFF16423C),
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 10),

                  // Divider
                  const Text(
                    '- - - - - - - - - - - - - - - - - - - - - -',
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 18,
                        letterSpacing: 2,
                        fontWeight: FontWeight.bold
                    ),
                  ),

                  // Sub Total (Shipping + Total Amount)
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20),
                            child: Text(
                              "Sub Total",
                              style: TextStyle(
                                  color: Color(0xFF16423C),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Text(
                              "\$${totalAmount.toStringAsFixed(2)}",
                              style: TextStyle(
                                  color: Color(0xFF16423C),
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 30),

                      // Checkout Button
                      Padding(
                        padding: const EdgeInsets.only(right: 20, left: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Get.to(() => paymentscreen());
                              print("Get Started button pressed!");
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: themeColor,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            child: Text(
                              "Checkout",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 20)
                    ],
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyCart() {
    return Padding(
      padding: const EdgeInsets.all(40.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: Colors.grey[400],
          ),
          SizedBox(height: 20),
          Text(
            "Your cart is empty",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.grey[600],
            ),
          ),
          SizedBox(height: 10),
          Text(
            "Add some products to your cart",
            style: TextStyle(
              fontSize: 16,
              color: Colors.grey[500],
            ),
          ),
          SizedBox(height: 30),
          ElevatedButton(
            onPressed: () {
              Get.back(); // Go back to products
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: themeColor,
              padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
            ),
            child: Text(
              "Continue Shopping",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),
            ),
          ),
          // Add your original structure even when cart is empty
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Shipping information',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF16423C),
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Colors.white,
            ),
            height: 60,
            width: 380,
            child: Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset("assets/icons/img.png", height: 28),
                    Text("Enter your Promocode", style: TextStyle(fontSize: 18)),
                    Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Icon(Icons.arrow_forward_ios_outlined),
                    )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          // Show static prices when cart is empty
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Shipping", style: TextStyle(color: Color(0xFF16423C), fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text("40.00", style: TextStyle(color: Color(0xFF16423C), fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Text("Total Amount", style: TextStyle(color: Color(0xFF16423C), fontWeight: FontWeight.bold)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 20),
                    child: Text("0.00", style: TextStyle(color: Color(0xFF16423C), fontWeight: FontWeight.bold)),
                  )
                ],
              ),
              SizedBox(height: 10),
              const Text(
                '- - - - - - - - - - - - - - - - - - - - - -',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 18,
                    letterSpacing: 2,
                    fontWeight: FontWeight.bold
                ),
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Text("Sub Total", style: TextStyle(color: Color(0xFF16423C), fontWeight: FontWeight.bold)),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 20),
                        child: Text("40.00", style: TextStyle(color: Color(0xFF16423C), fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                  SizedBox(height: 30),
                  Padding(
                    padding: const EdgeInsets.only(right: 20, left: 20),
                    child: SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          Get.to(() => paymentscreen());
                          print("Get Started button pressed!");
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeColor,
                          padding: EdgeInsets.symmetric(vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: Text(
                          "Checkout",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20)
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showRemoveConfirmation(CartItem cartItem) {
    Get.defaultDialog(
      title: "Remove Item",
      titleStyle: TextStyle(color: themeColor, fontWeight: FontWeight.bold),
      content: Column(
        children: [
          Text("Are you sure you want to remove"),
          Text(
            cartItem.formattedName,
            style: TextStyle(fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          Text("from your cart?"),
        ],
      ),
      confirm: ElevatedButton(
        onPressed: () {
          Get.back();
          cartController.removeFromCart(cartItem.cartId);
        },
        style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
        child: Text("Remove"),
      ),
      cancel: OutlinedButton(
        onPressed: () => Get.back(),
        child: Text("Cancel"),
      ),
    );
  }
}
