import 'package:flutter/material.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/utils/colors.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

class ChooseLanguage extends StatefulWidget {
  const ChooseLanguage({Key? key}) : super(key: key);
  static final String id = "choose_language_page";

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  int isChoose = 4;
  int? x;

  @override
  Widget build(BuildContext context) {
    final double phoneWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
<<<<<<< HEAD
            Spacer(
=======
           const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 16,
            ),
            Text(
              "Choose language",
              style: TextStyle(
<<<<<<< HEAD
                fontSize: 27,
=======
                fontSize: 25.sp,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                color: MainColors.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: phoneWidth / 15,
            ),
            Text(
              "Please choose which language you want. You can change later in the profile!",
              style: TextStyle(
<<<<<<< HEAD
                fontSize: 18,

              ),
            ),
            Spacer(
=======
                fontSize: 16.sp,

              ),
            ),
           const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 7,
            ),
            languages(
              imageFlag: "assets/images/uzbFlagg.png",
              language: "O'zbekcha",
              x: 1,
            ),
<<<<<<< HEAD
            Spacer(
=======
           const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 1,
            ),
            languages(
              imageFlag: "assets/images/rusFlag.png",
              language: "Russian",
              x: 2
            ),
<<<<<<< HEAD
            Spacer(
=======
           const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 1,
            ),
            languages(
              imageFlag: "assets/images/englishFlag.png",
              language: "English",
              x: 3
            ),
<<<<<<< HEAD
            Spacer(
=======
           const Spacer(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              flex: 8,
            )
          ],
        ),
      ),
    );
  }

  Widget languages({
    required String imageFlag,
    required String language,
    required int x,
  }) {
    return InkWell(
      onTap: (){
        setState(() {
          isChoose = x;
        });
        Navigator.pushReplacementNamed(context, AboutAppPage.id);
      },
      child: Container(
<<<<<<< HEAD
        height: 70,
=======
        height: 65.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
        width: double.infinity,
        decoration: BoxDecoration(
            color: isChoose == x? MainColors.greenColor: MainColors.whiteColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(width: 1, color: MainColors.greenColor)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            children: [
              Image.asset(
                imageFlag,
<<<<<<< HEAD
                width: 45,
              ),
              SizedBox(
                width: 30,
=======
                width: 45.w,
              ),
              SizedBox(
                width: 30.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              ),
              Text(
                language,
                style: TextStyle(
<<<<<<< HEAD
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isChoose == x? MainColors.whiteColor : MainColors.blackColor),
              ),
              Spacer(flex: 20,),
            isChoose == x? Icon(Icons.navigate_next, size: 35, color: MainColors.whiteColor,): SizedBox.shrink(),
=======
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: isChoose == x? MainColors.whiteColor : MainColors.blackColor),
              ),
             const Spacer(flex: 20,),
            isChoose == x? Icon(Icons.navigate_next, size: 35.w, color: MainColors.whiteColor,): SizedBox.shrink(),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              Spacer(flex: 1,)
            ],
          ),
        ),
      ),
    );
  }
}
