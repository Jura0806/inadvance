// To parse this JSON data, do
//
//     final tables = tablesFromMap(jsonString);

import 'dart:convert';

class TablesFullData {
  TablesFullData({
    this.data,
  });

  Data? data;

  factory TablesFullData.fromJson(String str) => TablesFullData.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TablesFullData.fromMap(Map<String, dynamic> json) => TablesFullData(
    data: Data.fromMap(json["data"]),
  );

  Map<String, dynamic> toMap() => {
    "data": data!.toMap(),
  };
}

class Data {
  Data({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.links,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  int? currentPage;
  List<TableInfos>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  List<Link>? links;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;

  factory Data.fromJson(String str) => Data.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Data.fromMap(Map<String, dynamic> json) => Data(
    currentPage: json["current_page"],
    data: List<TableInfos>.from(json["data"].map((x) => TableInfos.fromMap(x))),
    firstPageUrl: json["first_page_url"],
    from: json["from"],
    lastPage: json["last_page"],
    lastPageUrl: json["last_page_url"],
    links: List<Link>.from(json["links"].map((x) => Link.fromMap(x))),
    nextPageUrl: json["next_page_url"],
    path: json["path"],
    perPage: json["per_page"],
    prevPageUrl: json["prev_page_url"],
    to: json["to"],
    total: json["total"],
  );

  Map<String, dynamic> toMap() => {
    "current_page": currentPage,
    "data": List<dynamic>.from(data!.map((x) => x.toMap())),
    "first_page_url": firstPageUrl,
    "from": from,
    "last_page": lastPage,
    "last_page_url": lastPageUrl,
    "links": List<dynamic>.from(links!.map((x) => x.toMap())),
    "next_page_url": nextPageUrl,
    "path": path,
    "per_page": perPage,
    "prev_page_url": prevPageUrl,
    "to": to,
    "total": total,
  };
}

class TableInfos {
  TableInfos({
    this.id,
    this.restaurantId,
    required this.setNum,
    required this.price,
    required this.floor,
    required this.index,
    this.createdAt,
    this.updatedAt,
    this.orders,
  });

  int? id;
  String? restaurantId;
  String setNum;
  String price;
  String floor;
  String index;
  DateTime? createdAt;
  DateTime? updatedAt;
  List<dynamic>? orders;

  factory TableInfos.fromJson(String str) => TableInfos.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TableInfos.fromMap(Map<String, dynamic> json) => TableInfos(
    id: json["id"],
    restaurantId: json["restaurant_id"],
    setNum: json["set_num"],
    price: json["price"],
    floor: json["floor"],
    index: json["index"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    orders: List<dynamic>.from(json["orders"].map((x) => x)),
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "restaurant_id": restaurantId,
    "set_num": setNum,
    "price": price,
    "floor": floor,
    "index": index,
    "created_at": createdAt!.toIso8601String(),
    "updated_at": updatedAt!.toIso8601String(),
    "orders": List<dynamic>.from(orders!.map((x) => x)),
  };
}

class Link {
  Link({
    this.url,
    this.label,
    this.active,
  });

  String? url;
  String? label;
  bool? active;

  factory Link.fromJson(String str) => Link.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Link.fromMap(Map<String, dynamic> json) => Link(
    url: json["url"] == null ? null : json["url"],
    label: json["label"],
    active: json["active"],
  );

  Map<String, dynamic> toMap() => {
    "url": url == null ? null : url,
    "label": label,
    "active": active,
  };
}
