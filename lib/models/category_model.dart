class Category {
  int? id;
  String? nameUz;
  String? nameRu;
  String? nameEn;
  String? descriptionUz;
  String? descriptionRu;
  String? descriptionEn;
  String? imagePath;
  String? createdAt;

  Category(
      {this.id,
      this.nameUz,
      this.nameRu,
      this.nameEn,
      this.descriptionUz,
      this.descriptionRu,
      this.descriptionEn,
      this.imagePath,
      this.createdAt});

  Category.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nameUz = json['name_uz'];
    nameRu = json['name_ru'];
    nameEn = json['name_en'];
    descriptionUz = json['description_uz'];
    descriptionRu = json['description_ru'];
    descriptionEn = json['description_en'];
    imagePath = json['image_path'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name_uz'] = this.nameUz;
    data['name_ru'] = this.nameRu;
    data['name_en'] = this.nameEn;
    data['description_uz'] = this.descriptionUz;
    data['description_ru'] = this.descriptionRu;
    data['description_en'] = this.descriptionEn;
    data['image_path'] = this.imagePath;
    data['created_at'] = this.createdAt;
    return data;
  }
}

class Links {
  String? url;
  String? label;
  bool? active;

  Links({this.url, this.label, this.active});

  Links.fromJson(Map<String, dynamic> json) {
    url = json['url'];
    label = json['label'];
    active = json['active'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['url'] = this.url;
    data['label'] = this.label;
    data['active'] = this.active;
    return data;
  }
}
