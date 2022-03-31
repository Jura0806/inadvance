import 'package:flutter/material.dart';
import 'package:inadvance/pages/register_pages/registers_restaurant_and_user/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class FirstRegister extends StatefulWidget {
  const FirstRegister({Key? key}) : super(key: key);
  static final String id = "first_register";

  @override
  _FirstRegisterState createState() => _FirstRegisterState();
}

class _FirstRegisterState extends State<FirstRegister> {
  int isChoose = 4;
  int x = 0;

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          children: [
           const Spacer(
              flex: 2,
            ),
            Center(
                child: Image.asset(
              "assets/images/vector_register.jpg",
              width: phoneWidth / 2,
            )),
           const Spacer(
              flex: 2,
            ),
            Text(
              "UserTypeQuestion",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ).tr(),
           const Spacer(
              flex: 4,
            ),
            chooseButton(userType: "UserRestaurant", x: 1),
            SizedBox(
              height: 30.h,
            ),
            chooseButton(userType: "UserClient", x: 2),
            const Spacer(
              flex: 20,
            ),
            GestureDetector(
              onTap: () {
                if(isChoose == 1 || isChoose == 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) =>
                          OwnerSignUp(roleId: isChoose,)));
                  print(isChoose);
                }
                // if (isChoose == 2) {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (BuildContext context) => UserSignUp()));
                // } else if(isChoose == 1) {
                //   Navigator.of(context).push(MaterialPageRoute(
                //       builder: (BuildContext context) => OwnerSignUp()));
                // }
              },
              child: Container(
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.greenColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Next",
                    style:
                        TextStyle(color: MainColors.whiteColor, fontSize: 17.sp),
                  ).tr(),
                ),
              ),
            ),
            SizedBox(height: 40.w),
          ],
        ),
      ),
    );
  }

  Widget chooseButton({required String userType, required int x}) {
    return InkWell(
      onTap: () {
        setState(() {
          isChoose = x;
        });
      },
      child: Container(
        height: 45.h,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(width: 1, color: MainColors.greenColor),
          color: isChoose == x ? MainColors.greenColor : MainColors.whiteColor,
        ),
        child: Center(
          child: Text(
            userType,
            style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w500,
                color: isChoose == x
                    ? MainColors.whiteColor
                    : MainColors.blackColor),
          ).tr(),
        ),
      ),
    );
  }
}
