import 'package:flutter/material.dart';
import 'package:inadvance/models/rest_foods.dart';
import 'package:inadvance/pages/simple_user_screens/user_savatcha_screen.dart';
import 'package:inadvance/services/network_client_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class RestaurantInfosPage extends StatefulWidget {
  String? restId;
  String? restName;
  String? openTime;
  String? closeTime;
  String? phone;
  NetworkImage? image;

  RestaurantInfosPage(
      {Key? key,
      this.restId,
      this.restName,
      this.image,
      this.openTime,
      this.closeTime,
      this.phone})
      : super(key: key);

  @override
  _RestaurantInfosPageState createState() => _RestaurantInfosPageState();
}

class _RestaurantInfosPageState extends State<RestaurantInfosPage> {
  List<String> menuCategories = [
    "Salads",
    "Fast Foods",
    "Deserts",
    "Sous",
  ];

  void getRestaurantInfo() async {
    var response = await NetworkClient.ownerProfileGet("25");
    print(response);
  }

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.restName!),
      ),
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          ListView(
            children: [
              Container(
                height: 175.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: widget.image!,
                      fit: BoxFit.cover),
                ),
              ),
              SizedBox(
                height: 7,
              ),
              Container(
                child: Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 10.sp),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "foodType",
                        style:
                            TextStyle(color: Colors.grey[700], fontSize: 15.sp),
                      ).tr(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 35.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: MainColors.greenColor.withOpacity(.2)),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Text(" ${widget.openTime} - ${widget.closeTime}"),
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
                                  " +998${widget.phone}",
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
                        "isOpenRestaurant",
                        style: TextStyle(color: Colors.red),
                      ).tr(),
                    ],
                  ),
                ),
              ),
              categoryName("menu".tr(), 25),
              SizedBox(
                height: 35.h,
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
                        //height: 40.h,
                        width: menuCategories[category].length * 13,
                        margin: EdgeInsets.only(left: 10.sp),
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
              categoryName("Salads", 20),
              Padding(
                padding:  EdgeInsets.only(left:10.sp, right: 10.sp),
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Card(
                        child: foodInfos(),
                      );
                    },
                    itemCount: foods.length,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 3.h,
                      crossAxisSpacing: 3.w,
                      childAspectRatio: 0.75,
                    )),
              )
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
                                  "shopping".tr() + "$foodCount",
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
    return Padding(
      padding:  EdgeInsets.only(left: 10.sp, bottom: 10.sp, top: 10.sp),
      child: Text(
        nameCtg,
        style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
      ),
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
                          "23 000 " + "money".tr(),
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
                          "add",
                          style: TextStyle(
                              color: MainColors.whiteColor, fontSize: 15.sp),
                        ).tr()),
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
