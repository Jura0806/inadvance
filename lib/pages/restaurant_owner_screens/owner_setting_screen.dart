import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/restaurant_profile_page.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/utils/colors.dart';
import 'dart:io' show Platform;
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

import '../about_app_page.dart';
import '../choose_language_page.dart';

class OwnerSettingScreen extends StatefulWidget {
  const OwnerSettingScreen({Key? key}) : super(key: key);
  static  final String id  = "owner_setting";

  @override
  _OwnerSettingScreenState createState() => _OwnerSettingScreenState();
}

class _OwnerSettingScreenState extends State<OwnerSettingScreen> {

  void _iosDialog(){
    showDialog(context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want to logout?'),
            actions: [
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {},
                  child: Text('Cancel',style: TextStyle(color: MainColors.greenColor))),
              CupertinoDialogAction(
                  isDefaultAction: true,
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text('Confirm',style: TextStyle(color: Colors.redAccent),)),
            ],
          );
        }
    );
  }
  void _androidDialog(){
    showDialog(context: context,
        builder: (BuildContext context){
          return AlertDialog(
            title: Text('Logout'),
            content: Text('Are you sure you want to Logout!'),
            actions: [
              TextButton(
                child: Text('Cancel'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
              TextButton(
                child: Text('Confirm'),
                onPressed: (){
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        }
    );
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
<<<<<<< HEAD
                  height: 115,
                  width: 115,
=======
                  height: 105.h,
                  width: 105.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://scontent.ftas2-2.fna.fbcdn.net/v/t1.6435-1/147758135_2883057468590967_3283438224948433812_n.jpg?stp=dst-jpg_p720x720&_nc_cat=105&ccb=1-5&_nc_sid=1eb0c7&_nc_ohc=GzSj92nGIEAAX-EF1pd&_nc_ht=scontent.ftas2-2.fna&oh=00_AT_v--ZR3tfNgI1omykU60HmU2ULGmGL9NRF7z9fFT6jXQ&oe=6232FF9A"),
                        fit: BoxFit.fill),
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    border:
<<<<<<< HEAD
                    Border.all(width: 2.5, color: MainColors.greenColor),
=======
                    Border.all(width: 2.5.w, color: MainColors.greenColor),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                            color: MainColors.whiteColor, fontSize: 40),
=======
                            color: MainColors.whiteColor, fontSize: 35.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Rayhon",
<<<<<<< HEAD
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
=======
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
          InkWell(child: settingInfos(nameInfo: "Languages"), onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ChooseLanguage()));
          },),
          InkWell(onTap: () {
            if(Platform.isAndroid){
              _androidDialog();
            }else if(Platform.isIOS){
              _iosDialog();
            }
          }, child: settingInfos(nameInfo: "Log Out")),
          TextButton(
              onPressed: (){
                HiveOwnerSignIn().removeOwner();
              },
<<<<<<< HEAD
              child: Text("Remove_Owner's_SignIn_Data")),
=======
              child: const Text("Remove_Owner's_SignIn_Data")),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          TextButton(
              onPressed: (){
                print(OwnerToken().loadToken());
              },
              child: Text("Print_Owner_Token")),
<<<<<<< HEAD
          Spacer(
=======
          TextButton(
              onPressed: (){
                print(OwnerProfile().loadProfile());
              },
              child: Text("Owner_PROFILE_LOCALDATA_PRINT")),
         const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
          thickness: 0.5,
=======
          thickness: 0.5.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          height: 0,
          color: Colors.grey,
        ),
        ListTile(
          title: Text(
            nameInfo,
            style: TextStyle(
<<<<<<< HEAD
                fontSize: 17,
=======
                fontSize: 15.sp,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
            size: 30,
=======
            size: 25.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          ),
          tileColor: MainColors.whiteColor,
        ),
      ],
    );
  }
}
