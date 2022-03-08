import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/pages/choose_language_page.dart';
import 'package:inadvance/pages/register_pages/register_restaurant_owner/restaurant_owner_sign_in_page.dart';
import 'package:inadvance/pages/register_pages/register_restaurant_owner/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/pages/register_pages/register_user/user_sign_up_page.dart';
import 'package:inadvance/pages/register_pages/who_are_you_register_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_setting_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_navigation_bar.dart';
import 'package:inadvance/pages/simple_user_screens/user_setting_screen.dart';
import 'package:inadvance/pages/splash_page.dart';

void main() async {
  await Hive.initFlutter();
  await Hive.openBox("OwnerSignUp");
  await Hive.openBox("OwnerSignIn");
  await Hive.openBox("OwnerProfile");
  await Hive.openBox("ownerToken");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'inAdvance',
      theme: ThemeData(
        primarySwatch: Colors.grey,
        textTheme: TextTheme(
          headline1: TextStyle(fontFamily: "Gilroy"),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
      ),
      home: SplashPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        AboutAppPage.id: (context) => AboutAppPage(),
        ChooseLanguage.id: (context) => ChooseLanguage(),
        FirstRegister.id: (context) => FirstRegister(),
        UserSignUp.id: (context) => UserSignUp(),
        OwnerSignUp.id: (context) => OwnerSignUp(),
        OwnerSignInPage.id: (context) => OwnerSignInPage(),
        UserNavigationBar.id: (context) => UserNavigationBar(),
        UserSettingScreen.id: (context) => UserSettingScreen(),
        OwnerNavigationBar.id: (context) => OwnerNavigationBar(),
        OwnerSettingScreen.id: (context) => OwnerSettingScreen(),

      },
    );
  }
}
