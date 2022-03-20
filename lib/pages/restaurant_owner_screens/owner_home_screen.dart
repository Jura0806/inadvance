import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inadvance/utils/colors.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({Key? key}) : super(key: key);

  @override
  _OwnerHomeScreenState createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  List<Map<String, dynamic>> rate = [
    {
      "images": 'assets/images/order_vector.svg',
      "title": '423',
      "subtitle": "Order recieved "
    },
    {
      "images": 'assets/images/new_customer.svg',
      "title": '280',
      "subtitle": "New customers"
    },
    {
      "images": 'assets/images/earning_vector.svg',
      "title": '\$1452',
      "subtitle": "Earning "
    }
  ];
  List<Map<String, dynamic>> foods = [
    {
      "images": 'assets/images/Rectangle 686.png',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
      "leading": "15 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 709.png',
      "title": 'Freelow',
      "subtitle": "Fast food",
      "leading": "30 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 686.png',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
      "leading": "15 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 708.png',
      "title": 'Burger',
      "subtitle": "Fast food",
      "leading": "21 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 709.png',
      "title": 'Freelow',
      "subtitle": "Fast food",
      "leading": "30 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 708.png',
      "title": 'Burger',
      "subtitle": "Fast food",
      "leading": "21 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 686.png',
      "title": 'Murskoy Kapris',
      "subtitle": "salat",
      "leading": "15 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 709.png',
      "title": 'Freelow',
      "subtitle": "Fast food",
      "leading": "30 000 UZS"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Restaurant overview"),
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              height: 255.h,
              //width:double.infinity,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    // padding: EdgeInsets.only(top: 10),
                    // margin: EdgeInsets.all(8),
                    height: 70.h,
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30.w,
                          backgroundColor: MainColors.greenColor,
                          child: SvgPicture.asset(
                            rate[index]['images'],
                            color: MainColors.whiteColor,
                            height: 25.h,
                            width: 25.w,
                          ),
                        ),
                        title: Text(
                          rate[index]['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
                        ),
                        subtitle: Text(rate[index]['subtitle']),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  children: [
                    Text(
                      "\nToday's hot menu",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 255.h,
                      //width:double.infinity,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) => Container(
                          height: 65.h,
                          width: double.infinity,
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 22.w,
                                child: Image.asset(foods[index]['images']),
                              ),
                              title: Text(foods[index]['title']),
                              subtitle: Text(foods[index]['subtitle']),
                              trailing: Text(
                                foods[index]['leading'],
                                style: TextStyle(fontWeight: FontWeight.w700),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            TextButton(
                onPressed: () {
                  HiveOwnerSignUp().removeOwner();
                },
                child: Text("Remove_Owner's_Register_Data")),
          ],
        ),
      ),
    );
  }
}
