import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
<<<<<<< HEAD
import 'package:inadvance/services/hive_db_owner_service.dart';
=======
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:inadvance/utils/colors.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({Key? key}) : super(key: key);

  @override
  _OwnerHomeScreenState createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  List<Map<String, dynamic>> rate = [
    {
<<<<<<< HEAD
      "images": 'assets/images/Group 394.png',
=======
      "images": 'assets/images/order_vector.svg',
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      "title": '423',
      "subtitle": "Order recieved "
    },
    {
<<<<<<< HEAD
      "images": 'assets/images/customers.png',
=======
      "images": 'assets/images/new_customer.svg',
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      "title": '280',
      "subtitle": "New customers"
    },
    {
<<<<<<< HEAD
      "images": 'assets/images/earning.png',
=======
      "images": 'assets/images/earning_vector.svg',
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
              height: 280,
=======
              height: 255.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              //width:double.infinity,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
<<<<<<< HEAD
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    // padding: EdgeInsets.only(top: 10),
                    // margin: EdgeInsets.all(8),
                    height: 80,
=======
                      borderRadius: BorderRadius.circular(8)),
                  child: Container(
                    // padding: EdgeInsets.only(top: 10),
                    // margin: EdgeInsets.all(8),
                    height: 70.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
<<<<<<< HEAD
                          radius: 30,
                          child: Image.asset(rate[index]['images']),
=======
                          radius: 30.w,
                          backgroundColor: MainColors.greenColor,
                          child: SvgPicture.asset(
                            rate[index]['images'],
                            color: MainColors.whiteColor,
                            height: 25.h,
                            width: 25.w,
                          ),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                        ),
                        title: Text(
                          rate[index]['title'],
                          style: TextStyle(
<<<<<<< HEAD
                              fontWeight: FontWeight.bold, fontSize: 18),
=======
                              fontWeight: FontWeight.bold, fontSize: 15.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
=======
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                child: Column(
                  children: [
                    Text(
                      "\nToday's hot menu",
                      textAlign: TextAlign.left,
                      style:
<<<<<<< HEAD
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
=======
                          TextStyle(fontSize: 17.sp, fontWeight: FontWeight.bold),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Container(
<<<<<<< HEAD
                      height: 275,
=======
                      height: 255.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                      //width:double.infinity,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) => Container(
<<<<<<< HEAD
                          height: 70,
=======
                          height: 65.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                          width: double.infinity,
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
<<<<<<< HEAD
                                radius: 25,
=======
                                radius: 22.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                child: Image.asset(foods[index]['images']),
                              ),
                              title: Text(foods[index]['title']),
                              subtitle: Text(foods[index]['subtitle']),
                              trailing: Text(
                                foods[index]['leading'],
<<<<<<< HEAD
                                style: TextStyle(fontWeight: FontWeight.bold),
=======
                                style: TextStyle(fontWeight: FontWeight.w700),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                onPressed: (){
                  HiveOwnerSignUp().removeOwner();
                },
                child: Text("Remove_Owner's_Register_Data")),

=======
                onPressed: () {
                  HiveOwnerSignUp().removeOwner();
                },
                child: Text("Remove_Owner's_Register_Data")),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          ],
        ),
      ),
    );
  }
}
