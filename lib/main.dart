import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/pages/choose_language_page.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_in_page.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_up_page.dart';
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
  await Hive.openBox("ownerToken");
  await Hive.openBox("ClientSignUp");
  await Hive.openBox("ClientSignIn");
  await Hive.openBox("ClientToken");
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Set the fit size (fill in the screen size of the device in the design) If the design is based on the size of the iPhone6 ​​(iPhone6 ​​750*1334)
    return ScreenUtilInit(
      designSize: Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: () => MaterialApp(
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
        builder: (context, widget) {
          ScreenUtil.setContext(context);
          return MediaQuery(
            //Setting font does not change with system font size
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: widget!,
          );
        },
        home: SplashPage(),
        routes: {
          SplashPage.id: (context) => SplashPage(),
          AboutAppPage.id: (context) => AboutAppPage(),
          ChooseLanguage.id: (context) => ChooseLanguage(),
          FirstRegister.id: (context) => FirstRegister(),
          OwnerSignUp.id: (context) => OwnerSignUp(),
          OwnerSignInPage.id: (context) => OwnerSignInPage(),
          UserNavigationBar.id: (context) => UserNavigationBar(),
          UserSettingScreen.id: (context) => UserSettingScreen(),
          OwnerNavigationBar.id: (context) => OwnerNavigationBar(),
          OwnerSettingScreen.id: (context) => OwnerSettingScreen(),

        }
      ),
    );
  }
}

