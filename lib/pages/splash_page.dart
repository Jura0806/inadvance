
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/pages/choose_language_page.dart';
import 'package:inadvance/utils/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  static final String id = "splash_page";

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

    bool isLoggedIn = false;

  _initTimer(){
    Timer(Duration(seconds: 3), (){
      if(isLoggedIn){
       // Navigator.pushReplacementNamed(context, HomePage.id);
      }else{
        Navigator.pushReplacementNamed(context, ChooseLanguage.id);
      }
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
              width: 120,
              height: 120,
              decoration: BoxDecoration(
                color: MainColors.whiteColor,
                shape: BoxShape.circle
              ),
            ),
            SizedBox(height: 20,),
            Text("inAdvance", style: TextStyle(color: MainColors.whiteColor, fontSize: 20, fontWeight: FontWeight.bold),),
          ],
        ),
      ),
    );
  }
}




















