import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_in_page.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/restaurant_profile_page.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/utils/colors.dart';
import 'dart:io' show Platform;
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../about_app_page.dart';
import '../choose_language_page.dart';

class OwnerSettingScreen extends StatefulWidget {
  const OwnerSettingScreen({Key? key}) : super(key: key);
  static final String id = "owner_setting";

  @override
  _OwnerSettingScreenState createState() => _OwnerSettingScreenState();
}

class _OwnerSettingScreenState extends State<OwnerSettingScreen> {
  void _iosDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want to logout?'),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Cancel',
                      style: TextStyle(color: MainColors.greenColor))),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    HiveOwnerSignIn().removeOwner();
                    OwnerToken().removeToken();
                    HiveOwnerSignUp().removeOwner();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => OwnerSignUp(roleId: 1,)),
                        (route) => false);
                  },
                  child: Text(
                    'Confirm',
                    style: TextStyle(color: Colors.redAccent),
                  )),
            ],
          );
        });
  }

  void _androidDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want to Logout!'),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Confirm'),
                onPressed: () {
                  HiveOwnerSignIn().removeOwner();
                  OwnerToken().removeToken();
                  HiveOwnerSignUp().removeOwner();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => OwnerSignUp(roleId: 1,)),
                          (route) => false);
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        title: Text("Sozlamalar"),
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 5,
          ),
          Center(
            child: Column(
              children: [
                Container(
                  height: 105.h,
                  width: 105.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://scontent.ftas2-2.fna.fbcdn.net/v/t1.6435-1/147758135_2883057468590967_3283438224948433812_n.jpg?stp=dst-jpg_p720x720&_nc_cat=105&ccb=1-5&_nc_sid=1eb0c7&_nc_ohc=GzSj92nGIEAAX-EF1pd&_nc_ht=scontent.ftas2-2.fna&oh=00_AT_v--ZR3tfNgI1omykU60HmU2ULGmGL9NRF7z9fFT6jXQ&oe=6232FF9A"),
                        fit: BoxFit.fill),
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 2.5.w, color: MainColors.greenColor),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "Rayhon"[0],
                        style: TextStyle(
                            color: MainColors.whiteColor, fontSize: 35.sp),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rayhon",
                  style:
                      TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
                ),
              ],
            ),
          ),
          const Spacer(
            flex: 15,
          ),
          InkWell(
            child: settingInfos(nameInfo: "Restaurant profili"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => RestProfilePage()));
            },
          ),
          settingInfos(nameInfo: "To'lov tarixi"),
          InkWell(
            child: settingInfos(nameInfo: "Ilova haqida"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutAppPage()));
            },
          ),
          settingInfos(nameInfo: "Contact"),
          InkWell(
            child: settingInfos(nameInfo: "Languages"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => ChooseLanguage()));
            },
          ),
          InkWell(
              onTap: () {
                if (Platform.isAndroid) {
                  _androidDialog();
                } else if (Platform.isIOS) {
                  _iosDialog();
                }
              },
              child: settingInfos(nameInfo: "Log Out")),
          TextButton(
              onPressed: () {
                print(OwnerToken().loadToken());
              },
              child: Text("Print_Owner_Token")),
          const Spacer(
            flex: 50,
          ),
        ],
      ),
    );
  }

  Widget settingInfos({required String nameInfo}) {
    return Column(
      children: [
        Divider(
          thickness: 0.5.w,
          height: 0,
          color: Colors.grey,
        ),
        ListTile(
          title: Text(
            nameInfo,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.bold,
                color: nameInfo == "Log Out"
                    ? Colors.redAccent
                    : MainColors.blackColor),
          ),
          trailing: Icon(
            Icons.navigate_next,
            color: nameInfo == "Log Out"
                ? Colors.redAccent
                : MainColors.blackColor,
            size: 25.w,
          ),
          tileColor: MainColors.whiteColor,
        ),
      ],
    );
  }
}
