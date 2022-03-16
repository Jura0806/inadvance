import 'package:flutter/material.dart';
import 'package:inadvance/pages/register_pages/who_are_you_register_page.dart';
import 'package:inadvance/utils/colors.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);
  static final String id = "about_app_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
<<<<<<< HEAD
            height: 344,
            width: double.infinity,
            child: Column(
              children: [
                Spacer(
                  flex: 2,
                ),
                Container(
                  width: 120,
                  height: 120,
=======
            height: 300.h,
            width: double.infinity,
            child: Column(
              children: [
                const Spacer(
                  flex: 2,
                ),
                Container(
                  width: 100.w,
                  height: 100.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  decoration: BoxDecoration(
                      color: MainColors.whiteColor, shape: BoxShape.circle),
                ),
                SizedBox(
<<<<<<< HEAD
                  height: 20,
=======
                  height: 20.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                ),
                Text(
                  "Ilova haqida",
                  style: TextStyle(
                    color: MainColors.whiteColor,
<<<<<<< HEAD
                    fontSize: 28,
=======
                    fontSize: 25.sp,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  ),
                ),
                Spacer(
                  flex: 1,
                )
              ],
            ),
            decoration: BoxDecoration(
              color: MainColors.greenColor,
              borderRadius:
<<<<<<< HEAD
                  BorderRadius.vertical(bottom: Radius.elliptical(200, 200)),
            ),
          ),
          Spacer(
=======
                  BorderRadius.vertical(bottom: Radius.elliptical(200.w, 200.w)),
            ),
          ),
         const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            flex: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => FirstRegister()));
                  },
                  child: Container(
<<<<<<< HEAD
                    height: 55,
=======
                    height: 45.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MainColors.greenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Davom etish",
                        style: TextStyle(
<<<<<<< HEAD
                            color: MainColors.whiteColor, fontSize: 20),
=======
                            color: MainColors.whiteColor, fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
<<<<<<< HEAD
            height: 40,
=======
            height: 40.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          ),
        ],
      ),
    );
  }
}
