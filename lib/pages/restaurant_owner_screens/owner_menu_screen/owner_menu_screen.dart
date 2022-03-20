import 'package:cached_network_image/cached_network_image.dart';
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
  late Future<List<Category>> _categories;
  late Future<List<Meal>> _meals;

  @override
  void initState() {
    _categories = OwnerNetwork.getCategories();
    _meals = OwnerNetwork.getMeals();
    super.initState();
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
                        NewOrUpdateMeal(type: 'Add'),
                  ),
                );
              },
              child: Image.asset('assets/images/Vector.png')),
          SizedBox(width: 10),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Duration(seconds: 1));
          _categories = OwnerNetwork.getCategories();
          _meals = OwnerNetwork.getMeals();
          setState(() {});
        },
        child: SingleChildScrollView(
          physics:
              AlwaysScrollableScrollPhysics(parent: BouncingScrollPhysics()),
          child: Column(
            children: [
              FutureBuilder<List<Category>>(
                future: _categories,
                builder: (ctx, AsyncSnapshot<List<Category>> snapshot) {
                  List<Category>? _categories = snapshot.data;
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return SizedBox();
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      return SizedBox();
                    } else if (snapshot.hasData) {
                      return ListView.separated(
                        itemCount: _categories!.length,
                        physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (ctx, i) {
                          Category _category = _categories[0];
                          return foodCategoryListItem(category: _category);
                        },
                        separatorBuilder: (ctx, i) => SizedBox(height: 15.0.h),
                      );
                    } else {
                      return SizedBox();
                    }
                  } else {
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
                    showModelSheet(context);
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
                            )));
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
                        meal.nameEn!,
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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.0.w),
          child: Text(
            category.nameUz!,
            style: TextStyle(
              color: MainColors.blackColor,
              fontSize: 20.0.sp,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        FutureBuilder<List<Meal>>(
          future: _meals,
          builder: (ctx, AsyncSnapshot<List<Meal>> snapshot) {
            List<Meal>? meals = snapshot.data;
            if (snapshot.hasError) {
              return SizedBox();
            } else if (snapshot.hasData) {
              return Container(
                height: 230.0.h,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: meals!.length,
                  padding: EdgeInsets.symmetric(
                      vertical: 10.0.w, horizontal: 15.0.w),
                  itemBuilder: (ctx, i) {
                    Meal _meal = meals[i];
                    return foodListItem(meal: _meal);
                  },
                  separatorBuilder: (ctx, index) => SizedBox(width: 15.0.w),
                ),
              );
            } else {
              return SizedBox();
            }
          },
        ),
      ],
    );
  }
}
