import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_navigation_bar.dart';
import 'package:inadvance/utils/colors.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

class UserSignIn extends StatefulWidget {
  const UserSignIn({Key? key}) : super(key: key);

  @override
  _UserSignInState createState() => _UserSignInState();
}

class _UserSignInState extends State<UserSignIn> {
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
<<<<<<< HEAD
        padding: EdgeInsets.symmetric(
=======
        padding: const EdgeInsets.symmetric(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
          const   Spacer(),
            const Text(
              "Kirish",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
=======
            const Spacer(),
            Text(
              "Kirish",
              style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.w600),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
              margin: EdgeInsets.only(left: phoneWidth/2),
              child: Text(
                "Parolni unutdingizmi?",
                style: TextStyle(color: MainColors.greenColor, fontSize: 15),
=======
              margin: EdgeInsets.only(left: phoneWidth / 2),
              child: Text(
                "Parolni unutdingizmi?",
                style: TextStyle(color: MainColors.greenColor, fontSize: 13.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              ),
            ),
            const Spacer(
              flex: 14,
            ),
            InkWell(
              onTap: () {
                if (true) {
<<<<<<< HEAD
                Navigator.pushNamedAndRemoveUntil(context, UserNavigationBar.id, (route) => false);
                }
              },
              child: Container(
                height: 55,
=======
                  Navigator.pushNamedAndRemoveUntil(
                      context, UserNavigationBar.id, (route) => false);
                }
              },
              child: Container(
                height: 45.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.greenColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Davom etish",
<<<<<<< HEAD
                    style:
                        TextStyle(color: MainColors.whiteColor, fontSize: 20),
=======
                    style: TextStyle(
                        color: MainColors.whiteColor, fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  ),
                ),
              ),
            ),
<<<<<<< HEAD
            const SizedBox(height: 40),
=======
            SizedBox(height: 40.h),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
