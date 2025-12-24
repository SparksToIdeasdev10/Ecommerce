// // models/cart_item_model.dart
// class CartItem {
//   final String id;
//   final String title;
//   final String category;
//   final double price;
//   final String imageUrl;
//   int quantity;
//   final String? selectedSize;
//   final String? selectedColor;
//
//   CartItem({
//     required this.id,
//     required this.title,
//     required this.category,
//     required this.price,
//     required this.imageUrl,
//     this.quantity = 1,
//     this.selectedSize,
//     this.selectedColor,
//   });
//
//   double get totalPrice => price * quantity;
//
//   CartItem copyWith({
//     int? quantity,
//     String? selectedSize,
//     String? selectedColor,
//   }) {
//     return CartItem(
//       id: id,
//       title: title,
//       category: category,
//       price: price,
//       imageUrl: imageUrl,
//       quantity: quantity ?? this.quantity,
//       selectedSize: selectedSize ?? this.selectedSize,
//       selectedColor: selectedColor ?? this.selectedColor,
//     );
//   }
// }



// cart_response_model.dart
// import 'dart:convert';
//
// class CartResponse {
//   final bool status;
//   final int count;
//   final List<CartItem> data;
//
//   CartResponse({
//     required this.status,
//     required this.count,
//     required this.data,
//   });
//
//   factory CartResponse.fromJson(Map<String, dynamic> json) {
//     return CartResponse(
//       status: json['status'] ?? false,
//       count: json['count'] ?? 0,
//       data: (json['data'] as List<dynamic>)
//           .map((itemJson) => CartItem.fromJson(itemJson))
//           .toList(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'count': count,
//       'data': data.map((item) => item.toJson()).toList(),
//     };
//   }
// }
//
// class CartItem {
//   final int cartId;
//   final int qty;
//   final String size;
//   final String color;
//   final int id;
//   final String name;
//   final String photo;
//
//   CartItem({
//     required this.cartId,
//     required this.qty,
//     required this.size,
//     required this.color,
//     required this.id,
//     required this.name,
//     required this.photo,
//   });
//
//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       cartId: json['cart_id'] ?? 0,
//       qty: json['qty'] ?? 0,
//       size: json['size'] ?? '',
//       color: json['color'] ?? '',
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       photo: json['photo'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'cart_id': cartId,
//       'qty': qty,
//       'size': size,
//       'color': color,
//       'id': id,
//       'name': name,
//       'photo': photo,
//     };
//   }
//
//   // Helper methods
//   String get formattedName {
//     if (name.length > 30) {
//       return '${name.substring(0, 30)}...';
//     }
//     return name;
//   }
//
//   bool get hasImage => photo.isNotEmpty;
//
//   // For displaying in UI
//   String get displayInfo {
//     List<String> info = [];
//     if (size.isNotEmpty) info.add('Size: $size');
//     if (color.isNotEmpty) info.add('Color: $color');
//     return info.join(' • ');
//   }
//
// }
// // Extended version with price (if your API provides it elsewhere)
// class CartItemWithPrice extends CartItem {
//   final double price;
//   final double? discountPrice;
//
//   CartItemWithPrice({
//     required int cartId,
//     required int qty,
//     required String size,
//     required String color,
//     required int id,
//     required String name,
//     required String photo,
//     required this.price,
//     this.discountPrice,
//   }) : super(
//     cartId: cartId,
//     qty: qty,
//     size: size,
//     color: color,
//     id: id,
//     name: name,
//     photo: photo,
//   );
//
//   factory CartItemWithPrice.fromJson(Map<String, dynamic> json) {
//     return CartItemWithPrice(
//       cartId: json['cart_id'] ?? 0,
//       qty: json['qty'] ?? 0,
//       size: json['size'] ?? '',
//       color: json['color'] ?? '',
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       photo: json['photo'] ?? '',
//       price: (json['price'] is int)
//           ? (json['price'] as int).toDouble()
//           : (json['price'] ?? 0.0).toDouble(),
//       discountPrice: (json['discount_price'] is int)
//           ? (json['discount_price'] as int).toDouble()
//           : (json['discount_price'] ?? 0.0).toDouble(),
//     );
//   }
//
//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = super.toJson();
//     data['price'] = price;
//     if (discountPrice != null) {
//       data['discount_price'] = discountPrice;
//     }
//     return data;
//   }
//
//   // Price helpers
//   double get effectivePrice => discountPrice ?? price;
//   double get totalPrice => effectivePrice * qty;
//   bool get hasDiscount => discountPrice != null && discountPrice! < price;
//   double get discountPercentage {
//     if (!hasDiscount) return 0.0;
//     return ((price - discountPrice!) / price * 100).roundToDouble();
//   }
//
//   String get formattedPrice => '\$${effectivePrice.toStringAsFixed(2)}';
//   String get formattedTotalPrice => '\$${totalPrice.toStringAsFixed(2)}';
//   String get formattedOriginalPrice => '\$${price.toStringAsFixed(2)}';
// }
//
// //Add to Cart Model
//
//
// // add_to_cart_response_model.dart
// class AddToCartResponse {
//   final bool status;
//   final String message;
//
//   AddToCartResponse({
//     required this.status,
//     required this.message,
//   });
//
//   factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
//     return AddToCartResponse(
//       status: json['status'] ?? false,
//       message: json['message'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//     };
//   }
//
//   bool get isSuccess => status == true;
// }

//main hai aaj ka
// import 'dart:convert';
//
// class CartResponse {
//   final bool status;
//   final int count;
//   final List<CartItem> data;
//
//   CartResponse({
//     required this.status,
//     required this.count,
//     required this.data,
//   });
//
//   factory CartResponse.fromJson(Map<String, dynamic> json) {
//     return CartResponse(
//       status: json['status'] ?? false,
//       count: json['count'] ?? 0,
//       data: (json['data'] as List<dynamic>)
//           .map((itemJson) => CartItem.fromJson(itemJson))
//           .toList(),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'count': count,
//       'data': data.map((item) => item.toJson()).toList(),
//     };
//   }
// }
//
// class CartItem {
//   final int cartId;
//   final int qty;
//   final String size;
//   final String color;
//   final int id;
//   final String name;
//   final String photo;
//   final String discount_price;
//   final String previous_price;
//
//
//   CartItem({
//     required this.cartId,
//     required this.qty,
//     required this.size,
//     required this.color,
//     required this.id,
//     required this.name,
//     required this.photo,
//     required this.discount_price,
//     required this.previous_price,
//   });
//
//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       cartId: json['cart_id'] ?? 0,
//       qty: json['qty'] ?? 0,
//       size: json['size'] ?? '',
//       color: json['color'] ?? '',
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       photo: json['photo'] ?? '',
//       discount_price: json['discount_price'].toString() ?? '', // FIXED: was using 'photo'
//       previous_price: json['previous_price'].toString()?? '', // FIXED: was using 'photo'
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'cart_id': cartId,
//       'qty': qty,
//       'size': size,
//       'color': color,
//       'id': id,
//       'name': name,
//       'photo': photo,
//       'discount_price': discount_price,
//       'previous_price': previous_price,
//     };
//   }
//
//   // Helper methods
//   String get formattedName {
//     if (name.length > 30) {
//       return '${name.substring(0, 30)}...';
//     }
//     return name;
//   }
//
//   bool get hasImage => photo.isNotEmpty;
//
//   // For displaying in UI
//   String get displayInfo {
//     List<String> info = [];
//     if (size.isNotEmpty) info.add('Size: $size');
//     if (color.isNotEmpty) info.add('Color: $color');
//     return info.join(' • ');
//   }
//
//   // Price calculation methods
//   double get discountPriceValue => double.tryParse(discount_price) ?? 0.0;
//   double get previousPriceValue => double.tryParse(previous_price) ?? 0.0;
//
//   bool get hasDiscount => discountPriceValue > 0 && discountPriceValue < previousPriceValue;
//
//   double get effectivePrice => hasDiscount ? discountPriceValue : previousPriceValue;
//
//   double get totalPrice => effectivePrice * qty;
//
//   String get formattedDiscountPrice => '\$$discount_price';
//   String get formattedPreviousPrice => '\$$previous_price';
//   String get formattedTotalPrice => '\$${totalPrice.toStringAsFixed(2)}';
// }
//
// // Extended version with price calculations
// class CartItemWithPrice extends CartItem {
//   final double price;
//   final double? discountPrice;
//
//   CartItemWithPrice({
//     required int cartId,
//     required int qty,
//     required String size,
//     required String color,
//     required int id,
//     required String name,
//     required String photo,
//     required this.price,
//     this.discountPrice,
//     required String discount_price,
//     required String previous_price,
//   }) : super(
//     cartId: cartId,
//     qty: qty,
//     size: size,
//     color: color,
//     id: id,
//     name: name,
//     photo: photo,
//     discount_price: discount_price,
//     previous_price: previous_price,
//   );
//
//   factory CartItemWithPrice.fromJson(Map<String, dynamic> json) {
//     return CartItemWithPrice(
//       cartId: json['cart_id'] ?? 0,
//       qty: json['qty'] ?? 0,
//       size: json['size'] ?? '',
//       color: json['color'] ?? '',
//       id: json['id'] ?? 0,
//       name: json['name'] ?? '',
//       photo: json['photo'] ?? '',
//       discount_price: json['discount_price'] ?? '', // FIXED
//       previous_price: json['previous_price'] ?? '', // FIXED
//       price: (json['price'] is int)
//           ? (json['price'] as int).toDouble()
//           : (json['price'] ?? 0.0).toDouble(),
//       discountPrice: (json['discount_price'] is int)
//           ? (json['discount_price'] as int).toDouble()
//           : (json['discount_price'] is String)
//           ? double.tryParse(json['discount_price']) ?? 0.0
//           : (json['discount_price'] ?? 0.0).toDouble(),
//     );
//   }
//
//   @override
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = super.toJson();
//     data['price'] = price;
//     if (discountPrice != null) {
//       data['discount_price'] = discountPrice;
//     }
//     return data;
//   }
//
//   // Price helpers
//   @override
//   double get effectivePrice => discountPrice ?? price;
//
//   @override
//   double get totalPrice => effectivePrice * qty;
//
//   bool get hasDiscount => discountPrice != null && discountPrice! < price;
//
//   double get discountPercentage {
//     if (!hasDiscount) return 0.0;
//     return ((price - discountPrice!) / price * 100).roundToDouble();
//   }
//
//   String get formattedPrice => '\$${effectivePrice.toStringAsFixed(2)}';
//
//   @override
//   String get formattedTotalPrice => '\$${totalPrice.toStringAsFixed(2)}';
//
//   String get formattedOriginalPrice => '\$${price.toStringAsFixed(2)}';
// }
//
// // Add to Cart Model
// class AddToCartResponse {
//   final bool status;
//   final String message;
//
//   AddToCartResponse({
//     required this.status,
//     required this.message,
//   });
//
//   factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
//     return AddToCartResponse(
//       status: json['status'] ?? false,
//       message: json['message'] ?? '',
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'message': message,
//     };
//   }
//
//   bool get isSuccess => status == true;
// }

//just updated 24-11-25

import 'dart:convert';

// Add this Attribute model to your cart_model.dart
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
}

class CartResponse {
  final bool status;
  final int count;
  final List<CartItem> data;

  CartResponse({
    required this.status,
    required this.count,
    required this.data,
  });

  factory CartResponse.fromJson(Map<String, dynamic> json) {
    return CartResponse(
      status: json['status'] ?? false,
      count: json['count'] ?? 0,
      data: (json['data'] as List<dynamic>?)
          ?.map((itemJson) => CartItem.fromJson(itemJson))
          .toList() ?? [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'count': count,
      'data': data.map((item) => item.toJson()).toList(),
    };
  }
}

class CartItem {
  final int cartId;
  final int qty;
  final int id;
  final String name;
  final String photo;
  final String discount_price;
  final String previous_price;
  final List<Attribute> attributes;


  CartItem({
    required this.cartId,
    required this.qty,
    required this.id,
    required this.name,
    required this.photo,
    required this.discount_price,
    required this.previous_price,
    required this.attributes,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    // Parse attributes from API response

    List<Attribute> attributes = [];
    if (json['attributes'] != null && json['attributes'] is List) {
      attributes = (json['attributes'] as List)
          .map((attrJson) => Attribute.fromJson(attrJson))
          .toList();
    }

    return CartItem(
      cartId: json['cart_id'] ?? 0,
      qty: json['qty'] ?? 0,
      id: json['item_id'] ?? 0, // Use item_id from API
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      discount_price: json['discount_price']?.toString() ?? '0.0',
      previous_price: json['previous_price']?.toString() ?? '0.0',
      attributes: attributes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cart_id': cartId,
      'qty': qty,
      'item_id': id,
      'name': name,
      'photo': photo,
      'discount_price': discount_price,
      'previous_price': previous_price,
      'attributes': attributes.map((attr) => attr.toJson()).toList(),
    };
  }

  // Helper method to get selected size
  String get size {
    try {
      final sizeAttribute = attributes.firstWhere(
            (attr) => attr.keyword == 'size',
      );

      if (sizeAttribute.options.isNotEmpty) {
        return sizeAttribute.options.first.name;
      }
    } catch (e) {
      // No size attribute found
    }
    return '';
  }

  // Helper method to get selected color
  String get color {
    try {
      final colorAttribute = attributes.firstWhere(
            (attr) => attr.keyword == 'color',
      );

      if (colorAttribute.options.isNotEmpty) {
        return colorAttribute.options.first.name;
      }
    } catch (e) {
      // No color attribute found
    }
    return '';
  }

  // Get additional price from attributes
  double get attributeAdditionalPrice {
    double total = 0.0;
    for (var attribute in attributes) {
      if (attribute.options.isNotEmpty) {
        total += attribute.options.first.price;
      }
    }
    return total;
  }

  // Get total price including attribute additions
  double get totalPriceWithAttributes {
    double basePrice = discountPriceValue;
    return (basePrice + attributeAdditionalPrice) * qty;
  }

  // Get price per item with attributes
  double get pricePerItemWithAttributes {
    return discountPriceValue + attributeAdditionalPrice;
  }

  double get discountPriceValue => double.tryParse(discount_price) ?? 0.0;
  double get previousPriceValue => double.tryParse(previous_price) ?? 0.0;
  bool get hasDiscount => discountPriceValue > 0 && discountPriceValue < previousPriceValue;
  double get effectivePrice => hasDiscount ? discountPriceValue : previousPriceValue;
  double get totalPrice => effectivePrice * qty;

  String get formattedDiscountPrice => '\$${discountPriceValue.toStringAsFixed(2)}';
  String get formattedPreviousPrice => '\$${previousPriceValue.toStringAsFixed(2)}';
  String get formattedTotalPrice => '\$${totalPrice.toStringAsFixed(2)}';

  String get formattedPriceWithAttributes => '\$${pricePerItemWithAttributes.toStringAsFixed(2)}';
  String get formattedTotalWithAttributes => '\$${totalPriceWithAttributes.toStringAsFixed(2)}';

  String get formattedName {
    if (name.length > 30) {
      return '${name.substring(0, 30)}...';
    }
    return name;
  }

  bool get hasImage => photo.isNotEmpty;

  String get displayInfo {
    List<String> info = [];
    if (size.isNotEmpty) info.add('Size: $size');
    if (color.isNotEmpty) info.add('Color: $color');
    return info.join(' • ');
  }
}

// Add to Cart Model
class AddToCartResponse {
  final bool status;
  final String message;

  AddToCartResponse({
    required this.status,
    required this.message,
  });

  factory AddToCartResponse.fromJson(Map<String, dynamic> json) {
    return AddToCartResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
    };
  }

  bool get isSuccess => status == true;
}