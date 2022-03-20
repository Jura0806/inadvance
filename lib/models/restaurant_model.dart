import 'dart:convert';

Restaurant restaurantFromMap(String str) =>
    Restaurant.fromMap(json.decode(str));

String restaurantToMap(Restaurant data) => json.encode(data.toMap());

class Restaurant {
  Restaurant({
    this.id,
    this.userId,
    this.imagePath,
    this.logoPath,
    this.name,
    this.phone,
    this.mapLn,
    this.mapLt,
    this.openTime,
    this.closeTime,
    this.bankNumber,
    this.deletedAt,
    this.createdAt,
    this.updatedAt,
  });

  int? id;
  String? userId;
  String? imagePath;
  String? logoPath;
  String? name;
  String? phone;
  String? mapLn;
  String? mapLt;
  String? openTime;
  String? closeTime;
  String? bankNumber;
  String? deletedAt;
  DateTime? createdAt;
  DateTime? updatedAt;

  factory Restaurant.fromMap(Map<String, dynamic> json) => Restaurant(
        id: json["id"],
        userId: json["user_id"],
        imagePath: json["image_path"],
        logoPath: json["logo_path"],
        name: json["name"],
        phone: json["phone"],
        mapLn: json["map_ln"],
        mapLt: json["map_lt"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        bankNumber: json["bank_number"],
        deletedAt: json["deleted_at"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "user_id": userId,
        "image_path": imagePath,
        "logo_path": logoPath,
        "name": name,
        "phone": phone,
        "map_ln": mapLn,
        "map_lt": mapLt,
        "open_time": openTime,
        "close_time": closeTime,
        "bank_number": bankNumber,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
      };
}
