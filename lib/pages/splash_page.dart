import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inadvance/pages/choose_language_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
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
    if (Hive.box("OwnerSignUp").isEmpty && Hive.box("OwnerSignIn").isEmpty) {
      return Navigator.pushReplacementNamed(context, ChooseLanguage.id);
    } else {
      return Navigator.pushNamedAndRemoveUntil(
          context, OwnerNavigationBar.id, (route) => false);
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
            Container(
              width: 120.w,
              height: 120.h,
              decoration: BoxDecoration(
                  color: MainColors.whiteColor, shape: BoxShape.circle),
            ),
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
