import 'package:hive/hive.dart';
import 'package:inadvance/models/rest_owner_login.dart';
import 'package:inadvance/models/rest_owner_register.dart';
import 'package:inadvance/models/restaurant_profile_model.dart';

// << local memory for owner's signUp >> //
class HiveOwnerSignUp {
  var box = Hive.box("OwnerSignUp");

  void storeOwner(OwnerAccount ownerSignUp) {
    box.put("ownerSignUp", ownerSignUp.toJson());
  }

  OwnerAccount loadOwner() {
    var owner = OwnerAccount.fromJson(box.get("ownerSignUp"));
    return owner;
  }

  void removeOwner() {
    box.delete("ownerSignUp");
  }
}

// << local memory for owner's signIn >> //

class HiveOwnerSignIn {
  var box = Hive.box("OwnerSignIn");

  void storeOwner(OwnerSignIn ownerLogin) {
    box.put("OwnerSignIn", ownerLogin.toJson());
  }

  OwnerSignIn loadOwner() {
    var owner = OwnerSignIn.formJson(box.get("OwnerSignIn"));
    return owner;
  }

  void removeOwner() {
    box.delete("OwnerSignIn");
  }
}

// << Owner Profile and  token >> //

class OwnerProfile {
  var box = Hive.box("OwnerProfile");

  void storeProfile(RestaurantProfileModel profileModel) {
    box.put("ownerProfile", profileModel.toJson());
  }

  RestaurantProfileModel loadProfile() {
    var profile = RestaurantProfileModel.fromJson(box.get("ownerProfile"));
    return profile;
  }

  void removeProfile() {
    box.delete("ownerProfile");
  }
}

class OwnerToken{
  var box = Hive.box<dynamic>("OwnerToken");

  void storeToken(String token) {
    box.put("ownerToken", token);
  }

  String loadToken() {
    var token = box.get("ownerToken");
    return token;
  }

  void removeToken() {
    box.delete("ownerToken");
  }
}
