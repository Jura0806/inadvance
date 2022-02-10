import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/models/restaurants_model.dart';
import 'package:inadvance/pages/about_app_page.dart';
import 'package:inadvance/utils/responsive_size.dart';

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
  List<String> categories = [
    "Favourites",
    "New",
    "Popular",
    "Cafe",
    "Chayxana"
  ];

  List<Color> colors = [
    Colors.greenAccent.shade50,
    Colors.pinkAccent.shade50,
    Colors.deepPurpleAccent.shade50,
    Colors.lightGreenAccent.shade50,
    Colors.limeAccent.shade50,
    Colors.blueAccent.shade50,
  ];

  Color colorRandom() {
    return colors[Random().nextInt(colors.length)];
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SafeArea(
          child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 35,
                      width: SizeConfig.screenWidth! / 1.3,
                      padding: EdgeInsets.only(left: 10),
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
                    Icon(Icons.notifications),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                    // Container(
                    //   height: SizeConfig.screenHeight! / 4.5,
                    //   child: ListView.builder(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: restaurants.length,
                    //     itemBuilder: (ctx, i) {
                    //       return Card(
                    //         child: Container(
                    //           width: SizeConfig.screenWidth! / 1.75,
                    //           height: SizeConfig.screenHeight! / 4.5,
                    //           decoration: BoxDecoration(
                    //               borderRadius: BorderRadius.circular(8)),
                    //           child: topRestaurants(restaurants[i]),
                    //         ),
                    //       );
                    //     },
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "All Categories",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    // Container(
                    //   height: SizeConfig.screenWidth! / 12,
                    //   child: ListView.separated(
                    //     scrollDirection: Axis.horizontal,
                    //     itemCount: categories.length,
                    //     separatorBuilder: (BuildContext context, int index) =>
                    //         SizedBox(
                    //       width: 10,
                    //     ),
                    //     itemBuilder: (ctx, i) {
                    //       return category(categories[i]);
                    //     },
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    // Container(
                    //   width: double.infinity,
                    //   child: ListView.separated(
                    //     physics: NeverScrollableScrollPhysics(),
                    //     itemCount: restaurants.length,
                    //     itemBuilder: (ctx, i){
                    //       return Card(
                    //         child: Container(
                    //           height: SizeConfig.screenWidth,
                    //             width: double.infinity,
                    //             child: allRestaurants(restaurants[i])),
                    //       );
                    //     },
                    //     separatorBuilder: (BuildContext context, index) => SizedBox(height: 10,) ,
                    //   ),
                    // )
                  ],
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }

  Widget topRestaurants(Restaurants restaurants) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.only(bottom: 10),
          height: SizeConfig.screenHeight! / 6,
          width: double.infinity,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8), topRight: Radius.circular(8)),
            child: Image.network(
              restaurants.restaurantImage,
              fit: BoxFit.cover,
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
                  Container(
                    height: SizeConfig.blockSizeHorizontal! * 5,
                    child: FittedBox(
                      child: Text(
                        restaurants.restaurantName,
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
                        restaurants.restaurantsFoodType,
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.amber,
                  ),
                  const SizedBox(
                    width: 3,
                  ),
                  Text(
                    "${restaurants.restaurantFeedback}",
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
                  )
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Widget category(String category) {
    return Container(
      decoration: BoxDecoration(
        color: colorRandom(),
        borderRadius: BorderRadius.circular(5),
      ),
      height: SizeConfig.screenWidth! / 12,
      width: category.length * 15,
      child: Center(
        child: Text(category),
      ),
    );
  }

  Widget allRestaurants(Restaurants restaurants) {
    return AspectRatio(
        aspectRatio: 9 / 6,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: SizeConfig.screenWidth! / 2.2,
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
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        restaurants.restaurantsFoodType,
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        size: 15,
                        color: Colors.amber,
                      ),
                      const SizedBox(
                        width: 3,
                      ),
                      Text(
                        "${restaurants.restaurantFeedback}",
                        style: TextStyle(
                            fontSize: 12, fontWeight: FontWeight.bold),
                      )
                    ],
                  )
                ],
              ),
            )
          ],
        ));
  }
}
