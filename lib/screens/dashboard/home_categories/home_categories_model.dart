class CategoriesResponse {
  final bool status;
  final String message;
  final List<Category> data;

  CategoriesResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory CategoriesResponse.fromJson(Map<String, dynamic> json) {
    return CategoriesResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null
          ? (json['data'] as List).map((item) => Category.fromJson(item)).toList()
          : [],
    );
  }
}

class Category {
  final int id;
  final String name;
  final String slug;
  final String photo;
  final String? metaKeywords;
  final String? metaDescriptions;
  final int status;
  final int isFeature;
  final int serial;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  Category({
    required this.id,
    required this.name,
    required this.slug,
    required this.photo,
    this.metaKeywords,
    this.metaDescriptions,
    required this.status,
    required this.isFeature,
    required this.serial,
    this.createdAt,
    this.updatedAt,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
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

  // Helper method to convert to map if needed
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
}

