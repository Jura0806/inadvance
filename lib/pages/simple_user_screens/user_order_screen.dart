import 'package:flutter/material.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

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
<<<<<<< HEAD
                height: 40,
=======
                height: 35.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  categoryOrders(categoryName: "Hozirgi", x: 1),
                  categoryOrders(categoryName: "Tarix", x: 2),
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
<<<<<<< HEAD
        height: 40,
=======
        height: 35.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                fontSize: 17),
=======
                fontSize: 15.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          ),
        ),
      ),
    );
  }

  Widget nowOrder() {
    return Column(
      children: [
        data == null ? Padding(
<<<<<<< HEAD
          padding:  EdgeInsets.symmetric(horizontal: 50,vertical: SizeConfig.screenWidth!/1.5),
=======
          padding:  EdgeInsets.symmetric(horizontal: 50.h,vertical: SizeConfig.screenWidth!/1.5),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          child: Text(
            "Sizda aktiv holatdagi buyurtmalar yo'q!",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: SizeConfig.screenWidth! / 20,
            ),
          ),
        ) :  Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
<<<<<<< HEAD
                  height: SizeConfig.screenWidth! / 4,
                  width: SizeConfig.screenWidth! / 3.5,
=======
                  height: 100.h,
                  width: 106.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                      Text("Rayhon", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                      const SizedBox(height: 10,),
                      Text("56000" + "UZS", style: TextStyle( fontSize: 15, color: MainColors.greenColor),),
                      const SizedBox(height: 30,),
                      Row(
                        children: [
                          Icon(Icons.watch_later, size: 20,),
                          Text(" 19:00   "),
                          Icon(Icons.table_chart, size: 20,),
                          Text(" 5-stol   "),
                          Icon(Icons.date_range, size: 20,),
                          Text("15.02.2022  ")
=======
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
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
              height: SizeConfig.screenWidth! / 4,
              width: SizeConfig.screenWidth! / 3.5,
=======
              height: 100.h,
              width: 106.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                  Text("Rayhon", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                  const SizedBox(height: 10,),
                  Text("56000" + "UZS", style: TextStyle( fontSize: 15, color: MainColors.greenColor),),
                  const SizedBox(height: 30,),
                  Row(
                    children: [
                      Icon(Icons.watch_later, size: 20,),
                      Text(" 19:00   "),
                      Icon(Icons.table_chart, size: 20,),
                      Text(" 5-stol   "),
                      Icon(Icons.date_range, size: 20,),
                      Text("15.02.2022  ")
=======
                  Text("Rayhon", style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15.sp),),
                  const SizedBox(height: 10,),
                  Text("56000" + "UZS", style: TextStyle( fontSize: 13.sp, color: MainColors.greenColor),),
                  const SizedBox(height: 30,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.watch_later, size: 15.sp,),
                      Text(" 9:00 "),
                      const SizedBox(width: 5,),
                      Icon(Icons.table_chart, size: 15.sp,),
                      Text(" 5-stol "),
                      const SizedBox(width: 5,),
                      Icon(Icons.date_range, size: 15.sp,),
                      Text(" 15.02.2022 ")
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
