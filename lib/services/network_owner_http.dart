import 'dart:convert';

import 'package:http/http.dart';
import 'package:inadvance/models/rest_owner_register.dart';

class OwnerNetwork {
  static String BASE = "in-advance.bingo99.uz";

  //<< http APIs >>//
  static String Api_Register = "/api/register";
  static String Api_LogIn = "/api/login";

  //<< http requests >>//
  static Future<String?> postSignUp(
      String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var response = await post(uri, body: jsonEncode(params),);
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body.toString();
      }
    } catch (e) {
      return "BUG Network => $e";
    }
  }

  static Future<String?> postSignIn(
      String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.https(BASE, api);
      var response = await post(uri, body: jsonEncode(params));
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.body.toString();
      }
    } catch (e) {
      return "BUG Network => $e";
    }
  }

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
}
