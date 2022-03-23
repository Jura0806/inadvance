import 'dart:convert';


class RestaurantProfileModel {
  // final int userId;
  String? imagePath;
  String? logoPath;
  String name;
  String phone;
  String mapLn;
  String mapLt;
  String openTime;
  String closeTime;
  String bankNumber;
  String? logo;
  RestaurantProfileModel({
    // this.userId,
    this.imagePath,
    required this.name,
    required this.phone,
    required this.mapLn,
    required this.mapLt,
    required this.openTime,
    required this.closeTime,
    required this.bankNumber,
    this.logo
  });

  factory RestaurantProfileModel.fromJson(Map<String, dynamic> json) =>
      RestaurantProfileModel(
        imagePath: json["image_path"],
        logo: json["logo_path"],
        name: json["name"],
        phone: json["phone"],
        mapLn: json["map_ln"],
        mapLt: json["map_lt"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        bankNumber: json["bank_number"],
      );

  Map<String, dynamic> toJson() => {
        "image_path": imagePath,
         "logo_path" : logo,
        "name": name,
        "phone": phone,
        "map_ln": mapLn,
        "map_lt": mapLt,
        "open_time": openTime,
        "close_time": closeTime,
        "bank_number": bankNumber,
      };

  RestaurantProfileModel restaurantProfileModelFromJson(String str) =>
      RestaurantProfileModel.fromJson(json.decode(str));

  String restaurantProfileModelToJson(RestaurantProfileModel data) =>
      json.encode(data.toJson());
}
