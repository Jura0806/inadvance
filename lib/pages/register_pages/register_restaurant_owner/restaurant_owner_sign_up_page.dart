import 'package:flutter/material.dart';
import 'package:inadvance/models/rest_owner_register.dart';
import 'package:inadvance/pages/register_pages/register_restaurant_owner/restaurant_owner_sign_in_page.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';

class OwnerSignUp extends StatefulWidget {
  const OwnerSignUp({Key? key}) : super(key: key);
  static final String id = "owner_sign_in_page";

  @override
  _OwnerSignUpState createState() => _OwnerSignUpState();
}

class _OwnerSignUpState extends State<OwnerSignUp> {
  late final _formKey = GlobalKey<FormState>();

  AutovalidateMode _autoValidate = AutovalidateMode.disabled;
  bool isHiddenPassword1 = true;
  bool isHiddenPassword2 = true;
  bool isLoading = false ;

  var restaurantNameController = TextEditingController();
  var adminPhoneController = TextEditingController();
  var logInController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  late String password = passwordController.text.toString().trim();

  late String restName = restaurantNameController.text.toString();
  late String adminNumber = adminPhoneController.text.toString();
  late String login = logInController.text.toString();
  late String confirmPassword =
      confirmPasswordController.text.toString().trim();

  void _createAccount() async {
    var ownerAccount = OwnerAccount(
        full_name: restName,
        phone: int.parse(adminNumber),
        login: login,
        password: password,
        verify_password: confirmPassword,
    role_id: 3);
    setState(() {
      isLoading = true;
    });
    var response = await OwnerNetwork.postSignUp(
        OwnerNetwork.Api_Register, OwnerNetwork.paramsCreate(ownerAccount));
    setState(() {
      if(response != null){

      }
      isLoading = false;
    });
    print("New User Restaurant => $response");
  }

  void doSignUp() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _createAccount();
      var ownerAccount = OwnerAccount(
          full_name: restName,
          phone: int.parse(adminNumber),
          login: login,
          password: password,
          verify_password: confirmPassword, role_id: 3);

      HiveOwnerSignUp().storeOwner(ownerAccount);
      var account2 = HiveOwnerSignUp().loadOwner();

      print(account2.full_name);
      print(account2.phone);
      print(account2.login);
      print(account2.password);
      print(account2.verify_password);

      Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) => OwnerSignIn()));
    } else {
      setState(() => _autoValidate = AutovalidateMode.always);
    }
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
      body: Container(
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
                  child: Image.asset(
                    "assets/images/user_signup_vector.jpg",
                    width: SizeConfig.screenWidth! / 2,
                  ),
                ),
                const Text(
                  "Ro'yxatdan o'tish",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                const Spacer(
                  flex: 2,
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
                    labelText: "Restoran  nomi",
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
                    labelText: "Admin telefon raqami",
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
                    } else if (input.length < 3 || input.length > 20) {
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
                  validator: (input) => (input!.isEmpty || input != password)
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
                const Spacer(
                  flex: 14,
                ),
                InkWell(
                  onTap: () {
                  doSignUp();
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
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
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
        hintStyle: TextStyle(fontSize: 16),
        prefixText: prefixText,
        prefixStyle: TextStyle(color: Colors.black, fontSize: 16),
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
