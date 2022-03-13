import 'package:flutter/material.dart';
import 'package:inadvance/pages/register_pages/register_user/user_sign_in_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);
  static final String id = "user_sign_up_page";

  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {

  //final GlobalKey<FormState> _globalKey = GlobalKey<FormState>();

  var fullNameController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var loginNameController = TextEditingController();
  var confirmLoginController = TextEditingController();

  late String fulname = fullNameController.text.toString();
  late String phoneNumber = fullNameController.text.toString();
  late String loginNumber = fullNameController.text.toString();
  late String confirmLogin = fullNameController.text.toString();

  bool isHiddenPassword = true;

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: Column(
          children: [
            const Spacer(
              flex: 1,
            ),
            Center(
              child: Image.asset(
                "assets/images/user_signup_vector.jpg",
                width: phoneWidth / 2,
              ),
            ),
             Text(
              "Ro'yxatdan o'tish",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
            ),
            const Spacer(
              flex: 3,
            ),
            textField(
                labelText: "To'liq ismingiz", controller: fullNameController),
            const SizedBox(
              height: 20,
            ),
            textField(
                labelText: "Telefon raqamingiz",
                controller: phoneNumberController),
            const SizedBox(
              height: 20,
            ),
            textField(
              labelText: "Ilova uchun parol",
              controller: loginNameController,
              icon: InkWell(
                  onTap: () {
                    setState(() {
                      isHiddenPassword = !isHiddenPassword;
                    });
                  },
                  child: Icon(isHiddenPassword
                      ? Icons.visibility
                      : Icons.visibility_off)),
            ),
            const SizedBox(
              height: 20,
            ),
            textField(
              labelText: "Parolni qaytadan yozish",
              controller: confirmLoginController,
              icon: InkWell(
                onTap: () {
                  setState(() {
                    isHiddenPassword = !isHiddenPassword;
                  });
                },
                child: Icon(
                    isHiddenPassword ? Icons.visibility : Icons.visibility_off),
              ),
            ),
            const Spacer(
              flex: 14,
            ),
            InkWell(
              onTap: () {
                // if(!_globalKey.currentState!.validate()){
                //   return;
                // }
                if (true) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UserSignIn()));
                }
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
                    "Davom etish",
                    style:
                        TextStyle(color: MainColors.whiteColor, fontSize: 17.sp),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40.h),
          ],
        ),
      ),
    );
  }

  Widget textField(
      {required String labelText, InkWell? icon, required var controller}) {
    return Form(
     // key: _globalKey,
      child: TextFormField(
          controller: controller,
          validator: (value) {
            if (value!.isEmpty) {
              return "Iltimos ma'lumotlarni to'ldiring";
            }
          },
          obscureText: isHiddenPassword,
          decoration: InputDecoration(
              labelText: labelText,
              suffixIcon: icon,
              // labelStyle: TextStyle(color: MainColors.greenColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: MainColors.greenColor,
                    width: 1,
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: MainColors.textFieldColor,
                    width: 1,
                    style: BorderStyle.solid),
              ))),
    );
  }
}
