// search_model.dart
import 'dart:convert';

class SearchResponse {
  final bool status;
  final String message;
  final int count;
  final List<SearchProduct> data;

  SearchResponse({
    required this.status,
    required this.message,
    required this.count,
    required this.data,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      count: json['count'] ?? 0,
      data: (json['data'] as List? ?? [])
          .map((item) => SearchProduct.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'count': count,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class SearchProduct {
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
  final String date;
  final String file;
  final String link;
  final String? fileType;
  final String createdAt;
  final String updatedAt;
  final String? licenseName;
  final String? licenseKey;
  final String itemType;
  final String thumbnail;
  final String? affiliateLink;

  SearchProduct({
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
    required this.date,
    required this.file,
    required this.link,
    this.fileType,
    required this.createdAt,
    required this.updatedAt,
    this.licenseName,
    this.licenseKey,
    required this.itemType,
    required this.thumbnail,
    this.affiliateLink,
  });

  factory SearchProduct.fromJson(Map<String, dynamic> json) {
    return SearchProduct(
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
      date: json['date'] ?? '',
      file: json['file'] ?? '',
      link: json['link'] ?? '',
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
  List<String> get specificationNames {
    try {
      if (specificationName.isNotEmpty) {
        final List<dynamic> parsed = json.decode(specificationName);
        return parsed.map((e) => e.toString()).toList();
      }
    } catch (e) {
      print('Error parsing specification names: $e');
    }
    return [];
  }

  List<String> get specificationDescriptions {
    try {
      if (specificationDescription.isNotEmpty) {
        final List<dynamic> parsed = json.decode(specificationDescription);
        return parsed.map((e) => e.toString()).toList();
      }
    } catch (e) {
      print('Error parsing specification descriptions: $e');
    }
    return [];
  }

  List<String> get tagList {
    return tags.split(',').map((tag) => tag.trim()).toList();
  }

  bool get hasDiscount => previousPrice != null && previousPrice! > discountPrice;

  double get discountPercentage {
    if (previousPrice == null || previousPrice! <= 0) return 0.0;
    return ((previousPrice! - discountPrice) / previousPrice!) * 100;
  }
}