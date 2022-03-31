import 'dart:math';
import 'package:easy_localization/easy_localization.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/models/categories_restaurant.dart';
import 'package:inadvance/models/restaurant_model.dart';
import 'package:inadvance/models/restaurants_model.dart';
import 'package:inadvance/pages/simple_user_screens/restaurant_infos_page.dart';
import 'package:inadvance/services/network_owner_http.dart';
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
  List<Restaurants> fakeRestaurants = [
    Restaurants(
        restaurantName: "Rayhon",
        restaurantImage:
            "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg",
        restaurantFeedback: 4.9,
        restaurantsFoodType: "Foreign cuisine"),
    Restaurants(
        restaurantName: "TheFork",
        restaurantImage:
            "https://media.blogto.com/articles/20211009-1Hotel-15.jpg?w=2048&cmd=resize_then_crop&height=1365&quality=70",
        restaurantFeedback: 4.9,
        restaurantsFoodType: "National Food"),
    Restaurants(
        restaurantName: "FoodTime",
        restaurantImage:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR-y5DHzl80LUYbmm-ZqEReSxL2D9hKB6vf6_HPTxmGi5bEIW4-5K0cYHkOT5gkwdR7YM&usqp=CAU",
        restaurantFeedback: 4.9,
        restaurantsFoodType: "Foreign cuisine"),
    Restaurants(
        restaurantName: "Mosse",
        restaurantImage:
            "https://media-cdn.tripadvisor.com/media/photo-s/12/74/2e/25/about-our-lovely-place.jpg",
        restaurantFeedback: 4.9,
        restaurantsFoodType: "Foreign cuisine"),
  ];
  List<CategoriesRest> categories = [
    CategoriesRest(category: "Favourites"),
    CategoriesRest(category: "New"),
    CategoriesRest(category: "Popular"),
    CategoriesRest(category: "Cafe"),
    CategoriesRest(category: "Chayxana"),
  ];

  List<Color> colors = [
    MainColors.categoryPink,
    MainColors.categoryBlue,
    MainColors.categoryGreen,
    MainColors.categoryPurple,
    MainColors.categoryLime,
    MainColors.dimRedColor,
    MainColors.categoryLightGreen,
  ];

  Color colorRandom() {
    return colors[Random().nextInt(colors.length)];
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  //  print(OwnerNetwork.getRestaurants());
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
        padding: EdgeInsets.only(
          left: 15.w,
          right: 15.w,
          top: 10.h,
        ),
        child: ListView(
          children: [
            SizedBox(height: 20.h),
            Text(
              "recommend",
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
              ),
            ).tr(),
            SizedBox(height: 10.h),

            // << Top Restaurants List Horizontall>>
            Container(
              height: 200.h,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: fakeRestaurants.length,
                itemBuilder: (ctx, i) {
                  return Card(
                    child: Container(
                      width: 235.w,
                      height: 210.h,
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(8)),
                      child: topRestaurants(fakeRestaurants[i]),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Text(
              "allCategories".tr(),
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
            const SizedBox(height: 15),
            FutureBuilder<List<Restaurant>>(
              future: OwnerNetwork.getRestaurants(),
              builder: (context, AsyncSnapshot<List<Restaurant>> snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return SizedBox();
                } else if (snapshot.connectionState == ConnectionState.done) {
                  List<Restaurant> restaurants = snapshot.data!;
                  if (snapshot.hasError) {
                    return SizedBox();
                  } else if (snapshot.hasData) {
                    return Column(
                      children: restaurants
                          .map(
                            (restaurant) => Card(
                              margin: EdgeInsets.symmetric(vertical: 10),
                              child: Container(
                                height: 212.h,
                                child: singleRestaurant(restaurant),
                              ),
                            ),
                          )
                          .toList(),
                    );
                  } else {
                    return SizedBox();
                  }
                } else {
                  return SizedBox();
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget topRestaurants(Restaurants restaurants) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        InkWell(
          onTap: () {
            // Navigator.of(context).push(MaterialPageRoute(
            //     builder: (BuildContext context) => RestaurantInfosPage()));
          },
          child: Container(
            height: 140.h,
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
          padding: const EdgeInsets.only(left: 8, right: 12, bottom: 7),
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

  Widget singleRestaurant(Restaurant restaurant) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => RestaurantInfosPage(
                      restId: restaurant.id.toString(),
                      restName: restaurant.name,
                  phone: restaurant.phone,
                  openTime: restaurant.openTime,
                  closeTime: restaurant.closeTime,
                  image: NetworkImage('https://in-advance.bingo99.uz${restaurant.imagePath}'),
                    )));
          },
          child: Container(
            height: 155.h,
            width: double.infinity,
            child: ClipRRect(
              child: CachedNetworkImage(
                imageUrl:
                    'https://in-advance.bingo99.uz${restaurant.imagePath}',
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
                    restaurant.name!,
                    style:
                        TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    "foodType",
                    style: TextStyle(color: Colors.grey, fontSize: 13.sp),
                  ).tr(),
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
                    '4.9',
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
