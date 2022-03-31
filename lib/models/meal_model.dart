class Meal {
  int? id;
  int? userId;
  int? restaurantId;
  int? categoryId;
  String? nameUz;
  String? nameRu;
  String? nameEn;
  String? descriptionUz;
  String? descriptionRu;
  String? descriptionEn;
  String? price;
  String? imagePath;
  String? deletedAt;
  String? createdAt;
  String? updatedAt;

  Meal(
      {this.id,
      this.userId,
      this.restaurantId,
      this.categoryId,
      this.nameUz,
      this.nameRu,
      this.nameEn,
      this.descriptionUz,
      this.descriptionRu,
      this.descriptionEn,
      this.price,
      this.imagePath,
      this.deletedAt,
      this.createdAt,
      this.updatedAt});

  Meal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'].runtimeType == String
        ? int.parse(json['user_id'])
        : json['user_id'];
    restaurantId = json['restaurant_id'];
    categoryId = json['category_id'];
    nameUz = json['name_uz'];
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    descriptionUz = json['description_uz'];
    descriptionRu = json['description_ru'];
    descriptionEn = json['description_en'];
    price = json['price'];
    imagePath = json['image_path'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['restaurant_id'] = this.restaurantId;
    data['category_id'] = this.categoryId;
    data['name_uz'] = this.nameUz;
    data['name_ru'] = this.nameRu;
    data['name_en'] = this.nameEn;
    data['description_uz'] = this.descriptionUz;
    data['description_ru'] = this.descriptionRu;
    data['description_en'] = this.descriptionEn;
    data['price'] = this.price;
    data['image_path'] = this.imagePath;
    data['deleted_at'] = this.deletedAt;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
