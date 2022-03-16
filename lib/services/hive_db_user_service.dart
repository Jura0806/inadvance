

// << local memory for client's signUp >> //
import 'package:hive/hive.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/models/sign_up_account_model.dart';

class HiveClientSignUp {
  var box = Hive.box("ClientSignUp");

  void storeClient(SignUpAccount clientSignUp) {
    box.put("clientSignUp", clientSignUp.toJson());
  }

  SignUpAccount loadClient() {
    var client = SignUpAccount.fromJson(box.get("clientSignUp"));
    return client;
  }

  void removeClient() {
    box.delete("clientSignUp");
  }
}

// << local memory for client's signIn >> //

class HiveClientSignIn {
  var box = Hive.box("ClientSignIn");

  void storeClient(SignIn signIn) {
    box.put("clientSignIn", signIn.toJson());
  }

  SignIn loadClient() {
    var client = SignIn.formJson(box.get("clientSignIn"));
    return client;
  }

  void removeClient() {
    box.delete("clientSignIn");
  }
}


// << Client  token >> //

class ClientToken{
  var box = Hive.box("ClientToken");

  void storeToken(String token) {
    box.put("clientToken", token);
  }

  String loadToken() {
    var token = box.get("clientToken");
    return token;
  }

  void removeToken() {
    box.delete("clientToken");
  }
}