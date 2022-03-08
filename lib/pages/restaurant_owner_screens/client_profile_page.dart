import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/utils/colors.dart';

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
              padding: const EdgeInsets.all(15),
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
                            height: 80,
                            width: 80,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border:
                                    Border.all(width: 3, color: MainColors.greenColor),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0aZ_qZ41uKX9HA5EQsxP6tdrUUZBA1auZQ&usqp=CAU"))),
                          ),
                        ),
                      ),
                      SizedBox(width: 30,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Rayhon Safarova",style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),),
                          SizedBox(height: 10,),
                          Text("56 000 UZS", style: TextStyle(color: MainColors.greenColor),)
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 15,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.watch_later,
                            color: MainColors.greenColor,
                            size: 20,
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
                            size: 20,
                          ),
                          Text( " 15.02.22",),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 25,),
                  Text("Orders", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                  SizedBox(height: 15,),
                  Container(
                    width: double.infinity,
                    child: Column(
                      children: orderFoods.map((e) => cardFood(e)).toList(),
                    )
                  ),
                  SizedBox(height: 20,),
                  InkWell(
                    onTap: (){
                      
                    },
                    child: Container(
                      height: 55,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: MainColors.greenColor,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          "Buyurtma bajarildi",
                          style:
                          TextStyle(color: MainColors.whiteColor, fontSize: 20),
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
            height: 90,
            child: Center(
              child: ListTile(
                leading: Container(
                  height: 70,
                     width: 70,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(8),
                       image: DecorationImage(
                         fit: BoxFit.cover,
                         image: NetworkImage(orderFoods["images"]),
                       )
                     ),
                ),
                title:  Text(orderFoods["title"],style: TextStyle(fontWeight: FontWeight.bold),),
                subtitle: Text(orderFoods["subtitle"]),
                trailing: Text(orderFoods["trailing"], style: TextStyle(color: MainColors.greenColor),),
              ),
            ),
          ),
        ),
        SizedBox(height: 5,)
      ],
    );
  }
}
