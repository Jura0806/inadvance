import 'package:flutter/material.dart';
import 'package:inadvance/pages/register_pages/register_restaurant_owner/restaurant_owner_sign_up_page.dart';
import 'package:inadvance/pages/register_pages/register_user/user_sign_up_page.dart';
import 'package:inadvance/utils/colors.dart';

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
            Spacer(
              flex: 2,
            ),
            Center(
                child: Image.asset(
              "assets/images/vector_register.jpg",
              width: phoneWidth / 2,
            )),
            Spacer(
              flex: 2,
            ),
            Text(
              "Siz kimsiz?",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(
              flex: 4,
            ),
            chooseButton(userType: "Restoran egasi", x: 1),
            SizedBox(
              height: 30,
            ),
            chooseButton(userType: "Oddiy foydalanuvchi", x: 2),
            Spacer(
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
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.greenColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Davom etish",
                    style:
                        TextStyle(color: MainColors.whiteColor, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 40),
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
        height: 55,
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
                fontSize: 20,
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
