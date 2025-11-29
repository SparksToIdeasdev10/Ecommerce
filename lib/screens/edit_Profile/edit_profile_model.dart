// // user_profile_model.dart
// class UserProfileResponse {
//   final bool status;
//   final User user;
//
//   UserProfileResponse({
//     required this.status,
//     required this.user,
//   });
//
//   factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
//     return UserProfileResponse(
//       status: json['status'] ?? false,
//       user: User.fromJson(json['user']),
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'status': status,
//       'user': user.toJson(),
//     };
//   }
// }
//
// class User {
//   final int id;
//   final String firstName;
//   final String lastName;
//   final String phone;
//   final String email;
//   final String? photo;
//   final String? emailToken;
//   final String? shipAddress1;
//   final String? shipAddress2;
//   final String? shipZip;
//   final String? shipCity;
//   final String? shipCountry;
//   final String? shipCompany;
//   final String? billAddress1;
//   final String? billAddress2;
//   final String? billZip;
//   final String? billCity;
//   final String? billCountry;
//   final String? billCompany;
//   final String createdAt;
//   final String updatedAt;
//   final dynamic stateId;
//   final int emailVerify;
//
//   User({
//     required this.id,
//     required this.firstName,
//     required this.lastName,
//     required this.phone,
//     required this.email,
//     this.photo,
//     this.emailToken,
//     this.shipAddress1,
//     this.shipAddress2,
//     this.shipZip,
//     this.shipCity,
//     this.shipCountry,
//     this.shipCompany,
//     this.billAddress1,
//     this.billAddress2,
//     this.billZip,
//     this.billCity,
//     this.billCountry,
//     this.billCompany,
//     required this.createdAt,
//     required this.updatedAt,
//     this.stateId,
//     required this.emailVerify,
//   });
//
//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       id: json['id'] ?? 0,
//       firstName: json['first_name'] ?? '',
//       lastName: json['last_name'] ?? '',
//       phone: json['phone'] ?? '',
//       email: json['email'] ?? '',
//       photo: json['photo'],
//       emailToken: json['email_token'],
//       shipAddress1: json['ship_address1'],
//       shipAddress2: json['ship_address2'],
//       shipZip: json['ship_zip'],
//       shipCity: json['ship_city'],
//       shipCountry: json['ship_country'],
//       shipCompany: json['ship_company'],
//       billAddress1: json['bill_address1'],
//       billAddress2: json['bill_address2'],
//       billZip: json['bill_zip'],
//       billCity: json['bill_city'],
//       billCountry: json['bill_country'],
//       billCompany: json['bill_company'],
//       createdAt: json['created_at'] ?? '',
//       updatedAt: json['updated_at'] ?? '',
//       stateId: json['state_id'],
//       emailVerify: json['email_verify'] ?? 0,
//     );
//   }
//
//   Map<String, dynamic> toJson() {
//     return {
//       'id': id,
//       'first_name': firstName,
//       'last_name': lastName,
//       'phone': phone,
//       'email': email,
//       'photo': photo,
//       'email_token': emailToken,
//       'ship_address1': shipAddress1,
//       'ship_address2': shipAddress2,
//       'ship_zip': shipZip,
//       'ship_city': shipCity,
//       'ship_country': shipCountry,
//       'ship_company': shipCompany,
//       'bill_address1': billAddress1,
//       'bill_address2': billAddress2,
//       'bill_zip': billZip,
//       'bill_city': billCity,
//       'bill_country': billCountry,
//       'bill_company': billCompany,
//       'created_at': createdAt,
//       'updated_at': updatedAt,
//       'state_id': stateId,
//       'email_verify': emailVerify,
//     };
//   }
//
//   // Helper method to get full name
//   String get fullName => '$firstName $lastName'.trim();
//
//   // Helper method to check if email is verified
//   bool get isEmailVerified => emailVerify == 1;
// }


// user_profile_model.dart
class UserProfileResponse {
  final bool status;
  final String message;
  final User data; // Changed from 'user' to 'data'

  UserProfileResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: User.fromJson(json['data']), // Changed from json['user'] to json['data']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'message': message,
      'data': data.toJson(), // Changed from 'user' to 'data'
    };
  }
}

class User {
  final int id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String? photo;
  final String? emailToken;
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
  final String createdAt;
  final String updatedAt;
  final dynamic stateId;
  final int emailVerify;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    this.photo,
    this.emailToken,
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
    required this.createdAt,
    required this.updatedAt,
    this.stateId,
    required this.emailVerify,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] ?? 0,
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phone: json['phone'] ?? '',
      email: json['email'] ?? '',
      photo: json['photo'],
      emailToken: json['email_token'],
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
      createdAt: json['created_at'] ?? '',
      updatedAt: json['updated_at'] ?? '',
      stateId: json['state_id'],
      emailVerify: json['email_verify'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'phone': phone,
      'email': email,
      'photo': photo,
      'email_token': emailToken,
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
      'created_at': createdAt,
      'updated_at': updatedAt,
      'state_id': stateId,
      'email_verify': emailVerify,
    };
  }

  //update model



  // Helper method to get full name
  String get fullName => '$firstName $lastName'.trim();

  // Helper method to check if email is verified
  bool get isEmailVerified => emailVerify == 1;
}


//update profile

// update_profile_model.dart
class UpdateProfileResponse {
  final bool status;
  final String message;
  final UpdatedUserData data;

  UpdateProfileResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory UpdateProfileResponse.fromJson(Map<String, dynamic> json) {
    return UpdateProfileResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: UpdatedUserData.fromJson(json['data']), // Make sure this line is correct
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

class UpdatedUserData {
  final String firstName;
  final String lastName;
  final String email;
  final String phone;

  UpdatedUserData({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
  });

  factory UpdatedUserData.fromJson(Map<String, dynamic> json) {
    return UpdatedUserData(
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      phone: json['phone'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
    };
  }

  // Helper method to get full name
  String get fullName => '$firstName $lastName'.trim();
}