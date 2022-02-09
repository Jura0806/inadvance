import 'package:flutter/material.dart';
import 'package:inadvance/utils/colors.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({Key? key}) : super(key: key);
  static final String id = "user_sign_up_page";

  @override
  _UserSignUpState createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
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
        padding: EdgeInsets.symmetric(
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
            const Text(
              "Ro'yxatdan o'tish",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            const Spacer(
              flex: 3,
            ),
            textField(labelText: "To'liq ismingiz"),
            const SizedBox(
              height: 20,
            ),
            textField(labelText: "Telefon raqamingiz"),
            const SizedBox(
              height: 20,
            ),
            textField(
                labelText: "Ilova uchun parol",
                icon: InkWell(
                    onTap: (){
                  setState(() {
                    isHiddenPassword = !isHiddenPassword;
                  });
                },
                    child: Icon(isHiddenPassword? Icons.visibility : Icons.visibility_off)),),
            const SizedBox(
              height: 20,
            ),
            textField(
                labelText: "Parolni qaytadan yozish",
                icon: InkWell(
                  onTap: (){
                    setState(() {
                      isHiddenPassword = !isHiddenPassword;
                    });
                  },
                  child: Icon(isHiddenPassword? Icons.visibility : Icons.visibility_off),),),
            const Spacer(
              flex: 14,
            ),
            InkWell(
              onTap: () {
                if (true) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UserSignUp()));
                } else {}
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
                    style:
                        TextStyle(color: MainColors.whiteColor, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget textField({required String labelText, InkWell? icon}) {
    return TextFormField(
        obscureText: isHiddenPassword ,
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
            )));
  }
}
