import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/utils/colors.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Column(
        children: [
          const Spacer(
            flex: 1,
          ),
          Center(
            child: Stack(
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
                ),
                Positioned(
                  left: 75,
                  child: Container(
                    height: 35,
                    width: 35,
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: MainColors.greenColor,
                        size: 20,
                      ),
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: MainColors.whiteColor,
                        border:
                            Border.all(width: 2, color: MainColors.greenColor)),
                  ),
                )
              ],
            ),
          ),
          const Spacer(
            flex: 5,
          ),
          userInfos(infos: "FirstName"),
          userInfos(infos: "LastName"),
          userInfos(infos: "Phone Number"),
          Spacer(
            flex: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(MainColors.dimRedColor),
                  ),
                  child: Center(
                    child: Text("Rad etish", style: TextStyle(color: Colors.red.shade900,fontSize: 17),),
                  ),
                ),
                Spacer(),
                ElevatedButton(
                  onPressed: () {},
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                    elevation: MaterialStateProperty.all(0),
                    backgroundColor: MaterialStateProperty.all(MainColors.greenColor, ),
                  ),
                  child: Center(
                    child: Text("Saqlash", style: TextStyle(color: MainColors.whiteColor, fontSize: 17),),
                  ),
                ),
              ],
            ),
          ),
          Spacer(flex: 5,)
        ],
      ),
    );
  }

  Widget userInfos({required String infos}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFormField(
              decoration: InputDecoration(
                  labelText: infos,
                  // labelStyle: TextStyle(color: MainColors.greenColor),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MainColors.greenColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(
                        color: MainColors.textFieldColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ))),
          SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
