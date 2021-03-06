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
import 'package:easy_localization/easy_localization.dart';

class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({Key? key}) : super(key: key);
  static final String id = "user_setting_screen";

  @override
  _UserSettingScreenState createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {

  final String defaultLocale = Platform.localHostname;
  Map<String, dynamic> data = {
    "user": {
      "id": 36,
      "role_id": "3",
      "full_name": "jhbsdjahb",
      "phone": "998872334",
      "login": "loplop",
      "image_path": null,
    },
  };

  void getProfile() async {
    var ownerSignIn = SignIn(
        login: HiveClientSignIn().loadClient().login ,
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
            content: Text("logoutQuestion").tr(),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('cancel',
                          style: TextStyle(color: MainColors.greenColor))
                      .tr()),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    HiveClientSignUp().removeClient();
                    HiveClientSignIn().removeClient();
                    HiveToken().removeToken();
                    HiveRestId().removeId();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                ChooseLanguage()),
                        (route) => false);
                  },
                  child: Text(
                    'confirm',
                    style: TextStyle(color: Colors.redAccent),
                  ).tr()),
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
                  HiveRestId().removeId();
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
        image:
            NetworkImage("https://in-advance.bingo99.uz${data["image_path"]}"),
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
        title: Text("Settings").tr(),
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
                    image: Hive.box("ClientSignIn").isEmpty
                        ? defaultLogo()
                        : getLogoNetwork(),
                    color: MainColors.greyColor,
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
                        Hive.box("ClientSignIn").isEmpty
                            ? "F"
                            : data["full_name"][0]??"F",
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
                  Hive.box("ClientSignIn").isEmpty
                      ? "FullName"
                      : data["full_name"]??"FullName",
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
            child: settingInfos(nameInfo: "profile"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => UserProfilePage()));
            },
          ),
          settingInfos(nameInfo: "storyPayment"),
          InkWell(
            child: settingInfos(nameInfo: "aboutApp"),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => AboutAppPage()));
            },
          ),
          settingInfos(nameInfo: "Contact"),
          InkWell(
            child: settingInfos(nameInfo: "languages"),
            onTap: () {
              print(defaultLocale);
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
              child: settingInfos(nameInfo: "logOut")),
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
                color: nameInfo == "logOut"
                    ? Colors.redAccent
                    : MainColors.blackColor),
          ).tr(),
          trailing: Icon(
            Icons.navigate_next,
            color:
                nameInfo == "logOut" ? Colors.redAccent : MainColors.blackColor,
            size: 25.sp,
          ),
          tileColor: MainColors.whiteColor,
        ),
      ],
    );
  }
}
