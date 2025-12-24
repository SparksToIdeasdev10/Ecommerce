// order_models.dart
class OrderResponse {
  bool status;
  String message;
  int orderId;

  OrderResponse({required this.status, required this.message, required this.orderId});

  factory OrderResponse.fromJson(Map<String, dynamic> json) {
    return OrderResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      orderId: json['order_id'] ?? 0,
    );
  }
}

class OrderRequest {
  final Map<String, dynamic> address;
  final Map<String, dynamic> billing;
  final String paymentMethod;
  final int shippingId;
  final int stateId;
  final Map<String, dynamic> cart;

  OrderRequest({
    required this.address,
    required this.billing,
    required this.paymentMethod,
    required this.shippingId,
    required this.stateId,
    required this.cart,
  });

  Map<String, dynamic> toJson() {
    return {
      'address': address,
      'billing': billing,
      'payment_method': paymentMethod,
      'shipping_id': shippingId,
      'state_id': stateId,
      'cart': cart,
    };
  }

  // Quick static method to create from your data
  static OrderRequest createOrder({
    required Map<String, dynamic> shippingAddress,
    required Map<String, dynamic> billingAddress,
    required Map<String, dynamic> cartData,
    String paymentMethod = 'cod',
    int shippingId = 1,
    int stateId = 6,
  }) {
    return OrderRequest(
      address: shippingAddress,
      billing: billingAddress,
      paymentMethod: paymentMethod,
      shippingId: shippingId,
      stateId: stateId,
      cart: cartData,
    );
  }
}