import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:http_parser/http_parser.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/models/sign_up_account_model.dart';
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
  static String Api_Restaurant_Profile = "/api/owner/restaurant";

  //<<status codes >> //
  static int registerStatusCode = 0;
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

  static Future<String> ownerProfile1(
      String api, Map<String, dynamic> params) async {
    try {
      var uri = Uri.parse("https://in-advance.bingo99.uz/api/owner/restaurant");
      var requests = http.MultipartRequest("POST", uri);
      requests.headers.addAll(headersWithToken);
      requests.files.add(http.MultipartFile(
        //"image_path", params["image_path"],
        "file",
        params["image_path"].readAsBytes().asStream(),
        params["image_path"].lengthSync(),
        filename: "image_path",
        //contentType: new MediaType('application', 'x-tar'),
        contentType: MediaType("image", "jpeg"),
      ));
      requests.fields["name"] = params["name"];
      requests.fields["phone"] = params["phone"];
      requests.fields["open_time"] = params["open_time"];
      requests.fields["close_time"] = params["close_time"];
      requests.fields["bank_number"] = params["bank_number"];
      requests.fields["map_In"] = params["map_In"];
      requests.fields["map_It"] = params["map_It"];
      var response = await requests.send();
      // print(params["image_path"]);
      // print(params["name"]);
      // print(params["phone"]);
      // print(params["open_time"]);
      // print(params["close_time"]);
      // print(params["bank_number"]);
      // print(params["map_In"]);
      // print(params["map_It"]);
      // print(headersWithToken);
      // print(headers);
      // print(OwnerToken().loadToken().toString() == "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYTJkMTdjMzdjNTMwYWUzOWYwODBlZGY0OWNiMWE4NWU4ZTE3YjdiYmY0MDNjMzYwNGExMWVlNWVlNzIzNTM1MGMwYTlmM2QxNjE3N2M3MjQiLCJpYXQiOjE2NDczNzExOTUuNzEwMzcsIm5iZiI6MTY0NzM3MTE5NS43MTAzNzIsImV4cCI6MTY3ODkwNzE5NS43MDQ0NTcsInN1YiI6IjI3Iiwic2NvcGVzIjpbIm93bmVyIl19.Zp0QJjMQaH0GZTak4npFmzUGW-TpfSAVahC8YRC4AnDMSNEF0fCncct_13e1gmMpotH6BzOwMFDou8XAsxwk3grEvVxE8og77pI8EILg-auCraEjjrAiJM2P3TaiB2lWNYEo_DLbEsKxHZurN5yWpIPC5kMhnt0kXD5NEoRaCCLMuMxCtRgYvEvaXVg2swLaEBPmfRgyl5gWbjVkEpn_ubYCZfXHlzSZOJEjkrkKOh3xHu0-7RZLk_0gLr1bRyZ3k3cRu6rivxlJFRoy_RtCBWMyZvTJbfYhg2jExsfTm-bk_N90c3FwFyLlWPokI3xwhSRvb9zjdoPEloajzhLfMQkGyj2tFZ1Gc3nhe0aM86hc_4J3dqwCOEHX0SiEnPg76atyZisiTh3-nE83SURd3EkNEpKQSyBNEHrl4tH4k8r01U9phGq6tUwPqaBo8r6YGTMQiQgRfTMxGVIgeLyhEFvmFAWHdBmbrXvVIDJWTKyXFgk0xLpwbJit5bEJ-2X_m5s6fXRpq3b50xyk5rN789Ki_nQmmMgiHCyQqRexEkJLbppnJWEcPjjkX9LFoC1W3JY7mSczTFrVPufKpFO-hZJQlr88zsEWA1gNs3LxBSXehLkfV2rWN4LiSdZqKKSFu9JsFRiXgnMLPwDmi9u3tYVcmkT8LN5fhEpPCz9bHGA");
      // // print('Bearer ${OwnerToken().loadToken()}');

        if (response.statusCode == 200 || response.statusCode == 201) {
          return response.toString();
        }else{
          return response.statusCode.toString();
        }
    } catch (e) {
      return "BUG Network => $e";
    }
  }

  //<< http params >>//
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
