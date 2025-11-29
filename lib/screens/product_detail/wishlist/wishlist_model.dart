// // models/wishlist_model.dart
// class WishlistItem {
//   final int wishlistId;
//   final int id;
//   final int categoryId;
//   final String name;
//   final String slug;
//   final String sku;
//   final String tags;
//   final String sortDetails;
//   final String details;
//   final String photo;
//   final double discountPrice;
//   final double previousPrice;
//   final int stock;
//   final String? isType;
//   final String thumbnail;
//
//   WishlistItem({
//     required this.wishlistId,
//     required this.id,
//     required this.categoryId,
//     required this.name,
//     required this.slug,
//     required this.sku,
//     required this.tags,
//     required this.sortDetails,
//     required this.details,
//     required this.photo,
//     required this.discountPrice,
//     required this.previousPrice,
//     required this.stock,
//     this.isType,
//     required this.thumbnail,
//   });
//
//   factory WishlistItem.fromJson(Map<String, dynamic> json) {
//     return WishlistItem(
//       wishlistId: json['wishlist_id'] ?? 0,
//       id: json['id'] ?? 0,
//       categoryId: json['category_id'] ?? 0,
//       name: json['name'] ?? '',
//       slug: json['slug'] ?? '',
//       sku: json['sku'] ?? '',
//       tags: json['tags'] ?? '',
//       sortDetails: json['sort_details'] ?? '',
//       details: json['details'] ?? '',
//       photo: json['photo'] ?? '',
//       discountPrice: (json['discount_price'] is num)
//           ? (json['discount_price'] as num).toDouble()
//           : 0.0,
//       previousPrice: (json['previous_price'] is num)
//           ? (json['previous_price'] as num).toDouble()
//           : 0.0,
//       stock: json['stock'] ?? 0,
//       isType: json['is_type'],
//       thumbnail: json['thumbnail'] ?? '',
//     );
//   }
//
//   bool get hasDiscount => previousPrice > discountPrice && previousPrice > 0;
//
//   double get discountPercentage {
//     if (!hasDiscount) return 0.0;
//     return ((previousPrice - discountPrice) / previousPrice) * 100;
//   }
// }
//
// class WishlistResponse {
//   final bool status;
//   final String message;
//   final int count;
//   final List<WishlistItem> data;
//
//   WishlistResponse({
//     required this.status,
//     required this.message,
//     required this.count,
//     required this.data,
//   });
//
//   factory WishlistResponse.fromJson(Map<String, dynamic> json) {
//     var dataList = json['data'] as List? ?? [];
//     return WishlistResponse(
//       status: json['status'] ?? false,
//       message: json['message'] ?? '',
//       count: json['count'] ?? 0,
//       data: dataList.map((item) => WishlistItem.fromJson(item)).toList(),
//     );
//   }
// }


class WishlistItem {
  final int wishlistId;
  final int id;
  final int categoryId;
  final String name;
  final String slug;
  final String sku;
  final String tags;
  final String sortDetails;
  final String details;
  final String photo;
  final double discountPrice;
  final double previousPrice;
  final int stock;
  final String? isType;
  final String thumbnail;

  WishlistItem({
    required this.wishlistId,
    required this.id,
    required this.categoryId,
    required this.name,
    required this.slug,
    required this.sku,
    required this.tags,
    required this.sortDetails,
    required this.details,
    required this.photo,
    required this.discountPrice,
    required this.previousPrice,
    required this.stock,
    this.isType,
    required this.thumbnail,
  });

  factory WishlistItem.fromJson(Map<String, dynamic> json) {
    return WishlistItem(
      wishlistId: json['wishlist_id'] ?? 0,
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      sku: json['sku'] ?? '',
      tags: json['tags'] ?? '',
      sortDetails: json['sort_details'] ?? '',
      details: json['details'] ?? '',
      photo: json['photo'] ?? '',
      discountPrice: (json['discount_price'] is num)
          ? (json['discount_price'] as num).toDouble()
          : 0.0,
      previousPrice: (json['previous_price'] is num)
          ? (json['previous_price'] as num).toDouble()
          : 0.0,
      stock: json['stock'] ?? 0,
      isType: json['is_type'],
      thumbnail: json['thumbnail'] ?? '',
    );
  }

  bool get hasDiscount => previousPrice > discountPrice && previousPrice > 0;

  double get discountPercentage {
    if (!hasDiscount) return 0.0;
    return ((previousPrice - discountPrice) / previousPrice) * 100;
  }
}

class WishlistResponse {
  final bool status;
  final String message;
  final int count;
  final List<WishlistItem> data;

  WishlistResponse({
    required this.status,
    required this.message,
    required this.count,
    required this.data,
  });

  factory WishlistResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List? ?? [];
    return WishlistResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      count: json['count'] ?? 0,
      data: dataList.map((item) => WishlistItem.fromJson(item)).toList(),
    );
  }
}

class AddWishlistResponse {
  final bool status;
  final String message;

  AddWishlistResponse({
    required this.status,
    required this.message,
  });

  factory AddWishlistResponse.fromJson(Map<String, dynamic> json) {
    return AddWishlistResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }
}