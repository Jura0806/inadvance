import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/owner_navigation_bar_icons.dart';

import 'owner_home_screen.dart';
import 'owner_menu_screen/owner_menu_screen.dart';
import 'owner_order_screen.dart';
import 'owner_setting_screen.dart';
import 'owner_table_screen.dart';

class OwnerNavigationBar extends StatefulWidget {
  const OwnerNavigationBar({Key? key}) : super(key: key);
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
        currentIndex: currentIndex,
        onTap: (index) => setState(() => currentIndex = index),
        unselectedItemColor: MainColors.blackColor,
        selectedItemColor: MainColors.greenColor,
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(
            icon: bottomBarIcon(0),
            label: "Asosiy",
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(1),
            label: "Menyu",
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(2),
            label: "Stollar",
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(3),
            label: "Buyurtma",
          ),
          BottomNavigationBarItem(
            icon: bottomBarIcon(4),
            label: "Sozlama",
          ),
        ],
      ),
    );
  }

  Widget bottomBarIcon(int iconNumber) {
    return SvgPicture.asset(
      ownerBottomBarIcons[iconNumber]["active"].toString(),
      color: currentIndex == iconNumber? MainColors.greenColor : MainColors.blackColor,
      height:  currentIndex == iconNumber? 25 : 20,
    );
  }


}
