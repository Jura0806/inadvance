import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/models/category_model.dart';
import 'package:inadvance/models/meal_model.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_menu_screen/update_or_new_meal.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:inadvance/widgets/restaurant_owner_widgets/owner_menu_bottomSheet.dart';

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
            fontSize: getWidth(24.0),
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
                        separatorBuilder: (ctx, i) =>
                            SizedBox(height: getHeight(15.0)),
                      );
                    } else {
                      return SizedBox();
                    }
                  } else {
                    return SizedBox();
                  }
                },
              ),
              SizedBox(height: getHeight(30.0)),
              Container(
                alignment: Alignment.bottomCenter,
                padding: EdgeInsets.symmetric(horizontal: getWidth(15.0)),
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
      width: getWidth(222.0),
      height: getHeight(222.0),
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
            height: getHeight(126.0),
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
                    width: getWidth(40.0),
                    height: getWidth(40.0),
                    decoration: BoxDecoration(
                        color: Color(0xFF00BB4B).withOpacity(0.15),
                        shape: BoxShape.circle),
                    child: Icon(Icons.edit,
                        color: MainColors.greenColor, size: getWidth(15.0)),
                  ),
                  splashColor: MainColors.greenColor,
                  splashRadius: getWidth(20.0),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              top: getHeight(11.0),
              left: getWidth(10.0),
              right: getWidth(10.0),
              bottom: getHeight(16.0),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: getWidth(150.0),
                      child: Text(
                        meal.nameEn!,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: getWidth(18.0),
                          color: MainColors.blackColor,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    SizedBox(height: getHeight(6.0)),
                    Text(
                      meal.price!,
                      style: TextStyle(
                        color: MainColors.greenColor,
                        fontSize: getWidth(16.0),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Text(
                  'salad',
                  style: TextStyle(
                    color: MainColors.blackColor.withOpacity(0.6),
                    fontSize: getWidth(14.0),
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
          padding: EdgeInsets.only(left: getWidth(15.0)),
          child: Text(
            category.nameUz!,
            style: TextStyle(
              color: MainColors.blackColor,
              fontSize: getWidth(20.0),
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
                height: getHeight(230.0),
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  physics: AlwaysScrollableScrollPhysics(
                      parent: BouncingScrollPhysics()),
                  itemCount: meals!.length,
                  padding: EdgeInsets.symmetric(
                      vertical: getHeight(10.0), horizontal: getWidth(15.0)),
                  itemBuilder: (ctx, i) {
                    Meal _meal = meals[i];
                    return foodListItem(meal: _meal);
                  },
                  separatorBuilder: (ctx, index) =>
                      SizedBox(width: getWidth(15.0)),
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
