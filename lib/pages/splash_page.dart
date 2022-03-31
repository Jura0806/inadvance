import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:inadvance/pages/choose_language_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/pages/simple_user_screens/user_navigation_bar.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static final String id = "splash_page";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool isLoggedIn = false;

  _startPage() {
    if (Hive.box("OwnerSignUp").isNotEmpty ||
        Hive.box("OwnerSignIn").isNotEmpty) {
      return Navigator.pushNamedAndRemoveUntil(
          context, OwnerNavigationBar.id, (route) => false);
    } else if (Hive.box("ClientSignUp").isNotEmpty ||
        Hive.box("ClientSignIn").isNotEmpty) {
      return Navigator.pushNamedAndRemoveUntil(
          context, UserNavigationBar.id, (route) => false);
    } else {
      return Navigator.pushReplacementNamed(context, ChooseLanguage.id);
    }
  }

  _initTimer() {
    Timer(Duration(seconds: 2), () {
      _startPage();
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
     _initTimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MainColors.greenColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      width: 2, color: MainColors.whiteColor
                    )
                  ),
                    child: Image.asset(
              "assets/images/logo3.png",
              height: 90.h,
              width: 90.w,
            ))),
            SizedBox(
              height: 20.h,
            ),
            Text(
              "inAdvance",
              style: TextStyle(
                  color: MainColors.whiteColor,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ),
    );
  }
}
