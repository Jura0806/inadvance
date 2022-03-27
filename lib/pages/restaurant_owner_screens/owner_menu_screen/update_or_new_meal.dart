import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inadvance/models/category_model.dart';
import 'package:inadvance/models/meal_model.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/formfield.dart';

bool icon = true;

class NewOrUpdateMeal extends StatefulWidget {
  const NewOrUpdateMeal({
    Key? key,
    this.meal,
    required this.type,
    required this.categories,
  }) : super(key: key);

  final List<Category> categories;
  final Meal? meal;
  final String type;

  @override
  _NewOrUpdateMealState createState() => _NewOrUpdateMealState();
}

class _NewOrUpdateMealState extends State<NewOrUpdateMeal> {
  List<String> categoriesTitle = [];
  late Category choose;
  File? mealCoverImg;

  TextEditingController _descController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  bool isLoading = false;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    initFieldValues();
    super.initState();
    choose = widget.categories[0];
  }

  Future getImage({tag}) async {
    XFile? _pickedFile;
    mealCoverImg = null;
    _pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (_pickedFile != null) {
      mealCoverImg = File(_pickedFile.path);
    }
    setState(() {});
  }

  initFieldValues() {
    categoriesTitle = widget.categories.map((e) => e.nameUz!).toList();
    if (widget.meal != null) {
      _nameController.text = widget.meal!.nameEn.toString();
      _priceController.text = widget.meal!.price.toString();
      _descController.text = widget.meal!.descriptionEn.toString();
    }
  }

  Widget chooseCategory({required Category category}) {
    return InkWell(
      onTap: () {
        setState(() => choose = category);
        // var restaurantData = HiveSignIn().loadOwner();
        // print(restaurantData.id);
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
              category.nameUz!,
              style: TextStyle(
                  fontSize: 17,
                  color: choose == category
                      ? MainColors.whiteColor
                      : MainColors.blackColor),
            ),
          ),
          categoriesTitle.last != category.nameUz
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

  void updateMeal() async {
    setState(() => isLoading = true);
    var res = await OwnerNetwork.updateMeal(
      params: mealCoverImg == null
          ? {
              "meal_id": widget.meal!.id.toString(),
              "restaurant_id": '23',
              "category_id": choose.id.toString(),
              "name_uz": _nameController.text.isNotEmpty
                  ? _nameController.text
                  : widget.meal!.nameUz,
              "name_ru": _nameController.text.isNotEmpty
                  ? _nameController.text
                  : widget.meal!.nameRu,
              "name_en": _nameController.text.isNotEmpty
                  ? _nameController.text
                  : widget.meal!.nameEn,
              "description_uz": _descController.text.isNotEmpty
                  ? _descController.text
                  : widget.meal!.descriptionUz,
              "description_ru": _descController.text.isNotEmpty
                  ? _descController.text
                  : widget.meal!.descriptionRu,
              "description_en": _descController.text.isNotEmpty
                  ? _descController.text
                  : widget.meal!.descriptionEn,
              "price": _priceController.text.isNotEmpty
                  ? _priceController.text
                  : widget.meal!.price,
              "_method": "PUT",
            }
          : {
              "meal_id": widget.meal!.id.toString(),
              "restaurant_id": '23',
              "category_id": choose.id.toString(),
              "image_path": mealCoverImg!.path,
              "name_uz": _nameController.text.isNotEmpty
                  ? _nameController.text
                  : widget.meal!.nameUz,
              "name_ru": _nameController.text.isNotEmpty
                  ? _nameController.text
                  : widget.meal!.nameRu,
              "name_en": _nameController.text.isNotEmpty
                  ? _nameController.text
                  : widget.meal!.nameEn,
              "description_uz": _descController.text.isNotEmpty
                  ? _descController.text
                  : widget.meal!.descriptionUz,
              "description_ru": _descController.text.isNotEmpty
                  ? _descController.text
                  : widget.meal!.descriptionRu,
              "description_en": _descController.text.isNotEmpty
                  ? _descController.text
                  : widget.meal!.descriptionEn,
              "price": _priceController.text.isNotEmpty
                  ? _priceController.text
                  : widget.meal!.price,
              "_method": "PUT",
            },
    );
    await Future.delayed(Duration(seconds: 1));
    if (res.id != null) {
      setState(() => isLoading = false);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Text("Muvaffaqiyatli update qilindi"),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  "ok",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: MainColors.greenColor,
                ),
              )
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
    }
  }

  void addMeal() async {
    setState(() => isLoading = true);
    var res = await OwnerNetwork.storeMeals(
      params: {
        "restaurant_id": "23",
        "category_id": choose.id.toString(),
        "image_path": mealCoverImg!.path,
        "name_uz": _nameController.text,
        "name_ru": _nameController.text,
        "name_en": _nameController.text,
        "description_uz": _descController.text,
        "description_ru": _descController.text,
        "description_en": _descController.text,
        "price": _priceController.text,
      },
    );
    await Future.delayed(Duration(seconds: 1));
    if (res.id != null) {
      setState(() => isLoading = false);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Container(
              child: Text("Muvaffaqiyatli qo'shildi"),
            ),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: Text(
                  "ok",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  primary: MainColors.greenColor,
                ),
              )
            ],
            actionsAlignment: MainAxisAlignment.center,
          );
        },
      );
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
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    getImage();
                  },
                  child: Container(
                    height: 175.0.h,
                    width: double.infinity,
                    decoration: widget.meal != null
                        ? mealCoverImg == null
                            ? BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                image: DecorationImage(
                                  image: CachedNetworkImageProvider(
                                    'https://in-advance.bingo99.uz${widget.meal!.imagePath}',
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                image: DecorationImage(
                                  image: FileImage(mealCoverImg!),
                                  fit: BoxFit.cover,
                                ),
                              )
                        : mealCoverImg != null
                            ? BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
                                image: DecorationImage(
                                  image: FileImage(mealCoverImg!),
                                  fit: BoxFit.cover,
                                ),
                              )
                            : BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8)),
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
                        height: widget.categories.length * 45 + 2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                                width: 1, color: MainColors.greenColor)),
                        child: ListView(
                          // reverse: true,
                          children: widget.categories
                              .map((c) => chooseCategory(category: c))
                              .toList(),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    if (widget.meal != null) {
                      updateMeal();
                    } else {
                      addMeal();
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 16.w),
                    height: 55,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MainColors.greenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: isLoading
                          ? CircularProgressIndicator(
                              color: Colors.white,
                            )
                          : Text(
                              "Confirm",
                              style: TextStyle(
                                  color: MainColors.whiteColor, fontSize: 20),
                            ),
                    ),
                  ),
                ),
                SizedBox(height: 10.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
