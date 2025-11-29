// Main Category model that represents the API response
import 'dart:convert';

class Category {
  final bool status;
  final String message;
  final List<CategoryItem> data; // Changed to CategoryItem for individual items

  Category({
    required this.status,
    required this.message,
    required this.data,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List? ?? [];
    return Category(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: dataList.map((item) => CategoryItem.fromJson(item)).toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

// Individual category item model
class CategoryItem {
  final int id;
  final String name;
  final String slug;
  final String photo;
  final dynamic metaKeywords;
  final dynamic metaDescriptions;
  final int status;
  final int isFeature;
  final int serial;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  CategoryItem({
    required this.id,
    required this.name,
    required this.slug,
    required this.photo,
    required this.metaKeywords,
    required this.metaDescriptions,
    required this.status,
    required this.isFeature,
    required this.serial,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryItem.fromJson(Map<String, dynamic> json) {
    return CategoryItem(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      photo: json['photo'] ?? '',
      metaKeywords: json['meta_keywords'],
      metaDescriptions: json['meta_descriptions'],
      status: json['status'] ?? 0,
      isFeature: json['is_feature'] ?? 0,
      serial: json['serial'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'photo': photo,
      'meta_keywords': metaKeywords,
      'meta_descriptions': metaDescriptions,
      'status': status,
      'is_feature': isFeature,
      'serial': serial,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
    };
  }



  bool get isFeatured => isFeature == 1;
  bool get isActive => status == 1;
}

//category id model


class CategoryDetailResponse {
  final bool status;
  final String message;
  final CategoryDetailData data;

  CategoryDetailResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoryDetailResponse.fromJson(Map<String, dynamic> json) {
    return CategoryDetailResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: CategoryDetailData.fromJson(json['data'] ?? {}),
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

class CategoryDetailData {
  final CategoryItem category; // Use existing CategoryItem
  final List<Subcategory> subcategories;
  final List<dynamic> childcategories;
  final List<Product> products;

  CategoryDetailData({
    required this.category,
    required this.subcategories,
    required this.childcategories,
    required this.products,
  });

  factory CategoryDetailData.fromJson(Map<String, dynamic> json) {
    return CategoryDetailData(
      category: CategoryItem.fromJson(json['category'] ?? {}),
      subcategories: (json['subcategories'] as List? ?? [])
          .map((item) => Subcategory.fromJson(item))
          .toList(),
      childcategories: json['childcategories'] as List? ?? [],
      products: (json['products'] as List? ?? [])
          .map((item) => Product.fromJson(item))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'category': category.toJson(),
      'subcategories': subcategories.map((item) => item.toJson()).toList(),
      'childcategories': childcategories,
      'products': products.map((item) => item.toJson()).toList(),
    };
  }
}

class Subcategory {
  final int id;
  final String name;
  final String slug;
  final int categoryId;
  final int status;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? photo;

  Subcategory({
    required this.id,
    required this.name,
    required this.slug,
    required this.categoryId,
    required this.status,
    this.createdAt,
    this.updatedAt,
    this.photo,
  });

  factory Subcategory.fromJson(Map<String, dynamic> json) {
    return Subcategory(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      categoryId: json['category_id'] ?? 0,
      status: json['status'] ?? 0,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
      photo: json['photo'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'category_id': categoryId,
      'status': status,
      'created_at': createdAt?.toIso8601String(),
      'updated_at': updatedAt?.toIso8601String(),
      'photo': photo,
    };
  }

  bool get isActive => status == 1;
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
  final String? sku;
  final String tags;
  final String video;
  final String sortDetails;
  final List<String> specificationName;
  final List<String> specificationDescription;
  final int isSpecification;
  final String details;
  final String photo;
  final double discountPrice;
  final double? previousPrice;
  final int stock;
  final String metaKeywords;
  final dynamic metaDescription;
  final int status;
  final String isType;
  final String date;
  final String? file;
  final String? link;
  final String? fileType;
  final DateTime createdAt;
  final DateTime updatedAt;
  final dynamic licenseName;
  final dynamic licenseKey;
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
    this.sku,
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
    // Parse specification_name from JSON string to List
    List<String> specNames = [];
    if (json['specification_name'] is String) {
      try {
        final parsed = jsonDecode(json['specification_name']);
        if (parsed is List) {
          specNames = List<String>.from(parsed);
        }
      } catch (e) {
        specNames = [];
      }
    } else if (json['specification_name'] is List) {
      specNames = List<String>.from(json['specification_name']);
    }

    // Parse specification_description from JSON string to List
    List<String> specDescriptions = [];
    if (json['specification_description'] is String) {
      try {
        final parsed = jsonDecode(json['specification_description']);
        if (parsed is List) {
          specDescriptions = List<String>.from(parsed);
        }
      } catch (e) {
        specDescriptions = [];
      }
    } else if (json['specification_description'] is List) {
      specDescriptions = List<String>.from(json['specification_description']);
    }

    return Product(
      id: json['id'] ?? 0,
      categoryId: json['category_id'] ?? 0,
      subcategoryId: json['subcategory_id'],
      childcategoryId: json['childcategory_id'],
      taxId: json['tax_id'] ?? 0,
      brandId: json['brand_id'],
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      sku: json['sku'],
      tags: json['tags'] ?? '',
      video: json['video'] ?? '',
      sortDetails: json['sort_details'] ?? '',
      specificationName: specNames,
      specificationDescription: specDescriptions,
      isSpecification: json['is_specification'] ?? 0,
      details: json['details'] ?? '',
      photo: json['photo'] ?? '',
      discountPrice: (json['discount_price'] is num)
          ? (json['discount_price'] as num).toDouble()
          : 0.0,
      previousPrice: (json['previous_price'] is num)
          ? (json['previous_price'] as num).toDouble()
          : null,
      stock: json['stock'] ?? 0,
      metaKeywords: json['meta_keywords'] ?? '',
      metaDescription: json['meta_description'],
      status: json['status'] ?? 0,
      isType: json['is_type'] ?? '',
      date: json['date'] ?? '',
      file: json['file'],
      link: json['link'],
      fileType: json['file_type'],
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'])
          : DateTime.now(),
      updatedAt: json['updated_at'] != null
          ? DateTime.parse(json['updated_at'])
          : DateTime.now(),
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
      'specification_name': jsonEncode(specificationName),
      'specification_description': jsonEncode(specificationDescription),
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
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'license_name': licenseName,
      'license_key': licenseKey,
      'item_type': itemType,
      'thumbnail': thumbnail,
      'affiliate_link': affiliateLink,
    };
  }

  bool get hasDiscount => previousPrice != null && previousPrice! > discountPrice;
  bool get isActive => status == 1;
  bool get hasSpecifications => isSpecification == 1;

  double get discountPercentage {
    if (!hasDiscount) return 0.0;
    return ((previousPrice! - discountPrice) / previousPrice!) * 100;
  }
}