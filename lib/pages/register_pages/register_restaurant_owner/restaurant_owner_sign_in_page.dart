import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:inadvance/models/rest_owner_login.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';

class OwnerSignInPage extends StatefulWidget {
  const OwnerSignInPage({Key? key}) : super(key: key);
  static String id = "owner_sign_in";

  @override
  _OwnerSignInPageState createState() => _OwnerSignInPageState();
}

class _OwnerSignInPageState extends State<OwnerSignInPage> {
  late final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  late bool isLoading = true;
  String notAvialableLogin = '';

  var logInController = TextEditingController();
  var passwordController = TextEditingController();

  late String login = logInController.text.toString();
  late String password = passwordController.text.toString();

  void _signInAccount() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var ownerSignIn = OwnerSignIn(login: login, password: password);
      setState(() {
        isLoading = true;
      });
      var response = await OwnerNetwork.ownerRegister(
          OwnerNetwork.Api_LogIn, OwnerNetwork.paramsSignIn(ownerSignIn));
      setState(() {
        if (response != null) {
          OwnerToken().storeToken(jsonDecode(response)["token"]);
          doSignIn();
        } else {
          setState(() {
            notAvialableLogin = "Bu login mavjud emas";
          });
        }
        isLoading = false;
      });
      print("Login Restaurant => $response");
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
  }

  void doSignIn() {
    var ownerSignIn = OwnerSignIn(login: login, password: password);
    HiveOwnerSignIn().storeOwner(ownerSignIn);
    var loginAccount = HiveOwnerSignIn().loadOwner();

    print(loginAccount.login);
    print(loginAccount.password);
    print(OwnerToken().loadToken());

    Navigator.pushNamedAndRemoveUntil(
        context, OwnerNavigationBar.id, (route) => false);
  }

  bool isHiddenPassword = true;

  String loginError() {
    return notAvialableLogin;
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Form(
          key: _formKey,
          autovalidateMode: _autoValidate,
          child: Column(
            children: [
              Center(
                child: Image.asset(
                  "assets/images/user_signin_vector.jpg",
                  width: SizeConfig.screenWidth! / 2,
                ),
              ),
              Spacer(),
              const Text(
                "Kirish",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Spacer(
                flex: 2,
              ),
              TextFormField(
                  controller: logInController,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Iltimos  login kiriting!";
                    } else {
                      return null;
                    }
                  },
                  decoration: buildDecorate(labelText: "Login")),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: passwordController,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Iltimos  login kiriting!";
                    } else {
                      return null;
                    }
                  },
                  obscureText: isHiddenPassword,
                  decoration: buildDecorate(
                    labelText: "Parol",
                    icon: InkWell(
                      onTap: () {
                        setState(() {
                          isHiddenPassword = !isHiddenPassword;
                        });
                      },
                      child: Icon(isHiddenPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  )),
              const SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.only(left: SizeConfig.screenWidth! / 2),
                child: Text(
                  "Parolni unutdingizmi?",
                  style: TextStyle(color: MainColors.greenColor, fontSize: 15),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(loginError()),
              const Spacer(
                flex: 14,
              ),
              isLoading
                  ? InkWell(
                      onTap: () {
                        _signInAccount();
                      },
                      child: Container(
                        height: 55,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: MainColors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Davom etish",
                            style: TextStyle(
                                color: MainColors.whiteColor, fontSize: 20),
                          ),
                        ),
                      ),
                    )
                  : CircularProgressIndicator(
                      backgroundColor: Colors.white,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(MainColors.greenColor),
                    ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }

  InputDecoration buildDecorate({required String labelText, InkWell? icon}) {
    return InputDecoration(
        labelText: labelText,
        suffixIcon: icon,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: MainColors.greenColor, width: 1, style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: MainColors.textFieldColor,
              width: 1,
              style: BorderStyle.solid),
        ));
  }
}
