import 'dart:convert';

class TablesData {

  final String restaurantId;
  final String setNum;
  final String price;
  final String floor;
  final String index;



  TablesData({
    required this.restaurantId,
    required this.setNum,
    required this.price,
    required this.floor,
    required this.index,
  });


  factory TablesData.fromJson(Map<String, dynamic> json) => TablesData(

    restaurantId: json["restaurant_id"],
    setNum: json["set_num"],
    price: json["price"],
    floor: json["floor"],
    index: json["index"],
  );

  Map<String, dynamic> toJson() => {
    "restaurant_id": restaurantId,
    "set_num": setNum,
    "price": price,
    "floor": floor,
    "index": index,
  };


  TablesData tablesDataFromJson(String str) => TablesData.fromJson(json.decode(str));

  String tablesDataToJson(TablesData data) => json.encode(data.toJson());

}