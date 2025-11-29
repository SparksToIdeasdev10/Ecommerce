import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ecommerce/screens/dashboard/featured_screen/featured_controller.dart';
import 'package:ecommerce/screens/product_detail/product_detail_screen.dart';

class AllFeaturesScreen extends StatefulWidget {
  const AllFeaturesScreen({super.key});

  @override
  State<AllFeaturesScreen> createState() => _AllFeaturesScreenState();
}

class _AllFeaturesScreenState extends State<AllFeaturesScreen> {
  late featureController featureCtrl; // ✅ Changed variable name

  @override
  void initState() {
    super.initState();

    // Get the controller
    featureCtrl = Get.put(featureController()); // ✅ Using class name

    // If no data, try to load it
    if (featureCtrl.featureList.isEmpty) {
      print("🔄 No features found, loading data...");
      featureCtrl.featurecont();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Customer Favourites'),
        backgroundColor: const Color(0xFF16423C),
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              featureCtrl.featurecont();
            },
          ),
        ],
      ),
      body: Obx(() {
        // Show loading
        if (featureCtrl.isfeatureloading.value) {
          return const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 10),
                Text('Loading favourites...'),
              ],
            ),
          );
        }

        // Get features
        final features = featureCtrl.featureList;

        // Show empty state
        if (features.isEmpty) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.favorite_border, size: 60, color: Colors.grey),
                const SizedBox(height: 16),
                const Text(
                  'No Favourites Available',
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total favourites: ${features.length}',
                  style: const TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    featureCtrl.featurecont();
                  },
                  child: const Text('Retry Load Favourites'),
                ),
              ],
            ),
          );
        }

        // Show features grid
        return GridView.builder(
          padding: const EdgeInsets.all(16),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 16,
            mainAxisSpacing: 16,
            childAspectRatio: 0.7,
          ),
          itemCount: features.length,
          itemBuilder: (context, index) {
            final feature = features[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProductDetailsScreen(productId: feature.id),
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    )
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.vertical(
                        top: Radius.circular(12),
                      ),
                      child: Image.network(
                        feature.photo,
                        height: 120,
                        width: double.infinity,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            height: 120,
                            color: Colors.grey[200],
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(Icons.error, color: Colors.grey),
                                SizedBox(height: 4),
                                Text('No Image', style: TextStyle(fontSize: 10)),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            feature.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 12,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 4),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$${feature.previousPrice?.toStringAsFixed(2) ?? feature.discountPrice.toStringAsFixed(2)}",
                                style: const TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star, color: Colors.amber, size: 14),
                                  Text(
                                    feature.brandId?.toString() ?? "5.0",
                                    style: const TextStyle(fontSize: 10),
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 6),
                          Container(
                            alignment: Alignment.center,
                            width: double.infinity,
                            padding: const EdgeInsets.symmetric(vertical: 6),
                            decoration: BoxDecoration(
                              color: const Color(0xFF16423C),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              "\$${feature.discountPrice.toStringAsFixed(2)}",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        );
      }),
    );
  }
}