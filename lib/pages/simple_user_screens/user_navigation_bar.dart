import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/pages/simple_user_screens/user_home_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_order_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_setting_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_search_screen.dart';
import 'package:inadvance/pages/simple_user_screens/user_savatcha_screen.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/user_navigation_bar_icons.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

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
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        enableFeedback: true,
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        unselectedItemColor: MainColors.blackColor,
        selectedItemColor: MainColors.greenColor,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: bottomBarIcon(0),
            label: "Home".tr(),
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(1),
            label: "search".tr(),
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(2),
            label: "shopping".tr(),
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(3),
            label: "Orders".tr(),
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(4),
            label: "Settings".tr(),
          ),
        ],
      ),
    );
  }

  Widget bottomBarIcon(int iconNumber) {
    return SvgPicture.asset(
      userBottomBarIcons[iconNumber]["active"].toString(),
      color: currentIndex == iconNumber? MainColors.greenColor : MainColors.blackColor,
      height:  currentIndex == iconNumber? 20.w : 17.w,
    );
  }
}
