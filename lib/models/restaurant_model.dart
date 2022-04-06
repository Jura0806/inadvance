// To parse this JSON data, do
//
//     final restaurantModel = restaurantModelFromMap(jsonString);

import 'dart:convert';

RestaurantModel restaurantModelFromMap(String str) => RestaurantModel.fromMap(json.decode(str));

String restaurantModelToMap(RestaurantModel data) => json.encode(data.toMap());

class RestaurantModel {
    RestaurantModel({
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
    List<Restaurant>? data;
    String? firstPageUrl;
    int? from;
    int? lastPage;
    String? lastPageUrl;
    List<Link>? links;
    String? nextPageUrl;
    String? path;
    int? perPage;
    String? prevPageUrl;
    int? to;
    int? total;

    factory RestaurantModel.fromMap(Map<String, dynamic> json) => RestaurantModel(
        currentPage: json["current_page"],
        data: List<Restaurant>.from(json["data"].map((x) => Restaurant.fromMap(x))),
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
        this.type,
        this.deletedAt,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    int? userId;
    String? imagePath;
    String? logoPath;
    String? name;
    String? phone;
    String? mapLn;
    String? mapLt;
    String? openTime;
    String? closeTime;
    String? bankNumber;
    String? type;
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
        mapLn: json["map_ln"] == null ? null : json["map_ln"],
        mapLt: json["map_lt"] == null ? null : json["map_lt"],
        openTime: json["open_time"],
        closeTime: json["close_time"],
        bankNumber: json["bank_number"],
        type: json["type"],
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
        "map_ln": mapLn == null ? null : mapLn,
        "map_lt": mapLt == null ? null : mapLt,
        "open_time": openTime,
        "close_time": closeTime,
        "bank_number": bankNumber,
        "type": type,
        "deleted_at": deletedAt,
        "created_at": createdAt!.toIso8601String(),
        "updated_at": updatedAt!.toIso8601String(),
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
