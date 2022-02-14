import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_home_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_order_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_setting_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_search_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_savatcha_screen.dart';
import 'package:inadvance/utils/colors.dart';

class UserNavigationBar extends StatefulWidget {
  const UserNavigationBar({Key? key}) : super(key: key);
  static final String id = "user_navigate_screen";

  @override
  _UserNavigationBarState createState() => _UserNavigationBarState();
}

class _UserNavigationBarState extends State<UserNavigationBar> {
  int currentIndex = 0;
  final screens = [
    UserHomeScreen(),
    UserSearchScreen(),
    UserShopScreen(),
    UserOrderScreen(),
    UserSettingScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: IndexedStack(
        index: currentIndex,
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 10,
        enableFeedback: true,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        unselectedItemColor: MainColors.blackColor,
        selectedItemColor: MainColors.greenColor,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_sharp),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Qidiruv",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_rounded),
            label: "Savatcha",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: "Buyurtmalar",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: "Sozlamalar",
          ),
        ],
      ),
    );
  }
}
