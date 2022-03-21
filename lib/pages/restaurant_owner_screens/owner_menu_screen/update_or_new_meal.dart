import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inadvance/models/category_model.dart';
import 'package:inadvance/models/meal_model.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/formfield.dart';

bool icon = true;
String choose = "";
List<String> categoriesTitle = [];

class NewOrUpdateMeal extends StatefulWidget {
  final Meal? meal;
  final String type;
  // final List<Category> categories;
  const NewOrUpdateMeal({
    Key? key,
    this.meal,
    required this.type,
    // required this.categories,
  }) : super(key: key);

  @override
  _NewOrUpdateMealState createState() => _NewOrUpdateMealState();
}

class _NewOrUpdateMealState extends State<NewOrUpdateMeal> {
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _descController = TextEditingController();

  @override
  void initState() {
    initFieldValues();
    super.initState();
    choose = 'Fast foods';
  }

  initFieldValues() {
    if (widget.meal != null) {
      _nameController.text = widget.meal!.nameEn.toString();
      _priceController.text = widget.meal!.price.toString();
      _descController.text = widget.meal!.descriptionEn.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        title: widget.meal == null ? Text("Add new") : Text("Edit"),
      ),
      body: Container(
        height: double.infinity,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                height: 175.0.h,
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
                padding: EdgeInsets.all(16.w),
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
                      height: categoriesTitle.length * 45 + 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                              width: 1, color: MainColors.greenColor)),
                      child: Column(
                        children: categoriesTitle
                            .map((c) => chooseCategory(categoryName: c))
                            .toList(),
                      ),
                    ),
                  ],
                ),
              ),
              InkWell(
                onTap: updateMeals,
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.w),
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
              SizedBox(height: 10.h)
            ],
          ),
        ),
      ),
    );
  }

  Widget chooseCategory({required String categoryName}) {
    return InkWell(
      onTap: () {
        setState(() => choose = categoryName);
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: choose == categoryName
                    ? MainColors.greenColor
                    : MainColors.whiteColor),
            child: Text(
              categoryName,
              style: TextStyle(
                  fontSize: 17,
                  color: choose == categoryName
                      ? MainColors.whiteColor
                      : MainColors.blackColor),
            ),
          ),
          categoriesTitle.last != categoryName
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

  void updateMeals() async {
    await OwnerNetwork.updateMeals(
      restaurantId: '',
      categoryId: '',
      mealId: widget.meal!.id.toString(),
      nameUz: _nameController.text,
      nameRu: _nameController.text,
      nameEn: _nameController.text,
      descUz: _descController.text,
      descRu: _descController.text,
      descEn: _descController.text,
      price: _priceController.text,
    );
  }
}
