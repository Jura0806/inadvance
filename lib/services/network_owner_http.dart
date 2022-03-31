import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:inadvance/models/category_model.dart';
import 'package:inadvance/models/meal_model.dart';
import 'package:inadvance/models/restaurant_ables_model.dart';
import 'package:inadvance/models/restaurant_model.dart';
import 'package:inadvance/models/restaurant_tables_model.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/models/sign_up_account_model.dart';
import 'package:inadvance/models/restaurant_profile_model.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/services/hive_db_user_service.dart';

class OwnerNetwork {
  static String BASE = "in-advance.bingo99.uz";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };
  static Map<String, String> headers2 = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization':
        'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZmYzMTEwODYxOWEzYWM0NmU1ODUxMjZhY2I1YjBkZTk0NmFlNzliYzkzODcyZDIzY2E5NGY0ZWIwMjBhYzg0ZmIzMWZhYzAxMDk4ODEzNzMiLCJpYXQiOjE2NDc0MzE5MDMuMDUzNzM0LCJuYmYiOjE2NDc0MzE5MDMuMDUzNzM3LCJleHAiOjE2Nzg5Njc5MDMuMDUxMTI1LCJzdWIiOiIyIiwic2NvcGVzIjpbIm93bmVyIl19.qbI8hOK9wiH6ykmAB4btqB7ZOvUfEyDe0HYNajkl1L7rCXBuyRDNFW4-22yDizawEfUdg4wyXivnnC4R6VQo2XP8GetJvW2v3Tev6EmvxPZ1jQWVm7mjRbON2kki-kMbGNAxAyfgJD8V3tsQAe5__NISxYkd30L0N-68PmhJwJva-ePAzWdEx7QqCv1YEMYCS2NVOmru3Ih6G-wm1g7IsKyG7_3p9J03bb9qp6Pw6HBoYjbYwQ47-1AFJ2BV4tyw7dhqAYtZsCVrvsxhZtkUMCjfTo6JHJFHnU47smlDiz_fqEPzKoU-nmR7BlDE5uTunfZjajCx2XGir_akQXeCutr7ZE6z9LF2Mw1APwTfe-ALscErfF2-petOS_b2P7_nS7Lltz-_PO5Y5IiBVcbAck11QKcwzQZasE7zxzsxbYLoNz1U1rEuWVY6jPmB3DKVOrrsiK_XQVJuJjTm_jk4Zo6dTs8sXRK35uBxrP71x405MKT_k77suFpSc6uHfT98VI3GwiNjR8sBj2gSj107Y4KjzexR_i9Hx6osmYn_QhmaUDdcOI84dZfuMH6MLNCLe30-kIAICgCaFaknKOled-Uw4QcY6IY3-IZZYleSIl7OTw4MylEwSLfgOaF5Ph6UMFUGhPxXI6BPTSuVINbxKDUHcdam2KVr3SLgvO-1xSw'
  };

  static Map<String, String> headersWithToken = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${HiveToken().loadToken()}'
  };

  //<< http APIs >>//
  static String Api_Register = "/api/register";
  static String Api_LogIn = "/api/login";
  static String Api_Restaurant_Profile = "/api/owner/restaurant";
  static String Api_Restaurant_Table = "/api/owner/table";

  //<< http requests >>//
  static Future<String?> ownerRegister(
      String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var response =
          await post(uri, body: jsonEncode(params), headers: headers);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      return "BUG Network => $e";
    }
  }

  //<< For restaurant profile post api >> //
  static Future<String?> ownerProfilePost(
      String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.parse("https://in-advance.bingo99.uz/api/owner/restaurant");
      var requests = http.MultipartRequest("POST", uri);
      requests.headers.addAll(headersWithToken);
      requests.files.add(await http.MultipartFile.fromPath(
        "image_path",
        params["image_path"],
        // filename: "images"
      ));
      requests.files.add(await http.MultipartFile.fromPath(
        "logo_path",
        params["logo_path"],
        // filename: "images"
      ));
      requests.fields["name"] = params["name"];
      requests.fields["phone"] = params["phone"];
      requests.fields["open_time"] = params["open_time"];
      requests.fields["close_time"] = params["close_time"];
      requests.fields["bank_number"] = params["bank_number"];
      requests.fields["map_ln"] = params["map_ln"];
      requests.fields["map_lt"] = params["map_lt"];
      requests.fields["type"] = params['type'];
      var streamedResponse = await requests.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      print(response.statusCode.toString());
    } catch (e) {
      return "BUG Network => $e";
    }
  }

  static Future<String?> ownerProfilePut(
      String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.parse(
          "https://in-advance.bingo99.uz/api/owner/restaurant/${HiveRestId().loadId()}");
      var requests = http.MultipartRequest("POST", uri);
      requests.headers.addAll(headersWithToken);
      requests.files.add(await http.MultipartFile.fromPath(
        "image_path",
        params["image_path"],
      ));
      requests.files.add(await http.MultipartFile.fromPath(
        "logo_path",
        params["logo_path"],
        // filename: "image
        // s"
      ));
      requests.fields["name"] = params["name"];
      requests.fields["phone"] = params["phone"];
      requests.fields["open_time"] = params["open_time"];
      requests.fields["close_time"] = params["close_time"];
      requests.fields["bank_number"] = params["bank_number"];
      requests.fields["map_ln"] = params["map_ln"];
      requests.fields["map_lt"] = params["map_lt"];
      // requests.fields["user_id"] = params["user_id"];
      requests.fields["_method"] = params["_method"];
      requests.fields["type"] = params['type'];
      var streamedResponse = await requests.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      print(response.statusCode.toString());
    } catch (e) {
      return "BUG Network => $e";
      print("Bugg $e");
    }
  }

  static Future<String?> ownerProfileGet(String api) async {
    try {
      var uri = Uri.parse(
          "https://in-advance.bingo99.uz/api/owner/restaurant/${HiveRestId().loadId()}");
      var response = await get(uri, headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      print(response.statusCode.toString());

      print(response.statusCode);
    } catch (e) {
      return "BUG Network => $e";
    }
  }

  //<< For Tables Page >> //
  static Future<String?> ownersTable(
      String api, Map<String, String> params) async {
    try {
      var uri = Uri.parse("https://in-advance.bingo99.uz/api/owner/table");
      var response =
          await post(uri, body: jsonEncode(params), headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      print(response.statusCode);
    } catch (e) {
      return "BUG Network table list=> $e";
    }
  }

  // Get Restaurant's tables list  //
  static Future<String?> ownersGetTableList() async {
    try {
      var uri = Uri.parse("https://in-advance.bingo99.uz/api/owner/table");
      var response = await get(uri, headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
      print(response.statusCode);
      print(response.body);
    } catch (e) {
      return "BUG Network => $e";
    }
  }

  // update tables info's //
  static Future<String?> updateTableInfo(
      String id, Map<String, dynamic> params) async {
    try {
      var uri = Uri.parse("https://in-advance.bingo99.uz/api/owner/table/$id");
      var response =
          await post(uri, body: jsonEncode(params), headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return response.statusCode.toString();
      }
         print(response.statusCode.toString());

    } catch (e) {
      return "BUG Network => $e";
    }
  }

  static Future<dynamic> deleteTable(String id) async {
    try {
      var uri = Uri.parse("https://in-advance.bingo99.uz/api/owner/table/$id");
      var response = await delete(uri, headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return response.statusCode;
      }
    } catch (e) {
      return "BUG Network => $e";
    }
  }

  // Category APIS
  static Future<List<Category>> getCategories() async {
    try {
      var uri = Uri.https(BASE, '/api/owner/category');
      var response = await get(uri, headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (jsonDecode(response.body)['data']['data'] as List)
            .map((e) => Category.fromJson(e))
            .toList();
      } else {
        print(response.statusCode);
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
      // return "BUG Network => $e";
    }
  }

  // Store Category APIS
  static Future<Category> storeCategories(
      {required Map<String, dynamic> params}) async {
    try {
      var uri = Uri.https(BASE, '/api/owner/category');
      var response = await post(
        uri,
        headers: headersWithToken,
        body: jsonEncode(
          {
            "name_uz": params["name_uz"],
            "name_ru": params["name_ru"],
            "name_en": params["name_en"],
            "description_uz": params["description_uz"],
            "description_ru": params["description_ru"],
            "description_en": params["description_en"]
          },
        ),
      );
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Category.fromJson(jsonDecode(response.body)['data']);
      } else {
        print(response.statusCode);
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
      // return "BUG Network => $e";
    }
  }

  // Meals APIS
  static Future<List<Meal>> getMeals() async {
    try {
      var uri = Uri.https(BASE, '/api/owner/meal');
      var response = await get(uri, headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (jsonDecode(response.body)['data']['data'] as List)
            .map((e) => Meal.fromJson(e))
            .toList();
      } else {
        print(response.statusCode);
        throw Exception('Failed to load meals');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  // Update Meals APIS
  static Future<Meal> updateMeal({required Map<String, dynamic> params}) async {
    try {
      var uri = Uri.https(BASE, '/api/owner/meal/${params['meal_id']}');
      var requests = MultipartRequest("POST", uri);
      requests.headers.addAll(headersWithToken);
      params["image_path"] != null
          ? requests.files.add(await http.MultipartFile.fromPath(
              "image_path", params['image_path']))
          : print('');
      requests.fields["restaurant_id"] = params['restaurant_id'];
      requests.fields["category_id"] = params['category_id'];
      requests.fields["name_uz"] = params['name_uz'];
      requests.fields["name_ru"] = params['name_ru'];
      requests.fields["name_en"] = params['name_en'];
      requests.fields["description_uz"] = params['description_uz'];
      requests.fields["description_ru"] = params['description_ru'];
      requests.fields["description_en"] = params['description_en'];
      requests.fields["price"] = params['price'];
      requests.fields["_method"] = params['_method'];
      var streamedResponse = await requests.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Meal.fromJson(jsonDecode(response.body)['data']);
      } else {
        print(response.statusCode);
        print(response.body);
        throw Exception('Failed to update meal');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  // Store Meals APIS
  static Future<Meal> storeMeals({required Map<String, dynamic> params}) async {
    try {
      var uri = Uri.https(BASE, '/api/owner/meal');
      var requests = MultipartRequest("POST", uri);
      requests.headers.addAll(headersWithToken);
      requests.files.add(await http.MultipartFile.fromPath(
          'image_path', params['image_path']));
      requests.fields["restaurant_id"] = params['restaurant_id'];
      requests.fields["category_id"] = params['category_id'];
      requests.fields["name_uz"] = params['name_uz'];
      requests.fields["name_ru"] = params['name_ru'];
      requests.fields["name_en"] = params['name_en'];
      requests.fields["description_uz"] = params['description_uz'];
      requests.fields["description_ru"] = params['description_ru'];
      requests.fields["description_en"] = params['description_en'];
      requests.fields["price"] = params['price'];
      var streamedResponse = await requests.send();
      var response = await http.Response.fromStream(streamedResponse);
      print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return Meal.fromJson(jsonDecode(response.body)['data']);
      } else {
        print(response.statusCode);
        throw Exception('Failed to add meal');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  // Restaurants APIS
  static Future<List<Restaurant>> getRestaurants() async {
    try {
      var uri = Uri.https(BASE, '/api/customer/restaurant');
      var response = await get(uri, headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return (jsonDecode(response.body)['data']['data'] as List)
            .map((e) => Restaurant.fromMap(e))
            .toList();
      } else {
        print(response.statusCode.toString());
        throw Exception('Failed to load restaurants');
      }
    } catch (e) {
      print(e.toString());
      throw Exception(e.toString());
    }
  }

  //<< http params >>//

  static Map<String, String> paramsEmpty() {
    Map<String, String> params = new Map();
    return params;
  }

  //<< for register signup parametres >>//
  static Map<String, String> paramsCreate(SignUpAccount ownerAccount) {
    Map<String, String> params = new Map();
    params.addAll({
      "full_name": ownerAccount.full_name,
      "phone": ownerAccount.phone.toString(),
      "login": ownerAccount.login,
      "password": ownerAccount.password,
      "verify_password": ownerAccount.verify_password,
      "role_id": ownerAccount.role_id.toString(),
    });
    return params;
  }

  //<< for register signin parametres >>//
  static Map<String, String> paramsSignIn(SignIn ownerSignIn) {
    Map<String, String> params = new Map();
    params.addAll({
      "login": ownerSignIn.login,
      "password": ownerSignIn.password,
    });
    return params;
  }

  static Map<String, dynamic> paramsOwnerProfile(
      RestaurantProfileModel profileModel) {
    Map<String, dynamic> params = new Map();
    params.addAll({
      "image_path": profileModel.imagePath,
      "logo_path": profileModel.logo,
      "name": profileModel.name,
      "phone": profileModel.phone,
      "open_time": profileModel.openTime,
      "close_time": profileModel.closeTime,
      "bank_number": profileModel.bankNumber,
      "map_ln": "112.1122",
      "map_lt": "112.1222",
      "type": "1",
    });
    return params;
  }

  static Map<String, dynamic> paramsOwnerProfilePut(
      RestaurantProfileModel profileModel) {
    Map<String, dynamic> params = new Map();
    params.addAll({
      "image_path": profileModel.imagePath,
      "logo_path": profileModel.logo,
      "name": profileModel.name,
      "phone": profileModel.phone,
      "open_time": profileModel.openTime,
      "close_time": profileModel.closeTime,
      "bank_number": profileModel.bankNumber,
      "map_ln": profileModel.mapLn,
      "map_lt": profileModel.mapLt,
      "type": "1",
      "_method": "PUT",
    });
    return params;
  }

  //<< Owner's table parametres >>//

  static Map<String, String> paramsOwnerTable(TablesData tablesData) {
    Map<String, String> params = new Map();
    params.addAll({
      "restaurant_id": tablesData.restaurantId,
      "set_num": tablesData.setNum,
      "price": tablesData.price,
      "floor": tablesData.floor,
      "index": tablesData.index,
    });
    return params;
  }

  static Map<String, String> paramsUpdateTable(TableInfos table) {
    Map<String, String> params = new Map();
    params.addAll({
      "_method": "PUT",
      "set_num": table.setNum,
      "price": table.price,
      "floor": table.floor,
      "index": table.index,
    });
    return params;
  }

  //<< Update meal parametres >>//
  static Map<String, String> paramsUpdateMeal(
      String id,
      String restaurantId,
      String categoryId,
      String nameUz,
      String nameRu,
      String nameEn,
      String descUz,
      String descRu,
      String descEn,
      String price) {
    Map<String, String> params = new Map();
    params.addAll({
      "_method": "POST",
      "restaurant_id": restaurantId,
      "category_id": categoryId,
      "name_uz": nameUz,
      "name_ru": nameRu,
      "name_en": nameEn,
      "description_uz": descUz,
      "description_ru": descRu,
      "description_en": descEn,
      "price": price,
    });
    return params;
  }

  //<< Parsing response >>//
  static RestaurantProfileModel profileParse(String body) {
    dynamic json = jsonDecode(body);
    RestaurantProfileModel data = RestaurantProfileModel.fromJson(json);
    return data;
  }

  static List<Data> parseTableList(String response) {
    dynamic json = jsonDecode(response);
    var data = List<Data>.from(json.map((x) => Data.fromJson(x)));
    return data;
  }
}
