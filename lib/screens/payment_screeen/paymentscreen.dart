import 'package:ecommerce/screens/add_new_card/add_new_card_screen.dart';
import 'package:ecommerce/screens/bottom_nav/bottom_nav_screen.dart';
import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
import 'package:ecommerce/screens/edit_adress_screen/edit_address_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../customs/buttonscreen.dart';
import '../edit_adress_screen/edit_address_screen.dart';
import 'order_details_screens/my_order_screen.dart';
import 'order_screen/order_controller.dart';

class paymentscreen extends StatefulWidget {
  const paymentscreen({super.key});

  @override
  State<paymentscreen> createState() => _paymentscreenState();
}

class _paymentscreenState extends State<paymentscreen> {
  final Color themeColor = const Color(0xFF16423C);
  final CartController cartController = Get.find<CartController>();
  final OrderController orderController = Get.put(OrderController());

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

  ];
  // Widget _buildCheckoutButton() {
  //   return GetBuilder<EditAddressController>(
  //     builder: (controller) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //         child: controller.hasData.value
  //             ? CustomButton(
  //           text: "Checkout Now",
  //           onPressed: () {
  //             showCheckoutBottomSheet(context);
  //           },
  //         )
  //             : Opacity(
  //           opacity: 0.6, // Makes it look disabled
  //           child: CustomButton(
  //             text: "Checkout Now",
  //             onPressed: () {
  //               // Show message when disabled
  //               Get.snackbar(
  //                 "Address Required",
  //                 "Please add your address first",
  //                 snackPosition: SnackPosition.BOTTOM,
  //               );
  //             },
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }
  // Widget _buildCheckoutButton() {
  //   return GetBuilder<EditAddressController>(
  //     builder: (controller) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //         child: Column(
  //           children: [
  //             // Debug info
  //             Text(
  //               "Debug - Has Data: ${controller.hasData.value}, Address: ${controller.addressData.value.shipAddress1}",
  //               style: TextStyle(fontSize: 12, color: Colors.grey),
  //             ),
  //             SizedBox(height: 10),
  //             // Button
  //             CustomButton(
  //               text: "Checkout Now",
  //               onPressed: () {
  //                 showCheckoutBottomSheet(context);
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  // Widget _buildCheckoutButton() {
  //   return GetBuilder<EditAddressController>(
  //     builder: (controller) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //         child: Column(
  //           children: [
  //             // Debug info (optional)
  //             if (kDebugMode)
  //               Text(
  //                 "Debug - Has Data: ${controller.hasData.value}",
  //                 style: TextStyle(fontSize: 12, color: Colors.grey),
  //               ),
  //             SizedBox(height: 10),
  //
  //             // Button
  //             GetBuilder<OrderController>(
  //               builder: (orderController) {
  //                 return orderController.isLoading.value
  //                     ? Center(
  //                   child: CircularProgressIndicator(
  //                     valueColor: AlwaysStoppedAnimation<Color>(themeColor),
  //                   ),
  //                 )
  //                     : CustomButton(
  //                   text: "Checkout Now",
  //                   onPressed: () async {
  //                     // Check if address is available
  //                     if (!controller.hasData.value) {
  //                       Get.snackbar(
  //                         "Address Required",
  //                         "Please add your address first",
  //                         snackPosition: SnackPosition.BOTTOM,
  //                         backgroundColor: Colors.orange,
  //                         colorText: Colors.white,
  //                       );
  //                       return;
  //                     }
  //
  //                     // Show loading
  //                     Get.dialog(
  //                       Center(
  //                         child: CircularProgressIndicator(
  //                           valueColor: AlwaysStoppedAnimation<Color>(themeColor),
  //                         ),
  //                       ),
  //                       barrierDismissible: false,
  //                     );
  //
  //                     try {
  //                       // Place order
  //                       await orderController.placeOrder();
  //
  //                       // Close loading dialog
  //                       Get.back();
  //
  //                       // Check if order was successful
  //                       if (orderController.isOrderPlaced.value) {
  //                         // Show success bottom sheet
  //                         showCheckoutBottomSheet(
  //                           context,
  //                           orderId: orderController.orderId.value,
  //                         );
  //                       }
  //                       // If order failed, the error is already shown in placeOrder()
  //
  //                     } catch (e) {
  //                       // Close loading dialog
  //                       Get.back();
  //
  //                       // Show error
  //                       Get.snackbar(
  //                         "Error",
  //                         "Failed to process checkout: $e",
  //                         snackPosition: SnackPosition.BOTTOM,
  //                         backgroundColor: Colors.red,
  //                         colorText: Colors.white,
  //                       );
  //                     }
  //                   },
  //                 );
  //               },
  //             ),
  //           ],
  //         ),
  //       );
  //     },
  //   );
  // }
  // Widget _buildCheckoutButton() {
  //   return Padding(
  //     padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //     child: CustomButton(
  //       text: "Checkout Now",
  //       onPressed: () async {
  //         try {
  //           // Get controllers safely
  //           final orderController = Get.find<OrderController>();
  //
  //           // Show loading
  //           Get.dialog(
  //             Center(
  //               child: CircularProgressIndicator(
  //                 valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF16423C)),
  //               ),
  //             ),
  //             barrierDismissible: false,
  //           );
  //
  //           // Place order
  //           await orderController.placeOrder();
  //
  //           // Close loading dialog
  //           Get.back();
  //
  //           // Check if order was successful
  //           if (orderController.isOrderPlaced.value) {
  //             // Show success bottom sheet
  //             showCheckoutBottomSheet(
  //               context,
  //               orderId: orderController.orderId.value,
  //             );
  //           }
  //           // If order failed, error is already shown in placeOrder()
  //
  //         } catch (e) {
  //           // Close loading dialog if still open
  //           if (Get.isDialogOpen ?? false) {
  //             Get.back();
  //           }
  //
  //           // Show error
  //           Get.snackbar(
  //             "Error",
  //             "Failed to process checkout: $e",
  //             snackPosition: SnackPosition.BOTTOM,
  //             backgroundColor: Colors.red,
  //             colorText: Colors.white,
  //           );
  //           print('❌ Checkout error: $e');
  //         }
  //       },
  //     ),
  //   );
  // }
  // Widget _buildCheckoutButton() {
  //   //return GetBuilder<EditAddressController>(
  //   return GetBuilder<EditAddressController>(
  //     builder: (addressController) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //         child: GetBuilder<OrderController>(
  //           builder: (orderController) {
  //             print('🔄 Checkout button rebuilt');
  //             print('   isLoading: ${orderController.isLoading.value}');
  //             print('   isOrderPlaced: ${orderController.isOrderPlaced.value}');
  //             print('   orderId: ${orderController.orderId.value}');
  //
  //             return Column(
  //               children: [
  //                 // Show current state
  //                 Text(
  //                   'State: ${orderController.isLoading.value ? "Processing..." : "Ready"}',
  //                   style: TextStyle(fontSize: 12, color: Colors.grey),
  //                 ),
  //                 if (orderController.errorMessage.value.isNotEmpty)
  //                   Text(
  //                     'Error: ${orderController.errorMessage.value}',
  //                     style: TextStyle(fontSize: 12, color: Colors.red),
  //                   ),
  //
  //                 SizedBox(height: 10),
  //
  //                 // Button
  //                 orderController.isLoading.value
  //                     ? Center(
  //                   child: Column(
  //                     children: [
  //                       CircularProgressIndicator(
  //                         valueColor: AlwaysStoppedAnimation<Color>(themeColor),
  //                       ),
  //                       SizedBox(height: 10),
  //                       Text('Processing order...'),
  //                     ],
  //                   ),
  //                 )
  //                     : CustomButton(
  //                   text: "Checkout Now",
  //                   onPressed: () async {
  //                     print('🖱️ Checkout Now button pressed');
  //
  //                     // Check if address is available
  //                     if (!addressController.hasData.value) {
  //                       print('❌ No address');
  //                       Get.snackbar(
  //                         "Address Required",
  //                         "Please add your address first",
  //                         snackPosition: SnackPosition.BOTTOM,
  //                         backgroundColor: Colors.orange,
  //                         colorText: Colors.white,
  //                       );
  //                       return;
  //                     }
  //
  //                     // Show loading
  //                     print('⏳ Showing loading dialog');
  //                     Get.dialog(
  //                       AlertDialog(
  //                         content: Column(
  //                           mainAxisSize: MainAxisSize.min,
  //                           children: [
  //                             CircularProgressIndicator(
  //                               valueColor: AlwaysStoppedAnimation<Color>(themeColor),
  //                             ),
  //                             SizedBox(height: 16),
  //                             Text("Placing your order..."),
  //                           ],
  //                         ),
  //                       ),
  //                       barrierDismissible: false,
  //                     );
  //
  //                     try {
  //                       print('📞 Calling placeOrder()');
  //                       // Place order
  //                       await orderController.placeOrder();
  //
  //                       print('✅ placeOrder() completed');
  //                       print('   isOrderPlaced: ${orderController.isOrderPlaced.value}');
  //                       print('   orderId: ${orderController.orderId.value}');
  //
  //                       // Close loading dialog
  //                       print('🗑️ Closing loading dialog');
  //                       Get.back();
  //
  //                       // Check if order was successful
  //                       if (orderController.isOrderPlaced.value) {
  //                         print('🎯 Showing success bottom sheet');
  //                         // Show success bottom sheet
  //                         showCheckoutBottomSheet(
  //                           context,
  //                           orderId: orderController.orderId.value,
  //                         );
  //                       } else {
  //                         print('❌ Order not placed, isOrderPlaced is false');
  //                         // Show error if not already shown
  //                         if (orderController.errorMessage.value.isEmpty) {
  //                           Get.snackbar(
  //                             "Order Failed",
  //                             "Unable to place order",
  //                             snackPosition: SnackPosition.BOTTOM,
  //                             backgroundColor: Colors.red,
  //                             colorText: Colors.white,
  //                           );
  //                         }
  //                       }
  //
  //                     } catch (e) {
  //                       print('🔥 Exception in checkout: $e');
  //                       // Close loading dialog
  //                       Get.back();
  //
  //                       // Show error
  //                       Get.snackbar(
  //                         "Error",
  //                         "Failed to process checkout: $e",
  //                         snackPosition: SnackPosition.BOTTOM,
  //                         backgroundColor: Colors.red,
  //                         colorText: Colors.white,
  //                       );
  //                     }
  //                   },
  //                 ),
  //               ],
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }
  //main hai aaj ka 24-12-25
  Widget _buildCheckoutButton() {
    return GetBuilder<EditAddressController>(
      builder: (addressController) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: GetBuilder<OrderController>(
            builder: (orderController) {
              // FORCE RESET isLoading if it's true but bottom sheet might be open
              WidgetsBinding.instance.addPostFrameCallback((_) {
                if (orderController.isLoading.value) {
                  // Check if we're showing loading when we shouldn't
                  print('⚠️ isLoading is TRUE in checkout button');
                }
              });

              return Column(
                children: [
                  SizedBox(height: 10),

                  // Button - REMOVE the "Processing order..." text
                  orderController.isLoading.value
                      ? Center(
                    child: Column(
                      children: [
                        CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                        ),
                        SizedBox(height: 10),
                        // REMOVE THIS TEXT or change it
                        // Text('Processing order...'),
                      ],
                    ),
                  )
                      : CustomButton(
                    text: "Checkout Now",
                    onPressed: () async {
                      print('🖱️ Checkout Now button pressed');

                      // Check if address is available
                      if (!addressController.hasData.value) {
                        print('❌ No address');
                        Get.snackbar(
                          "Address Required",
                          "Please add your address first",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.orange,
                          colorText: Colors.white,
                        );
                        return;
                      }

                      // Show loading dialog
                      // Get.dialog(
                      //   AlertDialog(
                      //     content: Column(
                      //       mainAxisSize: MainAxisSize.min,
                      //       children: [
                      //         CircularProgressIndicator(
                      //           valueColor: AlwaysStoppedAnimation<Color>(themeColor),
                      //         ),
                      //         SizedBox(height: 16),
                      //         Text("Placing your order..."),
                      //       ],
                      //     ),
                      //   ),
                      //   barrierDismissible: false,
                      // );

                      try {
                        print('📞 Calling placeOrder()');
                        // Place order
                        await orderController.placeOrder();

                        print('✅ placeOrder() completed');
                        print('   isOrderPlaced: ${orderController.isOrderPlaced.value}');
                        print('   orderId: ${orderController.orderId.value}');

                        // Close loading dialog
                        print('🗑️ Closing loading dialog');
                        if (Get.isDialogOpen ?? false) {
                          Get.back();
                        }

                        // Check if order was successful
                        if (orderController.isOrderPlaced.value) {
                          print('🎯 Showing success bottom sheet');
                          // Show success bottom sheet
                          showCheckoutBottomSheet(
                            context,
                            orderId: orderController.orderId.value,
                          );
                        } else {
                          print('❌ Order not placed, isOrderPlaced is false');
                          // IMPORTANT: Reset isLoading if order failed
                          orderController.isLoading.value = false;

                          // Show error if not already shown
                          if (orderController.errorMessage.value.isEmpty) {
                            Get.snackbar(
                              "Order Failed",
                              "Unable to place order",
                              snackPosition: SnackPosition.BOTTOM,
                              backgroundColor: Colors.red,
                              colorText: Colors.white,
                            );
                          }
                        }

                      } catch (e) {
                        print('🔥 Exception in checkout: $e');
                        // Close loading dialog
                        if (Get.isDialogOpen ?? false) {
                          Get.back();
                        }

                        // IMPORTANT: Reset isLoading on error
                        orderController.isLoading.value = false;

                        // Show error
                        Get.snackbar(
                          "Error",
                          "Failed to process checkout: $e",
                          snackPosition: SnackPosition.BOTTOM,
                          backgroundColor: Colors.red,
                          colorText: Colors.white,
                        );
                      }
                    },
                  ),
                ],
              );
            },
          ),
        );
      },
    );
  }

  // Widget _buildCheckoutButton() {
  //   return GetBuilder<EditAddressController>(
  //     builder: (addressController) {
  //       return Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //         child: GetBuilder<OrderController>(
  //           builder: (orderController) {
  //             return GetBuilder<CartController>(
  //               builder: (cartController) {
  //                 return Column(
  //                   children: [
  //                     // Debug button (optional - remove in production)
  //                     if (kDebugMode)
  //                       ElevatedButton(
  //                         onPressed: () {
  //                           orderController.debugPrintOrderRequest();
  //                         },
  //                         child: Text('Debug Cart Data'),
  //                       ),
  //
  //                     SizedBox(height: 10),
  //
  //                     // Main checkout button
  //                     orderController.isLoading.value
  //                         ? Center(
  //                       child: Column(
  //                         children: [
  //                           CircularProgressIndicator(
  //                             valueColor: AlwaysStoppedAnimation<Color>(themeColor),
  //                           ),
  //                         ],
  //                       ),
  //                     )
  //                         : CustomButton(
  //                       text: "Checkout Now",
  //                       onPressed: () async {
  //                         print('🖱️ Checkout Now button pressed');
  //
  //                         // Check if address is available
  //                         if (!addressController.hasData.value) {
  //                           Get.snackbar(
  //                             "Address Required",
  //                             "Please add your address first",
  //                             snackPosition: SnackPosition.BOTTOM,
  //                             backgroundColor: Colors.orange,
  //                             colorText: Colors.white,
  //                           );
  //                           return;
  //                         }
  //
  //                         // Check if cart has items
  //                         if (cartController.cartItems.isEmpty) {
  //                           Get.snackbar(
  //                             "Cart Empty",
  //                             "Please add items to your cart first",
  //                             snackPosition: SnackPosition.BOTTOM,
  //                             backgroundColor: Colors.orange,
  //                             colorText: Colors.white,
  //                           );
  //                           return;
  //                         }
  //
  //                         // Show loading
  //                         Get.dialog(
  //                           Center(
  //                             child: CircularProgressIndicator(
  //                               valueColor: AlwaysStoppedAnimation<Color>(themeColor),
  //                             ),
  //                           ),
  //                           barrierDismissible: false,
  //                         );
  //
  //                         try {
  //                           // Place order with dynamic cart data
  //                           await orderController.placeOrder();
  //
  //                           Get.back(); // Close loading dialog
  //
  //                           if (orderController.isOrderPlaced.value) {
  //                             showCheckoutBottomSheet(
  //                               context,
  //                               orderId: orderController.orderId.value,
  //                             );
  //                           }
  //
  //                         } catch (e) {
  //                           Get.back(); // Close loading dialog
  //                           Get.snackbar(
  //                             "Error",
  //                             "Failed to process checkout: $e",
  //                             snackPosition: SnackPosition.BOTTOM,
  //                             backgroundColor: Colors.red,
  //                             colorText: Colors.white,
  //                           );
  //                         }
  //                       },
  //                     ),
  //                   ],
  //                 );
  //               },
  //             );
  //           },
  //         ),
  //       );
  //     },
  //   );
  // }

  // Widget _buildAddressSection() {
  //   return GetBuilder<EditAddressController>(
  //     init: EditAddressController(),
  //     builder: (controller) {
  //       final address = controller.addressData.value;
  //
  //       // Fetch address when this section loads
  //       WidgetsBinding.instance.addPostFrameCallback((_) {
  //         if (!controller.isLoading.value) {
  //           controller.fetchUserAddress();
  //         }
  //       });
  //
  //       return Column(
  //         crossAxisAlignment: CrossAxisAlignment.start,
  //         children: [
  //           Padding(
  //             padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //             child: Row(
  //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //               children: [
  //                 Text("Address", style: TextStyle(
  //                     color: Color(0xFF16423C),
  //                     fontWeight: FontWeight.bold,
  //                     fontSize: 20
  //                 )),
  //                 GestureDetector(
  //                     onTap: () {
  //                       Get.to(() => EditAddressScreen());
  //                     },
  //                     child: Icon(Icons.edit)
  //                 )
  //               ],
  //             ),
  //           ),
  //           SizedBox(height: 20),
  //
  //           // Show loading or address data
  //           if (controller.isLoading.value)
  //             Padding(
  //               padding: const EdgeInsets.only(left: 10),
  //               child: Text("Loading address...", style: TextStyle(fontSize: 16)),
  //             )
  //           else
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               children: [
  //                 // Shipping Address Display
  //                 if (address.shipAddress1 != null && address.shipAddress1!.isNotEmpty)
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     child: Text("${address.shipAddress1}", style: TextStyle(fontSize: 16)),
  //                   ),
  //                 if (address.shipAddress2 != null && address.shipAddress2!.isNotEmpty)
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     child: Text("${address.shipAddress2}", style: TextStyle(fontSize: 16)),
  //                   ),
  //                 if (address.shipCity != null && address.shipCity!.isNotEmpty)
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     child: Text(
  //                         "${address.shipCity}${address.shipZip != null && address.shipZip!.isNotEmpty ? ', ${address.shipZip}' : ''}",
  //                         style: TextStyle(fontSize: 16)
  //                     ),
  //                   ),
  //                 if (address.shipCountry != null && address.shipCountry!.isNotEmpty)
  //                   Padding(
  //                     padding: const EdgeInsets.only(left: 10),
  //                     child: Text("${address.shipCountry}", style: TextStyle(fontSize: 16)),
  //                   ),
  //               ],
  //             ),
  //         ],
  //       );
  //     },
  //   );
  // }

  // In paymentscreen.dart
  // Widget _buildAddressSection() {
  //   return GetBuilder<EditAddressController>(
  //     init: EditAddressController(),
  //     builder: (controller) {
  //       return Obx(() {
  //         // Fetch address on first load
  //         if (!controller.hasShownSnackbar.value) {
  //           WidgetsBinding.instance.addPostFrameCallback((_) {
  //             controller.fetchUserAddress();
  //           });
  //         }
  //
  //         return Column(
  //           crossAxisAlignment: CrossAxisAlignment.start,
  //           children: [
  //             Padding(
  //               padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Text(
  //                       "Address",
  //                       style: TextStyle(
  //                           color: Color(0xFF16423C),
  //                           fontWeight: FontWeight.bold,
  //                           fontSize: 20
  //                       )
  //                   ),
  //                   GestureDetector(
  //                       onTap: () {
  //                         Get.to(() => EditAddressScreen());
  //                       },
  //                       child: Icon(Icons.edit)
  //                   )
  //                 ],
  //               ),
  //             ),
  //             SizedBox(height: 20),
  //
  //             if (controller.isLoading.value)
  //               Padding(
  //                 padding: const EdgeInsets.only(left: 10),
  //                 child: Text("Loading address...", style: TextStyle(fontSize: 16)),
  //               )
  //             else if (controller.hasData.value)
  //               _buildAddressDisplay(controller.addressData.value)
  //             else
  //               Padding(
  //                 padding: const EdgeInsets.only(left: 10),
  //                 child: Text(
  //                   "No address found. Please update your address.",
  //                   style: TextStyle(fontSize: 16, color: Colors.red),
  //                 ),
  //               ),
  //           ],
  //         );
  //       });
  //     },
  //   );
  // }
  Widget _buildAddressSection() {
    return GetBuilder<EditAddressController>(
      init: EditAddressController(),
      builder: (controller) {
        // Fetch address when controller initializes
        WidgetsBinding.instance.addPostFrameCallback((_) {
          controller.fetchUserAddress();
        });

        return Obx(() {
          final address = controller.addressData.value;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                        "Address",
                        style: TextStyle(
                            color: Color(0xFF16423C),
                            fontWeight: FontWeight.bold,
                            fontSize: 20
                        )
                    ),
                    GestureDetector(
                        onTap: () {
                          Get.to(() => EditAddressScreen());
                        },
                        child: Icon(Icons.edit)
                    )
                  ],
                ),
              ),
              SizedBox(height: 20),

              if (controller.isLoading.value)
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text("Loading address...", style: TextStyle(fontSize: 16)),
                )
              else if (address.shipAddress1 != null && address.shipAddress1!.isNotEmpty)
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Shipping Address Display
                    if (address.shipAddress1 != null && address.shipAddress1!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("${address.shipAddress1}", style: TextStyle(fontSize: 16)),
                      ),
                    if (address.shipAddress2 != null && address.shipAddress2!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("${address.shipAddress2}", style: TextStyle(fontSize: 16)),
                      ),
                    if (address.shipCity != null && address.shipCity!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text(
                            "${address.shipCity}${address.shipZip != null && address.shipZip!.isNotEmpty ? ', ${address.shipZip}' : ''}",
                            style: TextStyle(fontSize: 16)
                        ),
                      ),
                    if (address.shipCountry != null && address.shipCountry!.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Text("${address.shipCountry}", style: TextStyle(fontSize: 16)),
                      ),
                  ],
                )
              else
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text(
                    "No address found. Please update your address.",
                    style: TextStyle(fontSize: 16, color: Colors.red),
                  ),
                ),
            ],
          );
        });
      },
    );
  }

  Widget _buildAddressDisplay(AddressData address) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (address.shipAddress1 != null && address.shipAddress1!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("${address.shipAddress1}", style: TextStyle(fontSize: 16)),
          ),
        if (address.shipAddress2 != null && address.shipAddress2!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("${address.shipAddress2}", style: TextStyle(fontSize: 16)),
          ),
        if (address.shipCity != null && address.shipCity!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text(
                "${address.shipCity}${address.shipZip != null && address.shipZip!.isNotEmpty ? ', ${address.shipZip}' : ''}",
                style: TextStyle(fontSize: 16)
            ),
          ),
        if (address.shipCountry != null && address.shipCountry!.isNotEmpty)
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Text("${address.shipCountry}", style: TextStyle(fontSize: 16)),
          ),
      ],
    );
  }
  Widget _buildPaymentOption({
    required String image,
    required String title,
    required String subtitle,
    required bool selected,
  }) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: selected ? const Color(0xFFF2E8CF) : Colors.white,
        border: Border.all(
          color: selected ? const Color(0xFF16423C) : Colors.grey.shade300,
          width: 1,
        ),
      ),
      child: ListTile(
        leading: CircleAvatar(
          child: Image.asset(image, height: 25),
          // backgroundImage: AssetImage(image),
          backgroundColor: Color(0xFF16423C),
        ),
        title: Text(title, style: const TextStyle(color: Color(0xFF16423C))),
        subtitle: subtitle.isNotEmpty ? Text(subtitle) : null,
        trailing: selected
            ? const Icon(Icons.check_circle, color: Color(0xFF16423C))
            : const Icon(Icons.circle_outlined, color: Colors.grey),
      ),
    );
  }



  void _showPaymentBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        // local variable to track selected option
        String selectedOption = "Master Card";

        return StatefulBuilder(
          builder: (context, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(20.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header Row
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Payment Method",
                          style: TextStyle(
                            color: Color(0xFF16423C),
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>addnewcard()));
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Color(0xFF16423C)
                                ),
                                height: 35,width: 100,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        "Add",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Icon(Icons.add_circle_outline,
                                        size: 20,
                                        color: Colors.white,)
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    const SizedBox(height: 16),

                    // Master Card
                    GestureDetector(
                      onTap: () => setModalState(() => selectedOption = "Master Card"),
                      child: _buildPaymentOption(
                        image: "assets/icons/img_1.png",
                        title: "Master Card",
                        subtitle: "**** **** 1234",
                        selected: selectedOption == "Master Card",
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Net Banking
                    GestureDetector(
                      onTap: () => setModalState(() => selectedOption = "Net Banking"),
                      child: _buildPaymentOption(
                        image: "assets/icons/img_2.png",
                        title: "Net Banking",
                        subtitle: "",
                        selected: selectedOption == "Net Banking",
                      ),
                    ),
                    const SizedBox(height: 10),

                    // UPI
                    GestureDetector(
                      onTap: () => setModalState(() => selectedOption = "UPI"),
                      child: _buildPaymentOption(
                        image: "assets/images/upilogo.png",
                        title: "UPI",
                        subtitle: "",
                        selected: selectedOption == "UPI",
                      ),
                    ),

                    const SizedBox(height: 25),

                    // Confirm Payment Button
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF16423C),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text(
                          "Confirm Payment",
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }


  // void showCheckoutBottomSheet(BuildContext context, {required int orderId}) {
  //   showModalBottomSheet(
  //     context: context,
  //     shape: const RoundedRectangleBorder(
  //       borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
  //     ),
  //     backgroundColor: Colors.white,
  //     builder: (BuildContext context) {
  //       // local variable to track selected option
  //       String selectedOption = "Master Card";
  //
  //       return StatefulBuilder(
  //         builder: (context, setModalState) {
  //           return Padding(
  //             padding: const EdgeInsets.all(20.0),
  //             child: Column(
  //               mainAxisSize: MainAxisSize.min,
  //               crossAxisAlignment: CrossAxisAlignment.center,
  //               children: [
  //
  //                 Padding(
  //                   padding: const EdgeInsets.all(14.0),
  //                   child: Center(child: Image.asset("assets/images/img_1.png",height: 200,)),
  //                 ),
  //                 Center(
  //                   child: Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 20.0),
  //                     child: Align(
  //                       alignment: Alignment.center,
  //                       child: Text(
  //                         "Ordered Successfully",
  //                         style: TextStyle(
  //                           fontSize: 26,
  //                           fontWeight: FontWeight.bold,
  //                           color: Color(0xFFF004643),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //
  //                 Center(
  //                   child: Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 10.0),
  //                     child: Align(
  //                       alignment: Alignment.center,
  //                       child: Text(
  //                         textAlign: TextAlign.center,
  //                         "Your order is successfully will be delivered in 3 to 5 days",
  //                         style: TextStyle(
  //                           fontSize: 15,
  //                           fontWeight: FontWeight.bold,
  //                           color: Color(0xFFF004643),
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //
  //                 const SizedBox(height: 25),
  //
  //                 // Confirm Payment Button
  //                 SizedBox(
  //                   width: double.infinity,
  //                   child: ElevatedButton(
  //                     style: ElevatedButton.styleFrom(
  //                       backgroundColor: const Color(0xFF16423C),
  //                       shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(25),
  //                       ),
  //                       padding: const EdgeInsets.symmetric(vertical: 14),
  //                     ),
  //                     onPressed: () {
  //                       Navigator.pop(context);
  //                     },
  //                     child: const Text(
  //                       "Order Tracking",
  //                       style: TextStyle(
  //                         fontSize: 18,
  //                         color: Colors.white,
  //                         fontWeight: FontWeight.bold,
  //                       ),
  //                     ),
  //                   ),
  //                 ),
  //                 SizedBox(height: 20,)
  //               ],
  //             ),
  //           );
  //         },
  //       );
  //     },
  //   );
  // }
  void showCheckoutBottomSheet(BuildContext context, {int orderId = 0}) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // Add this for better scrolling
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      backgroundColor: Colors.white,
      builder: (BuildContext context) {
        return SingleChildScrollView( // Wrap with SingleChildScrollView
          child: Container(
            padding: EdgeInsets.only(
              bottom: MediaQuery.of(context).viewInsets.bottom,
            ),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min, // Important!
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(
                      child: Image.asset(
                        "assets/images/img_1.png",
                        height: 200,
                        width: 200, // Constrain width
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Text(
                        "Ordered Successfully",
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF004643),
                        ),
                        textAlign: TextAlign.center, // Add this
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Show order ID
                  if (orderId > 0)
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Order ID: #$orderId",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                          color: Color(0xFF16423C),
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),

                  SizedBox(height: 10),

                  // Message with proper constraints
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Text(
                      "Your order will be delivered in 3 to 5 days",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        color: Color(0xFF004643),
                      ),
                    ),
                  ),

                  const SizedBox(height: 25),

                  // Order Tracking Button - Full width but constrained
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xFF16423C),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25),
                  //       ),
                  //       padding: const EdgeInsets.symmetric(vertical: 14),
                  //     ),
                  //     onPressed: () {
                  //       Navigator.pop(context);
                  //       // orderController.navigateToOrderScreen();
                  //     },
                  //     child: const Text(
                  //       "Order Tracking",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // Order Tracking Button
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: ElevatedButton(
                  //     style: ElevatedButton.styleFrom(
                  //       backgroundColor: const Color(0xFF16423C),
                  //       shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(25),
                  //       ),
                  //       padding: const EdgeInsets.symmetric(vertical: 14),
                  //     ),
                  //     onPressed: () {
                  //
                  //     },
                  //     child: const Text(
                  //       "Order Tracking",
                  //       style: TextStyle(
                  //         fontSize: 18,
                  //         color: Colors.white,
                  //         fontWeight: FontWeight.bold,
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  // In your showCheckoutBottomSheet method, update the Order Tracking button:

                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF16423C),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                      ),
                      onPressed: () {
                        Navigator.pop(context); // Close bottom sheet

                        // Navigate to My Order Screen which will fetch orders automatically
                        Get.offAll(() => const MyOrderScreen());
                      },
                      child: const Text(
                        "Order Tracking",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Continue Shopping Button
                  SizedBox(
                    width: double.infinity,
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        // Navigate to My Order Screen which will fetch orders automatically
                        Get.offAll(() => const BottomNavScreen());
                        Get.back();
                      },
                      child: Text(
                        "Continue Shopping",
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF16423C),
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: 20)
                ],
              ),
            ),
          ),
        );
      },
    );
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF16423C),
          leading: InkWell(onTap: (){
            Get.back();
          },
              child: Icon(Icons.arrow_back,color: Colors.white,)),
          title: Text("Payment",style: TextStyle(color: Colors.white),),
        ),
        body: SingleChildScrollView(
            child: Column(

                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Text("Address",style: TextStyle(color: Color(0xFF16423C),fontWeight:
                  //       FontWeight.bold,fontSize: 20),),
                  //       GestureDetector(
                  //         onTap: (){
                  //           Get.to(() => const editaddressscreen());
                  //         },
                  //           child: Icon(Icons.edit)
                  //       )
                  //     ],
                  //   ),
                  //
                  //
                  //
                  // ),
                  // SizedBox(height: 20,),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child: Text("406 Akshat Tower, Nr. Pakwan Hotel, ",style: TextStyle(fontSize: 16),),
                  // ),
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 10),
                  //   child: Text("Bodakdev, Ahmdabad - 380001",style: TextStyle(fontSize: 16),),
                  // ),
// Add this import at the top of your file


// Then replace the address section with:
                  _buildAddressSection(),

                  SizedBox(height: 20,),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text("Products(3)",style: TextStyle(color: Color(0xFF16423C),fontSize: 20,
                        fontWeight: FontWeight.bold),),
                  ),
                  // Column(
                  //   children: popular.asMap().entries.map((entry) {
                  //     final index = entry.key;
                  //     final search = entry.value;
                  //
                  //     return Column(
                  //       children: [
                  //         Container(
                  //           decoration: BoxDecoration(
                  //             // Your background color
                  //             borderRadius: BorderRadius.circular(0), // Remove border radius for clean lines
                  //           ),
                  //           child: Row(
                  //             children: [
                  //               Padding(
                  //                   padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //                   child: Image.asset("assets/images/myorderimage.png",height: 60,width: 60,)
                  //               ),
                  //
                  //               // Product Details
                  //               Expanded(
                  //                 child: Column(
                  //                   crossAxisAlignment: CrossAxisAlignment.start,
                  //                   children: [
                  //                     Text(
                  //                       search['title'],
                  //                       style: const TextStyle(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 17,
                  //                         color: Color(0xFF16423C),
                  //                       ),
                  //                     ),
                  //                     const SizedBox(height: 4),
                  //                     Text(
                  //                       search['searches'],
                  //                       style: const TextStyle(
                  //                         color: Colors.grey,
                  //                         fontSize: 14,
                  //                       ),
                  //                     ),
                  //                     const SizedBox(height: 8),
                  //                     Text(
                  //                       '\$${search['price']}',
                  //                       style: const TextStyle(
                  //                         fontWeight: FontWeight.bold,
                  //                         fontSize: 16,
                  //                         color: Color(0xFF16423C),
                  //                       ),
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //
                  //               Padding(
                  //                 padding: const EdgeInsets.all(8.0),
                  //                 child: Column(
                  //                   children: [
                  //                     Row(
                  //
                  //                       children: [
                  //                         // Minus
                  //                         Container(
                  //                           height:30,
                  //                           width:30,
                  //                           decoration: BoxDecoration(
                  //                             border: Border.all(color: themeColor),
                  //                             borderRadius: BorderRadius.circular(25),
                  //                           ),
                  //
                  //                           child: IconButton(
                  //                             padding: EdgeInsets.zero,
                  //                             constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                  //                             icon: Icon(Icons.remove, color: themeColor,size: 14,),
                  //                             onPressed: search['quantity'] > 1
                  //                                 ? () => setState(() => search['quantity']--)
                  //                                 : null,
                  //                           ),
                  //                         ),
                  //
                  //                         // Quantity number
                  //                         Padding(
                  //                           padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //                           child: Text(
                  //                             search['quantity'].toString(),
                  //                             style: TextStyle(
                  //                               color: themeColor,
                  //                               fontWeight: FontWeight.bold,
                  //                               fontSize: 22,
                  //                             ),
                  //                           ),
                  //                         ),
                  //
                  //                         // Plus
                  //                         Container(
                  //                           height:30,
                  //                           width:30,
                  //                           decoration: BoxDecoration(
                  //                             border: Border.all(color: themeColor),
                  //                             borderRadius: BorderRadius.circular(25),
                  //                           ),
                  //                           child: IconButton(
                  //                             padding: EdgeInsets.zero,
                  //                             constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                  //                             icon: Icon(Icons.add,size: 14, color: themeColor),
                  //                             onPressed: () => setState(() => search['quantity']++),
                  //                           ),
                  //                         ),
                  //                       ],
                  //                     ),
                  //                   ],
                  //                 ),
                  //               ),
                  //
                  //
                  //               // Column(
                  //               //   children: [
                  //               //     Text(
                  //               //       search['title'],
                  //               //       style: const TextStyle(
                  //               //         fontWeight: FontWeight.w600,
                  //               //         fontSize: 16,
                  //               //         color: Color(0xFF16423C),
                  //               //       ),
                  //               //     ),
                  //               //     const SizedBox(height: 4),
                  //               //
                  //               //    Row(
                  //               //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //               //      children: [
                  //               //        Column(
                  //               //          children: [
                  //               //            Text(
                  //               //              search['searches'],
                  //               //              style: const TextStyle(
                  //               //                color: Colors.grey,
                  //               //                fontSize: 14,
                  //               //              ),
                  //               //            ),
                  //               //            const SizedBox(height: 4),
                  //               //            Text(
                  //               //              search['price'],
                  //               //              style: const TextStyle(
                  //               //                fontWeight: FontWeight.w600,
                  //               //                fontSize: 16,
                  //               //                color: Color(0xFF16423C),
                  //               //              ),
                  //               //            ),
                  //               //          ],
                  //               //        ),
                  //               //
                  //               //        Row(
                  //               //
                  //               //          children: [
                  //               //            // Minus
                  //               //            Container(
                  //               //              height:30,
                  //               //              width:30,
                  //               //              decoration: BoxDecoration(
                  //               //                border: Border.all(color: themeColor),
                  //               //                borderRadius: BorderRadius.circular(25),
                  //               //              ),
                  //               //
                  //               //              child: IconButton(
                  //               //                padding: EdgeInsets.zero,
                  //               //                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                  //               //                icon: Icon(Icons.remove, color: themeColor,size: 14,),
                  //               //                onPressed: search['quantity'] > 1
                  //               //                    ? () => setState(() => search['quantity']--)
                  //               //                    : null,
                  //               //              ),
                  //               //            ),
                  //               //
                  //               //            // Quantity number
                  //               //            Padding(
                  //               //              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  //               //              child: Text(
                  //               //                search['quantity'].toString(),
                  //               //                style: TextStyle(
                  //               //                  color: themeColor,
                  //               //                  fontWeight: FontWeight.bold,
                  //               //                  fontSize: 22,
                  //               //                ),
                  //               //              ),
                  //               //            ),
                  //               //
                  //               //            // Plus
                  //               //            Container(
                  //               //              height:30,
                  //               //              width:30,
                  //               //              decoration: BoxDecoration(
                  //               //                border: Border.all(color: themeColor),
                  //               //                borderRadius: BorderRadius.circular(25),
                  //               //              ),
                  //               //              child: IconButton(
                  //               //                padding: EdgeInsets.zero,
                  //               //                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                  //               //                icon: Icon(Icons.add,size: 14, color: themeColor),
                  //               //                onPressed: () => setState(() => search['quantity']++),
                  //               //              ),
                  //               //            ),
                  //               //          ],
                  //               //        ),
                  //               //      ],
                  //               //    )
                  //               //
                  //               //
                  //               //   ],
                  //               // ),
                  //
                  //
                  //             ],
                  //
                  //
                  //
                  //           ),
                  //         ),
                  //         // Add divider line between items (except after the last one)
                  //         //if (index < popular.length - 1)
                  //         Container(
                  //           height: 1,
                  //           color: Colors.black, // Line color
                  //           margin: const EdgeInsets.symmetric(horizontal: 16), // Optional: add horizontal margin to line
                  //         ),
                  //
                  //       ],
                  //     );
                  //   }).toList(),
                  // ),
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
                    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: Text("Payment Method",style: TextStyle(color: Color(0xFF16423C),fontSize: 20,
                        fontWeight: FontWeight.bold),),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 22.0,vertical: 10.0),
                  //   child: Container(
                  //     decoration: BoxDecoration(
                  //       borderRadius: BorderRadius.circular(14),
                  //       color: Colors.white,
                  //     ),
                  //
                  //     height: 80,
                  //     width: 380,
                  //     // child: Align(alignment: Alignment.centerLeft,
                  //     //     child: Padding(
                  //     //       padding: const EdgeInsets.symmetric(horizontal: 18.0,vertical: 8.0),
                  //     //       child: Row(
                  //     //         crossAxisAlignment: CrossAxisAlignment.start,
                  //     //         children: [
                  //     //           Image.asset("assets/icons/img_1.png",height: 40,),
                  //     //           Column(
                  //     //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     //             children: [
                  //     //               Text("Master Card"),
                  //     //               Text("**** **** 1234")
                  //     //             ],
                  //     //           ),
                  //     //           Icon(Icons.arrow_forward_ios_outlined)
                  //     //
                  //     //         ],
                  //     //       ),
                  //     //
                  //     //     ),
                  //     //
                  //     //
                  //     //
                  //     // ),
                  //
                  //
                  //   ),
                  // ),


                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0, vertical: 8.0),
                    child: GestureDetector(onTap: (){
                      _showPaymentBottomSheet(context); // 👈 opens bottom sheet
                    },
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(18),
                        ),
                        height: 80,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center, // 👈 centers vertically
                          children: [
                            // Left image
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                              child: Image.asset(
                                "assets/icons/img_1.png",
                                height: 40,
                              ),
                            ),

                            // Middle text
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center, // 👈 vertically center text
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: const [
                                    Text(
                                      "Master Card",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF16423C),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Text(
                                      "**** **** 1234",
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                  ],
                                ),
                              ),
                            ),

                            // Right arrow (centered vertically)
                            Padding(
                              padding: const EdgeInsets.only(right: 16.0),
                              child: Icon(
                                Icons.arrow_forward_ios_outlined,
                                color: Colors.grey,
                                size: 20,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Total Amount",style: TextStyle(fontSize: 18),),
                        ),
                        Text("45.00",style: TextStyle(color: Color(0xFF16423C),fontWeight:
                        FontWeight.bold,fontSize: 18),)
                      ],

                    ),
                  ),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0), // Match left padding
                  //   child: CustomButton(
                  //     text: "Checkout Now",
                  //     onPressed: () {
                  //       showCheckoutBottomSheet(context);
                  //       // Get.to(editaddressscreen());
                  //       // Add your button action here
                  //       print("Get Started button pressed!");
                  //       // You can add navigation or other logic here
                  //     },
                  //   ),
                  // ),
                  _buildCheckoutButton(),

                ])
        )
    );
  }
}