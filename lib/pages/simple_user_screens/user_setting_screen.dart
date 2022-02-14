import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/pages/choose_language_page.dart';
import 'package:inadvance/pages/simple_user_screens/user_profile_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'dart:io' show Platform;
class UserSettingScreen extends StatefulWidget {
  const UserSettingScreen({Key? key}) : super(key: key);
  static final String id = "user_setting_screen";

  @override
  _UserSettingScreenState createState() => _UserSettingScreenState();
}

class _UserSettingScreenState extends State<UserSettingScreen> {

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
                  height: 115,
                  width: 115,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image: NetworkImage(
                            "https://i.pinimg.com/originals/9c/bd/87/9cbd87199859155a3012b19c51a508cd.jpg"),
                        fit: BoxFit.fill),
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
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                          Colors.black.withOpacity(.5),
                        ],
                      ),
                      shape: BoxShape.circle,
                    ),
                    child: Center(
                      child: Text(
                        "Feruza"[0],
                        style: TextStyle(
                            color: MainColors.whiteColor, fontSize: 40),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Feruza Ergasheva",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
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
          Spacer(
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
                fontSize: 17,
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
            size: 30,
          ),
          tileColor: MainColors.whiteColor,
        ),
      ],
    );
  }
}
