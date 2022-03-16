import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/models/meal_model.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/formfield.dart';
import 'package:inadvance/utils/responsive_size.dart';

double _height = 40;
bool icon = true;
String choose = "";
List<String> categories = [
  "Salads",
  "Fast foods",
  "Drinks",
  "Foods",
];

class NewOrUpdateMeal extends StatefulWidget {
  final Meal? meal;
  final String type;
  const NewOrUpdateMeal({Key? key, this.meal, required this.type})
      : super(key: key);

  @override
  _NewOrUpdateMealState createState() => _NewOrUpdateMealState();
}

class _NewOrUpdateMealState extends State<NewOrUpdateMeal> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    super.initState();
    choose = 'Fast foods';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: Text("Add new"),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: getHeight(175.0),
                width: double.infinity,
                decoration: widget.meal != null
                    ? BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            'https://in-advance.bingo99.uz${widget.meal!.imagePath}',
                          ),
                          fit: BoxFit.cover,
                        ),
                      )
                    : BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        color: Colors.grey,
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
                padding: EdgeInsets.all(getWidth(16)),
                child: Column(
                  children: [
                    CustomFormField(
                      controller: _nameController,
                      hint: 'Name food',
                    ),
                    CustomFormField(
                      controller: _priceController,
                      inputType: TextInputType.number,
                      hint: 'Cost',
                    ),
                    CustomFormField(
                      controller: _descController,
                      hint: 'Description',
                      line: 4,
                    ),
                    Container(
                      height: categories.length * 45 + 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1, color: MainColors.greenColor)),
                      child: Column(
                        children:
                            categories.map((e) => chooseCategory(e)).toList(),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: getWidth(16)),
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
              SizedBox(
                height: 10,
              )
            ],
          ),
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
          categories.last != category
              ? Divider(
                  color: MainColors.greenColor,
                  height: 0,
                  thickness: 0.3,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }
}
