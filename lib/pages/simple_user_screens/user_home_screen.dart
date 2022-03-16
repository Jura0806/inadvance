import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inadvance/models/categories_restaurant.dart';
import 'package:inadvance/models/restaurants_model.dart';
import 'package:inadvance/pages/simple_user_screens/restaurant_infos_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

class UserHomeScreen extends StatefulWidget {
  const UserHomeScreen({Key? key}) : super(key: key);
  static final String id = "user_home_screen";

  @override
  _UserHomeScreenState createState() => _UserHomeScreenState();
}

class _UserHomeScreenState extends State<UserHomeScreen> {
  List<Restaurants> restaurants = [
    Restaurants(
        restaurantName: "Rayhon",
        restaurantImage:
            "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg",
        restaurantFeedback: 4.9,
        restaurantsFoodType: "National Food"),
    Restaurants(
        restaurantName: "Rayhon",
        restaurantImage:
            "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg",
        restaurantFeedback: 4.9,
        restaurantsFoodType: "National Food"),
    Restaurants(
        restaurantName: "Rayhon",
        restaurantImage:
            "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg",
        restaurantFeedback: 4.9,
        restaurantsFoodType: "National Food"),
    Restaurants(
        restaurantName: "Rayhon",
        restaurantImage:
            "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg",
        restaurantFeedback: 4.9,
        restaurantsFoodType: "National Food"),
  ];
  List<CategoriesRest> categories = [
    CategoriesRest(category: "Favourites"),
    CategoriesRest(category: "New"),
    CategoriesRest(category: "Popular"),
    CategoriesRest(category: "Cafe"),
    CategoriesRest(category: "Chayxana"),
  ];

  List<Color> colors = [
    MainColors.categoryBlue,
    MainColors.categoryGreen,
    MainColors.categoryLightGreen,
    MainColors.categoryPurple,
    MainColors.categoryLime,
    MainColors.categoryPink,
    MainColors.dimRedColor,
  ];

  Color colorRandom() {
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Container(
<<<<<<< HEAD
          height: 35,
          width: SizeConfig.screenWidth! / 1.3,
          padding: EdgeInsets.only(left: 10),
=======
          height: 35.h,
          width: 300.w,
          padding: const EdgeInsets.only(left: 10),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          decoration: BoxDecoration(
            color: Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              Icon(Icons.location_on),
              const SizedBox(
                width: 10,
              ),
              Text(
                "Chilonzor",
                style: TextStyle(color: Colors.grey.shade700),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Icon(Icons.notifications),
          ),
        ],
      ),
<<<<<<< HEAD
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
=======
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          top: 10,
        ),
        child: ListView(
          children: [
            const SizedBox(
              height: 20,
            ),
            Text(
              "Recomment",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
<<<<<<< HEAD
            // << Top Restaurants List Horizontall>>
            Container(
              height: SizeConfig.screenHeight! / 4.5,
=======

            // << Top Restaurants List Horizontall>>
            Container(
              height: 200.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: restaurants.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: Container(
<<<<<<< HEAD
                      width: SizeConfig.screenWidth! / 1.75,
                      height: SizeConfig.screenHeight! / 4.5,
=======
                      width: 235.w,
                      height: 210.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: topRestaurants(restaurants[i]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "All Categories",
<<<<<<< HEAD
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40,
=======
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (ctx, i) {
                  return Container(
<<<<<<< HEAD
                    height: 40,
                    margin: EdgeInsets.only(right: 15),
=======
                    height: 40.h,
                    margin: const EdgeInsets.only(right: 15),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    width: categories[i].category.length * 17.5,
                    decoration: BoxDecoration(
                      color: colorRandom(),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: category(categories[i]),
                  );
                },
                // separatorBuilder: (BuildContext context, index) => SizedBox(width: 10,),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
<<<<<<< HEAD
            Container(
                width: double.infinity,
                child: Column(
                  children: restaurants
                      .map(
                        (restoran) => Card(
                          child: Container(
                              height: SizeConfig.screenWidth! / 1.65,
                              //width: double.infinity,
                              child: allRestaurants(restoran)),
                        ),
                      )
                      .toList(),
                )),
          ],
        ),
      )),
=======
            Column(
              children: restaurants
                  .map(
                    (restoran) => Card(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      child: Container(
                          height: 212.h,
                          child: allRestaurants(restoran)),
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
    );
  }

  Widget topRestaurants(Restaurants restaurants) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => RestaurantInfosPage()));
          },
          child: Container(
<<<<<<< HEAD
            padding: EdgeInsets.only(bottom: 10),
            height: SizeConfig.screenHeight! / 6,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
=======
            padding: const EdgeInsets.only(bottom: 10),
            height: 150.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
              child: Image.network(
                restaurants.restaurantImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8, right: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
<<<<<<< HEAD
                  Container(
                    height: SizeConfig.blockSizeHorizontal! * 5,
                    child: FittedBox(
                      child: Text(
                        restaurants.restaurantName,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
=======
                  Text(
                    restaurants.restaurantName,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  ),
                  const SizedBox(
                    height: 7,
                  ),
<<<<<<< HEAD
                  Container(
                    height: SizeConfig.blockSizeHorizontal! * 3.5,
                    child: FittedBox(
                      child: Text(
                        restaurants.restaurantsFoodType,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
=======
                  Text(
                    restaurants.restaurantsFoodType,
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
<<<<<<< HEAD
                    size: 15,
=======
                    size: 15.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${restaurants.restaurantFeedback}",
<<<<<<< HEAD
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
=======
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget category(CategoriesRest categoriesRest) {
    return Center(
      child: Text(
        categoriesRest.category,
<<<<<<< HEAD
        style: TextStyle(fontWeight: FontWeight.bold),
=======
        style: TextStyle(fontWeight: FontWeight.w600),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      ),
    );
  }

  Widget allRestaurants(Restaurants restaurants) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => RestaurantInfosPage()));
          },
          child: Container(
<<<<<<< HEAD
            height: SizeConfig.screenWidth! / 2.2,
=======
            height: 155.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            width: double.infinity,
            child: ClipRRect(
              child: Hero(
                tag: "1",
                child: Image.network(
                  restaurants.restaurantImage,
                  fit: BoxFit.cover,
                ),
              ),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(8), topLeft: Radius.circular(8)),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10, top: 10, right: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    restaurants.restaurantName,
<<<<<<< HEAD
                    style: TextStyle(fontWeight: FontWeight.bold),
=======
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    restaurants.restaurantsFoodType,
<<<<<<< HEAD
                    style: TextStyle(color: Colors.grey.shade800),
=======
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
<<<<<<< HEAD
                    size: 15,
=======
                    size: 15.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${restaurants.restaurantFeedback}",
<<<<<<< HEAD
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
=======
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  )
                ],
              )
            ],
          ),
<<<<<<< HEAD
        )
=======
        ),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      ],
    );
  }
}
