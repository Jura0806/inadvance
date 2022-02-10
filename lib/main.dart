import 'package:flutter/material.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/pages/choose_language_page.dart';
import 'package:inadvance/pages/register_pages/register_restaurant_owner/restaurant_owner_sign_in_page.dart';
import 'package:inadvance/pages/register_pages/register_restaurant_owner/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/pages/register_pages/register_user/user_sign_up_page.dart';
import 'package:inadvance/pages/register_pages/who_are_you_register_page.dart';
import 'package:inadvance/pages/simple_user_screens/user_navigation_bar.dart';
import 'package:inadvance/pages/splash_page.dart';
import 'package:inadvance/utils/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'inAdvance',
      theme: ThemeData(
       primarySwatch: Colors.grey,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
        ),
       // backgroundColor: Colors.white
      ),
      home: SplashPage(),
      routes: {
        SplashPage.id: (context) => SplashPage(),
        AboutAppPage.id: (context) => AboutAppPage(),
        ChooseLanguage.id: (context) => ChooseLanguage(),
        FirstRegister.id: (context) => FirstRegister(),
        UserSignUp.id: (context) => UserSignUp(),
        OwnerSignUp.id: (context) => OwnerSignUp(),
        OwnerSignIn.id: (ccontext) => OwnerSignIn(),
        UserNavigationBar.id: (context) => UserNavigationBar(),
      },
    );
  }
}
