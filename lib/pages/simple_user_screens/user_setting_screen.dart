import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/pages/choose_language_page.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/pages/simple_user_screens/user_profile_page.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/services/hive_db_user_service.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'dart:io' show Platform;
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({Key? key}) : super(key: key);
  static final String id = "user_setting_screen";

  @override
  _UserSettingScreenState createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {

  Map<String, dynamic> data = {};
  void getProfile() async {
    var ownerSignIn = SignIn(
        login: HiveClientSignIn().loadClient().login,
        password: HiveClientSignIn().loadClient().password);
    var response = await OwnerNetwork.ownerRegister(
        OwnerNetwork.Api_LogIn, OwnerNetwork.paramsSignIn(ownerSignIn));

    if (response != null) {
      setState(() {
        data = jsonDecode(response)["user"];
      });
    }
    print(response);
  }
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
                    HiveClientSignUp().removeClient();
                    HiveClientSignIn().removeClient();
                    HiveToken().removeToken();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => ChooseLanguage()),
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
                  HiveClientSignUp().removeClient();
                  HiveClientSignIn().removeClient();
                  HiveToken().removeToken();
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                          builder: (BuildContext context) => ChooseLanguage()),
                      (route) => false);
                },
              ),
            ],
          );
        });
  }
  DecorationImage defaultLogo() {
    return DecorationImage(
        image: AssetImage("assets/images/default_image.png"),
        fit: BoxFit.cover);
  }
  DecorationImage getLogoNetwork() {
    return DecorationImage(
        image: NetworkImage(
            "https://in-advance.bingo99.uz${data["image_path"]}"),
        fit: BoxFit.cover);
  }

  @override
  void initState() {
    super.initState();
    getProfile();
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
                    image: Hive.box("ClientSignIn").isEmpty  ? defaultLogo() : getLogoNetwork() ,
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 2.5, color: MainColors.greenColor),
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.center,
                        colors: [
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.4),
                          Colors.black.withOpacity(.4),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        data["full_name"][0]?? "F",
                        style: TextStyle(
                            color: MainColors.whiteColor, fontSize: 25.sp),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  data["full_name"] ?? "FullName",
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
            child: settingInfos(nameInfo: "Profile"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => UserProfilePage()));
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
          thickness: 0.5,
          height: 0,
          color: Colors.grey,
        ),
        ListTile(
          title: Text(
            nameInfo,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w600,
                color: nameInfo == "Log Out"
                    ? Colors.redAccent
                    : MainColors.blackColor),
          ),
          trailing: Icon(
            Icons.navigate_next,
            color: nameInfo == "Log Out"
                ? Colors.redAccent
                : MainColors.blackColor,
            size: 25.sp,
          ),
          tileColor: MainColors.whiteColor,
        ),
      ],
    );
  }
}
