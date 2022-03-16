import 'package:hive/hive.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/models/sign_up_account_model.dart';

// << local memory for owner's signUp >> //
class HiveOwnerSignUp {
  var box = Hive.box("OwnerSignUp");

  void storeOwner(SignUpAccount ownerSignUp) {
    box.put("ownerSignUp", ownerSignUp.toJson());
  }

  SignUpAccount loadOwner() {
    var owner = SignUpAccount.fromJson(box.get("ownerSignUp"));
    return owner;
  }

  void removeOwner() {
    box.delete("ownerSignUp");
  }
}

// << local memory for owner's signIn >> //

class HiveOwnerSignIn {
  var box = Hive.box("OwnerSignIn");

  void storeOwner(SignIn ownerLogin) {
    box.put("OwnerSignIn", ownerLogin.toJson());
  }

  SignIn loadOwner() {
    var owner = SignIn.formJson(box.get("OwnerSignIn"));
    return owner;
  }

  void removeOwner() {
    box.delete("OwnerSignIn");
  }
}

// << Owner  token >> //

class OwnerToken{
  var box = Hive.box("OwnerToken");

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
