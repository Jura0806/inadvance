import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_payment_page.dart';
import 'package:inadvance/utils/colors.dart';
<<<<<<< HEAD
import 'package:inadvance/utils/responsive_size.dart';
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

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
        title: Text("Savatcha"),
        actions: [
          Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
<<<<<<< HEAD
          SizedBox(
=======
         const SizedBox(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            width: 10,
          ),
        ],
      ),
      body: data == null
          ? Center(
              child: Text(
                "Savatcha bo'sh",
<<<<<<< HEAD
                style: TextStyle(fontSize: 20),
=======
                style: TextStyle(fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              ),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              children: [
                Text(
                  "Rayhon",
<<<<<<< HEAD
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
=======
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                ),
                const SizedBox(
                  height: 25,
                ),
                foods(),
                foods(),
                foods(),
                foods(),
<<<<<<< HEAD
                SizedBox(height: SizeConfig.screenWidth! * 1.1 - 3 * 95),
=======
                SizedBox(height: 200.h),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jami summa",
<<<<<<< HEAD
                      style: TextStyle(fontSize: 20),
=======
                      style: TextStyle(fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    ),
                    Text(
                      "94 000 UZS",
                      style:
<<<<<<< HEAD
                          TextStyle(fontSize: 20, color: MainColors.greenColor),
=======
                          TextStyle(fontSize: 17.sp, color: MainColors.greenColor),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                    height: 55,
=======
                    height: 45.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: MainColors.greenColor,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        "Davom etish",
                        style: TextStyle(
<<<<<<< HEAD
                            color: MainColors.whiteColor, fontSize: 20),
=======
                            color: MainColors.whiteColor, fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                      ),
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
<<<<<<< HEAD
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
=======
          style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w600),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "23 000 UZS",
<<<<<<< HEAD
              style: TextStyle(fontSize: 17, color: Colors.grey[700]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: 180,
=======
              style: TextStyle(fontSize: 15.sp, color: Colors.grey[700]),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 40.h,
              width: 170.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                        height: 35,
                        width: 35,
=======
                        height: 30.h,
                        width: 30.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
<<<<<<< HEAD
                                fontWeight: FontWeight.bold, fontSize: 25),
=======
                                fontWeight: FontWeight.w600, fontSize: 20.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
=======
                          TextStyle(fontWeight: FontWeight.w600, fontSize: 20.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          foodCount++;
                        });
                      },
                      child: Container(
<<<<<<< HEAD
                        height: 35,
                        width: 35,
=======
                        height: 30.h,
                        width: 30.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
<<<<<<< HEAD
                                fontWeight: FontWeight.bold, fontSize: 22),
=======
                                fontWeight: FontWeight.w600, fontSize: 20.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
