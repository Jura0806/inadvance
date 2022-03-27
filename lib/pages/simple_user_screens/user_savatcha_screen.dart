import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_payment_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class UserShopScreen extends StatefulWidget {
  const UserShopScreen({Key? key}) : super(key: key);
  static final String id = "user_shop_screen";

  @override
  _UserShopScreenState createState() => _UserShopScreenState();
}

class _UserShopScreenState extends State<UserShopScreen> {
  int foodCount = 1;
  final int i = 1;

  List? data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("shopping").tr(),
        actions: [
          Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
         const SizedBox(
            width: 10,
          ),
        ],
      ),
      body: data == null
          ? Center(
              child: Text(
                "emptyShopping",
                style: TextStyle(fontSize: 17.sp),
              ).tr(),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              children: [
                Text(
                  "Rayhon",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                ),
                const SizedBox(
                  height: 25,
                ),
                foods(),
                foods(),
                foods(),
                foods(),
                SizedBox(height: 200.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "totalSumma",
                      style: TextStyle(fontSize: 17.sp),
                    ).tr(),
                    Text(
                      "92 000 UZS",
                      style:
                          TextStyle(fontSize: 17.sp, color: MainColors.greenColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => UserPaymentPage()));
                  },
                  child: Container(
                    height: 45.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MainColors.greenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            color: MainColors.whiteColor, fontSize: 17.sp),
                      ).tr(),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget foods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Grechiski",
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "23 000 UZS",
              style: TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40.h,
              width: 170.w,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (foodCount >= 1) {
                          setState(() {
                            foodCount--;
                          });
                        }
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.sp),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: MainColors.whiteColor,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    Text(
                      "$foodCount",
                      style:
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          foodCount++;
                        });
                      },
                      child: Container(
                        height: 30.h,
                        width: 30.w,
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 20.sp),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: MainColors.whiteColor,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}
