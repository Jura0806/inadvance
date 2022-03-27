import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/models/restaurant_tables_model.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_draw_scheme.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerTableScreen extends StatefulWidget {
  const OwnerTableScreen({
    Key? key,
  }) : super(key: key);

  @override
  _OwnerTableScreenState createState() => _OwnerTableScreenState();
}

class _OwnerTableScreenState extends State<OwnerTableScreen> {
  int indexPage = 0;
  var getResponse;
  final tableNumber = List.generate(20, (index) => "$index");
  late PageController pageController;

  Map<String, dynamic> listTables = {};
  List listTables2 = [];
  bool isLoading = true;

  List floor1 = [];
  List floor2 = [];
  List floor3 = [];
  List floor4 = [];
  List floor5 = [];
  List<List> floors = [];

  void apiTableList(String? nextPage) async {
    var response = await OwnerNetwork.ownersGetTableList(nextPage);
    if (response != null) {
      setState(() {
        getResponse = response;
        listTables2 = jsonDecode(response)["data"]["data"];
        isLoading = false;
        List.generate(listTables2.length, (index) {
          if (listTables2[index]["floor"] == "1") {
            floor1.add(listTables2[index]);
          } else if (listTables2[index]["floor"] == "2") {
            floor2.add(listTables2[index]);
          } else if (listTables2[index]["floor"] == "3") {
            floor3.add(listTables2[index]);
          } else if (listTables2[index]["floor"] == "4") {
            floor4.add(listTables2[index]);
          } else if (listTables2[index]["floor"] == "5") {
            floor5.add(listTables2[index]);
          }
        });
        List<List> floorss = [floor1, floor2, floor3, floor4, floor5];
        checkFloorList(floorss);
      });
    }
    // print( response);
  }

  checkFloorList(List<List> floorr) {
    setState(() {
      floorr.forEach((v) {
        if (v.isNotEmpty) {
          floors.add(v);
        }
      });
    });
  }

  @override
  void initState() {
    pageController = PageController(initialPage: indexPage);
    super.initState();
    apiTableList("");
    // setState(() {
    //   isDrawTable = true;
    // });
    // print("isDrawTAble: ${widget.isDrawTables}");
    // print("flooor: ${widget.floor}");
    // print("cost: ${widget.costTable}");
    // print("numberTable: ${widget.numberTable}");
    // print("startTAble: ${widget.startTable}");
    // print("endTable: ${widget.endTable}");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getResponse != null
          ? AppBar(
              title: GestureDetector(
                onTap: () {
                  // print(apiTableList());
                  //apiTableList("");
                  print(listTables2[2]["id"]);
                  print("list ${floors.length}");
                },
                child: Text(
                  "Tables",
                  style: TextStyle(color: MainColors.whiteColor),
                ),
              ),
              actions: [
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => DrawScheme(
                                setNum: '',
                                floor: '',
                              )));
                    },
                    child: Image.asset(
                      'assets/images/Vector.png',
                      color: MainColors.whiteColor,
                      height: 20,
                      width: 20,
                    )),
                SizedBox(
                  width: 15.w,
                ),
              ],
              backgroundColor: MainColors.greenColor,
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(25.h),
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 2.h),
                  height: 45.h,
                  child: Card(
                    child: Padding(
                      padding: EdgeInsets.only(left: 15.w),
                      child: ListView(
                        // controller: pageController,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Row(
                            children: List.generate(floors.length, (index) {
                              return TextButton(
                                  onPressed: () {
                                    setState(() {
                                      indexPage = index;
                                      pageController.animateToPage(index,
                                          duration: Duration(milliseconds: 100),
                                          curve: Curves.bounceIn);
                                    });
                                  },
                                  child: Text(
                                    "${index + 1} - floor",
                                    style: TextStyle(
                                        decoration: index == indexPage
                                            ? TextDecoration.underline
                                            : TextDecoration.none,
                                        color: index == indexPage
                                            ? MainColors.greenColor
                                            : MainColors.blackColor,
                                        fontSize: 15.sp),
                                  ));
                            }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
          : AppBar(
              title: Text(
                "Tables",
                style: TextStyle(color: MainColors.whiteColor),
              ),
              backgroundColor: MainColors.greenColor,
            ),
      body: getResponse != null
          ? isLoading
              ? Center(
                  child: CircularProgressIndicator(
                  color: MainColors.greenColor,
                ))
              : RefreshIndicator(
                  onRefresh: () async {
                    await Future.delayed(Duration(seconds: 1));
                    apiTableList("");
                    setState(() {});
                  },
                  child: PageView.builder(
                    controller: pageController,
                    onPageChanged: (int page) {
                      setState(() {
                        indexPage = page;
                      });
                    },
                    itemCount: floors.length,
                    itemBuilder: (ctx, item) => buildGridView(floors[item]),
                  ),
                )
          : noScheme(),
    );
  }

  Widget buildTableCard(int number, List floor) {
    return InkWell(
      onTap: () {
        print(floor[number]["orders"].toString()=="[]");
        number != floor.length
            ? Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DrawScheme(
                      floor: floor[number]["floor"],
                      setNum: floor[number]["set_num"],
                      price: floor[number]["price"],
                      index: floor[number]["index"],
                      id: floor[number]["id"],
                    )))
            : apiTableList("?page=2");
      },
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
        child: Container(
          padding: EdgeInsets.all(10.w),
          decoration: BoxDecoration(
              color:
                  number == 1 ? MainColors.greenColor : MainColors.whiteColor,
              border: Border.all(
                width: 0.3.sp,
                color:
                    number == 1 ? MainColors.whiteColor : MainColors.greenColor,
              ),
              borderRadius: BorderRadius.circular(8.w)),
          child: number != floor.length
              ? GridTile(
                  header: Text(
                    "${floor[number]["price"]} UZS",
                    style: TextStyle(
                        fontSize: 10.sp,
                        color: number == 1
                            ? MainColors.whiteColor
                            : MainColors.blackColor),
                    textAlign: TextAlign.left,
                  ),
                  child: Center(
                    child: Text(
                      "${floor[number]["index"]}",
                      style: TextStyle(
                          color: number == 1
                              ? MainColors.whiteColor
                              : MainColors.greenColor,
                          fontSize: 25.sp,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  footer: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "${floor[number]["set_num"]} kishilik   ${floor[number]["floor"]}",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: number == 1
                                ? MainColors.whiteColor
                                : MainColors.blackColor),
                      ),
                      number == 1
                          ? Icon(
                              Icons.lock,
                              size: 15.sp,
                              color: MainColors.whiteColor,
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                )
              : GridTile(
                  child: Center(
                  child: Icon(
                    Icons.replay,
                    size: 25,
                    color: MainColors.greenColor,
                  ),
                )),
        ),
      ),
    );
  }

  Widget buildGridView(List floor) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 3.w, mainAxisSpacing: 3.w),
      padding: EdgeInsets.all(10.w),
      itemCount: floor.length + 1,
      itemBuilder: (ctx, index) {
        // final item = tableNumber[index];
        return buildTableCard(index, floor);
      },
    );
  }

  Widget noScheme() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(),
        Center(
            child: Text(
          "This is no any scheme",
          style: TextStyle(fontSize: 17.sp),
        )),
        Spacer(),
        InkWell(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (BuildContext context) => DrawScheme(
                      setNum: '',
                      floor: '',
                    )));
          },
          child: Container(
            margin: EdgeInsets.symmetric(horizontal: 15.w),
            height: 45.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: MainColors.greenColor,
              borderRadius: BorderRadius.circular(8.w),
            ),
            child: Center(
              child: Text(
                "Sxema chizish",
                style: TextStyle(color: MainColors.whiteColor, fontSize: 20),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }
}
