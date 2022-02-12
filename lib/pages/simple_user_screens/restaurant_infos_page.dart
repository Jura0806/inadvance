import 'package:flutter/material.dart';
import 'package:inadvance/models/rest_foods.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            elevation: 0,
            floating: false,
            pinned: true,
            snap: false,
            backgroundColor: MainColors.whiteColor,
            expandedHeight: SizeConfig.screenWidth!,
            // title: Align(
            //   alignment: Alignment.topRight,
            //   child: InkWell(
            //     onTap: (){
            //       setState(() {
            //         isSearching = !isSearching;
            //       });
            //     },
            //     child: AnimatedContainer(
            //       height: 40,
            //       width: isSearching? width : SizeConfig.screenWidth! / 1.65,
            //       decoration: BoxDecoration(
            //         color: Colors.grey.shade200,
            //         borderRadius: BorderRadius.circular(8),
            //       ),
            //       duration: Duration(milliseconds: 400),
            //       child: isSearching? searching():  Center(child: Icon(Icons.search_sharp)),
            //     ),
            //   ),
            // ),
            actions: [
              Center(child: Icon(Icons.search_sharp)),
              SizedBox(
                width: 20,
              )
            ],
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Rayhon"),
              centerTitle: false,
              // titlePadding: EdgeInsets.only(left: 20,),
              background: Container(
                height: 200,
                width: SizeConfig.screenWidth,
                padding: EdgeInsets.only(top: 25),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.network(
                      "http://cdn.cnn.com/cnnnext/dam/assets/200120161356-cnn-worlds-best-new-restaurants---madera---simon-brown-photography-1-1.jpg"),
                ),
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
                      style: TextStyle(color: Colors.grey[700], fontSize: 17),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: MainColors.greenColor.withOpacity(.2)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon(
                            Icons.star,
                            color: Colors.orangeAccent,
                            size: 20,
                          ),
                          Text(" ${4.9}"),
                          Icon(
                            Icons.watch_later,
                            color: MainColors.greenColor,
                            size: 20,
                          ),
                          Text(" 9:00 - 22:00"),
                          Icon(
                            Icons.phone,
                            color: MainColors.greenColor,
                            size: 20,
                          ),
                          Text(" +998 99 850 75 04"),
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
              height: 40,
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
                      height: 45,
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
                  mainAxisSpacing: 7.5,
                  crossAxisSpacing: 7.5,
                  childAspectRatio: 3 / 4,
                )),
          ),
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
              context: context, builder: (context) => addToSavatcha()),
          child: Container(
            height: SizeConfig.screenWidth! / 2.2,
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
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "${23000} UZS",
                style: TextStyle(fontSize: 15),
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
          style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold),
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

  Widget addToSavatcha() {
    return Container(
      height: 250,
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Grechiski salat",
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
              "A persistent bottom sheet shows information that supplements the primary content of the app.",
              style: TextStyle(fontSize: 15),
            ),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 45,
                  width: SizeConfig.screenWidth! / 2.8,
                  decoration: BoxDecoration(
                    color: MainColors.greenColor,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Center(
                      child: Text(
                    "Qo'shish",
                    style:
                        TextStyle(color: MainColors.whiteColor, fontSize: 17),
                  )),
                ),
                Container(
                  height: 45,
                  width: SizeConfig.screenWidth! / 2,
                  decoration: BoxDecoration(
                    color: MainColors.greenColor.withOpacity(.2),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      InkWell(
                        onTap: () {
                          if(foodCount > 1) {
                            setState(() {
                              foodCount--;
                            });
                          }

                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "-",
                                style: TextStyle(fontSize: 30),
                              )),
                        ),
                      ),
                      Text(
                        "$foodCount",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      InkWell(
                        onTap: (){
                          setState(() {
                            foodCount++;
                          });
                        },
                        child: Container(
                          height: 35,
                          width: 35,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "+",
                                style: TextStyle(fontSize: 25),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
