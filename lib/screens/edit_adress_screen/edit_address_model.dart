// address_model.dart
class AddressResponse {
  final bool status;
  final String message;
  final AddressData data;

  AddressResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: AddressData.fromJson(json['data'] ?? {}),
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

class AddressData {
  final String? shipAddress1;
  final String? shipAddress2;
  final String? shipZip;
  final String? shipCity;
  final String? shipCountry;
  final String? shipCompany;
  final String? billAddress1;
  final String? billAddress2;
  final String? billZip;
  final String? billCity;
  final String? billCountry;
  final String? billCompany;

  AddressData({
    this.shipAddress1,
    this.shipAddress2,
    this.shipZip,
    this.shipCity,
    this.shipCountry,
    this.shipCompany,
    this.billAddress1,
    this.billAddress2,
    this.billZip,
    this.billCity,
    this.billCountry,
    this.billCompany,
  });

  factory AddressData.fromJson(Map<String, dynamic> json) {
    return AddressData(
      shipAddress1: json['ship_address1'],
      shipAddress2: json['ship_address2'],
      shipZip: json['ship_zip'],
      shipCity: json['ship_city'],
      shipCountry: json['ship_country'],
      shipCompany: json['ship_company'],
      billAddress1: json['bill_address1'],
      billAddress2: json['bill_address2'],
      billZip: json['bill_zip'],
      billCity: json['bill_city'],
      billCountry: json['bill_country'],
      billCompany: json['bill_company'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ship_address1': shipAddress1,
      'ship_address2': shipAddress2,
      'ship_zip': shipZip,
      'ship_city': shipCity,
      'ship_country': shipCountry,
      'ship_company': shipCompany,
      'bill_address1': billAddress1,
      'bill_address2': billAddress2,
      'bill_zip': billZip,
      'bill_city': billCity,
      'bill_country': billCountry,
      'bill_company': billCompany,
    };
  }
}

class UpdateAddressResponse {
  final bool status;
  final String message;
  final AddressData data;

  UpdateAddressResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateAddressResponse.fromJson(Map<String, dynamic> json) {
    return UpdateAddressResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: AddressData.fromJson(json['data'] ?? {}),
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
