// // screens/wishlist_screen/wishlist_screen.dart
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_controller.dart';
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
//
// import '../product_detail_screen.dart';
//
//
// class WishlistScreen extends StatefulWidget {
//
//   WishlistScreen({super.key});
//
//   @override
//   State<WishlistScreen> createState() => _WishlistScreenState();
// }
//
// class _WishlistScreenState extends State<WishlistScreen> {
//   final WishlistController wishlistController = Get.put(WishlistController());
//
//   final Color themeColor = const Color(0xFF16423C);
// @override
//   void initState() {
//   wishlistController.fetchWishlist();
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     final screenWidth = MediaQuery.of(context).size.width;
//     final screenHeight = MediaQuery.of(context).size.height;
//
//     return Scaffold(
//       backgroundColor: const Color(0xFFF5EEDC),
//       appBar: AppBar(
//         backgroundColor: themeColor,
//         elevation: 0,
//         leading: IconButton(
//           icon: const Icon(Icons.arrow_back, color: Colors.white),
//           onPressed: () => Navigator.pop(context),
//         ),
//         title: Obx(() => Text(
//           "My Wishlist (${wishlistController.wishlistCount.value})",
//           style: const TextStyle(color: Colors.white),
//         )),
//         actions: [
//           Obx(() => wishlistController.wishlistItems.isNotEmpty
//               ? IconButton(
//             icon: const Icon(Icons.delete_outline, color: Colors.white),
//             onPressed: () {
//               _showClearWishlistDialog(context);
//             },
//           )
//               : const SizedBox()),
//         ],
//       ),
//       body: Obx(() {
//         if (wishlistController.isLoading.value) {
//           return _buildLoadingState(screenWidth, screenHeight);
//         }
//
//         if (wishlistController.errorMessage.value.isNotEmpty) {
//           return _buildErrorState(
//             wishlistController.errorMessage.value,
//             screenWidth,
//             screenHeight,
//           );
//         }
//
//         if (wishlistController.wishlistItems.isEmpty) {
//           return _buildEmptyState(screenWidth, screenHeight);
//         }
//
//         return _buildWishlistList(screenWidth, screenHeight);
//       }),
//     );
//   }
//
//   Widget _buildLoadingState(double screenWidth, double screenHeight) {
//     return Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           CircularProgressIndicator(color: themeColor),
//           SizedBox(height: screenHeight * 0.02),
//           Text(
//             "Loading your wishlist...",
//             style: TextStyle(
//               fontSize: screenWidth * 0.04,
//               color: themeColor,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _buildErrorState(String error, double screenWidth, double screenHeight) {
//     return Center(
//       child: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.05),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.error_outline,
//               size: screenWidth * 0.15,
//               color: Colors.grey,
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             Text(
//               error,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: screenWidth * 0.04,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.03),
//             ElevatedButton(
//               onPressed: () => wishlistController.fetchWishlist(),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: themeColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth * 0.06,
//                   vertical: screenHeight * 0.02,
//                 ),
//               ),
//               child: Text(
//                 "Try Again",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.04,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildEmptyState(double screenWidth, double screenHeight) {
//     return Center(
//       child: Padding(
//         padding: EdgeInsets.all(screenWidth * 0.05),
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(
//               Icons.favorite_border,
//               size: screenWidth * 0.2,
//               color: Colors.grey,
//             ),
//             SizedBox(height: screenHeight * 0.02),
//             Text(
//               "Your Wishlist is Empty",
//               style: TextStyle(
//                 fontSize: screenWidth * 0.05,
//                 fontWeight: FontWeight.bold,
//                 color: themeColor,
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.01),
//             Text(
//               "Start adding products you love to your wishlist",
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 fontSize: screenWidth * 0.035,
//                 color: Colors.grey[600],
//               ),
//             ),
//             SizedBox(height: screenHeight * 0.03),
//             ElevatedButton(
//               onPressed: () {
//                 Get.back();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: themeColor,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(12),
//                 ),
//                 padding: EdgeInsets.symmetric(
//                   horizontal: screenWidth * 0.06,
//                   vertical: screenHeight * 0.02,
//                 ),
//               ),
//               child: Text(
//                 "Continue Shopping",
//                 style: TextStyle(
//                   fontSize: screenWidth * 0.04,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _buildWishlistList(double screenWidth, double screenHeight) {
//     return ListView.builder(
//       padding: EdgeInsets.all(screenWidth * 0.04),
//       itemCount: wishlistController.wishlistItems.length,
//       itemBuilder: (context, index) {
//         final item = wishlistController.wishlistItems[index];
//         return _buildWishlistItem(item, screenWidth, screenHeight);
//       },
//     );
//   }
//
//   Widget _buildWishlistItem(WishlistItem item, double screenWidth, double screenHeight) {
//     return Card(
//       margin: EdgeInsets.only(bottom: screenHeight * 0.02),
//       elevation: 2,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(12),
//       ),
//       child: ListTile(
//         contentPadding: EdgeInsets.all(screenWidth * 0.03),
//         leading: Container(
//           width: screenWidth * 0.2,
//           height: screenWidth * 0.2,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(8),
//             image: DecorationImage(
//               image: NetworkImage(item.photo),
//               fit: BoxFit.cover,
//             ),
//           ),
//         ),
//         title: Text(
//           item.name,
//           style: TextStyle(
//             fontWeight: FontWeight.bold,
//             color: themeColor,
//             fontSize: screenWidth * 0.04,
//           ),
//           maxLines: 2,
//           overflow: TextOverflow.ellipsis,
//         ),
//         subtitle: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             SizedBox(height: screenHeight * 0.005),
//             Text(
//               "\$${item.discountPrice.toStringAsFixed(2)}",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: screenWidth * 0.045,
//                 color: themeColor,
//               ),
//             ),
//             if (item.hasDiscount)
//               Text(
//                 "\$${item.previousPrice.toStringAsFixed(2)}",
//                 style: TextStyle(
//                   decoration: TextDecoration.lineThrough,
//                   color: Colors.grey,
//                   fontSize: screenWidth * 0.035,
//                 ),
//               ),
//             SizedBox(height: screenHeight * 0.005),
//             Text(
//               item.stock > 0 ? "In Stock" : "Out of Stock",
//               style: TextStyle(
//                 color: item.stock > 0 ? Colors.green : Colors.red,
//                 fontSize: screenWidth * 0.03,
//               ),
//             ),
//           ],
//         ),
//         trailing: IconButton(
//           icon: Icon(Icons.favorite, color: Colors.red),
//           onPressed: () {
//             wishlistController.removeFromWishlist(item.wishlistId);
//           },
//         ),
//         onTap: () {
//           Get.to(() => ProductDetailsScreen(productId: item.id));
//         },
//       ),
//     );
//   }
//
//   void _showClearWishlistDialog(BuildContext context) {
//     showDialog(
//       context: context,
//       builder: (context) => AlertDialog(
//         title: Text(
//           "Clear Wishlist",
//           style: TextStyle(color: themeColor),
//         ),
//         content: Text("Are you sure you want to remove all items from your wishlist?"),
//         actions: [
//           TextButton(
//             onPressed: () => Navigator.pop(context),
//             child: Text("Cancel", style: TextStyle(color: Colors.grey)),
//           ),
//           TextButton(
//             onPressed: () {
//               Navigator.pop(context);
//               wishlistController.clearWishlist();
//             },
//             child: Text("Clear", style: TextStyle(color: Colors.red)),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
//
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_controller.dart';
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_model.dart';
//
// class WishlistScreen extends StatelessWidget {
//   final WishlistController wishlistController = Get.put(WishlistController());
//
//   WishlistScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Wishlist'),
//         backgroundColor: Color(0xFF16423C),
//         foregroundColor: Colors.white,
//       ),
//       body: Obx(() {
//         if (wishlistController.isLoading.value) {
//           return Center(child: CircularProgressIndicator());
//         }
//
//         final wishlist = wishlistController.wishlistResponse.value;
//
//         if (wishlist.data.isEmpty) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
//                 SizedBox(height: 16),
//                 Text(
//                   'Your wishlist is empty',
//                   style: TextStyle(fontSize: 18, color: Colors.grey[600]),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Add items you love to your wishlist',
//                   style: TextStyle(fontSize: 14, color: Colors.grey[500]),
//                 ),
//               ],
//             ),
//           );
//         }
//
//         return ListView.builder(
//           padding: EdgeInsets.all(16),
//           itemCount: wishlist.data.length,
//           itemBuilder: (context, index) {
//             final item = wishlist.data[index];
//             return Card(
//               margin: EdgeInsets.only(bottom: 12),
//               child: ListTile(
//                 leading: Image.network(
//                   item.photo,
//                   width: 60,
//                   height: 60,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       width: 60,
//                       height: 60,
//                       color: Colors.grey[200],
//                       child: Icon(Icons.image_not_supported),
//                     );
//                   },
//                 ),
//                 title: Text(item.name),
//                 subtitle: Text('\$${item.discountPrice.toStringAsFixed(2)}'),
//                 trailing: IconButton(
//                   icon: Icon(Icons.delete, color: Colors.red),
//                   onPressed: () {
//                     // Remove from wishlist
//                   },
//                 ),
//               ),
//             );
//           },
//         );
//       }),
//     );
//   }
// }
//
// import 'dart:ui';
//
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_controller.dart';
// import 'package:ecommerce/screens/product_detail/wishlist/wishlist_model.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:get/get_core/src/get_main.dart';
//
// class WishlistScreen extends StatefulWidget {
//   const WishlistScreen({super.key});
//
//   @override
//   State<WishlistScreen> createState() => _WishlistScreenState();
// }
//
// class _WishlistScreenState extends State<WishlistScreen> {
//   final WishlistController wishlistController = Get.put(WishlistController());
//
//   @override
//   void initState() {
//     super.initState();
//     loadWishlist();
//   }
//
//   Future<void> loadWishlist() async {
//     // Only fetch if not already loaded
//     if (!wishlistController.hasLoaded.value) {
//       await wishlistController.fetchWishlist();
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('My Wishlist'),
//         backgroundColor: Color(0xFF16423C),
//         foregroundColor: Colors.white,
//         actions: [
//           IconButton(
//             icon: Icon(Icons.refresh),
//             onPressed: () async {
//               await wishlistController.fetchWishlist();
//             },
//           ),
//         ],
//       ),
//       body: Obx(() {
//         // Show loading only on initial load
//         if (wishlistController.isLoading.value && !wishlistController.hasLoaded.value) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 CircularProgressIndicator(),
//                 SizedBox(height: 16),
//                 Text("Loading your wishlist..."),
//               ],
//             ),
//           );
//         }
//
//         final wishlist = wishlistController.wishlistResponse.value;
//
//         // Debug info
//         print("🔄 Wishlist Screen Build:");
//         print("Has Loaded: ${wishlistController.hasLoaded.value}");
//         print("Item Count: ${wishlist.data.length}");
//         print("Status: ${wishlist.status}");
//
//         // Show empty state only if data is loaded and empty
//         if (wishlistController.hasLoaded.value && wishlist.data.isEmpty) {
//           return Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
//                 SizedBox(height: 16),
//                 Text(
//                   'Your wishlist is empty',
//                   style: TextStyle(fontSize: 18, color: Colors.grey[600]),
//                 ),
//                 SizedBox(height: 8),
//                 Text(
//                   'Add items you love to your wishlist',
//                   style: TextStyle(fontSize: 14, color: Colors.grey[500]),
//                 ),
//                 SizedBox(height: 20),
//                 ElevatedButton(
//                   onPressed: () {
//                     Get.back();
//                   },
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: Color(0xFF16423C),
//                     foregroundColor: Colors.white,
//                   ),
//                   child: Text('Continue Shopping'),
//                 ),
//               ],
//             ),
//           );
//         }
//
//         // Show wishlist items
//         return ListView.builder(
//           padding: EdgeInsets.all(16),
//           itemCount: wishlist.data.length,
//           itemBuilder: (context, index) {
//             final item = wishlist.data[index];
//             return buildWishlistItem(item);
//           },
//         );
//       }),
//     );
//   }
//
//   Widget buildWishlistItem(WishlistItem item) {
//     return Card(
//       margin: EdgeInsets.only(bottom: 12),
//       child: Padding(
//         padding: EdgeInsets.all(12),
//         child: Row(
//           children: [
//             // Image
//             Container(
//               width: 80,
//               height: 80,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: Colors.grey[200],
//               ),
//               child: ClipRRect(
//                 borderRadius: BorderRadius.circular(8),
//                 child: Image.network(
//                   item.photo,
//                   width: 80,
//                   height: 80,
//                   fit: BoxFit.cover,
//                   errorBuilder: (context, error, stackTrace) {
//                     return Container(
//                       color: Colors.grey[200],
//                       child: Icon(Icons.image_not_supported, color: Colors.grey),
//                     );
//                   },
//                   loadingBuilder: (context, child, loadingProgress) {
//                     if (loadingProgress == null) return child;
//                     return Center(
//                       child: CircularProgressIndicator(),
//                     );
//                   },
//                 ),
//               ),
//             ),
//
//             SizedBox(width: 12),
//
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     item.name,
//                     style: TextStyle(
//                       fontWeight: FontWeight.bold,
//                       fontSize: 16,
//                     ),
//                     maxLines: 2,
//                     overflow: TextOverflow.ellipsis,
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     '\$${item.discountPrice.toStringAsFixed(2)}',
//                     style: TextStyle(
//                       fontSize: 18,
//                       fontWeight: FontWeight.bold,
//                       color: Color(0xFF16423C),
//                     ),
//                   ),
//                   SizedBox(height: 4),
//                   Text(
//                     'SKU: ${item.sku}',
//                     style: TextStyle(
//                       fontSize: 12,
//                       color: Colors.grey[600],
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//
//             IconButton(
//               icon: Icon(Icons.delete, color: Colors.red),
//               onPressed: () {
//                 Get.defaultDialog(
//                   title: "Remove Item",
//                   content: Text("Remove ${item.name} from wishlist?"),
//                   actions: [
//                     TextButton(
//                       onPressed: () => Get.back(),
//                       child: Text("Cancel"),
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         Get.back();
//                         Get.snackbar(
//                           'Removed',
//                           'Item removed from wishlist',
//                           backgroundColor: Colors.red,
//                           colorText: Colors.white,
//                         );
//                       },
//                       child: Text(
//                         "Remove",
//                         style: TextStyle(color: Colors.red),
//                       ),
//                     ),
//                   ],
//                 );
//               },
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }


import 'dart:ui';
import 'package:ecommerce/screens/product_detail/wishlist/wishlist_controller.dart';
import 'package:ecommerce/screens/product_detail/wishlist/wishlist_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class WishlistScreen extends StatefulWidget {
  const WishlistScreen({super.key});

  @override
  State<WishlistScreen> createState() => _WishlistScreenState();
}

class _WishlistScreenState extends State<WishlistScreen> {
  final WishlistController wishlistController = Get.put(WishlistController());

  @override
  void initState() {
    super.initState();
    loadWishlist();
  }

  Future<void> loadWishlist() async {
    if (!wishlistController.hasLoaded.value) {
      await wishlistController.fetchWishlist();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Wishlist'),
        backgroundColor: Color(0xFF16423C),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () async {
              await wishlistController.fetchWishlist();
            },
          ),
        ],
      ),
      body: Obx(() {
        if (wishlistController.isLoading.value && !wishlistController.hasLoaded.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text("Loading your wishlist..."),
              ],
            ),
          );
        }

        final wishlist = wishlistController.wishlistResponse.value;

        if (wishlistController.hasLoaded.value && wishlist.data.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.favorite_border, size: 80, color: Colors.grey[400]),
                SizedBox(height: 16),
                Text(
                  'Your wishlist is empty',
                  style: TextStyle(fontSize: 18, color: Colors.grey[600]),
                ),
                SizedBox(height: 8),
                Text(
                  'Add items you love to your wishlist',
                  style: TextStyle(fontSize: 14, color: Colors.grey[500]),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF16423C),
                    foregroundColor: Colors.white,
                  ),
                  child: Text('Continue Shopping'),
                ),
              ],
            ),
          );
        }

        return ListView.builder(
          padding: EdgeInsets.all(16),
          itemCount: wishlist.data.length,
          itemBuilder: (context, index) {
            final item = wishlist.data[index];
            return buildWishlistItem(item);
          },
        );
      }),
    );
  }

  Widget buildWishlistItem(WishlistItem item) {
    return Card(
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(12),
        child: Row(
          children: [
            // Image
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: Colors.grey[200],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.network(
                  item.photo,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return Container(
                      color: Colors.grey[200],
                      child: Icon(Icons.image_not_supported, color: Colors.grey),
                    );
                  },
                ),
              ),
            ),

            SizedBox(width: 12),

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
                  Text(
                    '\$${item.discountPrice.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF16423C),
                    ),
                  ),
                ],
              ),
            ),

            IconButton(
              icon: Icon(Icons.delete, color: Colors.red),
              onPressed: () {
                _showDeleteConfirmation(item);
              },
            ),
          ],
        ),
      ),
    );
  }

  void _showDeleteConfirmation(WishlistItem item) {
    Get.defaultDialog(
      title: "Remove from Wishlist",
      content: Column(
        children: [
          Text("Are you sure you want to remove"),
          SizedBox(height: 8),
          Text(
            "${item.name}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Color(0xFF16423C),
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 8),
          Text("from your wishlist?"),
        ],
      ),
      actions: [
        TextButton(
          onPressed: () => Get.back(),
          child: Text("Cancel"),
        ),
        TextButton(
          onPressed: () async {
            Get.back();
            await wishlistController.removeFromWishlist(item.wishlistId);
          },
          child: Text(
            "Remove",
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}