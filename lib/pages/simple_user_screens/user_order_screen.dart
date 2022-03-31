import 'package:flutter/material.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class UserOrderScreen extends StatefulWidget {
  const UserOrderScreen({Key? key}) : super(key: key);
  static final String id = "user_order_screen";

  @override
  _UserOrderScreenState createState() => _UserOrderScreenState();
}

class _UserOrderScreenState extends State<UserOrderScreen> {
  int isNowOrder = 1;
  List? data ;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Stack(
            children: [
              Container(
                height: 35.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryOrders(categoryName: "today", x: 1),
                  categoryOrders(categoryName: "story", x: 2),
                ],
              ),
            ],
          ),
        ),
      ),
      body: SafeArea(
        child: ListView(
          children: [
            isNowOrder == 1? nowOrder(): storyOrder(),
          ],
        ),
      ),
    );
  }

  Widget categoryOrders({required String categoryName, required int x}) {
    return InkWell(
      onTap: () {
        setState(() {
          isNowOrder = x;
        });
      },
      child: Container(
        height: 35.h,
        width: SizeConfig.screenWidth! / 2 - 30,
        decoration: BoxDecoration(
            color:
                isNowOrder == x ? MainColors.greenColor : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8)),
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
                color: isNowOrder == x
                    ? MainColors.whiteColor
                    : MainColors.blackColor,
                fontSize: 15.sp),
          ).tr(),
        ),
      ),
    );
  }

  Widget nowOrder() {
    return Column(
      children: [
        data == null ? Padding(
          padding:  EdgeInsets.symmetric(horizontal: 50.h,vertical: SizeConfig.screenWidth!/1.5),
          child: Text(
            "emptyOrder",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.screenWidth! / 20,
            ),
          ).tr(),
        ) :  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 100.h,
                  width: 106.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://d4t7t8y8xqo0t.cloudfront.net/resized/750X436/eazytrendz%2F2947%2Ftrend20200930101748.jpg"))),
                ),
                const SizedBox(width: 5,),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Rayhon", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                      const SizedBox(height: 10,),
                      Text("56000" + "UZS", style: TextStyle( fontSize: 13.sp, color: MainColors.greenColor),),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          Icon(Icons.watch_later, size: 15.sp,),
                          Text(" 9:00 "),
                          const SizedBox(width: 5,),
                          Icon(Icons.table_chart, size: 15.sp,),
                          Text(" 5-stol "),
                          const SizedBox(width: 5,),
                          Icon(Icons.date_range, size: 15.sp,),
                          Text(" 15.02.2022 ")
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ) ,
      ],
    );
  }

  Widget storyOrder() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Card(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 100.h,
              width: 106.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: NetworkImage(
                          "https://d4t7t8y8xqo0t.cloudfront.net/resized/750X436/eazytrendz%2F2947%2Ftrend20200930101748.jpg"))),
            ),
            const SizedBox(width: 5,),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Rayhon", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                  const SizedBox(height: 10,),
                  Text("56000" + "UZS", style: TextStyle( fontSize: 13.sp, color: MainColors.redColor),),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.watch_later, size: 15.sp,),
                      Text(" 9:00 "),
                      const SizedBox(width: 5,),
                      Icon(Icons.table_chart, size: 15.sp,),
                      Text(" 5- " + "table".tr()),
                      const SizedBox(width: 5,),
                      Icon(Icons.date_range, size: 15.sp,),
                      Text(" 15.02.2022 ")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

}
