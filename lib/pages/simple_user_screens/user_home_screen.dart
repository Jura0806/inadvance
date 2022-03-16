import 'dart:math';

import 'package:flutter/material.dart';
import 'package:inadvance/models/categories_restaurant.dart';
import 'package:inadvance/models/restaurants_model.dart';
import 'package:inadvance/pages/simple_user_screens/restaurant_infos_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
          height: 35.h,
          width: 300.w,
          padding: const EdgeInsets.only(left: 10),
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
      body: Padding(
        padding: const EdgeInsets.only(
          left: 15,
          right: 15,
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

            // << Top Restaurants List Horizontall>>
            Container(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: restaurants.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: Container(
                      width: 235.w,
                      height: 210.h,
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
              style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 15,
            ),
            SizedBox(
              height: 40.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: categories.length,
                itemBuilder: (ctx, i) {
                  return Container(
                    height: 40.h,
                    margin: const EdgeInsets.only(right: 15),
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
            padding: const EdgeInsets.only(bottom: 10),
            height: 150.h,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
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
                  Text(
                    restaurants.restaurantName,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                  ),
                  const SizedBox(
                    height: 7,
                  ),
                  Text(
                    restaurants.restaurantsFoodType,
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15.w,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${restaurants.restaurantFeedback}",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
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
        style: TextStyle(fontWeight: FontWeight.w600),
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
            height: 155.h,
            width: double.infinity,
            child: ClipRRect(
              child: Image.network(
                restaurants.restaurantImage,
                fit: BoxFit.cover,
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
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    restaurants.restaurantsFoodType,
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15.w,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${restaurants.restaurantFeedback}",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w600),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
