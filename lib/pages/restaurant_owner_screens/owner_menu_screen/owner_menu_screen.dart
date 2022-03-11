
import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_menu_screen/add_menu.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:inadvance/widgets/restaurant_owner_widgets/owner_menu_bottomSheet.dart';

class OwnerMenuScreen extends StatefulWidget {
  const OwnerMenuScreen({Key? key}) : super(key: key);

  @override
  _OwnerMenuScreenState createState() => _OwnerMenuScreenState();
}

class _OwnerMenuScreenState extends State<OwnerMenuScreen> {
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

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Menu",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
        ),
        actions: [
          InkWell(
              onTap: () {
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
                categoryFoodList(0),
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
        ],
      ),
    );
  }

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
        ),
      ],
    );
  }
}
