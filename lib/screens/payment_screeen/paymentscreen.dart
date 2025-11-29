import 'package:ecommerce/screens/add_new_card/add_new_card_screen.dart';
import 'package:ecommerce/screens/edit_adress_screen/edit_address_controller.dart';
import 'package:ecommerce/screens/edit_adress_screen/edit_address_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../customs/buttonscreen.dart';
import '../edit_adress_screen/edit_address_screen.dart';

class paymentscreen extends StatefulWidget {
  const paymentscreen({super.key});

  @override
  State<paymentscreen> createState() => _paymentscreenState();
}

class _paymentscreenState extends State<paymentscreen> {
  final Color themeColor = const Color(0xFF16423C);

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
  Widget _buildCheckoutButton() {
    return GetBuilder<EditAddressController>(
      builder: (controller) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Column(
            children: [
              // Debug info
              Text(
                "Debug - Has Data: ${controller.hasData.value}, Address: ${controller.addressData.value.shipAddress1}",
                style: TextStyle(fontSize: 12, color: Colors.grey),
              ),
              SizedBox(height: 10),
              // Button
              CustomButton(
                text: "Checkout Now",
                onPressed: () {
                  showCheckoutBottomSheet(context);
                },
              ),
            ],
          ),
        );
      },
    );
  }

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


  void showCheckoutBottomSheet(BuildContext context) {
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
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  Padding(
                    padding: const EdgeInsets.all(14.0),
                    child: Center(child: Image.asset("assets/images/img_1.png",height: 200,)),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          "Ordered Successfully",
                          style: TextStyle(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF004643),
                          ),
                        ),
                      ),
                    ),
                  ),

                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Align(
                        alignment: Alignment.center,
                        child: Text(
                          textAlign: TextAlign.center,
                          "Your order is successfully will be delivered in 3 to 5 days",
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFFF004643),
                          ),
                        ),
                      ),
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
                        "Order Tracking",
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,)
                ],
              ),
            );
          },
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
            Column(
              children: popular.asMap().entries.map((entry) {
                final index = entry.key;
                final search = entry.value;

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        // Your background color
                        borderRadius: BorderRadius.circular(0), // Remove border radius for clean lines
                      ),
                      child: Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 12.0),
                            child: Image.asset("assets/images/myorderimage.png",height: 60,width: 60,)
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


                          // Column(
                          //   children: [
                          //     Text(
                          //       search['title'],
                          //       style: const TextStyle(
                          //         fontWeight: FontWeight.w600,
                          //         fontSize: 16,
                          //         color: Color(0xFF16423C),
                          //       ),
                          //     ),
                          //     const SizedBox(height: 4),
                          //
                          //    Row(
                          //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //      children: [
                          //        Column(
                          //          children: [
                          //            Text(
                          //              search['searches'],
                          //              style: const TextStyle(
                          //                color: Colors.grey,
                          //                fontSize: 14,
                          //              ),
                          //            ),
                          //            const SizedBox(height: 4),
                          //            Text(
                          //              search['price'],
                          //              style: const TextStyle(
                          //                fontWeight: FontWeight.w600,
                          //                fontSize: 16,
                          //                color: Color(0xFF16423C),
                          //              ),
                          //            ),
                          //          ],
                          //        ),
                          //
                          //        Row(
                          //
                          //          children: [
                          //            // Minus
                          //            Container(
                          //              height:30,
                          //              width:30,
                          //              decoration: BoxDecoration(
                          //                border: Border.all(color: themeColor),
                          //                borderRadius: BorderRadius.circular(25),
                          //              ),
                          //
                          //              child: IconButton(
                          //                padding: EdgeInsets.zero,
                          //                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                          //                icon: Icon(Icons.remove, color: themeColor,size: 14,),
                          //                onPressed: search['quantity'] > 1
                          //                    ? () => setState(() => search['quantity']--)
                          //                    : null,
                          //              ),
                          //            ),
                          //
                          //            // Quantity number
                          //            Padding(
                          //              padding: const EdgeInsets.symmetric(horizontal: 12.0),
                          //              child: Text(
                          //                search['quantity'].toString(),
                          //                style: TextStyle(
                          //                  color: themeColor,
                          //                  fontWeight: FontWeight.bold,
                          //                  fontSize: 22,
                          //                ),
                          //              ),
                          //            ),
                          //
                          //            // Plus
                          //            Container(
                          //              height:30,
                          //              width:30,
                          //              decoration: BoxDecoration(
                          //                border: Border.all(color: themeColor),
                          //                borderRadius: BorderRadius.circular(25),
                          //              ),
                          //              child: IconButton(
                          //                padding: EdgeInsets.zero,
                          //                constraints: const BoxConstraints(minWidth: 36, minHeight: 36),
                          //                icon: Icon(Icons.add,size: 14, color: themeColor),
                          //                onPressed: () => setState(() => search['quantity']++),
                          //              ),
                          //            ),
                          //          ],
                          //        ),
                          //      ],
                          //    )
                          //
                          //
                          //   ],
                          // ),


                        ],



                      ),
                    ),
                    // Add divider line between items (except after the last one)
                    //if (index < popular.length - 1)
                    Container(
                      height: 1,
                      color: Colors.black, // Line color
                      margin: const EdgeInsets.symmetric(horizontal: 16), // Optional: add horizontal margin to line
                    ),

                  ],
                );
              }).toList(),
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
