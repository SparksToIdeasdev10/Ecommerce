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
import 'dart:convert';

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
      data: (json['data'] as List<dynamic>)
          .map((itemJson) => CartItem.fromJson(itemJson))
          .toList(),
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
  final String size;
  final String color;
  final int id;
  final String name;
  final String photo;

  CartItem({
    required this.cartId,
    required this.qty,
    required this.size,
    required this.color,
    required this.id,
    required this.name,
    required this.photo,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      cartId: json['cart_id'] ?? 0,
      qty: json['qty'] ?? 0,
      size: json['size'] ?? '',
      color: json['color'] ?? '',
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'cart_id': cartId,
      'qty': qty,
      'size': size,
      'color': color,
      'id': id,
      'name': name,
      'photo': photo,
    };
  }

  // Helper methods
  String get formattedName {
    if (name.length > 30) {
      return '${name.substring(0, 30)}...';
    }
    return name;
  }

  bool get hasImage => photo.isNotEmpty;

  // For displaying in UI
  String get displayInfo {
    List<String> info = [];
    if (size.isNotEmpty) info.add('Size: $size');
    if (color.isNotEmpty) info.add('Color: $color');
    return info.join(' • ');
  }

}
// Extended version with price (if your API provides it elsewhere)
class CartItemWithPrice extends CartItem {
  final double price;
  final double? discountPrice;

  CartItemWithPrice({
    required int cartId,
    required int qty,
    required String size,
    required String color,
    required int id,
    required String name,
    required String photo,
    required this.price,
    this.discountPrice,
  }) : super(
    cartId: cartId,
    qty: qty,
    size: size,
    color: color,
    id: id,
    name: name,
    photo: photo,
  );

  factory CartItemWithPrice.fromJson(Map<String, dynamic> json) {
    return CartItemWithPrice(
      cartId: json['cart_id'] ?? 0,
      qty: json['qty'] ?? 0,
      size: json['size'] ?? '',
      color: json['color'] ?? '',
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      photo: json['photo'] ?? '',
      price: (json['price'] is int)
          ? (json['price'] as int).toDouble()
          : (json['price'] ?? 0.0).toDouble(),
      discountPrice: (json['discount_price'] is int)
          ? (json['discount_price'] as int).toDouble()
          : (json['discount_price'] ?? 0.0).toDouble(),
    );
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = super.toJson();
    data['price'] = price;
    if (discountPrice != null) {
      data['discount_price'] = discountPrice;
    }
    return data;
  }

  // Price helpers
  double get effectivePrice => discountPrice ?? price;
  double get totalPrice => effectivePrice * qty;
  bool get hasDiscount => discountPrice != null && discountPrice! < price;
  double get discountPercentage {
    if (!hasDiscount) return 0.0;
    return ((price - discountPrice!) / price * 100).roundToDouble();
  }

  String get formattedPrice => '\$${effectivePrice.toStringAsFixed(2)}';
  String get formattedTotalPrice => '\$${totalPrice.toStringAsFixed(2)}';
  String get formattedOriginalPrice => '\$${price.toStringAsFixed(2)}';
}

//Add to Cart Model


// add_to_cart_response_model.dart
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