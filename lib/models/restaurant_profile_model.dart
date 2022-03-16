import 'dart:io';

class RestaurantProfileModel {
  late File image_path;
  late String name;
  late String phone;
  late String open_time;
  late String close_time;
  late String bank_number;
  late String map_In;
  late String map_It;

  RestaurantProfileModel(
      {required this.name,
      required this.image_path,
      required this.bank_number,
      required this.phone,
      required this.open_time,
      required this.close_time,
      required this.map_In,
      required this.map_It});

  RestaurantProfileModel.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        phone = json["phone"],
        image_path = json["image_path"],
        bank_number = json["bank_number"],
        open_time = json["open_time"],
        close_time = json["close_time"],
        map_It = json["map_It"],
        map_In = json["map_In"];

  Map<String, dynamic> toJson() => {
        "name": name,
        "phone": phone,
        "image_path": image_path,
        "bank_number": bank_number,
        "open_time": open_time,
        "close_time": close_time,
        "map_It": map_It,
        "map_In": map_In,
      };
}
