import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_draw_scheme.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OwnerTableScreen extends StatefulWidget {
  String? floor;
  int? numberTable;
  int? costTable;
  String? startTable;
  String? endTable;
  bool? isDrawTables = false;

  OwnerTableScreen({
    Key? key,
    this.floor,
    this.numberTable,
    this.costTable,
    this.startTable,
    this.endTable,
    this.isDrawTables,
  }) : super(key: key);

  @override
  _OwnerTableScreenState createState() => _OwnerTableScreenState();
}

class _OwnerTableScreenState extends State<OwnerTableScreen> {
  int indexPage = 0;
  bool isDrawTable = true;
  final tableNumber = List.generate(20, (index) => "$index");
  List<String> floors = ["1 - floor", "2 - floor"];
  late PageController pageController;


  @override
  void initState() {
    pageController = PageController(initialPage: indexPage);
    super.initState();
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
      appBar: isDrawTable
          ? AppBar(
              title: Text(
                "Tables",
                style: TextStyle(color: MainColors.whiteColor),
              ),
              actions: [
                InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (BuildContext context) => DrawScheme()));
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
                      padding:  EdgeInsets.only(left: 15.w),
                      child: Row(
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
                                floors[index],
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
      body: isDrawTable
          ? PageView(
              controller: pageController,
              onPageChanged: (int page) {
                setState(() {
                  indexPage = page;
                });
              },
              children: [buildGridView(), Center(child: Text("TExtt"))],
            )
          : noScheme(),
    );
  }

  Widget buildTableCard(String number) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.w)),
      child: Container(
        padding: EdgeInsets.all(10.w),
        decoration: BoxDecoration(
            border: Border.all(
              width: 0.3.sp,
              color: MainColors.greenColor,
            ),
            borderRadius: BorderRadius.circular(8.w)),
        child: GridTile(
          header: Text(
            "10.000 UZS",
            style: TextStyle(fontSize: 10.sp),
            textAlign: TextAlign.left,
          ),
          child: Center(
            child: Text(
              "$number",
              style: TextStyle(
                  color: MainColors.greenColor,
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold),
            ),
          ),
          footer: Text(
            "4 kishilik",
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3, crossAxisSpacing: 3.w, mainAxisSpacing: 3.w),
      padding: EdgeInsets.all(10.w),
      itemCount: tableNumber.length,
      itemBuilder: (ctx, index) {
        final item = tableNumber[index];
        return buildTableCard(item);
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
                builder: (BuildContext context) => DrawScheme()));
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
