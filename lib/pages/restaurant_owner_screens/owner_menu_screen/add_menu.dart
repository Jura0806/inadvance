import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/formfield.dart';
import 'package:inadvance/utils/responsive_size.dart';

class AddMenu extends StatefulWidget {
  const AddMenu({Key? key}) : super(key: key);

  @override
  _AddMenuState createState() => _AddMenuState();
}

double _height = 40;
bool icon = true;
String choose = "";
List<String> categories = [
  "Salads",
  "Fast foods",
  "Drinks",
  "Foods",
];

class _AddMenuState extends State<AddMenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("Add new"),
      ),
      body: Container(
        height: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: getProportionateScreenHeight(175.0),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.all(Radius.circular(8)),
                image: DecorationImage(
                  image: AssetImage("assets/images/fastfood.jpg"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.2),
                    Colors.black.withOpacity(.2),
                  ]),
                ),
                child: Center(
                  child: Icon(
                    Icons.camera_alt_outlined,
                    color: MainColors.whiteColor,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(getProportionateScreenWidth(16)),
              child: Column(
                children: [
                  CustomFormField(
                    hint: 'Name food',
                  ),
                  CustomFormField(
                    inputType: TextInputType.number,
                    hint: 'Cost',
                  ),
                  CustomFormField(

                     hint: 'Description',
                    line: 4,
                  ),
                  Container(
                    height: categories.length * 45 + 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                       border:
                           Border.all(width: 1, color: MainColors.greenColor)
                      ),
                    child: Column(
                        children:
                            categories.map((e) => chooseCategory(e)).toList()),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(16)),
                height: 55,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.greenColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Confirm",
                    style:
                    TextStyle(color: MainColors.whiteColor, fontSize: 20),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  Widget chooseCategory(String category) {
    return InkWell(
      onTap: () {
        setState(() {
          choose = category;
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
               borderRadius: BorderRadius.circular(8),
                color: choose == category
                    ? MainColors.greenColor
                    : MainColors.whiteColor),
            child: Text(
              category,
              style: TextStyle(
                  fontSize: 17,
                  color: choose == category
                      ? MainColors.whiteColor
                      : MainColors.blackColor),
            ),
          ),
          categories.last != category ? Divider(color: MainColors.greenColor,height: 0,thickness: 0.3,): SizedBox.shrink(),
        ],
      ),
    );
  }
}
