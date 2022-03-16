import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/utils/colors.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

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
                            "https://i.pinimg.com/originals/9c/bd/87/9cbd87199859155a3012b19c51a508cd.jpg"),
                        fit: BoxFit.fill),
                    color: Colors.grey,
                    shape: BoxShape.circle,
                    border:
                        Border.all(width: 2.5, color: MainColors.greenColor),
                  ),
                ),
                Positioned(
<<<<<<< HEAD
                  left: 75,
                  child: Container(
                    height: 35,
                    width: 35,
=======
                  left: 70.w,
                  child: Container(
                    height: 30.h,
                    width: 30.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    child: Center(
                      child: Icon(
                        Icons.camera_alt_outlined,
                        color: MainColors.greenColor,
<<<<<<< HEAD
                        size: 20,
=======
                        size: 17.sp,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
          Spacer(
=======
          const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                    child: Text("Rad etish", style: TextStyle(color: Colors.red.shade900,fontSize: 17),),
=======
                    child: Text("Rad etish", style: TextStyle(color: Colors.red.shade900,fontSize: 15.sp),),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                    child: Text("Saqlash", style: TextStyle(color: MainColors.whiteColor, fontSize: 17),),
=======
                    child: Text("Saqlash", style: TextStyle(color: MainColors.whiteColor, fontSize: 15.sp),),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  ),
                ),
              ],
            ),
          ),
<<<<<<< HEAD
          Spacer(flex: 5,)
=======
         const  Spacer(flex: 5,)
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
        ],
      ),
    );
  }

  Widget userInfos({required String infos}) {
    return Padding(
<<<<<<< HEAD
      padding: EdgeInsets.symmetric(horizontal: 20),
=======
      padding: const EdgeInsets.symmetric(horizontal: 20),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
          SizedBox(
=======
          const SizedBox(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            height: 20,
          ),
        ],
      ),
    );
  }
}
