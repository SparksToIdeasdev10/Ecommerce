// // // banners_model.dart
// // class banner {
// //   final bool status;
// //   final String message;
// //   final List<BannerData>? data;
// //
// //   banner({
// //     required this.status,
// //     required this.message,
// //     this.data,
// //   });
// //
// //   factory banner.fromJson(Map<String, dynamic> json) {
// //     return banner(
// //       status: json['status'] ?? false,
// //       message: json['message'] ?? '',
// //       data: json['data'] != null
// //           ? (json['data'] as List).map((item) => BannerData.fromJson(item)).toList()
// //           : null,
// //     );
// //   }
// // }
// //
// // class BannerData {
// //   final int id;
// //   final String title;
// //   final String image;
// //   final String? link;
// //
// //   BannerData({
// //     required this.id,
// //     required this.title,
// //     required this.image,
// //     this.link,
// //   });
// //
// //   factory BannerData.fromJson(Map<String, dynamic> json) {
// //     return BannerData(
// //       id: json['id'] ?? 0,
// //       title: json['title'] ?? '',
// //       image: json['image'] ?? '',
// //       link: json['link'],
// //     );
// //   }
// // }
//
//
// class BannerResponse {
//   final bool status;
//   final String message;
//   final BannerData? data;
//
//   BannerResponse({
//     required this.status,
//     required this.message,
//     this.data,
//   });
//
//   factory BannerResponse.fromJson(Map<String, dynamic> json) {
//     return BannerResponse(
//       status: json['status'] ?? false,
//       message: json['message'] ?? '',
//       data: json['data'] != null ? BannerData.fromJson(json['data']) : null,
//     );
//   }
// }
//
// class BannerData {
//   final String heroBanner;
//   final List<SliderItem> sliders;
//   final List<BannerItem> banners;
//
//   BannerData({
//     required this.heroBanner,
//     required this.sliders,
//     required this.banners,
//   });
//
//   factory BannerData.fromJson(Map<String, dynamic> json) {
//     return BannerData(
//       heroBanner: json['hero_banner'] ?? '',
//       sliders: json['sliders'] != null
//           ? (json['sliders'] as List).map((item) => SliderItem.fromJson(item)).toList()
//           : [],
//       banners: json['banners'] != null
//           ? (json['banners'] as List).map((item) => BannerItem.fromJson(item)).toList()
//           : [],
//     );
//   }
// }
//
// class SliderItem {
//   final int id;
//   final String photo;
//   final String title;
//   final String details;
//   final String link;
//
//   SliderItem({
//     required this.id,
//     required this.photo,
//     required this.title,
//     required this.details,
//     required this.link,
//   });
//
//   factory SliderItem.fromJson(Map<String, dynamic> json) {
//     return SliderItem(
//       id: json['id'] ?? 0,
//       photo: json['photo'] ?? '',
//       title: json['title'] ?? '',
//       details: json['details'] ?? '',
//       link: json['link'] ?? '',
//     );
//   }
// }
//
// class BannerItem {
//   final int id;
//   final String photo;
//
//   BannerItem({
//     required this.id,
//     required this.photo,
//   });
//
//   factory BannerItem.fromJson(Map<String, dynamic> json) {
//     return BannerItem(
//       id: json['id'] ?? 0,
//       photo: json['photo'] ?? '',
//     );
//   }
// }


class BannerResponse {
  final bool status;
  final String message;
  final BannerData? data;

  BannerResponse({
    required this.status,
    required this.message,
    this.data,
  });

  factory BannerResponse.fromJson(Map<String, dynamic> json) {
    return BannerResponse(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: json['data'] != null ? BannerData.fromJson(json['data']) : null,
    );
  }
}

class BannerData {
  final String heroBanner;
  final List<SliderItem> sliders;
  final List<BannerItem> banners;

  BannerData({
    required this.heroBanner,
    required this.sliders,
    required this.banners,
  });

  factory BannerData.fromJson(Map<String, dynamic> json) {
    return BannerData(
      heroBanner: json['hero_banner'] ?? '',
      sliders: json['sliders'] != null
          ? (json['sliders'] as List).map((item) => SliderItem.fromJson(item)).toList()
          : [],
      banners: json['banners'] != null
          ? (json['banners'] as List).map((item) => BannerItem.fromJson(item)).toList()
          : [],
    );
  }
}

class SliderItem {
  final int id;
  final String photo;
  final String title;
  final String details;
  final String link;

  SliderItem({
    required this.id,
    required this.photo,
    required this.title,
    required this.details,
    required this.link,
  });

  factory SliderItem.fromJson(Map<String, dynamic> json) {
    return SliderItem(
      id: json['id'] ?? 0,
      photo: json['photo'] ?? '',
      title: json['title'] ?? '',
      details: json['details'] ?? '',
      link: json['link'] ?? '',
    );
  }
}

class BannerItem {
  final int id;
  final String photo;

  BannerItem({
    required this.id,
    required this.photo,
  });

  factory BannerItem.fromJson(Map<String, dynamic> json) {
    return BannerItem(
      id: json['id'] ?? 0,
      photo: json['photo'] ?? '',
    );
  }
}