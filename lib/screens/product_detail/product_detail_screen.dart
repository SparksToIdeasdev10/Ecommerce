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


// product_details_screen.dart
import 'package:ecommerce/screens/cart_screen/cart_controller.dart';
import 'package:ecommerce/screens/cart_screen/cart_model.dart';
import 'package:ecommerce/screens/cart_screen/cartscreen.dart';
import 'package:ecommerce/screens/product_detail/product_detail_controller.dart';
import 'package:ecommerce/screens/product_detail/product_detail_model.dart';
import 'package:ecommerce/screens/product_detail/wishlist/wishlist_controller.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductDetailsScreen extends StatefulWidget {
  final int productId;

  const ProductDetailsScreen({super.key, required this.productId});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  // Theme color
  final Color themeColor = const Color(0xFF16423C);

  // Dynamic state
  int quantity = 1;
  String selectedSize = 'M';
  Color selectedColor = Colors.blue;

  // Available options
  final List<String> sizes = ['S', 'M', 'L', 'XL'];
  final List<Color> colors = [Colors.blue, Colors.red, Colors.green, Colors.black];

  // Get the controllers
  final CartController cartController = Get.put(CartController());
  final ProductDetailsController productDetailsController = Get.put(ProductDetailsController());
  final WishlistController wishlistController = Get.put(WishlistController()); // ADD THIS LINE



  @override
  void initState() {
    super.initState();
    // Fetch product details when screen loads
    productDetailsController.fetchProductDetails(widget.productId);
    productDetailsController.fetchRelatedProducts(widget.productId);
    wishlistController.fetchWishlist();
    print("🔄 CALLING RELATED PRODUCTS API...");
  }

  @override
  void dispose() {
    // Clear product details when leaving screen
    productDetailsController.clearProductDetails();
    super.dispose();
  }

  double get totalPrice => (productDetailsController.product.discountPrice * quantity);

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: const Color(0xFFF5EEDC),
      appBar: AppBar(
        backgroundColor: themeColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Obx(() => Text(
          productDetailsController.isLoading.value ? "Loading..." : "Product Details",
          style: const TextStyle(color: Colors.white),
        )),
      ),
      body: Obx(() {
        if (productDetailsController.isLoading.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Loading product details..."),
              ],
            ),
          );
        }

        final product = productDetailsController.product;
        final gallery = productDetailsController.gallery;
        final reviews = productDetailsController.reviews;
        final avgRating = productDetailsController.avgRating;

        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image Section with Gallery
              _buildImageSection(screenWidth, screenHeight, product, gallery),

              // Product Details Section
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Title & Rating & Qty/Price
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Left: Title & meta
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.065,
                                  fontWeight: FontWeight.bold,
                                  color: themeColor,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(height: screenHeight * 0.005),
                              // Row(
                              //   children: [
                              //     Text(
                              //       product.sku,
                              //       style: TextStyle(
                              //         fontSize: screenWidth * 0.04,
                              //         color: Colors.grey[600],
                              //       ),
                              //     ),
                              //     SizedBox(width: screenWidth * 0.035),
                              //     Row(
                              //       children: [
                              //         const Icon(Icons.star, color: Colors.amber, size: 20),
                              //         SizedBox(width: screenWidth * 0.01),
                              //         Text(
                              //           avgRating.toStringAsFixed(1),
                              //           style: TextStyle(
                              //             fontSize: screenWidth * 0.04,
                              //             fontWeight: FontWeight.bold,
                              //             color: themeColor,
                              //           ),
                              //         ),
                              //         SizedBox(width: screenWidth * 0.02),
                              //         Text(
                              //           "(${reviews.length} reviews)",
                              //           style: TextStyle(
                              //             fontSize: screenWidth * 0.035,
                              //             color: Colors.grey[600],
                              //           ),
                              //         ),
                              //       ],
                              //     ),
                              //   ],
                              // ),
                              Row(
                                children: [
                                  // Tags with Flexible
                                  Flexible(
                                    flex: 3,
                                    child: Text(
                                      product.tags,
                                      style: TextStyle(
                                        fontSize: screenWidth * 0.04,
                                        color: Colors.grey[600],
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),

                                  SizedBox(width: screenWidth * 0.035),

                                  // Rating with Flexible
                                  Flexible(
                                    flex: 2,
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Icon(Icons.star, color: Colors.amber, size: 20),
                                        SizedBox(width: screenWidth * 0.01),
                                        Text(
                                          avgRating.toStringAsFixed(1),
                                          style: TextStyle(
                                            fontSize: screenWidth * 0.04,
                                            fontWeight: FontWeight.bold,
                                            color: themeColor,
                                          ),
                                        ),
                                        SizedBox(width: screenWidth * 0.02),
                                        Flexible(
                                          child: Text(
                                            "(${reviews.length} reviews)",
                                            style: TextStyle(
                                              fontSize: screenWidth * 0.035,
                                              color: Colors.grey[600],
                                            ),
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        // Right: Quantity Selector
                        Container(
                          padding: EdgeInsets.all(screenWidth * 0.02),
                          decoration: const BoxDecoration(
                            color: Color(0xFFF5EEDC),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              // Minus
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: themeColor),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minWidth: screenWidth * 0.085,
                                    minHeight: screenWidth * 0.085,
                                  ),
                                  icon: Icon(Icons.remove, color: themeColor),
                                  onPressed: quantity > 1
                                      ? () => setState(() => quantity--)
                                      : null,
                                ),
                              ),

                              // Quantity number
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.03),
                                child: Text(
                                  quantity.toString(),
                                  style: TextStyle(
                                    color: themeColor,
                                    fontWeight: FontWeight.bold,
                                    fontSize: screenWidth * 0.055,
                                  ),
                                ),
                              ),

                              // Plus
                              Container(
                                decoration: BoxDecoration(
                                  border: Border.all(color: themeColor),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: IconButton(
                                  padding: EdgeInsets.zero,
                                  constraints: BoxConstraints(
                                    minWidth: screenWidth * 0.085,
                                    minHeight: screenWidth * 0.085,
                                  ),
                                  icon: Icon(Icons.add, color: themeColor),
                                  onPressed: () => setState(() => quantity++),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Price Section
                    Row(
                      children: [
                        Text(
                          "\$${product.discountPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: screenWidth * 0.06,
                            fontWeight: FontWeight.bold,
                            color: themeColor,
                          ),
                        ),
                        if (product.hasDiscount) ...[
                          SizedBox(width: screenWidth * 0.03),
                          Text(
                            "\$${product.previousPrice!.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: screenWidth * 0.045,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                          SizedBox(width: screenWidth * 0.02),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: Text(
                              "${product.discountPercentage.toStringAsFixed(0)}% OFF",
                              style: TextStyle(
                                fontSize: screenWidth * 0.03,
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ],
                    ),

                    SizedBox(height: screenHeight * 0.02),

                    // Description
                    Text(
                      product.sortDetails.isNotEmpty ? product.sortDetails : "No description available",
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),

                    // Full details with expandable section
                    if (product.details.isNotEmpty) ...[
                      SizedBox(height: screenHeight * 0.01),
                      GestureDetector(
                        onTap: () {
                          // Show full details in dialog or new screen
                          _showFullDetails(product.details);
                        },
                        child: Text(
                          "Read More...",
                          style: TextStyle(
                            fontSize: screenWidth * 0.035,
                            fontWeight: FontWeight.bold,
                            color: themeColor,
                          ),
                        ),
                      ),
                    ],

                    SizedBox(height: screenHeight * 0.03),

                    // Specifications if available
                    if (productDetailsController.hasSpecifications)
                      _buildSpecificationsSection(product, screenWidth),

                    SizedBox(height: screenHeight * 0.03),

                    // Size and Color Section
                    _buildSizeColorSection(screenWidth, screenHeight),

                    SizedBox(height: screenHeight * 0.03),

                    // Add to Cart Button
                    _buildAddToCartButton(screenWidth, screenHeight, product),




// ✅ ADD RELATED PRODUCTS SECTION RIGHT HERE
                    SizedBox(height: screenHeight * 0.04),
                    _buildRelatedProductsSection(screenWidth, screenHeight),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  Widget _buildImageSection(double screenWidth, double screenHeight, Product product, List<GalleryImage> gallery) {
    return Stack(
      children: [
        Padding(
          padding: EdgeInsets.all(screenWidth * 0.055),
          child: Container(
            height: screenHeight * 0.4,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: PageView.builder(
              itemCount: gallery.isEmpty ? 1 : gallery.length,
              itemBuilder: (context, index) {
                final imageUrl = gallery.isEmpty ? product.photo : gallery[index].photo;
                return ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Image.network(
                    imageUrl,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[200],
                        child: const Icon(
                          Icons.image_not_supported,
                          color: Colors.grey,
                          size: 50,
                        ),
                      );
                    },
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return Container(
                        color: Colors.grey[200],
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
          ),
        ),
        //Favorite Button
        // Positioned(
        //   top: screenHeight * 0.06,
        //   right: screenWidth * 0.08,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: themeColor,
        //       borderRadius: BorderRadius.circular(25),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.1),
        //           blurRadius: 5,
        //         ),
        //       ],
        //     ),
        //     child: IconButton(
        //       icon: const Icon(Icons.favorite_border, color: Colors.white),
        //       onPressed: () {
        //         // TODO: toggle favorite
        //       },
        //     ),
        //   ),
        // ),

        // FAVORITE BUTTON - WORKING WITH WISHLIST API
        Positioned(
          top: screenHeight * 0.06,
          right: screenWidth * 0.08,
          child: Container(
            decoration: BoxDecoration(
              color: themeColor,
              borderRadius: BorderRadius.circular(25),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 5,
                ),
              ],
            ),
            child: Obx(() => IconButton(
              icon: Icon(
                wishlistController.isInWishlist(product.id)
                    ? Icons.favorite
                    : Icons.favorite_border,
                color: Colors.white,
              ),
              onPressed: () async {
                // Call Add Wishlist API when tapped
                await wishlistController.addToWishlist(product.id);
              },
            )),
          ),
        ),



        // Replace the existing favorite button with this:
        // Positioned(
        //   top: screenHeight * 0.06,
        //   right: screenWidth * 0.08,
        //   child: Container(
        //     decoration: BoxDecoration(
        //       color: themeColor,
        //       borderRadius: BorderRadius.circular(25),
        //       boxShadow: [
        //         BoxShadow(
        //           color: Colors.black.withOpacity(0.1),
        //           blurRadius: 5,
        //         ),
        //       ],
        //     ),
        //     child: Obx(() => IconButton(
        //       icon: Icon(
        //         wishlistController.isInWishlist(product.id)
        //             ? Icons.favorite
        //             : Icons.favorite_border,
        //         color: Colors.white,
        //       ),
        //       onPressed: () async {
        //         if (wishlistController.isInWishlist(product.id)) {
        //           // Find the wishlist item and remove it
        //           final wishlistItem = wishlistController.wishlistItems
        //               .firstWhere((item) => item.id == product.id);
        //           await wishlistController.removeFromWishlist(wishlistItem.wishlistId);
        //         } else {
        //           await wishlistController.addToWishlist(product.id);
        //         }
        //       },
        //     )),
        //   ),
        // ),

       // Favorite Button

      ],
    );
  }

  Widget _buildSpecificationsSection(Product product, double screenWidth) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Specifications",
          style: TextStyle(
            fontSize: screenWidth * 0.045,
            fontWeight: FontWeight.bold,
            color: themeColor,
          ),
        ),
        SizedBox(height: 10),
        ...List.generate(product.specificationNames.length, (index) {
          if (index < product.specificationDescriptions.length) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 8),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      product.specificationNames[index],
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: Colors.grey[700],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Text(
                      product.specificationDescriptions[index],
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return const SizedBox();
        }),
      ],
    );
  }
  //product related screen

  // Add this method to build the related products section
  Widget _buildRelatedProductsSection(double screenWidth, double screenHeight) {
    return Obx(() {
      if (productDetailsController.isRelatedProductsLoading.value) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: screenHeight * 0.02),
          child: Center(
            child: Column(
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text(
                  "Loading related products...",
                  style: TextStyle(
                    fontSize: screenWidth * 0.035,
                    color: themeColor,
                  ),
                ),
              ],
            ),
          ),
        );
      }

      if (productDetailsController.relatedProducts.isEmpty) {
        return SizedBox(); // Hide if no related products
      }

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Section Title
          Padding(
            padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
            child: Text(
              "You May Also Like",
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                color: themeColor,
              ),
            ),
          ),
          SizedBox(height: screenHeight * 0.02),

          // Horizontal Scrollable Products
          Container(
            height: screenHeight * 0.28,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
              itemCount: productDetailsController.relatedProducts.length,
              itemBuilder: (context, index) {
                final product = productDetailsController.relatedProducts[index];
                return _buildRelatedProductItem(product, screenWidth, screenHeight);
              },
            ),
          ),
          SizedBox(height: screenHeight * 0.03),
        ],
      );
    });
  }

  Widget _buildRelatedProductItem(Map<String, dynamic> product, double screenWidth, double screenHeight) {
    String productName = product['name'] ?? '';
    String productImage = product['photo'] ?? '';
    double discountPrice = (product['discount_price'] is num) ? (product['discount_price'] as num).toDouble() : 0.0;
    double? previousPrice = (product['previous_price'] is num) ? (product['previous_price'] as num).toDouble() : null;
    String productType = product['is_type'] ?? '';
    int productId = product['id'] ?? 0;

    bool hasDiscount = previousPrice != null && previousPrice > discountPrice;

    return GestureDetector(
      onTap: () {
        // Navigate to the related product details
        Get.to(() => ProductDetailsScreen(productId: productId));
      },
      child: Container(
        width: screenWidth * 0.45,
        margin: EdgeInsets.only(right: screenWidth * 0.03),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Container(
                height: screenHeight * 0.16,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
                  image: DecorationImage(
                    image: NetworkImage(productImage),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
          
              // Product Details
              Padding(
                padding: EdgeInsets.all(screenWidth * 0.03),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
                      style: TextStyle(
                        fontSize: screenWidth * 0.035,
                        fontWeight: FontWeight.w500,
                        color: themeColor,
                        height: 1.2,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    SizedBox(height: 6),
          
                    // Price Row
                    Row(
                      children: [
                        Text(
                          "\$${discountPrice.toStringAsFixed(2)}",
                          style: TextStyle(
                            fontSize: screenWidth * 0.04,
                            fontWeight: FontWeight.bold,
                            color: themeColor,
                          ),
                        ),
                        if (hasDiscount) ...[
                          SizedBox(width: 5),
                          Text(
                            "\$${previousPrice!.toStringAsFixed(2)}",
                            style: TextStyle(
                              fontSize: screenWidth * 0.03,
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough,
                            ),
                          ),
                        ],
                      ],
                    ),
          
                    SizedBox(height: 6),
          
                    // Badge for new/best
                    if (productType.isNotEmpty)
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                        decoration: BoxDecoration(
                          color: productType == "new" ? Colors.green :
                          productType == "best" ? Colors.orange : Colors.blue,
                          borderRadius: BorderRadius.circular(4),
                        ),
                        child: Text(
                          productType.toUpperCase(),
                          style: TextStyle(
                            fontSize: screenWidth * 0.025,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSizeColorSection(double screenWidth, double screenHeight) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        // Size
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Size",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: themeColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Row(
              children: sizes
                  .map((s) => Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.02),
                child: GestureDetector(
                  onTap: () => setState(() => selectedSize = s),
                  child: _buildSizeOption(s, selectedSize == s),
                ),
              ))
                  .toList(),
            ),
          ],
        ),

        // Color
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Color",
              style: TextStyle(
                fontSize: screenWidth * 0.04,
                fontWeight: FontWeight.bold,
                color: themeColor,
              ),
            ),
            SizedBox(height: screenHeight * 0.008),
            Row(
              children: colors
                  .map((c) => Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.02),
                child: GestureDetector(
                  onTap: () => setState(() => selectedColor = c),
                  child: _buildColorOption(c, selectedColor == c),
                ),
              ))
                  .toList(),
            ),
          ],
        ),
      ],
    );
  }

  // Widget _buildAddToCartButton(double screenWidth, double screenHeight, Product product) {
  //   return Center(
  //     child: GestureDetector(
  //       onTap: () {
  //         // Create cart item
  //         // final cartItem = CartItem(
  //         //   id: product.id.toString(),
  //         //   title: product.name,
  //         //   category: product.sku,
  //         //   price: product.discountPrice,
  //         //   imageUrl: product.photo,
  //         //   quantity: quantity,
  //         //   selectedSize: selectedSize,
  //         //   selectedColor: _colorName(selectedColor),
  //         // );
  //
  //         // Add to cart
  //         //cartController.addToCart(cartItem);
  //
  //         // Show success message
  //         Get.snackbar(
  //           'Success!',
  //           'Added $quantity× ${product.name} ($selectedSize, ${_colorName(selectedColor)}) to cart',
  //           backgroundColor: themeColor,
  //           colorText: Colors.white,
  //           duration: const Duration(seconds: 2),
  //         );
  //
  //         // Navigate to cart screen
  //         Get.to(() => cartscreen());
  //       },
  //       child: Container(
  //         height: screenHeight * 0.07,
  //         width: double.infinity,
  //         margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
  //         decoration: BoxDecoration(
  //           color: themeColor,
  //           borderRadius: BorderRadius.circular(12),
  //         ),
  //         child: Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             const Icon(Icons.shopping_bag_outlined, color: Color(0xFFF5EEDC)),
  //             SizedBox(width: screenWidth * 0.05),
  //             Text(
  //               "Add To Cart",
  //               style: TextStyle(
  //                 fontSize: screenWidth * 0.045,
  //                 fontWeight: FontWeight.bold,
  //                 color: const Color(0xFFF5EEDC),
  //               ),
  //             ),
  //             SizedBox(width: screenWidth * 0.02),
  //             Text(
  //               "|\$${totalPrice.toStringAsFixed(2)}   ",
  //               style: TextStyle(
  //                 fontSize: screenWidth * 0.045,
  //                 fontWeight: FontWeight.bold,
  //                 color: const Color(0xFFF5EEDC),
  //               ),
  //             ),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }


  Widget _buildAddToCartButton(double screenWidth, double screenHeight, Product product) {
    return Center(
      child: Obx(() => GestureDetector(
        onTap: productDetailsController.isLoading.value
            ? null
            : () async {
          // Call the API to add to cart and wait for result
          bool success = await productDetailsController.addToCart(
            quantity,
            selectedSize,
            _colorName(selectedColor),
          );

          // Navigate to cart screen only if API call was successful
          if (success) {
            Get.to(() => cartscreen());
          }
        },
        child: Container(
          height: screenHeight * 0.07,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: screenWidth * 0.04),
          decoration: BoxDecoration(
            color: productDetailsController.isLoading.value
                ? Colors.grey
                : themeColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (productDetailsController.isLoading.value) ...[
                SizedBox(
                  height: 20,
                  width: 20,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                ),
                SizedBox(width: screenWidth * 0.03),
                Text(
                  "Adding...",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF5EEDC),
                  ),
                ),
              ] else ...[
                const Icon(Icons.shopping_bag_outlined, color: Color(0xFFF5EEDC)),
                SizedBox(width: screenWidth * 0.05),
                Text(
                  "Add To Cart",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF5EEDC),
                  ),
                ),
                SizedBox(width: screenWidth * 0.02),
                Text(
                  "|\$${totalPrice.toStringAsFixed(2)}",
                  style: TextStyle(
                    fontSize: screenWidth * 0.045,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xFFF5EEDC),
                  ),
                ),
              ],
            ],
          ),
        ),
      )),
    );
  }

  void _showFullDetails(String details) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Product Details"),
        content: SingleChildScrollView(
          child: Text(details),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close"),
          ),
        ],
      ),
    );
  }

  // Size Option Widget
  Widget _buildSizeOption(String size, bool isSelected) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isSelected ? themeColor : Colors.transparent,
        border: Border.all(
          color: themeColor,
          width: 2,
        ),
        boxShadow: isSelected
            ? [
          BoxShadow(
            color: themeColor.withOpacity(0.3),
            blurRadius: 6,
            offset: const Offset(0, 3),
          ),
        ]
            : [],
      ),
      child: Center(
        child: Text(
          size,
          style: TextStyle(
            color: isSelected ? Colors.white : themeColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }



  // Color Option Widget
  Widget _buildColorOption(Color color, bool isSelected) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
        border: Border.all(
          color: isSelected ? themeColor : Colors.transparent,
          width: 3,
        ),
      ),
      child: isSelected
          ? const Icon(
        Icons.check,
        color: Colors.white,
        size: 20,
      )
          : null,
    );
  }

  // Helper to display a friendly color name
  String _colorName(Color c) {
    if (c == Colors.blue) return "Blue";
    if (c == Colors.red) return "Red";
    if (c == Colors.green) return "Green";
    if (c == Colors.black) return "Black";
    return "Color";
  }
}