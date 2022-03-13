import 'package:flutter/material.dart';
import 'package:inadvance/models/rest_foods.dart';
import 'package:inadvance/pages/simple_user_screens/user_savatcha_screen.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestaurantInfosPage extends StatefulWidget {
  const RestaurantInfosPage({Key? key}) : super(key: key);

  @override
  _RestaurantInfosPageState createState() => _RestaurantInfosPageState();
}

class _RestaurantInfosPageState extends State<RestaurantInfosPage> {
  List<String> menuCategories = [
    "Salatlar",
    "Fast Food",
    "Desertlar",
    "Souslar",
    "Taomlar",
  ];

  String foodDescription =
      "A persistent bottom sheet shows information that supplements the primary content of the app.";

  List<RestaurantFood> foods = [
    RestaurantFood(
        foodName: "Grechiski",
        foodCost: 20000,
        foodImage:
            "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
    RestaurantFood(
        foodName: "Grechiski",
        foodCost: 20000,
        foodImage:
            "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
    RestaurantFood(
        foodName: "Grechiski",
        foodCost: 20000,
        foodImage:
            "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
    RestaurantFood(
        foodName: "Grechiski",
        foodCost: 20000,
        foodImage:
            "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
    RestaurantFood(
        foodName: "Grechiski",
        foodCost: 20000,
        foodImage:
            "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
    RestaurantFood(
        foodName: "Grechiski",
        foodCost: 20000,
        foodImage:
            "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
  ];

  int isCategory = 0;
  bool isSearching = false;
  double width = 80;
  int foodCount = 1;
  bool isAddedFood = false;
  int foodCost = 23000;

  late ScrollController controller;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          CustomScrollView(
            //  controller: controller,
            slivers: [
              SliverAppBar(
                elevation: 0,
                floating: false,
                pinned: true,
                snap: false,
                backgroundColor: MainColors.whiteColor,
                expandedHeight: 175.h,
                actions: [
                  Center(child: Icon(Icons.search_sharp)),
                  const SizedBox(
                    width: 20,
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Rayhon"),
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(left: 15, bottom: 15),
                  background: Container(
                    height: 200.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(top: 40),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
                        "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg"),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "National food",
                          style: TextStyle(
                              color: Colors.grey[700], fontSize: 15.sp),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 40.h,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: MainColors.greenColor.withOpacity(.2)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.orangeAccent,
                                    size: 20.w,
                                  ),
                                  Text(" ${4.9}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: MainColors.greenColor,
                                    size: 20.w,
                                  ),
                                  Text(" 9:00 - 22:00"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: MainColors.greenColor,
                                    size: 20.w,
                                  ),
                                  SelectableText(
                                    " +998998507504",
                                    onTap: () {},
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Hozir bu restoran yopiq!",
                          style: TextStyle(color: Colors.red),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              categoryName("Menu", 25),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 40.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: menuCategories.length,
                    itemBuilder: (ctx, category) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            isCategory = category;
                          });
                        },
                        child: Container(
                          height: 45.h,
                          width: menuCategories[category].length * 15,
                          margin: EdgeInsets.only(left: 15),
                          decoration: BoxDecoration(
                              color: isCategory == category
                                  ? MainColors.greenColor.withOpacity(.2)
                                  : Colors.grey[300],
                              borderRadius: BorderRadius.circular(8)),
                          child: foodCategories(menuCategories[category]),
                        ),
                      );
                    },
                  ),
                ),
              ),
              categoryName("Salatlar", 20),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
                sliver: SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        return Card(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            alignment: Alignment.center,
                            child: foodInfos(),
                          ),
                        );
                      },
                      childCount: foods.length,
                    ),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 5.h,
                      crossAxisSpacing: 5.w,
                      childAspectRatio: 3 / 4,
                    )),
              ),
            ],
          ),
          isAddedFood
              ? Positioned(
                  bottom: 30.h,
                  left: 15.w,
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => UserShopScreen()));
                    },
                    child: Container(
                      height: 40.h,
                      width: SizeConfig.screenWidth! - 30,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MainColors.greenColor),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.shopping_cart_rounded,
                                  color: MainColors.whiteColor,
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Savatcha $foodCount",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                            Text(
                              "${foodCost * foodCount} UZS",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget foodInfos() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () => showModalBottomSheet(
              context: context, builder: (context) => bottomSheetAdd()),
          child: Container(
            height: 170.h,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(8),
                topRight: Radius.circular(8),
              ),
              image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://restaurantengine.com/wp-content/uploads/2013/12/Restaurant-Trends-Local-Foods-660x440.jpg")),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(5.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Grechiski",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                "$foodCost UZS",
                style: TextStyle(fontSize: 12.sp),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget foodCategories(String category) {
    return Center(
      child: Text(category),
    );
  }

  Widget categoryName(String nameCtg, double fontSize) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.only(left: 15, bottom: 10, top: 10),
        child: Text(
          nameCtg,
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }

  Widget searching() {
    return TextField(
      decoration:
          InputDecoration(hintText: "Searching", border: InputBorder.none),
    );
  }

  Widget bottomSheetAdd() {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter myState) {
        return Container(
          height: (140 + foodDescription.length / 1.5).h,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Grechiski salat",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17.sp),
                        ),
                        Text(
                          "23 000 so'm",
                          style: TextStyle(
                              color: MainColors.greenColor, fontSize: 17.sp),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      foodDescription,
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        setState(() {
                          isAddedFood = true;
                        });
                      },
                      child: Container(
                        height: 40.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: MainColors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Text(
                          "Qo'shish",
                          style: TextStyle(
                              color: MainColors.whiteColor, fontSize: 15.sp),
                        )),
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 165.w,
                      decoration: BoxDecoration(
                        color: MainColors.greenColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              if (foodCount > 1) {
                                myState(() {
                                  foodCount--;
                                });
                              }
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "-",
                                    style: TextStyle(fontSize: 25.sp),
                                  )),
                            ),
                          ),
                          Text(
                            "$foodCount",
                            style: TextStyle(
                                fontSize: 20.sp, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: () {
                              myState(() {
                                foodCount++;
                              });
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "+",
                                    style: TextStyle(fontSize: 23.sp),
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
