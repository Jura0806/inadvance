import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/utils/colors.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

class ClientProfilePage extends StatefulWidget {
  int item ;
  ClientProfilePage({Key? key, required this.item}) : super(key: key);

  @override
  _ClientProfilePageState createState() => _ClientProfilePageState();
}

class _ClientProfilePageState extends State<ClientProfilePage> {

  List<Map<String, dynamic>> orderFoods =[
    {
      "images": 'https://images.immediate.co.uk/production/volatile/sites/30/2014/05/Epic-summer-salad-hub-2646e6e.jpg',
      "title":'Murskoy Kapris',
      "subtitle": "1 dona",
      "trailing":"15 000 UZS"
    },
    {
      "images": 'https://img.taste.com.au/XPfahwow/taste/2018/08/lemon-chicken-noodle-salad-p64-140239-2.jpg',
      "title":'Freelow',
      "subtitle": "2 dona",
      "trailing":"30 000 UZS"
    },
    {
      "images": 'https://media-cldnry.s-nbcnews.com/image/upload/newscms/2019_21/2870431/190524-classic-american-cheeseburger-ew-207p.jpg',
      "title":'Murskoy Kapris',
      "subtitle": "3 dona",
      "trailing":"15 000 UZS"
    },
    {
      "images": 'https://assets.aboutkidshealth.ca/AKHAssets/fast_food_better_choices.jpg?renditionid=21',
      "title":'Burger',
      "subtitle": "2 dona",
      "trailing":"21 000 UZS"
    },
    {
      "images": 'https://assets.aboutkidshealth.ca/AKHAssets/fast_food_better_choices.jpg?renditionid=21',
      "title":'Freelow',
      "subtitle": "4 dona",
      "trailing":"30 000 UZS"
    },
    {
      "images": 'https://assets.aboutkidshealth.ca/AKHAssets/fast_food_better_choices.jpg?renditionid=21',
      "title":'Burger',
      "subtitle": "5 dona",
      "trailing":"21 000 UZS"
    },

  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Buyurtma sahifasi"),
      ),
      body: ListView(
        children: [
          Padding(
<<<<<<< HEAD
              padding: const EdgeInsets.all(15),
=======
              padding:  EdgeInsets.all(10.w),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Center(
                        child: Hero(
                          transitionOnUserGestures: true,
                          tag: widget.item,
                          child: Container(
<<<<<<< HEAD
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 3, color: MainColors.greenColor),
=======
                            height: 75.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 3.w, color: MainColors.greenColor),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0aZ_qZ41uKX9HA5EQsxP6tdrUUZBA1auZQ&usqp=CAU"))),
                          ),
                        ),
                      ),
<<<<<<< HEAD
                      SizedBox(width: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rayhon Safarova",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
=======
                      SizedBox(width: 30.w,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rayhon Safarova",style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w600),),
                          SizedBox(height: 10.h,),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                          Text("56 000 UZS", style: TextStyle(color: MainColors.greenColor),)
                        ],
                      )
                    ],
                  ),
<<<<<<< HEAD
                  SizedBox(height: 15,),
=======
                  SizedBox(height: 15.h,),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: MainColors.greenColor,
<<<<<<< HEAD
                            size: 20,
=======
                            size: 20.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                          ),
                          Text(" 9:00 - 22:00"),
                        ],
                      ),
                      Row(
                        children: [
                         SvgPicture.asset("assets/images/owner_table.svg",color: MainColors.greenColor,),
                          Text(" ${5}-stol"),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.calendar_today_sharp,
                            color: MainColors.greenColor,
<<<<<<< HEAD
                            size: 20,
=======
                            size: 20.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                          ),
                          Text( " 15.02.22",),
                        ],
                      ),
                    ],
                  ),
<<<<<<< HEAD
                  SizedBox(height: 25,),
                  Text("Orders", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
=======
                  SizedBox(height: 25.h,),
                  Text("Orders", style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w600),),
                  SizedBox(height: 15.h,),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: orderFoods.map((e) => cardFood(e)).toList(),
                    )
                  ),
<<<<<<< HEAD
                  SizedBox(height: 20,),
=======
                  SizedBox(height: 20.h,),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  InkWell(
                    onTap: (){
                      
                    },
                    child: Container(
<<<<<<< HEAD
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MainColors.greenColor,
                        borderRadius: BorderRadius.circular(8),
=======
                      height: 45.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MainColors.greenColor,
                        borderRadius: BorderRadius.circular(8.w),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                      ),
                      child: Center(
                        child: Text(
                          "Buyurtma bajarildi",
                          style:
<<<<<<< HEAD
                          TextStyle(color: MainColors.whiteColor, fontSize: 20),
=======
                          TextStyle(color: MainColors.whiteColor, fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
        ],
      ),
    );
  }
  Widget cardFood(Map<String, dynamic> orderFoods){
    return Column(
      children: [
        Card(
          elevation: 4,
          child: Container(
<<<<<<< HEAD
            height: 90,
            child: Center(
              child: ListTile(
                leading: Container(
                  height: 70,
                     width: 70,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
=======
            height: 85.h,
            child: Center(
              child: ListTile(
                leading: Container(
                  height: 70.h,
                     width: 70.w,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8.w),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                       image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage(orderFoods["images"]),
                       )
                     ),
                ),
<<<<<<< HEAD
                title:  Text(orderFoods["title"],style: TextStyle(fontWeight: FontWeight.bold),),
=======
                title:  Text(orderFoods["title"],style: TextStyle(fontWeight: FontWeight.w600),),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                subtitle: Text(orderFoods["subtitle"]),
                trailing: Text(orderFoods["trailing"], style: TextStyle(color: MainColors.greenColor),),
              ),
            ),
          ),
        ),
<<<<<<< HEAD
        SizedBox(height: 5,)
=======
        SizedBox(height: 5.h,)
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      ],
    );
  }
}
