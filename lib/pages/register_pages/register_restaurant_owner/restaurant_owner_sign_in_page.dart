

import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/utils/colors.dart';

class OwnerSignIn extends StatefulWidget {
  const OwnerSignIn({Key? key}) : super(key: key);
  static String id = "owner_sign_in";

  @override
  _OwnerSignInState createState() => _OwnerSignInState();
}

class _OwnerSignInState extends State<OwnerSignIn> {
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
            Center(
              child: Image.asset(
                "assets/images/user_signin_vector.jpg",
                width: phoneWidth / 2,
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
            textField(labelText: "To'liq ismingiz"),
            const SizedBox(
              height: 20,
            ),
            textField(
              labelText: "Parol",
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
            const SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.only(left: phoneWidth/2),
              child: Text(
                "Parolni unutdingizmi?",
                style: TextStyle(color: MainColors.greenColor, fontSize: 15),
              ),
            ),
            const Spacer(
              flex: 14,
            ),
            InkWell(
              onTap: () {
                if (true) {
                  Navigator.pushNamedAndRemoveUntil(context, OwnerNavigationBar.id, (route) => false);
                }
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
            )));
  }
}
