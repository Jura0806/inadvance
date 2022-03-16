<<<<<<< HEAD
import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart';
import 'package:inadvance/models/category_model.dart';
import 'package:inadvance/models/meal_model.dart';
=======
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
import 'package:inadvance/models/rest_owner_login.dart';
import 'package:inadvance/models/rest_owner_register.dart';
import 'package:inadvance/models/restaurant_profile_model.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';

class OwnerNetwork {
  static String BASE = "in-advance.bingo99.uz";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };
  static Map<String, String> headersWithToken = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${OwnerToken().loadToken()}'
  };

  //<< http APIs >>//
  static String Api_Register = "/api/register";
  static String Api_LogIn = "/api/login";
  static String Api_Restaurant_Profile = "api/owner/restaurant";

  //<< http requests >>//
<<<<<<< HEAD
  static Future<String?> ownerRegister(
      String api, Map<String, String> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var response =
          await post(uri, body: jsonEncode(params), headers: headers);
=======
  static Future<String?> ownerRegister(String api,
      Map<String, String> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var response =
      await post(uri, body: jsonEncode(params), headers: headers);
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      }
    } catch (e) {
      return "BUG Network => $e";
    }
  }

<<<<<<< HEAD
  static Future<String?> ownerProfile(
      String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var response =
          await post(uri, body: jsonEncode(params), headers: headersWithToken);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
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

  // static Future<String?> ownerProfile1(
  //     String api, Map<String, dynamic> params) async {
  //   try {
  //     var uri = Uri.https(BASE, api);
  //     var requests = http.MultiPartRequest("POST", uri)
=======
  // static Future<String?> ownerProfile(String api,
  //     Map<String, dynamic> params) async {
  //   try {
  //     var uri = Uri.https(BASE, api);
  //     var response =
  //     await post(uri, body: jsonEncode(params), headers: headersWithToken);
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       return response.body;
  //     }
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
  //   } catch (e) {
  //     return "BUG Network => $e";
  //   }
  // }

<<<<<<< HEAD
=======
  static Future<String?> ownerProfile1(String api,
      Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var requests = http.MultipartRequest("POST", uri);
      requests.headers.addAll(headersWithToken);
      requests.files.add(await http.MultipartFile
          .fromPath("image_path", params["image_path"]));
      requests.fields["name"] = params["name"];
      requests.fields["phone"] = params["phone"];
      requests.fields["open_time"] = params["open_time"];
      requests.fields["close_time"] = params["close_time"];
      requests.fields["bank_number"] = params["bank_number"];
      requests.fields["map_In"] = params["map_In"];
      requests.fields["map_It"] = params["map_It"];
      var response = await requests.send();
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.toString();
      }
    } catch (e) {
      return "BUG Network => $e";
    }
  }


>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
  //<< http params >>//
  static Map<String, String> paramsCreate(OwnerAccount ownerAccount) {
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

  static Map<String, String> paramsSignIn(OwnerSignIn ownerSignIn) {
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
      "image_path": profileModel.image_path,
      "name": profileModel.name,
      "phone": profileModel.phone,
      "open_time": profileModel.open_time,
      "close_time": profileModel.close_time,
      "bank_number": profileModel.bank_number,
      "map_In": "112.1122",
      "map_It": "112.1222",
    });
    return params;
  }

  static Map<String, dynamic> paramsOwnerProfilePut(
      RestaurantProfileModel profileModel) {
    Map<String, dynamic> params = new Map();
    params.addAll({
      "image_path": profileModel.image_path,
      "name": profileModel.name,
      "phone": profileModel.phone,
      "open_time": profileModel.open_time,
      "close_time": profileModel.close_time,
      "bank_number": profileModel.bank_number,
      "map_In": profileModel.map_In,
      "map_It": profileModel.map_It,
      "_method": "PUT",
    });
    return params;
  }
}
