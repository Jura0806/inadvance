import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/pages/simple_user_screens/user_navigation_bar.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/services/hive_db_user_service.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:easy_localization/easy_localization.dart';

class OwnerSignInPage extends StatefulWidget {
  int? roleId;

  OwnerSignInPage({Key? key, this.roleId}) : super(key: key);
  static String id = "owner_sign_in";

  @override
  _OwnerSignInPageState createState() => _OwnerSignInPageState();
}

class _OwnerSignInPageState extends State<OwnerSignInPage> {
  late final _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  late bool isLoading = true;
  String notAvialableLogin = '';

  String? id;
  String? token;

  var logInController = TextEditingController();
  var passwordController = TextEditingController();

  late String login = logInController.text.toString();
  late String password = passwordController.text.toString();

  void _signInAccount() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var ownerSignIn = SignIn(login: login, password: password);

      var response = await OwnerNetwork.ownerRegister(
          OwnerNetwork.Api_LogIn, OwnerNetwork.paramsSignIn(ownerSignIn));

      id = widget.roleId == 1
          ? jsonDecode(response!)["user"]["restaurant"]["id"].toString()
          : jsonDecode(response!)["user"]["id"].toString();
      setState(() {
        if (response != null) {
          HiveToken().storeToken(jsonDecode(response)["token"]);
          doSignIn();
          token = jsonDecode(response)["token"];
        } else {
            notAvialableLogin = "noLogin".tr();
        }
        id != null? HiveRestId().storeId(int.parse(id!)):null;
        isLoading = false;
      });
      print("Login Restaurant => $response");
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
  }

  void doSignIn() {
    var signIn = SignIn(login: login, password: password, id: id, token: token);
    widget.roleId == 1
        ? HiveSignIn().storeOwner(signIn)
        : HiveClientSignIn().storeClient(signIn);

    // var loginAccount = HiveOwnerSignIn().loadOwner();
    // var loginClient = HiveClientSignIn().loadClient();
    //
    // print(loginAccount.login);
    // print(loginAccount.password);
    // print(OwnerToken().loadToken());

    print(HiveToken().loadToken());

    widget.roleId == 1
        ? Navigator.pushNamedAndRemoveUntil(
            context, OwnerNavigationBar.id, (route) => false)
        : Navigator.pushNamedAndRemoveUntil(
            context, UserNavigationBar.id, (route) => false);
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
                child: SvgPicture.asset(
                  "assets/images/sign_in_vector.svg",
                  width: SizeConfig.screenWidth! / 2,
                ),
              ),
              Spacer(),
              Text(
                "loginInfo",
                style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),
              ).tr(),
              const Spacer(
                flex: 2,
              ),
              TextFormField(
                  controller: logInController,
                  cursorColor: MainColors.greenColor,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "validateLogin".tr();
                    } else {
                      return null;
                    }
                  },
                  decoration: buildDecorate(labelText: "logIn".tr())),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                  controller: passwordController,
                  cursorColor: MainColors.greenColor,
                  validator: (input) {
                    if (input!.isEmpty) {
                      return ;
                    } else {
                      return null;
                    }
                  },
                  obscureText: isHiddenPassword,
                  decoration: buildDecorate(
                    labelText: "password".tr(),
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
              Align(
                alignment: Alignment.topRight,
                child: TextButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(
                        context, OwnerSignUp.id, (route) => false);
                  },
                  child: Text("directionSignUp",
                      style: TextStyle(
                          color: MainColors.greenColor, fontSize: 15.sp)).tr(),
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
                        setState(() {
                          isLoading = true;
                        });
                      },
                      child: Container(
                        height: 45.h,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: MainColors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: MainColors.whiteColor, fontSize: 17.sp),
                          ).tr(),
                        ),
                      ),
                    )
                  : CircularProgressIndicator(
                      color: MainColors.greenColor,
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
              color: MainColors.greyColor, width: 1, style: BorderStyle.solid),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(
              color: MainColors.greenColor, width: 1, style: BorderStyle.solid),
        ));
  }
}
