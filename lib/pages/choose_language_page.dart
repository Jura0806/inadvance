import 'package:flutter/material.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/pages/register_pages/intro_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

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
           const Spacer(
              flex: 16,
            ),
            Text(
              "Choose language",
              style: TextStyle(
                fontSize: 25.sp,
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
                fontSize: 16.sp,

              ),
            ),
           const Spacer(
              flex: 7,
            ),
            languages(
              imageFlag: "assets/images/uzbFlagg.png",
              language: "Uzbek",
              x: 1,
            ),
           const Spacer(
              flex: 1,
            ),
            languages(
              imageFlag: "assets/images/rusFlag.png",
              language: "Russian",
              x: 2
            ),
           const Spacer(
              flex: 1,
            ),
            languages(
              imageFlag: "assets/images/englishFlag.png",
              language: "English",
              x: 3
            ),
           const Spacer(
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
        if(x == 1){
          context.setLocale(Locale('uz', 'UZ'));
        }else if(x == 2){
          context.setLocale(Locale('ru', 'RU'));
        }else if(x == 3){
          context.setLocale(Locale('en', 'US'));
        }
        Navigator.pushReplacementNamed(context, IntroPage.id);
      },
      child: Container(
        height: 65.h,
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
                width: 45.w,
              ),
              SizedBox(
                width: 30.w,
              ),
              Text(
                language,
                style: TextStyle(
                    fontSize: 17.sp,
                    fontWeight: FontWeight.w600,
                    color: isChoose == x? MainColors.whiteColor : MainColors.blackColor),
              ),
             const Spacer(flex: 20,),
            isChoose == x? Icon(Icons.navigate_next, size: 35.w, color: MainColors.whiteColor,): SizedBox.shrink(),
              Spacer(flex: 1,)
            ],
          ),
        ),
      ),
    );
  }
}
