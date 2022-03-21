import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/models/sign_up_account_model.dart';
import 'package:inadvance/models/user_profile_model.dart';

import 'hive_db_user_service.dart';

class NetworkClient {
  static String BASE = "in-advance.bingo99.uz";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  static Map<String, String> headersWithToken = {
    'Content-Type': 'application/json; charset=UTF-8',
    'Authorization': 'Bearer ${HiveToken().loadToken()}'
  };

  //<< http APIs >>//
  static String Api_Register = "/api/register";
  static String Api_LogIn = "/api/login";
  static String Api_User_Profile = "/customer/profile";

  static Future<String?> updateUserProfile(
      String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.parse("https://in-advance.bingo99.uz/api/customer/profile");
      var requests = http.MultipartRequest("POST", uri);
      requests.headers.addAll(headersWithToken);
      requests.files.add(await http.MultipartFile.fromPath(
        "image_path",
        params["image_path"],
        // filename: "images"
      ));
      requests.fields["full_name"] = params["full_name"];
      requests.fields["phone"] = params["phone"];
      var streamedResponse = await requests.send();
      var response = await http.Response.fromStream(streamedResponse);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body;
      } else {
        return response.statusCode.toString();
      }
    } catch (e) {
      return "BUG Network => $e";
    }
  }



  static Map<String, dynamic> paramsUpdateUser(UserProfile userProfile) {
    Map<String, dynamic> params = new Map();
    params.addAll({
      "image_path": userProfile.imagePath,
      "phone": userProfile.phone,
      "full_name": userProfile.fullName
    });
    return params;
  }
}
