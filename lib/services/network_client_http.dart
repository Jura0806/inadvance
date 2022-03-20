import 'dart:convert';

import 'package:http/http.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/models/sign_up_account_model.dart';

class NetworkClient{

  static String BASE = "in-advance.bingo99.uz";
  static Map<String, String> headers = {
    'Content-Type': 'application/json; charset=UTF-8'
  };

  //<< http APIs >>//
  static String Api_Register = "/api/register";
  static String Api_LogIn = "/api/login";

  //<< http requests >>//
  static Future<String?> clientRegister(
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


  //<< http parameters >>//
  static Map<String, String> paramsCreate(SignUpAccount signUpAccount) {
    Map<String, String> params = new Map();
    params.addAll({
      "full_name": signUpAccount.full_name,
      "phone": signUpAccount.phone.toString(),
      "login": signUpAccount.login,
      "password": signUpAccount.password,
      "verify_password": signUpAccount.verify_password,
      "role_id": signUpAccount.role_id.toString(),
    });
    return params;
  }

  static Map<String, String> paramsSignIn(SignIn  signin) {
    Map<String, String> params = new Map();
    params.addAll({
      "login": signin.login,
      "password": signin.password,
    });
    return params;
  }


}