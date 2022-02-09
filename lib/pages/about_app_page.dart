import 'package:flutter/material.dart';
import 'package:inadvance/pages/register_pages/who_are_you_register_page.dart';
import 'package:inadvance/utils/colors.dart';

class AboutAppPage extends StatelessWidget {
  const AboutAppPage({Key? key}) : super(key: key);
  static final String id = "about_app_page";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
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
                  decoration: BoxDecoration(
                      color: MainColors.whiteColor, shape: BoxShape.circle),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Ilova haqida",
                  style: TextStyle(
                    color: MainColors.whiteColor,
                    fontSize: 28,
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
                  BorderRadius.vertical(bottom: Radius.elliptical(200, 200)),
            ),
          ),
          Spacer(
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
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MainColors.greenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Davom etish",
                        style: TextStyle(
                            color: MainColors.whiteColor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 40,
          ),
        ],
      ),
    );
  }
}
