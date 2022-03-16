import 'package:flutter/material.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/utils/colors.dart';

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
            Spacer(
              flex: 16,
            ),
            Text(
              "Choose language",
              style: TextStyle(
                fontSize: 27,
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
                fontSize: 18,

              ),
            ),
            Spacer(
              flex: 7,
            ),
            languages(
              imageFlag: "assets/images/uzbFlagg.png",
              language: "O'zbekcha",
              x: 1,
            ),
            Spacer(
              flex: 1,
            ),
            languages(
              imageFlag: "assets/images/rusFlag.png",
              language: "Russian",
              x: 2
            ),
            Spacer(
              flex: 1,
            ),
            languages(
              imageFlag: "assets/images/englishFlag.png",
              language: "English",
              x: 3
            ),
            Spacer(
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
        height: 70,
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
                width: 45,
              ),
              SizedBox(
                width: 30,
              ),
              Text(
                language,
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: isChoose == x? MainColors.whiteColor : MainColors.blackColor),
              ),
              Spacer(flex: 20,),
            isChoose == x? Icon(Icons.navigate_next, size: 35, color: MainColors.whiteColor,): SizedBox.shrink(),
              Spacer(flex: 1,)
            ],
          ),
        ),
      ),
    );
  }
}
