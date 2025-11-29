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


import 'package:ecommerce/screens/cart_screen/cart_apiservice.dart';
import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
import 'package:ecommerce/screens/cart_screen/cart_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../customs/buttonscreen.dart';
import '../payment_screeen/paymentscreen.dart';


class cartscreen extends StatefulWidget {
  const cartscreen({super.key});

  @override
  State<cartscreen> createState() => _cartscreenState();
}

class _cartscreenState extends State<cartscreen> {
  final Color themeColor = const Color(0xFF16423C);
  final CartApiService _cartApiService = CartApiService();
  final CartController cartController = Get.find<CartController>();

  // Your existing dummy data
  final List<Map<String, dynamic>> popular = [
    {
      'title': 'Modern Light Clothes',
      'searches': 'T-shirt',
      'price':'40.00',
      'quantity':1
    },
    {
      'title': 'Modern Light Clothes',
      'searches': 'T-shirt',
      'price':'40.00',
      'quantity':1
    },
    {
      'title': 'Modern Light Clothes',
      'searches': 'T-shirt',
      'price':'40.00',
      'quantity':1
    },
    {
      'title': 'Modern Light Clothes',
      'searches': 'T-shirt',
      'price':'40.00',
      'quantity':1
    },{
      'title': 'Modern Light Clothes',
      'searches': 'T-shirt',
      'price':'40.00',
      'quantity':1
    },
  ];

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
        leading: InkWell(onTap: (){
          Get.back();
        },
            child: Icon(Icons.arrow_back,color: Colors.white,)),title:Text("Cart",style: TextStyle(color: Colors.white,fontWeight:
      FontWeight.bold),) ,),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // Show API data if available, otherwise show your dummy data
            Obx(()=>cartController.isLoading.value
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
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Image.network(
                                cartItem.photo,
                                height: 60,
                                width: 50,
                                errorBuilder: (context, error, stackTrace) {
                                  return Image.asset(
                                    "assets/images/myorderimage.png",
                                    height: 60,
                                    width: 50,
                                  );
                                },
                              )
                          ),

                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  cartItem.name,
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF16423C),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  "${cartItem.size} • ${cartItem.color}",
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$1352.81', // Using discount_price from API
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF16423C),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // Minus
                                    // Container(
                                    //   height:30,
                                    //   width:30,
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(color: themeColor),
                                    //     borderRadius: BorderRadius.circular(25),
                                    //   ),
                                    //   child: IconButton(
                                    //     padding: EdgeInsets.zero,
                                    //     constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                    //     icon: Icon(Icons.remove, color: themeColor,size: 14,),
                                    //     onPressed: cartItem.qty > 1
                                    //         ? () => cartController.updateQuantity(cartItem.cartId, cartItem.qty - 1)
                                    //         : null,
                                    //   ),
                                    // ),
                                    // Minus button - Remove immediately without confirmation
                                    // Container(
                                    //   height:30,
                                    //   width:30,
                                    //   decoration: BoxDecoration(
                                    //     border: Border.all(color: themeColor),
                                    //     borderRadius: BorderRadius.circular(25),
                                    //   ),
                                    //   child: IconButton(
                                    //     padding: EdgeInsets.zero,
                                    //     constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                    //     icon: Icon(Icons.remove, color: themeColor,size: 14,),
                                    //     onPressed: () => cartController.removeFromCart(cartItem.cartId),
                                    //   ),
                                    // ),
                                    // Minus button - Decrease quantity
                                    Container(
                                      height:30,
                                      width:30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: themeColor),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                        icon: Icon(Icons.remove, color: themeColor,size: 14,),
                                        onPressed: () {
                                          if (cartItem.qty > 1) {
                                            // Decrease quantity by 1
                                            cartController.updateQuantity(cartItem.cartId, cartItem.qty - 1);
                                          } else {
                                            // Remove item only when quantity is 1
                                            cartController.removeFromCart(cartItem.cartId);
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
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),

                                    // Plus
                                    Container(
                                      height:30,
                                      width:30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: themeColor),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                        icon: Icon(Icons.add,size: 14, color: themeColor),
                                        onPressed: () => cartController.updateQuantity(cartItem.cartId, cartItem.qty + 1),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Add divider line between items
                    Container(
                      height: 1,
                      color: Colors.black,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ],
                );
              }).toList(),
            )
                : Column(
              children: popular.asMap().entries.map((entry) {
                final index = entry.key;
                final search = entry.value;

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(0),
                      ),
                      child: Row(
                        children: [
                          Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child:Image.asset("assets/images/myorderimage.png",height: 60,width: 50,)
                          ),

                          // Product Details
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  search['title'],
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17,
                                    color: Color(0xFF16423C),
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  search['searches'],
                                  style: const TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                Text(
                                  '\$${search['price']}',
                                  style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Color(0xFF16423C),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    // Minus
                                    Container(
                                      height:30,
                                      width:30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: themeColor),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                        icon: Icon(Icons.remove, color: themeColor,size: 14,),
                                        onPressed: search['quantity'] > 1
                                            ? () => setState(() => search['quantity']--)
                                            : null,
                                      ),
                                    ),

                                    // Quantity number
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                                      child: Text(
                                        search['quantity'].toString(),
                                        style: TextStyle(
                                          color: themeColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 22,
                                        ),
                                      ),
                                    ),

                                    // Plus
                                    Container(
                                      height:30,
                                      width:30,
                                      decoration: BoxDecoration(
                                        border: Border.all(color: themeColor),
                                        borderRadius: BorderRadius.circular(25),
                                      ),
                                      child: IconButton(
                                        padding: EdgeInsets.zero,
                                        constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                                        icon: Icon(Icons.add,size: 14, color: themeColor),
                                        onPressed: () => setState(() => search['quantity']++),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Add divider line between items
                    Container(
                      height: 1,
                      color: Colors.black,
                      margin: const EdgeInsets.symmetric(horizontal: 16),
                    ),
                  ],
                );
              }).toList(),
            ),
            ),


            SizedBox(height: 20,),
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
            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              height: 60,
              width: 380,
              child:Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset("assets/icons/img.png",height: 28,),
                        Text("Enter your Promocode",style: TextStyle(fontSize: 18),),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(Icons.arrow_forward_ios_outlined),
                        )
                      ],
                    ),
                  )),
            ),
            SizedBox(height: 20,),

            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Shipping",style: TextStyle(color: Color(0xFF16423C),fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("40.00",style: TextStyle(color: Color(0xFF16423C),
                          fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20),
                      child: Text("Total Amount",style: TextStyle(color: Color(0xFF16423C),
                          fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("5.00",style: TextStyle(color: Color(0xFF16423C),
                          fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
              ],
            ),
            SizedBox(height: 10,),
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
                      child: Text("Sub Total",style: TextStyle(color: Color(0xFF16423C),
                          fontWeight: FontWeight.bold),),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: Text("45.00",style: TextStyle(color: Color(0xFF16423C),
                          fontWeight: FontWeight.bold),),
                    )
                  ],
                ),
                SizedBox(height: 30,),
                Padding(
                  padding: const EdgeInsets.only(right: 20,left: 20),
                  child: CustomButton(
                    text: "Checkout",
                    onPressed: () {
                      Get.to(paymentscreen());
                      print("Get Started button pressed!");
                    },
                  ),
                ),
                SizedBox(height: 20,)
              ],
            )
          ],
        ),
      ),
    );
  }
}
