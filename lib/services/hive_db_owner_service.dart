

import 'package:hive/hive.dart';
import 'package:inadvance/models/rest_owner_login.dart';
import 'package:inadvance/models/rest_owner_register.dart';

class HiveOwnerSignUp{

  var box = Hive.box("OwnerSignUp");

  void storeOwner(OwnerAccount ownerSignUp){
    box.put("ownerSignUp",  ownerSignUp.toJson());
  }

  OwnerAccount loadOwner(){
    var owner = OwnerAccount.fromJson(box.get("ownerSignUp"));
    return owner;
  }

  void removeOwner(){
   box.delete("ownerSignUp");
  }
}

// << local memory for owner's signin >> //

class HiveOwnerSignIn{

  var box = Hive.box("OwnerSignIn");

  void storeOwner(OwnerLogin ownerLogin){
    box.put("OwnerSignIn",  ownerLogin.toJson());
  }

  OwnerLogin loadOwner(){
    var owner = OwnerLogin.formJson(box.get("OwnerSignIn"));
    return owner;
  }

  void removeOwner(){
    box.delete("OwnerSignIn");
  }

}