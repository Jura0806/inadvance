import 'package:flutter/material.dart';
import 'package:inadvance/models/rest_foods.dart';
import 'package:inadvance/pages/simple_user_screens/user_savatcha_screen.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

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

<<<<<<< HEAD
   String foodDescription = "A persistent bottom sheet shows information that supplements the primary content of the app.";
=======
  String foodDescription =
      "A persistent bottom sheet shows information that supplements the primary content of the app.";
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

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
<<<<<<< HEAD
        "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
=======
            "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
    RestaurantFood(
        foodName: "Grechiski",
        foodCost: 20000,
        foodImage:
<<<<<<< HEAD
        "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),


=======
            "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
  ];

  int isCategory = 0;
  bool isSearching = false;
  double width = 80;
  int foodCount = 1;
  bool isAddedFood = false;
  int foodCost = 23000;

<<<<<<< HEAD
  late ScrollController controller ;
=======
  late ScrollController controller;

>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          CustomScrollView(
<<<<<<< HEAD
          //  controller: controller,
=======
            //  controller: controller,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            slivers: [
              SliverAppBar(
                elevation: 0,
                floating: false,
                pinned: true,
                snap: false,
                backgroundColor: MainColors.whiteColor,
<<<<<<< HEAD
                expandedHeight: SizeConfig.screenWidth!/1.15,
                actions: [
                  Center(child: Icon(Icons.search_sharp)),
                  SizedBox(
=======
                expandedHeight: 175.h,
                actions: [
                  Center(child: Icon(Icons.search_sharp)),
                  const SizedBox(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    width: 20,
                  )
                ],
                flexibleSpace: FlexibleSpaceBar(
                  title: Text("Rayhon"),
                  centerTitle: true,
<<<<<<< HEAD
                   titlePadding: EdgeInsets.only(left: 15,bottom: 15),
                  background: Container(
                    height: 200,
                    width: SizeConfig.screenWidth,
                    margin: EdgeInsets.only(top: 40),
=======
                  titlePadding: EdgeInsets.only(left: 15, bottom: 15),
                  background: Container(
                    height: 200.h,
                    width: 35.w,
                    margin: const EdgeInsets.only(top: 40),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Image.network(
<<<<<<< HEAD
                      "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg"),
=======
                        "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg"),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                          style: TextStyle(color: Colors.grey[700], fontSize: 17),
=======
                          style: TextStyle(
                              color: Colors.grey[700], fontSize: 15.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
<<<<<<< HEAD
                          height: 40,
=======
                          height: 40.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                                    size: 20,
=======
                                    size: 20.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                  ),
                                  Text(" ${4.9}"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.watch_later,
                                    color: MainColors.greenColor,
<<<<<<< HEAD
                                    size: 20,
=======
                                    size: 20.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                  ),
                                  Text(" 9:00 - 22:00"),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.phone,
                                    color: MainColors.greenColor,
<<<<<<< HEAD
                                    size: 20,
                                  ),
                                  SelectableText( " +998998507504", onTap: (){

                                  },),
=======
                                    size: 20.w,
                                  ),
                                  SelectableText(
                                    " +998998507504",
                                    onTap: () {},
                                  ),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                  height: 40,
=======
                  height: 40.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                          height: 45,
=======
                          height: 45.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                      mainAxisSpacing: 7.5,
                      crossAxisSpacing: 7.5,
=======
                      mainAxisSpacing: 5.h,
                      crossAxisSpacing: 5.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                      childAspectRatio: 3 / 4,
                    )),
              ),
            ],
          ),
<<<<<<< HEAD
         isAddedFood? Positioned(
            bottom: 30,
            left: 15,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => UserShopScreen() ));
              },
              child: Container(
                height: 40,
                width: SizeConfig.screenWidth! - 30,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: MainColors.greenColor
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.shopping_cart_rounded, color: MainColors.whiteColor,),
                          SizedBox(width: 5,),
                          Text("Savatcha $foodCount", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),),
                        ],
                      ),
                     Text("${foodCost * foodCount} UZS", style: TextStyle(color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
              ),
            ),
          ) :  const SizedBox.shrink(),
=======
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
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
            height: SizeConfig.screenWidth! / 2.2,
=======
            height: 170.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
=======
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),
              ),
              const SizedBox(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                height: 5,
              ),
              Text(
                "$foodCost UZS",
<<<<<<< HEAD
                style: TextStyle(fontSize: 15),
=======
                style: TextStyle(fontSize: 12.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
=======
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.w600),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
      builder: (BuildContext context, StateSetter myState){
        return Container(
          height: 160 + foodDescription.length/1.5,
=======
      builder: (BuildContext context, StateSetter myState) {
        return Container(
          height: (140 + foodDescription.length / 1.5).h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                        ),
                        Text(
                          "23 000 so'm",
                          style: TextStyle(color: MainColors.greenColor, fontSize: 17),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      foodDescription,
                      style: TextStyle(fontSize: 15),
=======
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
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
<<<<<<< HEAD
                      onTap: (){
=======
                      onTap: () {
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                        Navigator.of(context).pop();
                        setState(() {
                          isAddedFood = true;
                        });
                      },
                      child: Container(
<<<<<<< HEAD
                        height: 45,
                        width: SizeConfig.screenWidth! / 2.8,
=======
                        height: 40.h,
                        width: 150.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                        decoration: BoxDecoration(
                          color: MainColors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Text(
<<<<<<< HEAD
                              "Qo'shish",
                              style:
                              TextStyle(color: MainColors.whiteColor, fontSize: 17),
                            )),
                      ),
                    ),
                    Container(
                      height: 45,
                      width: SizeConfig.screenWidth! / 2,
=======
                          "Qo'shish",
                          style: TextStyle(
                              color: MainColors.whiteColor, fontSize: 15.sp),
                        )),
                      ),
                    ),
                    Container(
                      height: 40.h,
                      width: 165.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                      decoration: BoxDecoration(
                        color: MainColors.greenColor.withOpacity(.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
<<<<<<< HEAD
                              if(foodCount > 1) {
=======
                              if (foodCount > 1) {
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                myState(() {
                                  foodCount--;
                                });
                              }
<<<<<<< HEAD

                            },
                            child: Container(
                              height: 35,
                              width: 35,
=======
                            },
                            child: Container(
                              height: 30.h,
                              width: 30.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "-",
<<<<<<< HEAD
                                    style: TextStyle(fontSize: 30),
=======
                                    style: TextStyle(fontSize: 25.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                  )),
                            ),
                          ),
                          Text(
                            "$foodCount",
                            style: TextStyle(
<<<<<<< HEAD
                                fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          GestureDetector(
                            onTap: (){
                             myState((){
                               foodCount++;
                             });
                            },
                            child: Container(
                              height: 35,
                              width: 35,
=======
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
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Align(
                                  alignment: Alignment.topCenter,
                                  child: Text(
                                    "+",
<<<<<<< HEAD
                                    style: TextStyle(fontSize: 25),
=======
                                    style: TextStyle(fontSize: 23.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                  )),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
<<<<<<< HEAD
                SizedBox(height: 5,),
=======
                const SizedBox(
                  height: 5,
                ),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              ],
            ),
          ),
        );
      },
    );
  }
}
