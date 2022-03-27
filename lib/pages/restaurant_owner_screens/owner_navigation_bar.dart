import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/owner_navigation_bar_icons.dart';
import 'owner_home_screen.dart';
import 'owner_menu_screen/owner_menu_screen.dart';
import 'owner_order_screen.dart';
import 'owner_setting_screen.dart';
import 'owner_table_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
class OwnerNavigationBar extends StatefulWidget {
  OwnerNavigationBar({Key? key}) : super(key: key);
  static final String id = "owner_navigation_bar";

  @override
  _OwnerNavigationBarState createState() => _OwnerNavigationBarState();
}

class _OwnerNavigationBarState extends State<OwnerNavigationBar> {


  int currentIndex = 0;
  final screens = [
    OwnerHomeScreen(),
    OwnerMenuScreen(),
    OwnerTableScreen(),
    OwnerOrderScreen(),
    OwnerSettingScreen(),
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
            label: "Menu".tr(),
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(2),
            label: "Tables".tr(),
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
      ownerBottomBarIcons[iconNumber]["active"].toString(),
      color: currentIndex == iconNumber? MainColors.greenColor : MainColors.blackColor,
      height:  currentIndex == iconNumber? 20.w : 17.w,
    );
  }


}
