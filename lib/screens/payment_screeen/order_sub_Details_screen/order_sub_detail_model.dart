// // // Model for single order details response
// // class OrderDetailSingleResponse {
// //   final bool status;
// //   final OrderDetailData? data;
// //
// //   OrderDetailSingleResponse({required this.status, this.data});
// //
// //   factory OrderDetailSingleResponse.fromJson(Map<String, dynamic> json) {
// //     return OrderDetailSingleResponse(
// //       status: json['status'] ?? false,
// //       data: json['data'] != null
// //           ? OrderDetailData.fromJson(json['data'])
// //           : null,
// //     );
// //   }
// // }
// //
// // // Model for single order data
// // class OrderDetailData {
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
// //   final StateModel state;
// //
// //   OrderDetailData({
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
// //   factory OrderDetailData.fromJson(Map<String, dynamic> json) {
// //     return OrderDetailData(
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
// //       state: StateModel.fromJson(Map<String, dynamic>.from(json['state'] ?? {})),
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
// //
// //   // Get subtotal (price before tax and shipping)
// //   double get subtotal {
// //     double total = 0;
// //     cart.forEach((key, value) {
// //       if (value is Map<String, dynamic>) {
// //         double price = (value['price'] ?? 0).toDouble();
// //         int qty = (value['qty'] ?? 1).toInt();
// //         total += price * qty;
// //       }
// //     });
// //     return total;
// //   }
// // }
// //
// // // Reuse these classes from your existing model or create new ones
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
// //   String get fullName => '$shipFirstName $shipLastName';
// //   String get fullAddress => '$shipAddress1, $shipCity, $shipZip, $shipCountry';
// // }
// //
// // class StateModel {
// //   final int id;
// //   final String name;
// //   final double price;
// //   final int status;
// //   final String type;
// //
// //   StateModel({
// //     required this.id,
// //     required this.name,
// //     required this.price,
// //     required this.status,
// //     required this.type,
// //   });
// //
// //   factory StateModel.fromJson(Map<String, dynamic> json) {
// //     return StateModel(
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
// //   double get itemTotal => price * qty;
// //
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
// class OrderDetailSingleResponse {
//   final bool status;
//   final OrderDetailData? data;
//
//   OrderDetailSingleResponse({required this.status, this.data});
//
//   factory OrderDetailSingleResponse.fromJson(Map<String, dynamic> json) {
//     return OrderDetailSingleResponse(
//       status: json['status'] ?? false,
//       data: json['data'] != null
//           ? OrderDetailData.fromJson(json['data'])
//           : null,
//     );
//   }
// }
//
// class OrderDetailData {
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
//   final BillingInfo billingInfo;
//   final String paymentStatus;
//   final String createdAt;
//   final String updatedAt;
//   final double statePrice;
//   final StateModel state;
//
//   OrderDetailData({
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
//   factory OrderDetailData.fromJson(Map<String, dynamic> json) {
//     return OrderDetailData(
//       id: json['id'] ?? 0,
//       userId: json['user_id'] ?? 0,
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
//       billingInfo: BillingInfo.fromJson(Map<String, dynamic>.from(json['billing_info'] ?? {})),
//       paymentStatus: json['payment_status'] ?? 'Unpaid',
//       createdAt: json['created_at']?.toString() ?? '',
//       updatedAt: json['updated_at']?.toString() ?? '',
//       statePrice: (json['state_price'] is String ? double.tryParse(json['state_price']) : json['state_price'] ?? 0).toDouble(),
//       state: StateModel.fromJson(Map<String, dynamic>.from(json['state'] ?? {})),
//     );
//   }
//
//   // Get cart items as list
//   List<CartItem> get cartItems {
//     List<CartItem> items = [];
//     cart.forEach((key, value) {
//       if (value is Map<String, dynamic>) {
//         items.add(CartItem.fromJson(value));
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
//   // Get subtotal (price before tax and shipping)
//   double get subtotal {
//     double total = 0;
//     cart.forEach((key, value) {
//       if (value is Map<String, dynamic>) {
//         double price = (value['price'] ?? 0).toDouble();
//         int qty = (value['qty'] ?? 1).toInt();
//         total += price * qty;
//       }
//     });
//     return total;
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
//   final String shipAddress2;
//   final String shipZip;
//   final String shipCity;
//   final String shipCountry;
//   final String? shipCompany;
//
//   ShippingInfo({
//     required this.shipFirstName,
//     required this.shipLastName,
//     required this.shipEmail,
//     required this.shipPhone,
//     required this.shipAddress1,
//     required this.shipAddress2,
//     required this.shipZip,
//     required this.shipCity,
//     required this.shipCountry,
//     this.shipCompany,
//   });
//
//   factory ShippingInfo.fromJson(Map<String, dynamic> json) {
//     return ShippingInfo(
//       shipFirstName: json['ship_first_name'] ?? '',
//       shipLastName: json['ship_last_name'] ?? '',
//       shipEmail: json['ship_email'] ?? '',
//       shipPhone: json['ship_phone']?.toString() ?? '',
//       shipAddress1: json['ship_address1'] ?? '',
//       shipAddress2: json['ship_address2'] ?? '',
//       shipZip: json['ship_zip']?.toString() ?? '',
//       shipCity: json['ship_city'] ?? '',
//       shipCountry: json['ship_country'] ?? '',
//       shipCompany: json['ship_company'],
//     );
//   }
//
//   String get fullName => '$shipFirstName $shipLastName';
//   String get fullAddress {
//     List<String> parts = [];
//     if (shipAddress1.isNotEmpty) parts.add(shipAddress1);
//     if (shipAddress2.isNotEmpty) parts.add(shipAddress2);
//     if (shipCity.isNotEmpty) parts.add(shipCity);
//     if (shipZip.isNotEmpty) parts.add(shipZip);
//     if (shipCountry.isNotEmpty) parts.add(shipCountry);
//     return parts.join(', ');
//   }
// }
//
// class BillingInfo {
//   final String billFirstName;
//   final String billLastName;
//   final String billEmail;
//   final String billPhone;
//   final String billAddress1;
//   final String billAddress2;
//   final String billZip;
//   final String billCity;
//   final String billCountry;
//   final String? billCompany;
//
//   BillingInfo({
//     required this.billFirstName,
//     required this.billLastName,
//     required this.billEmail,
//     required this.billPhone,
//     required this.billAddress1,
//     required this.billAddress2,
//     required this.billZip,
//     required this.billCity,
//     required this.billCountry,
//     this.billCompany,
//   });
//
//   factory BillingInfo.fromJson(Map<String, dynamic> json) {
//     return BillingInfo(
//       billFirstName: json['bill_first_name'] ?? '',
//       billLastName: json['bill_last_name'] ?? '',
//       billEmail: json['bill_email'] ?? '',
//       billPhone: json['bill_phone']?.toString() ?? '',
//       billAddress1: json['bill_address1'] ?? '',
//       billAddress2: json['bill_address2'] ?? '',
//       billZip: json['bill_zip']?.toString() ?? '',
//       billCity: json['bill_city'] ?? '',
//       billCountry: json['bill_country'] ?? '',
//       billCompany: json['bill_company'],
//     );
//   }
//
//   String get fullName => '$billFirstName $billLastName';
//   String get fullAddress {
//     List<String> parts = [];
//     if (billAddress1.isNotEmpty) parts.add(billAddress1);
//     if (billAddress2.isNotEmpty) parts.add(billAddress2);
//     if (billCity.isNotEmpty) parts.add(billCity);
//     if (billZip.isNotEmpty) parts.add(billZip);
//     if (billCountry.isNotEmpty) parts.add(billCountry);
//     return parts.join(', ');
//   }
// }
//
// class StateModel {
//   final int id;
//   final String name;
//   final double price;
//   final int status;
//   final String type;
//
//   StateModel({
//     required this.id,
//     required this.name,
//     required this.price,
//     required this.status,
//     required this.type,
//   });
//
//   factory StateModel.fromJson(Map<String, dynamic> json) {
//     return StateModel(
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
//
//   // Get full image URL
//   String get fullImageUrl {
//     if (photo.isEmpty) return '';
//     if (photo.startsWith('http')) return photo;
//     return 'https://anniecabs.com/emartnew/$photo';
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

class OrderDetailSingleResponse {
  final bool status;
  final OrderDetailData? data;

  OrderDetailSingleResponse({required this.status, this.data});

  factory OrderDetailSingleResponse.fromJson(Map<String, dynamic> json) {
    return OrderDetailSingleResponse(
      status: json['status'] ?? false,
      data: json['data'] != null
          ? OrderDetailData.fromJson(json['data'])
          : null,
    );
  }
}

class OrderDetailData {
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
  final BillingInfo billingInfo;
  final String paymentStatus;
  final String createdAt;
  final String updatedAt;
  final double statePrice;
  final StateModel state;

  OrderDetailData({
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

  factory OrderDetailData.fromJson(Map<String, dynamic> json) {
    return OrderDetailData(
      id: json['id'] ?? 0,
      userId: json['user_id'] ?? 0,
      cart: Map<String, dynamic>.from(json['cart'] ?? {}),
      currencySign: json['currency_sign'] ?? '\$',
      currencyValue: json['currency_value']?.toString() ?? '1',
      discount: json['discount']?.toString() ?? '[]',
      shipping: Shipping.fromJson(Map<String, dynamic>.from(json['shipping'] ?? {})),
      paymentMethod: json['payment_method'] ?? 'cod',
      txnid: json['txnid'],
      tax: (json['tax'] is String ? double.tryParse(json['tax']) : json['tax'] ?? 0).toDouble(),
      chargeId: json['charge_id'],
      transactionNumber: json['transaction_number'],
      orderStatus: json['order_status'] ?? 'Pending',
      shippingInfo: ShippingInfo.fromJson(Map<String, dynamic>.from(json['shipping_info'] ?? {})),
      billingInfo: BillingInfo.fromJson(Map<String, dynamic>.from(json['billing_info'] ?? {})),
      paymentStatus: json['payment_status'] ?? 'Unpaid',
      createdAt: json['created_at']?.toString() ?? '',
      updatedAt: json['updated_at']?.toString() ?? '',
      statePrice: (json['state_price'] is String ? double.tryParse(json['state_price']) : json['state_price'] ?? 0).toDouble(),
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

  // Get subtotal (price before tax and shipping)
  double get subtotal {
    double total = 0;
    cart.forEach((key, value) {
      if (value is Map<String, dynamic>) {
        double price = (value['price'] ?? 0).toDouble();
        int qty = (value['qty'] ?? 1).toInt();
        total += price * qty;
      }
    });
    return total;
  }
}

class Shipping {
  final int id;
  final String title;
  final double price;
  final double minimumPrice;
  final int isCondition;
  final int status;

  Shipping({
    required this.id,
    required this.title,
    required this.price,
    required this.minimumPrice,
    required this.isCondition,
    required this.status,
  });

  factory Shipping.fromJson(Map<String, dynamic> json) {
    return Shipping(
      id: json['id']?.toInt() ?? 0,
      title: json['title'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      minimumPrice: (json['minimum_price'] ?? 0).toDouble(),
      isCondition: json['is_condition']?.toInt() ?? 0,
      status: json['status']?.toInt() ?? 0,
    );
  }
}

class ShippingInfo {
  final String shipFirstName;
  final String shipLastName;
  final String shipEmail;
  final String shipPhone;
  final String shipAddress1;
  final String shipAddress2;
  final String shipZip;
  final String shipCity;
  final String shipCountry;
  final String? shipCompany;

  ShippingInfo({
    required this.shipFirstName,
    required this.shipLastName,
    required this.shipEmail,
    required this.shipPhone,
    required this.shipAddress1,
    required this.shipAddress2,
    required this.shipZip,
    required this.shipCity,
    required this.shipCountry,
    this.shipCompany,
  });

  factory ShippingInfo.fromJson(Map<String, dynamic> json) {
    return ShippingInfo(
      shipFirstName: json['ship_first_name'] ?? '',
      shipLastName: json['ship_last_name'] ?? '',
      shipEmail: json['ship_email'] ?? '',
      shipPhone: json['ship_phone']?.toString() ?? '',
      shipAddress1: json['ship_address1'] ?? '',
      shipAddress2: json['ship_address2'] ?? '',
      shipZip: json['ship_zip']?.toString() ?? '',
      shipCity: json['ship_city'] ?? '',
      shipCountry: json['ship_country'] ?? '',
      shipCompany: json['ship_company'],
    );
  }

  String get fullName => '$shipFirstName $shipLastName';
  String get fullAddress {
    List<String> parts = [];
    if (shipAddress1.isNotEmpty) parts.add(shipAddress1);
    if (shipAddress2.isNotEmpty) parts.add(shipAddress2);
    if (shipCity.isNotEmpty) parts.add(shipCity);
    if (shipZip.isNotEmpty) parts.add(shipZip);
    if (shipCountry.isNotEmpty) parts.add(shipCountry);
    return parts.join(', ');
  }
}

class BillingInfo {
  final String billFirstName;
  final String billLastName;
  final String billEmail;
  final String billPhone;
  final String billAddress1;
  final String billAddress2;
  final String billZip;
  final String billCity;
  final String billCountry;
  final String? billCompany;

  BillingInfo({
    required this.billFirstName,
    required this.billLastName,
    required this.billEmail,
    required this.billPhone,
    required this.billAddress1,
    required this.billAddress2,
    required this.billZip,
    required this.billCity,
    required this.billCountry,
    this.billCompany,
  });

  factory BillingInfo.fromJson(Map<String, dynamic> json) {
    return BillingInfo(
      billFirstName: json['bill_first_name'] ?? '',
      billLastName: json['bill_last_name'] ?? '',
      billEmail: json['bill_email'] ?? '',
      billPhone: json['bill_phone']?.toString() ?? '',
      billAddress1: json['bill_address1'] ?? '',
      billAddress2: json['bill_address2'] ?? '',
      billZip: json['bill_zip']?.toString() ?? '',
      billCity: json['bill_city'] ?? '',
      billCountry: json['bill_country'] ?? '',
      billCompany: json['bill_company'],
    );
  }

  String get fullName => '$billFirstName $billLastName';
  String get fullAddress {
    List<String> parts = [];
    if (billAddress1.isNotEmpty) parts.add(billAddress1);
    if (billAddress2.isNotEmpty) parts.add(billAddress2);
    if (billCity.isNotEmpty) parts.add(billCity);
    if (billZip.isNotEmpty) parts.add(billZip);
    if (billCountry.isNotEmpty) parts.add(billCountry);
    return parts.join(', ');
  }
}

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
      id: json['id']?.toInt() ?? 0,
      name: json['name'] ?? '',
      price: (json['price'] ?? 0).toDouble(),
      status: json['status']?.toInt() ?? 0,
      type: json['type'] ?? 'percentage',
    );
  }
}

class CartItem {
  final List<dynamic> optionsId;
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
      optionsId: List<dynamic>.from(json['options_id'] ?? []),
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

  // Get full image URL
  String get fullImageUrl {
    if (photo.isEmpty) return '';
    if (photo.startsWith('http')) return photo;
    return 'https://anniecabs.com/emartnew/$photo';
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
