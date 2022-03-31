import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/restaurant_profile_page.dart';
import 'package:inadvance/provider_views/owner_views_provider/profile_post_view.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/services/hive_db_user_service.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'dart:io' show Platform;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import '../about_app_page.dart';
import '../choose_language_page.dart';

class OwnerSettingScreen extends StatefulWidget {
  const OwnerSettingScreen({Key? key}) : super(key: key);
  static final String id = "owner_setting";

  @override
  _OwnerSettingScreenState createState() => _OwnerSettingScreenState();
}

class _OwnerSettingScreenState extends State<OwnerSettingScreen> {
  // CreateProfile createProfile = new CreateProfile();
  Map<String, dynamic> profile ={
    "data": {
      "name": "Restaurant Name",
    }
  };
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
                  onPressed: () async {
                    Navigator.of(context).pop();
                    // createProfile.getProfile();
                    print(HiveSignUp().loadOwner().id);
                    print(HiveSignUp().loadOwner().token);
                    var response = await OwnerNetwork.ownerProfileGet(
                        OwnerNetwork.Api_Restaurant_Profile);
                    print(response);
                  },
                  child: Text('cancel',
                      style: TextStyle(color: MainColors.greenColor)).tr()),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    HiveSignIn().removeOwner();
                    HiveSignUp().removeOwner();
                    HiveToken().removeToken();
                    HiveRestId().removeId();
                    Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                            builder: (BuildContext context) => ChooseLanguage()),
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
            content: Text("logoutQuestion"),
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
                  HiveSignIn().removeOwner();
                  HiveSignUp().removeOwner();
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

  Future getProfile() async {
    var response =
    await OwnerNetwork.ownerProfileGet(OwnerNetwork.Api_Restaurant_Profile);

    if (jsonDecode(response)["data"] != null) {
      setState(() {
        profile = jsonDecode(response);
      });
    }
  }
  @override
  void initState() {
    // TODO: implement initState
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
                    image:
                    Hive.box("Restaurant_id").isEmpty && Hive.box("OwnerSignIn").isEmpty
                        ?
                    DecorationImage(
                            image:
                                AssetImage("assets/images/default_image.png"),
                            fit: BoxFit.fill)
                        : DecorationImage(
                            image:
                                NetworkImage("https://in-advance.bingo99.uz${profile["data"]["logo_path"]}"),
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
                         profile["data"]["name"][0]??"R",
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
                  profile["data"]["name"]??"restaurantName".tr(),
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
            child: settingInfos(nameInfo: "profileRestaurant"),
            onTap: () {
              // print(HiveRestId().loadId());
              // getProfile();
              // RestProfilePage().createState().getProfile();
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (BuildContext context) => RestProfilePage()));
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
          TextButton(
              onPressed: ()  {
                var restaurantData = HiveSignIn().loadOwner();
               print("Restoran id => ${restaurantData.id}");
              //  print("token => ${restaurantData.token}");
                print("login => ${restaurantData.login}");

              },
              child: Text("Print_Owner_Restaurant's_Data")),
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
                color: nameInfo == "logOut"
                    ? Colors.redAccent
                    : MainColors.blackColor),
          ).tr(),
          trailing: Icon(
            Icons.navigate_next,
            color: nameInfo == "logOut"
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
