import 'dart:convert';

Category categoryFromMap(String str) => Category.fromMap(json.decode(str));

String categoryToMap(Category data) => json.encode(data.toMap());

class Category {
  Category({
    this.id,
    this.restaurantId,
    this.nameUz,
    this.nameRu,
    this.nameEn,
    this.descriptionUz,
    this.descriptionRu,
    this.descriptionEn,
    this.imagePath,
    this.createdAt,
  });

  int? id;
  String? restaurantId;
  String? nameUz;
  String? nameRu;
  String? nameEn;
  String? descriptionUz;
  String? descriptionRu;
  String? descriptionEn;
  String? imagePath;
  DateTime? createdAt;

  factory Category.fromMap(Map<String, dynamic> json) => Category(
        id: json["id"],
        restaurantId: json["restaurant_id"],
        nameUz: json["name_uz"],
        nameRu: json["name_ru"],
        nameEn: json["name_en"],
        descriptionUz: json["description_uz"],
        descriptionRu: json["description_ru"],
        descriptionEn: json["description_en"],
        imagePath: json["image_path"],
        createdAt: DateTime.parse(json["created_at"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "restaurant_id": restaurantId,
        "name_uz": nameUz,
        "name_ru": nameRu,
        "name_en": nameEn,
        "description_uz": descriptionUz,
        "description_ru": descriptionRu,
        "description_en": descriptionEn,
        "image_path": imagePath,
        "created_at": createdAt!.toIso8601String(),
      };
}
