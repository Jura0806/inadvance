class Restaurant {
  Restaurant({
    required this.id,
    required this.userId,
    required this.imagePath,
    required this.logoPath,
    required this.name,
    required this.phone,
    required this.mapLn,
    required this.mapLt,
    required this.openTime,
    required this.closeTime,
    required this.bankNumber,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });
  late final int id;
  late final String userId;
  late final String imagePath;
  late final String logoPath;
  late final String name;
  late final String phone;
  late final String mapLn;
  late final String mapLt;
  late final String openTime;
  late final String closeTime;
  late final String bankNumber;
  late final String deletedAt;
  late final String createdAt;
  late final String updatedAt;
  
  Restaurant.fromJson(Map<String, dynamic> json){
    id = json['id'];
    userId = json['user_id'];
    imagePath = json['image_path'];
    logoPath = json['logo_path'];
    name = json['name'];
    phone = json['phone'];
    mapLn = json['map_ln'];
    mapLt = json['map_lt'];
    openTime = json['open_time'];
    closeTime = json['close_time'];
    bankNumber = json['bank_number'];
    deletedAt = json['deleted_at'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;
    _data['user_id'] = userId;
    _data['image_path'] = imagePath;
    _data['logo_path'] = logoPath;
    _data['name'] = name;
    _data['phone'] = phone;
    _data['map_ln'] = mapLn;
    _data['map_lt'] = mapLt;
    _data['open_time'] = openTime;
    _data['close_time'] = closeTime;
    _data['bank_number'] = bankNumber;
    _data['deleted_at'] = deletedAt;
    _data['created_at'] = createdAt;
    _data['updated_at'] = updatedAt;
    return _data;
  }
}