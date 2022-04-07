import 'package:flutter/material.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/pages/register_pages/intro_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class ChooseLanguage extends StatefulWidget {

  String? currentLanguage;

  ChooseLanguage({Key? key, this.currentLanguage}) : super(key: key);
  static final String id = "choose_language_page";

  @override
  _ChooseLanguageState createState() => _ChooseLanguageState();
}

class _ChooseLanguageState extends State<ChooseLanguage> {
  String isChoose = "";
  String? x;

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
              textAlign: TextAlign.center,
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
              x: "uz-UZ",
            ),
           const Spacer(
              flex: 1,
            ),
            languages(
              imageFlag: "assets/images/rusFlag.png",
              language: "Russian",
              x: "ru-RU"
            ),
           const Spacer(
              flex: 1,
            ),
            languages(
              imageFlag: "assets/images/englishFlag.png",
              language: "English",
              x: "en-US"
            ),
           const Spacer(
              flex: 8,
             ),
            // InkWell(
            //   onTap: () {
            //    // _createAccount();
            //   },
            //   child: Container(
            //     height: 45.h,
            //     width: double.infinity,
            //     decoration: BoxDecoration(
            //       color: MainColors.greenColor,
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Center(
            //       child: Text(
            //         "update",
            //         style: TextStyle(
            //             color: MainColors.whiteColor, fontSize: 17.sp),
            //       ).tr(),
            //     ),
            //   ),
            // ),
            // const Spacer(
            //   flex: 3,
            // ),
          ],
        ),
      ),
    );
  }

  Widget languages({
    required String imageFlag,
    required String language,
    required String x,
  }) {
    return InkWell(
      onTap: (){
        setState(() {
          isChoose = x;
        });
        if(x == "uz-UZ"){
          context.setLocale(Locale('uz', 'UZ'));
        }else if(x == "ru-RU"){
          context.setLocale(Locale('ru', 'RU'));
        }else if(x == "en-US"){
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
