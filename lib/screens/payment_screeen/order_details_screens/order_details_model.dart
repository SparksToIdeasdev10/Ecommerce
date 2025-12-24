// // // order_details_model.dart
// //
// // class OrderDetailsResponse {
// //   final bool status;
// //   final List<OrderData> data;
// //
// //   OrderDetailsResponse({required this.status, required this.data});
// //
// //   factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
// //     return OrderDetailsResponse(
// //       status: json['status'] ?? false,
// //       data: (json['data'] as List<dynamic>?)
// //           ?.map((item) => OrderData.fromJson(item))
// //           .toList() ??
// //           [],
// //     );
// //   }
// // }
// //
// // class OrderData {
// //   final int id;
// //   final int userId;
// //   final Map<String, dynamic> cart;
// //   final String currencySign;
// //   final String currencyValue;
// //   final String discount;
// //   final Shipping shipping;
// //   final String paymentMethod;
// //   final dynamic txnid;
// //   final double tax;
// //   final dynamic chargeId;
// //   final dynamic transactionNumber;
// //   final String orderStatus;
// //   final ShippingInfo shippingInfo;
// //   final ShippingInfo billingInfo;
// //   final String paymentStatus;
// //   final String createdAt;
// //   final String updatedAt;
// //   final double statePrice;
// //   final State state;
// //
// //   OrderData({
// //     required this.id,
// //     required this.userId,
// //     required this.cart,
// //     required this.currencySign,
// //     required this.currencyValue,
// //     required this.discount,
// //     required this.shipping,
// //     required this.paymentMethod,
// //     required this.txnid,
// //     required this.tax,
// //     required this.chargeId,
// //     required this.transactionNumber,
// //     required this.orderStatus,
// //     required this.shippingInfo,
// //     required this.billingInfo,
// //     required this.paymentStatus,
// //     required this.createdAt,
// //     required this.updatedAt,
// //     required this.statePrice,
// //     required this.state,
// //   });
// //
// //   factory OrderData.fromJson(Map<String, dynamic> json) {
// //     return OrderData(
// //       id: json['id'] ?? 0,
// //       userId: json['user_id'] ?? 0,
// //       cart: Map<String, dynamic>.from(json['cart'] ?? {}),
// //       currencySign: json['currency_sign'] ?? '\$',
// //       currencyValue: json['currency_value'] ?? '1',
// //       discount: json['discount'] ?? '[]',
// //       shipping: Shipping.fromJson(Map<String, dynamic>.from(json['shipping'] ?? {})),
// //       paymentMethod: json['payment_method'] ?? 'cod',
// //       txnid: json['txnid'],
// //       tax: (json['tax'] ?? 0).toDouble(),
// //       chargeId: json['charge_id'],
// //       transactionNumber: json['transaction_number'],
// //       orderStatus: json['order_status'] ?? 'Pending',
// //       shippingInfo: ShippingInfo.fromJson(Map<String, dynamic>.from(json['shipping_info'] ?? {})),
// //       billingInfo: ShippingInfo.fromJson(Map<String, dynamic>.from(json['billing_info'] ?? {})),
// //       paymentStatus: json['payment_status'] ?? 'Unpaid',
// //       createdAt: json['created_at'] ?? '',
// //       updatedAt: json['updated_at'] ?? '',
// //       statePrice: (json['state_price'] ?? 0).toDouble(),
// //       state: State.fromJson(Map<String, dynamic>.from(json['state'] ?? {})),
// //     );
// //   }
// //
// //   // Get cart items as list
// //   List<CartItem> get cartItems {
// //     List<CartItem> items = [];
// //     cart.forEach((key, value) {
// //       if (value is Map<String, dynamic>) {
// //         items.add(CartItem.fromJson(value));
// //       }
// //     });
// //     return items;
// //   }
// //
// //   // Get total price
// //   double get totalPrice {
// //     double total = 0;
// //     cart.forEach((key, value) {
// //       if (value is Map<String, dynamic>) {
// //         double price = (value['price'] ?? 0).toDouble();
// //         int qty = (value['qty'] ?? 1).toInt();
// //         total += price * qty;
// //       }
// //     });
// //     return total + statePrice + tax;
// //   }
// // }
// //
// // class Shipping {
// //   final int id;
// //   final String title;
// //   final double price;
// //   final double minimumPrice;
// //   final int isCondition;
// //   final int status;
// //   final String? createdAt;
// //   final String? updatedAt;
// //
// //   Shipping({
// //     required this.id,
// //     required this.title,
// //     required this.price,
// //     required this.minimumPrice,
// //     required this.isCondition,
// //     required this.status,
// //     this.createdAt,
// //     this.updatedAt,
// //   });
// //
// //   factory Shipping.fromJson(Map<String, dynamic> json) {
// //     return Shipping(
// //       id: json['id'] ?? 0,
// //       title: json['title'] ?? '',
// //       price: (json['price'] ?? 0).toDouble(),
// //       minimumPrice: (json['minimum_price'] ?? 0).toDouble(),
// //       isCondition: json['is_condition'] ?? 0,
// //       status: json['status'] ?? 0,
// //       createdAt: json['created_at'],
// //       updatedAt: json['updated_at'],
// //     );
// //   }
// // }
// //
// // class ShippingInfo {
// //   final String shipFirstName;
// //   final String shipLastName;
// //   final String shipEmail;
// //   final String shipPhone;
// //   final String shipAddress1;
// //   final String shipZip;
// //   final String shipCity;
// //   final String shipCountry;
// //
// //   ShippingInfo({
// //     required this.shipFirstName,
// //     required this.shipLastName,
// //     required this.shipEmail,
// //     required this.shipPhone,
// //     required this.shipAddress1,
// //     required this.shipZip,
// //     required this.shipCity,
// //     required this.shipCountry,
// //   });
// //
// //   factory ShippingInfo.fromJson(Map<String, dynamic> json) {
// //     return ShippingInfo(
// //       shipFirstName: json['ship_first_name'] ?? '',
// //       shipLastName: json['ship_last_name'] ?? '',
// //       shipEmail: json['ship_email'] ?? '',
// //       shipPhone: json['ship_phone'] ?? '',
// //       shipAddress1: json['ship_address1'] ?? '',
// //       shipZip: json['ship_zip'] ?? '',
// //       shipCity: json['ship_city'] ?? '',
// //       shipCountry: json['ship_country'] ?? '',
// //     );
// //   }
// //
// //   // For billing info (same structure)
// //   String get fullName => '$shipFirstName $shipLastName';
// //   String get fullAddress => '$shipAddress1, $shipCity, $shipZip, $shipCountry';
// // }
// //
// // class State {
// //   final int id;
// //   final String name;
// //   final double price;
// //   final int status;
// //   final String type;
// //
// //   State({
// //     required this.id,
// //     required this.name,
// //     required this.price,
// //     required this.status,
// //     required this.type,
// //   });
// //
// //   factory State.fromJson(Map<String, dynamic> json) {
// //     return State(
// //       id: json['id'] ?? 0,
// //       name: json['name'] ?? '',
// //       price: (json['price'] ?? 0).toDouble(),
// //       status: json['status'] ?? 0,
// //       type: json['type'] ?? 'percentage',
// //     );
// //   }
// // }
// //
// // class CartItem {
// //   final List<int> optionsId;
// //   final Attribute attribute;
// //   final double attributePrice;
// //   final String name;
// //   final String slug;
// //   final int qty;
// //   final double price;
// //   final double mainPrice;
// //   final String photo;
// //   final String itemType;
// //   final dynamic itemLN;
// //   final dynamic itemLK;
// //
// //   CartItem({
// //     required this.optionsId,
// //     required this.attribute,
// //     required this.attributePrice,
// //     required this.name,
// //     required this.slug,
// //     required this.qty,
// //     required this.price,
// //     required this.mainPrice,
// //     required this.photo,
// //     required this.itemType,
// //     this.itemLN,
// //     this.itemLK,
// //   });
// //
// //   factory CartItem.fromJson(Map<String, dynamic> json) {
// //     return CartItem(
// //       optionsId: List<int>.from(json['options_id'] ?? []),
// //       attribute: Attribute.fromJson(Map<String, dynamic>.from(json['attribute'] ?? {})),
// //       attributePrice: (json['attribute_price'] ?? 0).toDouble(),
// //       name: json['name'] ?? '',
// //       slug: json['slug'] ?? '',
// //       qty: (json['qty'] ?? 1).toInt(),
// //       price: (json['price'] ?? 0).toDouble(),
// //       mainPrice: (json['main_price'] ?? 0).toDouble(),
// //       photo: json['photo'] ?? '',
// //       itemType: json['item_type'] ?? 'normal',
// //       itemLN: json['item_l_n'],
// //       itemLK: json['item_l_k'],
// //     );
// //   }
// //
// //   // Get item total
// //   double get itemTotal => price * qty;
// //
// //   // Get attribute string
// //   String get attributesString {
// //     if (attribute.names.isNotEmpty && attribute.optionName.isNotEmpty) {
// //       List<String> attrs = [];
// //       for (int i = 0; i < attribute.names.length; i++) {
// //         if (i < attribute.optionName.length) {
// //           attrs.add('${attribute.names[i]}: ${attribute.optionName[i]}');
// //         }
// //       }
// //       return attrs.join(', ');
// //     }
// //     return '';
// //   }
// // }
// //
// // class Attribute {
// //   final List<String> names;
// //   final List<String> optionName;
// //   final List<double> optionPrice;
// //
// //   Attribute({
// //     required this.names,
// //     required this.optionName,
// //     required this.optionPrice,
// //   });
// //
// //   factory Attribute.fromJson(Map<String, dynamic> json) {
// //     return Attribute(
// //       names: List<String>.from(json['names'] ?? []),
// //       optionName: List<String>.from(json['option_name'] ?? []),
// //       optionPrice: List<double>.from((json['option_price'] ?? []).map((e) => e.toDouble())),
// //     );
// //   }
// // }
// //
// // class OrderListResponse {
// //   bool? status;
// //   List<OrderData>? data;
// //
// //   OrderListResponse({this.status, this.data});
// //
// //   factory OrderListResponse.fromJson(Map<String, dynamic> json) {
// //     return OrderListResponse(
// //       status: json['status'],
// //       data: json['data'] != null
// //           ? (json['data'] as List).map((item) => OrderData.fromJson(item)).toList()
// //           : null,
// //     );
// //   }
// // }
// //
// // // Keep all your existing OrderData, CartItem, etc. classes as they are
// // // They already work with single order, they'll work with list too
//
// class OrderListResponse {
//   final bool status;
//   final List<OrderData> data;
//
//   OrderListResponse({required this.status, required this.data});
//
//   factory OrderListResponse.fromJson(Map<String, dynamic> json) {
//     return OrderListResponse(
//       status: json['status'] ?? false,
//       data: (json['data'] as List<dynamic>?)
//           ?.map((item) => OrderData.fromJson(item as Map<String, dynamic>))
//           .toList() ?? [],
//     );
//   }
// }
//
// class OrderData {
//   final int id;
//   final int userId;
//   final Map<String, dynamic> cart;
//   final String currencySign;
//   final String currencyValue;
//   final String discount;
//   final Shipping shipping;
//   final String paymentMethod;
//   final dynamic txnid;
//   final double tax;
//   final dynamic chargeId;
//   final dynamic transactionNumber;
//   final String orderStatus;
//   final ShippingInfo shippingInfo;
//   final ShippingInfo billingInfo;
//   final String paymentStatus;
//   final String createdAt;
//   final String updatedAt;
//   final double statePrice;
//   final State state;
//
//   OrderData({
//     required this.id,
//     required this.userId,
//     required this.cart,
//     required this.currencySign,
//     required this.currencyValue,
//     required this.discount,
//     required this.shipping,
//     required this.paymentMethod,
//     required this.txnid,
//     required this.tax,
//     required this.chargeId,
//     required this.transactionNumber,
//     required this.orderStatus,
//     required this.shippingInfo,
//     required this.billingInfo,
//     required this.paymentStatus,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.statePrice,
//     required this.state,
//   });
//
//   factory OrderData.fromJson(Map<String, dynamic> json) {
//     return OrderData(
//       id: json['id']?.toInt() ?? 0,
//       userId: json['user_id']?.toInt() ?? 0,
//       cart: Map<String, dynamic>.from(json['cart'] ?? {}),
//       currencySign: json['currency_sign'] ?? '\$',
//       currencyValue: json['currency_value']?.toString() ?? '1',
//       discount: json['discount']?.toString() ?? '[]',
//       shipping: Shipping.fromJson(Map<String, dynamic>.from(json['shipping'] ?? {})),
//       paymentMethod: json['payment_method'] ?? 'cod',
//       txnid: json['txnid'],
//       tax: (json['tax'] is String ? double.tryParse(json['tax']) : json['tax'] ?? 0).toDouble(),
//       chargeId: json['charge_id'],
//       transactionNumber: json['transaction_number'],
//       orderStatus: json['order_status'] ?? 'Pending',
//       shippingInfo: ShippingInfo.fromJson(Map<String, dynamic>.from(json['shipping_info'] ?? {})),
//       billingInfo: ShippingInfo.fromJson(Map<String, dynamic>.from(json['billing_info'] ?? {})),
//       paymentStatus: json['payment_status'] ?? 'Unpaid',
//       createdAt: json['created_at']?.toString() ?? '',
//       updatedAt: json['updated_at']?.toString() ?? '',
//       statePrice: (json['state_price'] is String ? double.tryParse(json['state_price']) : json['state_price'] ?? 0).toDouble(),
//       state: State.fromJson(Map<String, dynamic>.from(json['state'] ?? {})),
//     );
//   }
//
//   // Get cart items as list
//   List<CartItem> get cartItems {
//     List<CartItem> items = [];
//     cart.forEach((key, value) {
//       if (value is Map<String, dynamic>) {
//         try {
//           items.add(CartItem.fromJson(value));
//         } catch (e) {
//           print('Error parsing cart item: $e');
//         }
//       }
//     });
//     return items;
//   }
//
//   // Get total price
//   double get totalPrice {
//     double total = 0;
//     cart.forEach((key, value) {
//       if (value is Map<String, dynamic>) {
//         double price = (value['price'] ?? 0).toDouble();
//         int qty = (value['qty'] ?? 1).toInt();
//         total += price * qty;
//       }
//     });
//     return total + statePrice + tax;
//   }
//
//   // Get first cart item (for display)
//   CartItem? get firstCartItem {
//     if (cartItems.isNotEmpty) {
//       return cartItems.first;
//     }
//     return null;
//   }
//
//   // Get product name for display
//   String get displayProductName {
//     if (firstCartItem != null) {
//       return firstCartItem!.name;
//     }
//     return 'Product';
//   }
//
//   // Get product image for display
//   String get displayProductImage {
//     if (firstCartItem != null) {
//       return firstCartItem!.photo;
//     }
//     return '';
//   }
// }
//
// class Shipping {
//   final int id;
//   final String title;
//   final double price;
//   final double minimumPrice;
//   final int isCondition;
//   final int status;
//
//   Shipping({
//     required this.id,
//     required this.title,
//     required this.price,
//     required this.minimumPrice,
//     required this.isCondition,
//     required this.status,
//   });
//
//   factory Shipping.fromJson(Map<String, dynamic> json) {
//     return Shipping(
//       id: json['id']?.toInt() ?? 0,
//       title: json['title'] ?? '',
//       price: (json['price'] ?? 0).toDouble(),
//       minimumPrice: (json['minimum_price'] ?? 0).toDouble(),
//       isCondition: json['is_condition']?.toInt() ?? 0,
//       status: json['status']?.toInt() ?? 0,
//     );
//   }
// }
//
// class ShippingInfo {
//   final String shipFirstName;
//   final String shipLastName;
//   final String shipEmail;
//   final String shipPhone;
//   final String shipAddress1;
//   final String shipZip;
//   final String shipCity;
//   final String shipCountry;
//
//   ShippingInfo({
//     required this.shipFirstName,
//     required this.shipLastName,
//     required this.shipEmail,
//     required this.shipPhone,
//     required this.shipAddress1,
//     required this.shipZip,
//     required this.shipCity,
//     required this.shipCountry,
//   });
//
//   factory ShippingInfo.fromJson(Map<String, dynamic> json) {
//     return ShippingInfo(
//       shipFirstName: json['ship_first_name'] ?? '',
//       shipLastName: json['ship_last_name'] ?? '',
//       shipEmail: json['ship_email'] ?? '',
//       shipPhone: json['ship_phone']?.toString() ?? '',
//       shipAddress1: json['ship_address1'] ?? '',
//       shipZip: json['ship_zip']?.toString() ?? '',
//       shipCity: json['ship_city'] ?? '',
//       shipCountry: json['ship_country'] ?? '',
//     );
//   }
//
//   String get fullName => '$shipFirstName $shipLastName';
//   String get fullAddress => '$shipAddress1, $shipCity, $shipZip, $shipCountry';
// }
//
// class State {
//   final int id;
//   final String name;
//   final double price;
//   final int status;
//   final String type;
//
//   State({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.status,
//     required this.type,
//   });
//
//   factory State.fromJson(Map<String, dynamic> json) {
//     return State(
//       id: json['id']?.toInt() ?? 0,
//       name: json['name'] ?? '',
//       price: (json['price'] ?? 0).toDouble(),
//       status: json['status']?.toInt() ?? 0,
//       type: json['type'] ?? 'percentage',
//     );
//   }
// }
//
// class CartItem {
//   final List<dynamic> optionsId;
//   final Attribute attribute;
//   final double attributePrice;
//   final String name;
//   final String slug;
//   final int qty;
//   final double price;
//   final double mainPrice;
//   final String photo;
//   final String itemType;
//   final dynamic itemLN;
//   final dynamic itemLK;
//
//   CartItem({
//     required this.optionsId,
//     required this.attribute,
//     required this.attributePrice,
//     required this.name,
//     required this.slug,
//     required this.qty,
//     required this.price,
//     required this.mainPrice,
//     required this.photo,
//     required this.itemType,
//     this.itemLN,
//     this.itemLK,
//   });
//
//   factory CartItem.fromJson(Map<String, dynamic> json) {
//     return CartItem(
//       optionsId: List<dynamic>.from(json['options_id'] ?? []),
//       attribute: Attribute.fromJson(Map<String, dynamic>.from(json['attribute'] ?? {})),
//       attributePrice: (json['attribute_price'] ?? 0).toDouble(),
//       name: json['name'] ?? '',
//       slug: json['slug'] ?? '',
//       qty: (json['qty'] ?? 1).toInt(),
//       price: (json['price'] ?? 0).toDouble(),
//       mainPrice: (json['main_price'] ?? 0).toDouble(),
//       photo: json['photo'] ?? '',
//       itemType: json['item_type'] ?? 'normal',
//       itemLN: json['item_l_n'],
//       itemLK: json['item_l_k'],
//     );
//   }
//
//   double get itemTotal => price * qty;
//
//   String get attributesString {
//     if (attribute.names.isNotEmpty && attribute.optionName.isNotEmpty) {
//       List<String> attrs = [];
//       for (int i = 0; i < attribute.names.length; i++) {
//         if (i < attribute.optionName.length) {
//           attrs.add('${attribute.names[i]}: ${attribute.optionName[i]}');
//         }
//       }
//       return attrs.join(', ');
//     }
//     return '';
//   }
// }
//
// class Attribute {
//   final List<String> names;
//   final List<String> optionName;
//   final List<double> optionPrice;
//
//   Attribute({
//     required this.names,
//     required this.optionName,
//     required this.optionPrice,
//   });
//
//   factory Attribute.fromJson(Map<String, dynamic> json) {
//     return Attribute(
//       names: List<String>.from(json['names'] ?? []),
//       optionName: List<String>.from(json['option_name'] ?? []),
//       optionPrice: List<double>.from((json['option_price'] ?? []).map((e) => e.toDouble())),
//     );
//   }
// }
// Use a prefix or alias to avoid conflict with Flutter's State class
import 'package:flutter/material.dart' as flutter;

class OrderDetailsResponse {
  final bool status;
  final List<OrderData> data;

  OrderDetailsResponse({required this.status, required this.data});

  factory OrderDetailsResponse.fromJson(Map<String, dynamic> json) {
    return OrderDetailsResponse(
      status: json['status'] ?? false,
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => OrderData.fromJson(item))
          .toList() ??
          [],
    );
  }
}

class OrderData {
  final int id;
  final int userId;
  final Map<String, dynamic> cart;
  final String currencySign;
  final String currencyValue;
  final String discount;
  final Shipping shipping;
  final String paymentMethod;
  final dynamic txnid;
  final double tax;
  final dynamic chargeId;
  final dynamic transactionNumber;
  final String orderStatus;
  final ShippingInfo shippingInfo;
  final ShippingInfo billingInfo;
  final String paymentStatus;
  final String createdAt;
  final String updatedAt;
  final double statePrice;
  final StateModel state; // Renamed from 'State' to 'StateModel'

  OrderData({
    required this.id,
    required this.userId,
    required this.cart,
    required this.currencySign,
    required this.currencyValue,
    required this.discount,
    required this.shipping,
    required this.paymentMethod,
    required this.txnid,
    required this.tax,
    required this.chargeId,
    required this.transactionNumber,
    required this.orderStatus,
    required this.shippingInfo,
    required this.billingInfo,
    required this.paymentStatus,
    required this.createdAt,
    required this.updatedAt,
    required this.statePrice,
    required this.state,
  });

  factory OrderData.fromJson(Map<String, dynamic> json) {
    return OrderData(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      cart: Map<String, dynamic>.from(json['cart'] ?? {}),
      currencySign: json['currency_sign'] ?? '\$',
      currencyValue: json['currency_value'] ?? '1',
      discount: json['discount'] ?? '[]',
      shipping: Shipping.fromJson(Map<String, dynamic>.from(json['shipping'] ?? {})),
      paymentMethod: json['payment_method'] ?? 'cod',
      txnid: json['txnid'],
      tax: (json['tax'] ?? 0).toDouble(),
      chargeId: json['charge_id'],
      transactionNumber: json['transaction_number'],
      orderStatus: json['order_status'] ?? 'Pending',
      shippingInfo: ShippingInfo.fromJson(Map<String, dynamic>.from(json['shipping_info'] ?? {})),
      billingInfo: ShippingInfo.fromJson(Map<String, dynamic>.from(json['billing_info'] ?? {})),
      paymentStatus: json['payment_status'] ?? 'Unpaid',
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      statePrice: (json['state_price'] ?? 0).toDouble(),
      state: StateModel.fromJson(Map<String, dynamic>.from(json['state'] ?? {})),
    );
  }

  // Get cart items as list
  List<CartItem> get cartItems {
    List<CartItem> items = [];
    cart.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        items.add(CartItem.fromJson(value));
      }
    });
    return items;
  }

  // Get total price
  double get totalPrice {
    double total = 0;
    cart.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        double price = (value['price'] ?? 0).toDouble();
        int qty = (value['qty'] ?? 1).toInt();
        total += price * qty;
      }
    });
    return total + statePrice + tax;
  }

  // Get first cart item
  CartItem? get firstCartItem {
    if (cartItems.isNotEmpty) {
      return cartItems.first;
    }
    return null;
  }

  // Get product name for display
  String get displayProductName {
    if (firstCartItem != null) {
      return firstCartItem!.name;
    }
    return 'Product';
  }

  // Get product image for display
  String get displayProductImage {
    if (firstCartItem != null) {
      return firstCartItem!.photo;
    }
    return '';
  }
}

class Shipping {
  final int id;
  final String title;
  final double price;
  final double minimumPrice;
  final int isCondition;
  final int status;
  final String? createdAt;
  final String? updatedAt;

  Shipping({
    required this.id,
    required this.title,
    required this.price,
    required this.minimumPrice,
    required this.isCondition,
    required this.status,
    this.createdAt,
    this.updatedAt,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) {
    return Shipping(
      id: json['id'] ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      minimumPrice: (json['minimum_price'] ?? 0).toDouble(),
      isCondition: json['is_condition'] ?? 0,
      status: json['status'] ?? 0,
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }
}

class ShippingInfo {
  final String shipFirstName;
  final String shipLastName;
  final String shipEmail;
  final String shipPhone;
  final String shipAddress1;
  final String shipZip;
  final String shipCity;
  final String shipCountry;

  ShippingInfo({
    required this.shipFirstName,
    required this.shipLastName,
    required this.shipEmail,
    required this.shipPhone,
    required this.shipAddress1,
    required this.shipZip,
    required this.shipCity,
    required this.shipCountry,
  });

  factory ShippingInfo.fromJson(Map<String, dynamic> json) {
    return ShippingInfo(
      shipFirstName: json['ship_first_name'] ?? '',
      shipLastName: json['ship_last_name'] ?? '',
      shipEmail: json['ship_email'] ?? '',
      shipPhone: json['ship_phone'] ?? '',
      shipAddress1: json['ship_address1'] ?? '',
      shipZip: json['ship_zip'] ?? '',
      shipCity: json['ship_city'] ?? '',
      shipCountry: json['ship_country'] ?? '',
    );
  }

  String get fullName => '$shipFirstName $shipLastName';
  String get fullAddress => '$shipAddress1, $shipCity, $shipZip, $shipCountry';
}

// Renamed from 'State' to 'StateModel' to avoid conflict
class StateModel {
  final int id;
  final String name;
  final double price;
  final int status;
  final String type;

  StateModel({
    required this.id,
    required this.name,
    required this.price,
    required this.status,
    required this.type,
  });

  factory StateModel.fromJson(Map<String, dynamic> json) {
    return StateModel(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      status: json['status'] ?? 0,
      type: json['type'] ?? 'percentage',
    );
  }
}

class CartItem {
  final List<int> optionsId;
  final Attribute attribute;
  final double attributePrice;
  final String name;
  final String slug;
  final int qty;
  final double price;
  final double mainPrice;
  final String photo;
  final String itemType;
  final dynamic itemLN;
  final dynamic itemLK;

  CartItem({
    required this.optionsId,
    required this.attribute,
    required this.attributePrice,
    required this.name,
    required this.slug,
    required this.qty,
    required this.price,
    required this.mainPrice,
    required this.photo,
    required this.itemType,
    this.itemLN,
    this.itemLK,
  });

  factory CartItem.fromJson(Map<String, dynamic> json) {
    return CartItem(
      optionsId: List<int>.from(json['options_id'] ?? []),
      attribute: Attribute.fromJson(Map<String, dynamic>.from(json['attribute'] ?? {})),
      attributePrice: (json['attribute_price'] ?? 0).toDouble(),
      name: json['name'] ?? '',
      slug: json['slug'] ?? '',
      qty: (json['qty'] ?? 1).toInt(),
      price: (json['price'] ?? 0).toDouble(),
      mainPrice: (json['main_price'] ?? 0).toDouble(),
      photo: json['photo'] ?? '',
      itemType: json['item_type'] ?? 'normal',
      itemLN: json['item_l_n'],
      itemLK: json['item_l_k'],
    );
  }

  double get itemTotal => price * qty;

  String get attributesString {
    if (attribute.names.isNotEmpty && attribute.optionName.isNotEmpty) {
      List<String> attrs = [];
      for (int i = 0; i < attribute.names.length; i++) {
        if (i < attribute.optionName.length) {
          attrs.add('${attribute.names[i]}: ${attribute.optionName[i]}');
        }
      }
      return attrs.join(', ');
    }
    return '';
  }
}

class Attribute {
  final List<String> names;
  final List<String> optionName;
  final List<double> optionPrice;

  Attribute({
    required this.names,
    required this.optionName,
    required this.optionPrice,
  });

  factory Attribute.fromJson(Map<String, dynamic> json) {
    return Attribute(
      names: List<String>.from(json['names'] ?? []),
      optionName: List<String>.from(json['option_name'] ?? []),
      optionPrice: List<double>.from((json['option_price'] ?? []).map((e) => e.toDouble())),
    );
  }
}