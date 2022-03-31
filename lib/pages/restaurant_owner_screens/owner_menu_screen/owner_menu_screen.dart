import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/models/category_model.dart';
import 'package:inadvance/models/meal_model.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_menu_screen/update_or_new_meal.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:inadvance/widgets/restaurant_owner_widgets/owner_menu_bottomSheet.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerMenuScreen extends StatefulWidget {
  const OwnerMenuScreen({Key? key}) : super(key: key);

  @override
  _OwnerMenuScreenState createState() => _OwnerMenuScreenState();
}

class _OwnerMenuScreenState extends State<OwnerMenuScreen> {
  List<Category> _categories = [];
  List<Meal> _meals = [];
  TextEditingController _storeCategoryController = TextEditingController();
  @override
  void initState() {
    super.initState();
    initValues();
  }

  Future initValues() async {
    _categories = await OwnerNetwork.getCategories();
    _meals = await OwnerNetwork.getMeals();
  }

  @override
  void dispose() {
    _storeCategoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: 24.sp,
            color: MainColors.blackColor,
          ),
        ),
        actions: [
          InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) =>
                        NewOrUpdateMeal(type: 'Add', categories: _categories),
                  ),
                );
              },
              child: Image.asset('assets/images/Vector.png')),
          SizedBox(width: 10),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          _categories.clear();
          _meals.clear();
          await Future.delayed(Duration(seconds: 1));
          await initValues();
          setState(() {});
        },
        child: SingleChildScrollView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              FutureBuilder(
                future: initValues(),
                builder: (ctx, AsyncSnapshot snapshot) {
                  switch (snapshot.connectionState) {
                    case ConnectionState.waiting:
                      return SizedBox();
                    case ConnectionState.done:
                      return ListView.separated(
                        itemCount: _categories.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          Category _category = _categories[i];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.0.w),
                                child: Text(
                                  _category.nameUz!,
                                  style: TextStyle(
                                    color: MainColors.blackColor,
                                    fontSize: 20.0.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                              foodCategoryListItem(category: _category),
                            ],
                          );
                        },
                        separatorBuilder: (ctx, i) => SizedBox(height: 15.0.h),
                      );
                    default:
                      return SizedBox();
                  }
                },
              ),
              SizedBox(height: 30.0.h),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: InkWell(
                  onTap: () {
                    _storeCategoryController.clear();
                    showModelSheet(
                      context,
                      controller: _storeCategoryController,
                      onSave: () async {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Container(
                                width: 15.w,
                                height: 15.w,
                                child: CupertinoActivityIndicator(),
                              ),
                            );
                          },
                        );
                        var res = await OwnerNetwork.storeCategories(
                          params: {
                            "name_uz": _storeCategoryController.text,
                            "name_ru": _storeCategoryController.text,
                            "name_en": _storeCategoryController.text,
                            "description_uz": _storeCategoryController.text,
                            "description_ru": _storeCategoryController.text,
                            "description_en": _storeCategoryController.text,
                          },
                        );
                        await Future.delayed(Duration(seconds: 1));
                        if (res.id != null) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Container(
                                  child: Text("Category qo'shildi"),
                                ),
                                actions: [
                                  ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
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
                      },
                    );
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    height: 45,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: MainColors.greenColor,
                        borderRadius: BorderRadius.circular(8)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Add new category",
                          style: TextStyle(
                              color: MainColors.whiteColor, fontSize: 17),
                        ),
                        Image.asset(
                          'assets/images/Vector.png',
                          color: MainColors.whiteColor,
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        color: MainColors.greenColor,
      ),
    );
  }

  Widget foodListItem({required Meal meal}) {
    return Container(
      width: 222.0.w,
      height: 222.0.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 3,
            spreadRadius: 1,
          )
        ],
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 126.0.h,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: CachedNetworkImageProvider(
                    'https://in-advance.bingo99.uz${meal.imagePath}'),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Align(
              alignment: Alignment.topRight,
              child: Material(
                color: Colors.transparent,
                elevation: 0.0,
                child: IconButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => NewOrUpdateMeal(
                            type: 'Edit',
                            meal: meal,
                            categories: _categories)));
                  },
                  icon: Container(
                    width: 40.0.w,
                    height: 40.0.h,
                    decoration: BoxDecoration(
                        color: Color(0xFF00BB4B).withOpacity(0.15),
                        shape: BoxShape.circle),
                    child: Icon(Icons.edit,
                        color: MainColors.greenColor, size: 15.0.w),
                  ),
                  splashColor: MainColors.greenColor,
                  splashRadius: 20.0.w,
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: 11.0.h,
              left: 10.0.w,
              right: 10.0.w,
              bottom: 16.0.h,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 150.w,
                      child: Text(
                        meal.nameUz!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 18.0.sp,
                          color: MainColors.blackColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: 6.0.h),
                    Text(
                      meal.price!,
                      style: TextStyle(
                        color: MainColors.greenColor,
                        fontSize: 16.0.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  'salad',
                  style: TextStyle(
                    color: MainColors.blackColor.withOpacity(0.6),
                    fontSize: 14.0.sp,
                    fontWeight: FontWeight.w500,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget foodCategoryListItem({required Category category}) {
    bool isCategoryHaveMeals = false;
    for (var meal in _meals) {
      if (category.id.toString() == meal.categoryId) {
        isCategoryHaveMeals = true;
        break;
      } else {
        isCategoryHaveMeals = false;
      }
    }
    switch (isCategoryHaveMeals) {
      case true:
        return Container(
          height: 230.h,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            physics:
                AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
            itemCount: _meals.length,
            padding: EdgeInsets.symmetric(vertical: 10.0.w, horizontal: 15.0.w),
            itemBuilder: (ctx, i) {
              Meal _meal = _meals[i];
              if (category.id.toString() == _meal.categoryId) {
                return foodListItem(meal: _meal);
              } else {
                return SizedBox();
              }
            },
            separatorBuilder: (ctx, i) {
              Meal _meal = _meals[i];
              if (category.id.toString() == _meal.categoryId) {
                return SizedBox(width: 15.0.w);
              } else {
                return SizedBox();
              }
            },
          ),
        );
      default:
        return SizedBox();
    }
  }
}
