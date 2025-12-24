// // product_details_model.dart
//main hai  23 ka
// import 'dart:convert';
//
// class ProductDetailsResponse {
//   final bool status;
//   final String message;
//   final ProductDetailsData data;
//
//   ProductDetailsResponse({
//     required this.status,
//     required this.message,
//     required this.data,
//   });
//
//   factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
//     return ProductDetailsResponse(
//       status: json['status'] ?? false,
//       message: json['message'] ?? '',
//       data: ProductDetailsData.fromJson(json['data'] ?? {}),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//       'data': data.toJson(),
//     };
//   }
// }
//
// class ProductDetailsData {
//   final Product product;
//   final List<GalleryImage> gallery;
//   final List<Review> reviews;
//   final double avgRating;
//
//   ProductDetailsData({
//     required this.product,
//     required this.gallery,
//     required this.reviews,
//     required this.avgRating,
//   });
//
//   factory ProductDetailsData.fromJson(Map<String, dynamic> json) {
//     return ProductDetailsData(
//       product: Product.fromJson(json['product'] ?? {}),
//       gallery: (json['gallery'] as List<dynamic>?)
//           ?.map((galleryJson) => GalleryImage.fromJson(galleryJson))
//           .toList() ?? [],
//       reviews: (json['reviews'] as List<dynamic>?)
//           ?.map((reviewJson) => Review.fromJson(reviewJson))
//           .toList() ?? [],
//       avgRating: (json['avg_rating'] is int)
//           ? (json['avg_rating'] as int).toDouble()
//           : (json['avg_rating'] ?? 0.0).toDouble(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'product': product.toJson(),
//       'gallery': gallery.map((gallery) => gallery.toJson()).toList(),
//       'reviews': reviews.map((review) => review.toJson()).toList(),
//       'avg_rating': avgRating,
//     };
//   }
// }
//
// class Product {
//   final int id;
//   final int categoryId;
//   final int? subcategoryId;
//   final int? childcategoryId;
//   final int taxId;
//   final int? brandId;
//   final String name;
//   final String slug;
//   final String sku;
//   final String tags;
//   final String video;
//   final String sortDetails;
//   final String specificationName;
//   final String specificationDescription;
//   final int isSpecification;
//   final String details;
//   final String photo;
//   final double discountPrice;
//   final double? previousPrice;
//   final int stock;
//   final String metaKeywords;
//   final String? metaDescription;
//   final int status;
//   final String isType;
//   final String? date;
//   final String? file;
//   final String? link;
//   final String? fileType;
//   final String createdAt;
//   final String updatedAt;
//   final String? licenseName;
//   final String? licenseKey;
//   final String itemType;
//   final String thumbnail;
//   final String? affiliateLink;
//
//   Product({
//     required this.id,
//     required this.categoryId,
//     this.subcategoryId,
//     this.childcategoryId,
//     required this.taxId,
//     this.brandId,
//     required this.name,
//     required this.slug,
//     required this.sku,
//     required this.tags,
//     required this.video,
//     required this.sortDetails,
//     required this.specificationName,
//     required this.specificationDescription,
//     required this.isSpecification,
//     required this.details,
//     required this.photo,
//     required this.discountPrice,
//     this.previousPrice,
//     required this.stock,
//     required this.metaKeywords,
//     this.metaDescription,
//     required this.status,
//     required this.isType,
//     this.date,
//     this.file,
//     this.link,
//     this.fileType,
//     required this.createdAt,
//     required this.updatedAt,
//     this.licenseName,
//     this.licenseKey,
//     required this.itemType,
//     required this.thumbnail,
//     this.affiliateLink,
//   });
//
//   factory Product.fromJson(Map<String, dynamic> json) {
//     return Product(
//       id: json['id'] ?? 0,
//       categoryId: json['category_id'] ?? 0,
//       subcategoryId: json['subcategory_id'],
//       childcategoryId: json['childcategory_id'],
//       taxId: json['tax_id'] ?? 0,
//       brandId: json['brand_id'],
//       name: json['name'] ?? '',
//       slug: json['slug'] ?? '',
//       sku: json['sku'] ?? '',
//       tags: json['tags'] ?? '',
//       video: json['video'] ?? '',
//       sortDetails: json['sort_details'] ?? '',
//       specificationName: json['specification_name'] ?? '',
//       specificationDescription: json['specification_description'] ?? '',
//       isSpecification: json['is_specification'] ?? 0,
//       details: json['details'] ?? '',
//       photo: json['photo'] ?? '',
//       discountPrice: (json['discount_price'] is int)
//           ? (json['discount_price'] as int).toDouble()
//           : (json['discount_price'] ?? 0.0).toDouble(),
//       previousPrice: (json['previous_price'] is int)
//           ? (json['previous_price'] as int).toDouble()
//           : (json['previous_price'] ?? 0.0).toDouble(),
//       stock: json['stock'] ?? 0,
//       metaKeywords: json['meta_keywords'] ?? '',
//       metaDescription: json['meta_description'],
//       status: json['status'] ?? 0,
//       isType: json['is_type'] ?? '',
//       date: json['date'],
//       file: json['file'],
//       link: json['link'],
//       fileType: json['file_type'],
//       createdAt: json['created_at'] ?? '',
//       updatedAt: json['updated_at'] ?? '',
//       licenseName: json['license_name'],
//       licenseKey: json['license_key'],
//       itemType: json['item_type'] ?? '',
//       thumbnail: json['thumbnail'] ?? '',
//       affiliateLink: json['affiliate_link'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'category_id': categoryId,
//       'subcategory_id': subcategoryId,
//       'childcategory_id': childcategoryId,
//       'tax_id': taxId,
//       'brand_id': brandId,
//       'name': name,
//       'slug': slug,
//       'sku': sku,
//       'tags': tags,
//       'video': video,
//       'sort_details': sortDetails,
//       'specification_name': specificationName,
//       'specification_description': specificationDescription,
//       'is_specification': isSpecification,
//       'details': details,
//       'photo': photo,
//       'discount_price': discountPrice,
//       'previous_price': previousPrice,
//       'stock': stock,
//       'meta_keywords': metaKeywords,
//       'meta_description': metaDescription,
//       'status': status,
//       'is_type': isType,
//       'date': date,
//       'file': file,
//       'link': link,
//       'file_type': fileType,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'license_name': licenseName,
//       'license_key': licenseKey,
//       'item_type': itemType,
//       'thumbnail': thumbnail,
//       'affiliate_link': affiliateLink,
//     };
//   }
//
//   // Helper methods
//   bool get hasDiscount => previousPrice != null && previousPrice! > discountPrice && previousPrice! > 0;
//
//   double get discountPercentage {
//     if (previousPrice == null || previousPrice! <= 0) return 0.0;
//     return ((previousPrice! - discountPrice) / previousPrice! * 100).roundToDouble();
//   }
//
//   List<String> get tagList {
//     if (tags.isEmpty) return [];
//     return tags.split(',').map((tag) => tag.trim()).toList();
//   }
//
//   List<String> get specificationNames {
//     try {
//       if (specificationName.isEmpty) return [];
//       final List<dynamic> parsed = json.decode(specificationName);
//       return parsed.map((e) => e.toString()).toList();
//     } catch (e) {
//       return [];
//     }
//   }
//
//   List<String> get specificationDescriptions {
//     try {
//       if (specificationDescription.isEmpty) return [];
//       final List<dynamic> parsed = json.decode(specificationDescription);
//       return parsed.map((e) => e.toString()).toList();
//     } catch (e) {
//       return [];
//     }
//   }
//
//   // Check product type
//   bool get isBest => isType == 'best';
//   bool get isNew => isType == 'new';
//   bool get isFeature => isType == 'feature';
//   bool get isTop => isType == 'top';
//   bool get isFlashDeal => isType == 'flash_deal';
//
//   // Check item type
//   bool get isNormalItem => itemType == 'normal';
//   bool get isDigitalItem => itemType == 'digital';
//   bool get isLicenseItem => itemType == 'license';
//
//   // Format price
//   String get formattedDiscountPrice => '\$${discountPrice.toStringAsFixed(2)}';
//   String get formattedPreviousPrice => previousPrice != null && previousPrice! > 0
//       ? '\$${previousPrice!.toStringAsFixed(2)}'
//       : '';
//
//   // Check stock status
//   bool get inStock => stock > 0;
//   bool get outOfStock => stock <= 0;
//
//   // Check if product has specifications
//   bool get hasSpecifications => isSpecification == 1 && specificationNames.isNotEmpty;
//
//   // Check if product has gallery images
//   bool get hasGallery => true; // Gallery is handled separately in ProductDetailsData
// }
//
// class GalleryImage {
//   final int id;
//   final int itemId;
//   final String photo;
//   final String? createdAt;
//   final String? updatedAt;
//
//   GalleryImage({
//     required this.id,
//     required this.itemId,
//     required this.photo,
//     this.createdAt,
//     this.updatedAt,
//   });
//
//   factory GalleryImage.fromJson(Map<String, dynamic> json) {
//     return GalleryImage(
//       id: json['id'] ?? 0,
//       itemId: json['item_id'] ?? 0,
//       photo: json['photo'] ?? '',
//       createdAt: json['created_at'],
//       updatedAt: json['updated_at'],
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'item_id': itemId,
//       'photo': photo,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//     };
//   }
// }
//
// class Review {
//   final int id;
//   final int userId;
//   final int itemId;
//   final String review;
//   final String subject;
//   final int rating;
//   final int status;
//   final String createdAt;
//   final String updatedAt;
//
//   Review({
//     required this.id,
//     required this.userId,
//     required this.itemId,
//     required this.review,
//     required this.subject,
//     required this.rating,
//     required this.status,
//     required this.createdAt,
//     required this.updatedAt,
//   });
//
//   factory Review.fromJson(Map<String, dynamic> json) {
//     return Review(
//       id: json['id'] ?? 0,
//       userId: json['user_id'] ?? 0,
//       itemId: json['item_id'] ?? 0,
//       review: json['review'] ?? '',
//       subject: json['subject'] ?? '',
//       rating: json['rating'] ?? 0,
//       status: json['status'] ?? 0,
//       createdAt: json['created_at'] ?? '',
//       updatedAt: json['updated_at'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'user_id': userId,
//       'item_id': itemId,
//       'review': review,
//       'subject': subject,
//       'rating': rating,
//       'status': status,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//     };
//   }
//
//
//   // Helper methods
//   bool get isActive => status == 1;
//
//   String get formattedDate {
//     try {
//       final date = DateTime.parse(createdAt);
//       return '${date.day}/${date.month}/${date.year}';
//     } catch (e) {
//       return createdAt;
//     }
//   }
// }
//
//
//


//just update at 2:40
import 'dart:convert';

class ProductDetailsResponse {
  final bool status;
  final String message;
  final ProductDetailsData data;

  ProductDetailsResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ProductDetailsResponse.fromJson(Map<String, dynamic> json) {
    return ProductDetailsResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: ProductDetailsData.fromJson(json['data'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(),
    };
  }
}

class ProductDetailsData {
  final Product product;
  final List<Attribute> attributes;
  final List<GalleryImage> gallery;
  final List<Review> reviews;
  final double avgRating;

  ProductDetailsData({
    required this.product,
    required this.attributes,
    required this.gallery,
    required this.reviews,
    required this.avgRating,
  });

  factory ProductDetailsData.fromJson(Map<String, dynamic> json) {
    return ProductDetailsData(
      product: Product.fromJson(json['product'] ?? {}),
      attributes: (json['attributes'] as List<dynamic>?)
          ?.map((attrJson) => Attribute.fromJson(attrJson))
          .toList() ?? [],
      gallery: (json['gallery'] as List<dynamic>?)
          ?.map((galleryJson) => GalleryImage.fromJson(galleryJson))
          .toList() ?? [],
      reviews: (json['reviews'] as List<dynamic>?)
          ?.map((reviewJson) => Review.fromJson(reviewJson))
          .toList() ?? [],
      avgRating: (json['avg_rating'] is int)
          ? (json['avg_rating'] as int).toDouble()
          : (json['avg_rating'] ?? 0.0).toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product': product.toJson(),
      'attributes': attributes.map((attr) => attr.toJson()).toList(),
      'gallery': gallery.map((gallery) => gallery.toJson()).toList(),
      'reviews': reviews.map((review) => review.toJson()).toList(),
      'avg_rating': avgRating,
    };
  }
}

// NEW: Attribute Model
class Attribute {
  final int id;
  final int itemId;
  final String name;
  final String keyword;
  final String? createdAt;
  final String? updatedAt;
  final List<AttributeOption> options;

  Attribute({
    required this.id,
    required this.itemId,
    required this.name,
    required this.keyword,
    this.createdAt,
    this.updatedAt,
    required this.options,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      id: json['id'] ?? 0,
      itemId: json['item_id'] ?? 0,
      name: json['name'] ?? '',
      keyword: json['keyword'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      options: (json['options'] as List<dynamic>?)
          ?.map((optionJson) => AttributeOption.fromJson(optionJson))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item_id': itemId,
      'name': name,
      'keyword': keyword,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'options': options.map((option) => option.toJson()).toList(),
    };
  }
}

// NEW: Attribute Option Model
class AttributeOption {
  final int id;
  final int attributeId;
  final String name;
  final double price;
  final String keyword;
  final String? createdAt;
  final String? updatedAt;
  final String stock;

  AttributeOption({
    required this.id,
    required this.attributeId,
    required this.name,
    required this.price,
    required this.keyword,
    this.createdAt,
    this.updatedAt,
    required this.stock,
  });

  factory AttributeOption.fromJson(Map<String, dynamic> json) {
    return AttributeOption(
      id: json['id'] ?? 0,
      attributeId: json['attribute_id'] ?? 0,
      name: json['name'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] ?? 0.0).toDouble(),
      keyword: json['keyword'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      stock: json['stock'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'attribute_id': attributeId,
      'name': name,
      'price': price,
      'keyword': keyword,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'stock': stock,
    };
  }

  // Helper methods
  bool get hasStock => stock.toLowerCase() != 'outofstock';
  bool get isUnlimited => stock.toLowerCase() == 'unlimited';
}

class Product {
  final int id;
  final int categoryId;
  final int? subcategoryId;
  final int? childcategoryId;
  final int taxId;
  final int? brandId;
  final String name;
  final String slug;
  final String sku;
  final String tags;
  final String video;
  final String sortDetails;
  final String specificationName;
  final String specificationDescription;
  final int isSpecification;
  final String details;
  final String photo;
  final double discountPrice;
  final double? previousPrice;
  final int stock;
  final String metaKeywords;
  final String? metaDescription;
  final int status;
  final String isType;
  final String? date;
  final String? file;
  final String? link;
  final String? fileType;
  final String createdAt;
  final String updatedAt;
  final String? licenseName;
  final String? licenseKey;
  final String itemType;
  final String thumbnail;
  final String? affiliateLink;

  Product({
    required this.id,
    required this.categoryId,
    this.subcategoryId,
    this.childcategoryId,
    required this.taxId,
    this.brandId,
    required this.name,
    required this.slug,
    required this.sku,
    required this.tags,
    required this.video,
    required this.sortDetails,
    required this.specificationName,
    required this.specificationDescription,
    required this.isSpecification,
    required this.details,
    required this.photo,
    required this.discountPrice,
    this.previousPrice,
    required this.stock,
    required this.metaKeywords,
    this.metaDescription,
    required this.status,
    required this.isType,
    this.date,
    this.file,
    this.link,
    this.fileType,
    required this.createdAt,
    required this.updatedAt,
    this.licenseName,
    this.licenseKey,
    required this.itemType,
    required this.thumbnail,
    this.affiliateLink,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      subcategoryId: json['subcategory_id'],
      childcategoryId: json['childcategory_id'],
      taxId: json['tax_id'] ?? 0,
      brandId: json['brand_id'],
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      sku: json['sku'] ?? '',
      tags: json['tags'] ?? '',
      video: json['video'] ?? '',
      sortDetails: json['sort_details'] ?? '',
      specificationName: json['specification_name'] ?? '',
      specificationDescription: json['specification_description'] ?? '',
      isSpecification: json['is_specification'] ?? 0,
      details: json['details'] ?? '',
      photo: json['photo'] ?? '',
      discountPrice: (json['discount_price'] is int)
          ? (json['discount_price'] as int).toDouble()
          : (json['discount_price'] ?? 0.0).toDouble(),
      previousPrice: (json['previous_price'] is int)
          ? (json['previous_price'] as int).toDouble()
          : (json['previous_price'] ?? 0.0).toDouble(),
      stock: json['stock'] ?? 0,
      metaKeywords: json['meta_keywords'] ?? '',
      metaDescription: json['meta_description'],
      status: json['status'] ?? 0,
      isType: json['is_type'] ?? '',
      date: json['date'],
      file: json['file'],
      link: json['link'],
      fileType: json['file_type'],
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      licenseName: json['license_name'],
      licenseKey: json['license_key'],
      itemType: json['item_type'] ?? '',
      thumbnail: json['thumbnail'] ?? '',
      affiliateLink: json['affiliate_link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'category_id': categoryId,
      'subcategory_id': subcategoryId,
      'childcategory_id': childcategoryId,
      'tax_id': taxId,
      'brand_id': brandId,
      'name': name,
      'slug': slug,
      'sku': sku,
      'tags': tags,
      'video': video,
      'sort_details': sortDetails,
      'specification_name': specificationName,
      'specification_description': specificationDescription,
      'is_specification': isSpecification,
      'details': details,
      'photo': photo,
      'discount_price': discountPrice,
      'previous_price': previousPrice,
      'stock': stock,
      'meta_keywords': metaKeywords,
      'meta_description': metaDescription,
      'status': status,
      'is_type': isType,
      'date': date,
      'file': file,
      'link': link,
      'file_type': fileType,
      'created_at': createdAt,
      'updated_at': updatedAt,
      'license_name': licenseName,
      'license_key': licenseKey,
      'item_type': itemType,
      'thumbnail': thumbnail,
      'affiliate_link': affiliateLink,
    };
  }

  // Helper methods
  bool get hasDiscount => previousPrice != null && previousPrice! > discountPrice && previousPrice! > 0;

  double get discountPercentage {
    if (previousPrice == null || previousPrice! <= 0) return 0.0;
    return ((previousPrice! - discountPrice) / previousPrice! * 100).roundToDouble();
  }

  List<String> get tagList {
    if (tags.isEmpty) return [];
    return tags.split(',').map((tag) => tag.trim()).toList();
  }

  List<String> get specificationNames {
    try {
      if (specificationName.isEmpty) return [];
      final List<dynamic> parsed = json.decode(specificationName);
      return parsed.map((e) => e.toString()).toList();
    } catch (e) {
      return [];
    }
  }

  List<String> get specificationDescriptions {
    try {
      if (specificationDescription.isEmpty) return [];
      final List<dynamic> parsed = json.decode(specificationDescription);
      return parsed.map((e) => e.toString()).toList();
    } catch (e) {
      return [];
    }
  }

  // Check product type
  bool get isBest => isType == 'best';
  bool get isNew => isType == 'new';
  bool get isFeature => isType == 'feature';
  bool get isTop => isType == 'top';
  bool get isFlashDeal => isType == 'flash_deal';

  // Check item type
  bool get isNormalItem => itemType == 'normal';
  bool get isDigitalItem => itemType == 'digital';
  bool get isLicenseItem => itemType == 'license';

  // Format price
  String get formattedDiscountPrice => '\$${discountPrice.toStringAsFixed(2)}';
  String get formattedPreviousPrice => previousPrice != null && previousPrice! > 0
      ? '\$${previousPrice!.toStringAsFixed(2)}'
      : '';

  // Check stock status
  bool get inStock => stock > 0;
  bool get outOfStock => stock <= 0;

  // Check if product has specifications
  bool get hasSpecifications => isSpecification == 1 && specificationNames.isNotEmpty;

  // Check if product has gallery images
  bool get hasGallery => true;
}

class GalleryImage {
  final int id;
  final int itemId;
  final String photo;
  final String? createdAt;
  final String? updatedAt;

  GalleryImage({
    required this.id,
    required this.itemId,
    required this.photo,
    this.createdAt,
    this.updatedAt,
  });

  factory GalleryImage.fromJson(Map<String, dynamic> json) {
    return GalleryImage(
      id: json['id'] ?? 0,
      itemId: json['item_id'] ?? 0,
      photo: json['photo'] ?? '',
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'item_id': itemId,
      'photo': photo,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }
}

class Review {
  final int id;
  final int userId;
  final int itemId;
  final String review;
  final String subject;
  final int rating;
  final int status;
  final String createdAt;
  final String updatedAt;

  Review({
    required this.id,
    required this.userId,
    required this.itemId,
    required this.review,
    required this.subject,
    required this.rating,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      itemId: json['item_id'] ?? 0,
      review: json['review'] ?? '',
      subject: json['subject'] ?? '',
      rating: json['rating'] ?? 0,
      status: json['status'] ?? 0,
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'item_id': itemId,
      'review': review,
      'subject': subject,
      'rating': rating,
      'status': status,
      'created_at': createdAt,
      'updated_at': updatedAt,
    };
  }

  // Helper methods
  bool get isActive => status == 1;

  String get formattedDate {
    try {
      final date = DateTime.parse(createdAt);
      return '${date.day}/${date.month}/${date.year}';
    } catch (e) {
      return createdAt;
    }
  }
}