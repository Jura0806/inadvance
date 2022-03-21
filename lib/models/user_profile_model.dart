// To parse this JSON data, do
//
//     final userProfile = userProfileFromJson(jsonString);


class UserProfile {
  UserProfile({
    this.id,
    this.roleId,
    required this.fullName,
    required this.phone,
    this.login,
    this.imagePath,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
  });

  int? id;
  String? roleId;
  String fullName;
  String phone;
  String? login;
  String? imagePath;
  DateTime? createdAt;
  DateTime? updatedAt;
  dynamic deletedAt;

  factory UserProfile.fromJson(Map<String, dynamic> json) => UserProfile(
    id: json["id"],
    roleId: json["role_id"],
    fullName: json["full_name"],
    phone: json["phone"],
    login: json["login"],
    imagePath: json["image_path"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    deletedAt: json["deleted_at"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role_id": roleId,
    "full_name": fullName,
    "phone": phone,
    "login": login,
    "image_path": imagePath,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "deleted_at": deletedAt,
  };
}
