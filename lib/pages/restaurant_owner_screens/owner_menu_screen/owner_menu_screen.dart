<<<<<<< HEAD
import 'dart:ffi';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/models/category_model.dart';
import 'package:inadvance/models/meal_model.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_menu_screen/update_or_new_meal.dart';
import 'package:inadvance/services/network_owner_http.dart';
=======

import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_menu_screen/add_menu.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:inadvance/widgets/restaurant_owner_widgets/owner_menu_bottomSheet.dart';

class OwnerMenuScreen extends StatefulWidget {
  const OwnerMenuScreen({Key? key}) : super(key: key);

  @override
  _OwnerMenuScreenState createState() => _OwnerMenuScreenState();
}

class _OwnerMenuScreenState extends State<OwnerMenuScreen> {
<<<<<<< HEAD
  late Future<List<Category>> _categories;
  late Future<List<Meal>> _meals;

  @override
  void initState() {
    _categories = OwnerNetwork.getCategories();
    _meals = OwnerNetwork.getMeals();
    super.initState();
  }
=======
  List<Map<String, dynamic>> foods = [
    {
      "images": 'assets/images/cola.jpg',
      "images2": 'assets/images/salat1.jpg',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
      "leading": "15 000 UZS"
    },
    {
      "images": 'assets/images/sekn.jpg',
      "images2": 'assets/images/salat2.jpg',
      "title": 'Freelow',
      "subtitle": "Fast food",
      "leading": "30 000 UZS"
    },
    {
      "images": 'assets/images/cola.jpg',
      "images2": 'assets/images/salat3.jpg',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
      "leading": "15 000 UZS"
    },
    {
      "images": 'assets/images/sekn.jpg',
      "images2": 'assets/images/salat1.jpg',
      "title": 'Burger',
      "subtitle": "Fast food",
      "leading": "21 000 UZS"
    },
    {
      "images": 'assets/images/fastfood.jpg',
      "images2": 'assets/images/salat3.jpg',
      "title": 'Freelow',
      "subtitle": "Fast food",
      "leading": "30 000 UZS"
    },
    {
      "images": 'assets/images/sekn.jpg',
      "images2": 'assets/images/salat1.jpg',
      "title": 'Burger',
      "subtitle": "Fast food",
      "leading": "21 000 UZS"
    },
    {
      "images": 'assets/images/cola.jpg',
      "images2": 'assets/images/salat2.jpg',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
      "leading": "15 000 UZS"
    },
    {
      "images": 'assets/images/fastfood.jpg',
      "images2": 'assets/images/salat3.jpg',
      "title": 'Freelow',
      "subtitle": "Fast food",
      "leading": "30 000 UZS"
    },
  ];
  List<Map<String, dynamic>> gowo = [
    {
      "images2": 'assets/images/salat2.jpg',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
    },
    {
      "images2": 'assets/images/salat2.jpg',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
    },
    {
      "images2": 'assets/images/salat2.jpg',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
    }
  ];

  List<String> categories = [
    "Salads",
    "Fast Foods",
  ];
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
<<<<<<< HEAD
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            fontSize: getWidth(24.0),
            color: MainColors.blackColor,
          ),
=======
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
        ),
        actions: [
          InkWell(
              onTap: () {
<<<<<<< HEAD
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
=======
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AddMenu()));
              },
              child: Image.asset('assets/images/Vector.png')),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10),
            child: ListView(
              children: [
                categoryFoodList(0),
                categoryFoodList(1),
            
                Container(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10),
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
                ),
              ],
            ),
          ),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
        ],
      ),
    );
  }

<<<<<<< HEAD
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
=======
  Widget foodList(int i) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddMenu()));
          },
          child: Container(
            padding: EdgeInsets.only(bottom: 10),
            height: SizeConfig.screenHeight! / 6,
            width: double.infinity,
            child: Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                  child: Image.asset(
                    foods[i]["images"],
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.amber,
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                        colors: [
                          MainColors.greenColor.withOpacity(.2),
                          MainColors.greenColor.withOpacity(.2),
                          MainColors.greenColor.withOpacity(.2),
                        ]
                      )
                    ),
                    child: IconButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => AddMenu()));
                      },
                      icon: Icon(Icons.edit),
                      color: Colors.green,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: SizeConfig.blockSizeHorizontal! * 5,
                    child: FittedBox(
                      child: Text(
                        foods[i]["title"],
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Container(
                    height: SizeConfig.blockSizeHorizontal! * 3.5,
                    child: FittedBox(
                      child: Text(
                        foods[0]["leading"],
                        style: TextStyle(
                            color: MainColors.greenColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ],
              ),
              Text(
                foods[0]["subtitle"],
                style: TextStyle(
                  fontSize: 14,
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget categoryFoodList(int i) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          categories[i],
          style: TextStyle(
              color: MainColors.blackColor,
              fontSize: 22,
              fontWeight: FontWeight.bold),
        ),
        Container(
          margin: EdgeInsets.only(top: 10, bottom: 20),
          height: SizeConfig.screenHeight! / 4.25,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            shrinkWrap: true,
            itemCount: foods.length,
            itemBuilder: (ctx, i) {
              return Card(
                child: Container(
                  width: SizeConfig.screenWidth! / 1.75,
                  height: SizeConfig.screenHeight! / 4.25,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(8)),
                  child: foodList(i),
                ),
              );
            },
          ),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
        ),
      ],
    );
  }
}
