import 'package:flutter/material.dart';
import 'package:inadvance/pages/register_pages/register_restaurant_owner/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/pages/register_pages/register_user/user_sign_up_page.dart';
import 'package:inadvance/utils/colors.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

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
<<<<<<< HEAD
            Spacer(
=======
           const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 2,
            ),
            Center(
                child: Image.asset(
              "assets/images/vector_register.jpg",
              width: phoneWidth / 2,
            )),
<<<<<<< HEAD
            Spacer(
=======
           const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 2,
            ),
            Text(
              "Siz kimsiz?",
              style: TextStyle(
<<<<<<< HEAD
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(
=======
                fontSize: 25.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
           const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 4,
            ),
            chooseButton(userType: "Restoran egasi", x: 1),
            SizedBox(
<<<<<<< HEAD
              height: 30,
            ),
            chooseButton(userType: "Oddiy foydalanuvchi", x: 2),
            Spacer(
=======
              height: 30.h,
            ),
            chooseButton(userType: "Oddiy foydalanuvchi", x: 2),
            const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 20,
            ),
            GestureDetector(
              onTap: () {
                if (isChoose == 2) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => UserSignUp()));
                } else if(isChoose == 1) {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (BuildContext context) => OwnerSignUp()));
                }
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
                    style:
<<<<<<< HEAD
                        TextStyle(color: MainColors.whiteColor, fontSize: 20),
=======
                        TextStyle(color: MainColors.whiteColor, fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  ),
                ),
              ),
            ),
<<<<<<< HEAD
            SizedBox(height: 40),
=======
            SizedBox(height: 40.w),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
        height: 55,
=======
        height: 45.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                fontSize: 20,
=======
                fontSize: 17.sp,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                fontWeight: FontWeight.w600,
                color: isChoose == x
                    ? MainColors.whiteColor
                    : MainColors.blackColor),
          ),
        ),
      ),
    );
  }
}
