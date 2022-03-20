import 'dart:convert';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/models/sign_up_account_model.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_in_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/pages/simple_user_screens/user_navigation_bar.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/services/hive_db_user_service.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';

class OwnerSignUp extends StatefulWidget {
  int? roleId;

  OwnerSignUp({Key? key, this.roleId}) : super(key: key);
  static final String id = "owner_sign_in_page";

  @override
  _OwnerSignUpState createState() => _OwnerSignUpState();
}

class _OwnerSignUpState extends State<OwnerSignUp> {
  late final _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool isHiddenPassword1 = true;
  bool isHiddenPassword2 = true;
  bool isLoading = false;

  var restaurantNameController = TextEditingController();
  var adminPhoneController = TextEditingController();
  var logInController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  late String password = passwordController.text.toString();
  late String restName = restaurantNameController.text.toString();
  late String adminNumber = adminPhoneController.text.toString();
  late String login = logInController.text.toString();
  late String confirmPassword = confirmPasswordController.text.toString();

  String? id;
  String? token;

  void _createAccount() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var ownerAccount = SignUpAccount(
          full_name: restName,
          phone: int.parse(adminNumber),
          login: login,
          password: password,
          verify_password: confirmPassword,
          role_id: widget.roleId == 1 ? 2 : 3);
      setState(() {
        isLoading = true;
      });
      var response = await OwnerNetwork.ownerRegister(
          OwnerNetwork.Api_Register, OwnerNetwork.paramsCreate(ownerAccount));

        if (response != null) {
          setState(() {
          doSignUp();
          HiveToken().storeToken(jsonDecode(response)["data"]["token"]);
         id = jsonDecode(response)["data"]["id"];
         token = jsonDecode(response)["data"]["token"];

          isLoading = false;
          });
        }
      widget.roleId == 1
          ? print("New User Restaurant => $response")
          : print("New User Client => $response");
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
  }

  void doSignUp() {
    var ownerAccount = SignUpAccount(
      full_name: restName,
      phone: int.parse(adminNumber),
      login: login,
      password: password,
      verify_password: confirmPassword,
      role_id: widget.roleId == 1 ? 2 : 3,
      id: id,
      token: token,
    );
    HiveSignUp().storeOwner(ownerAccount);

    var account2 = HiveSignUp().loadOwner();
    //
    print(account2);
    print(account2.token);

    print(HiveToken().loadToken());


    widget.roleId == 1
        ? Navigator.pushNamedAndRemoveUntil(
            context, OwnerNavigationBar.id, (route) => false)
        : Navigator.pushNamedAndRemoveUntil(
            context, UserNavigationBar.id, (route) => false);
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
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Container(
              height: SizeConfig.screenHeight,
              child: Form(
                key: _formKey,
                autovalidateMode: _autoValidate,
                child: Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 20,
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: SvgPicture.asset(
                          "assets/images/sign_up_vector.svg",
                          width: SizeConfig.screenWidth! / 2,
                        ),
                      ),
                      SizedBox(
                        height: 7,
                      ),
                      Text(
                        "Ro'yxatdan o'tish",
                        style: TextStyle(
                            fontSize: 20.sp, fontWeight: FontWeight.w600),
                      ),
                      const Spacer(
                        flex: 1,
                      ),
                      TextFormField(
                        controller: restaurantNameController,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return "Iltimos Restoran nomini kiriting";
                          }
                        },
                        onSaved: (input) => restName = input!,
                        decoration: buildDecorate(
                          labelText: widget.roleId == 2
                              ? "FullName"
                              : "Restoran  nomi",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: adminPhoneController,
                        keyboardType: TextInputType.number,
                        validator: (input) {
                          if (input!.isEmpty) {
                            return "Iltimos telefon raqam kiriting!";
                          } else if (input.length != 9) {
                            return "Xato nomer kiritildi";
                          } else {
                            return null;
                          }
                        },
                        decoration: buildDecorate(
                          labelText: widget.roleId == 2
                              ? "Telefon raqam"
                              : "Admin telefon raqami",
                          hintText: "991234567",
                          prefixText: "+998 ",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        validator: (input) {
                          if (input!.isEmpty) {
                            return "Iltimos LOgIn kiriting!";
                          } else if (input.length < 6 || input.length > 20) {
                            return "Bu LogIn tavsiya etilmaydi!";
                          } else {
                            return null;
                          }
                        },
                        onSaved: (input) => login = input!,
                        decoration: buildDecorate(
                          labelText: "Ilovaga kirish uchun login",
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: passwordController,
                        validator: (input) {
                          password = input!;
                          if (input.isEmpty) {
                            return "Iltimos LogIn uchun parol kiriting";
                          }
                        },
                        onSaved: (input) => password = input!,
                        obscureText: isHiddenPassword1,
                        decoration: buildDecorate(
                          labelText: "Ilova uchun parol",
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isHiddenPassword1 = !isHiddenPassword1;
                                });
                              },
                              child: Icon(isHiddenPassword1
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      TextFormField(
                        controller: confirmPasswordController,
                        validator: (input) =>
                            (input!.isEmpty || input != password)
                                ? "Parol to'g'ri kirtilmadi"
                                : null,
                        onSaved: (input) => confirmPassword = input!,
                        obscureText: isHiddenPassword2,
                        decoration: buildDecorate(
                          labelText: "Parolni qaytadan yozish",
                          suffixIcon: InkWell(
                              onTap: () {
                                setState(() {
                                  isHiddenPassword2 = !isHiddenPassword2;
                                });
                              },
                              child: Icon(isHiddenPassword2
                                  ? Icons.visibility
                                  : Icons.visibility_off)),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Agar Akkauntingiz mavjud bo'lsa  => ",
                            style: TextStyle(color: Colors.grey[700]),
                          ),
                          TextButton(
                              onPressed: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (BuildContext context) =>
                                        OwnerSignInPage(
                                          roleId: widget.roleId,
                                        )));
                              },
                              child: Text(
                                "LogIn",
                                style: TextStyle(
                                    color: MainColors.greenColor,
                                    fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                      const Spacer(
                        flex: 14,
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            bottom: 40.h,
            height: 45.h,
            width: SizeConfig.screenWidth,
            child: InkWell(
              onTap: () {
                _createAccount();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Container(
                  decoration: BoxDecoration(
                    color: MainColors.greenColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                    child: Text(
                      "Davom etish",
                      style: TextStyle(
                          color: MainColors.whiteColor, fontSize: 17.sp),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  InputDecoration buildDecorate(
      {required String labelText,
      Widget? suffixIcon,
      String? hintText,
      String? prefixText}) {
    return InputDecoration(
        labelText: labelText,
        suffixIcon: suffixIcon,
        hintText: hintText,
        hintStyle: TextStyle(fontSize: 15.sp),
        prefixText: prefixText,
        prefixStyle: TextStyle(color: Colors.black, fontSize: 15.sp),
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
