import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';

class OwnerHomeScreen extends StatefulWidget {
  const OwnerHomeScreen({Key? key}) : super(key: key);

  @override
  _OwnerHomeScreenState createState() => _OwnerHomeScreenState();
}

class _OwnerHomeScreenState extends State<OwnerHomeScreen> {
  List<Map<String, dynamic>> rate = [
    {
      "images": 'assets/images/Group 394.png',
      "title": '423',
      "subtitle": "Order recieved "
    },
    {
      "images": 'assets/images/customers.png',
      "title": '280',
      "subtitle": "New customers"
    },
    {
      "images": 'assets/images/earning.png',
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
              height: 280,
              //width:double.infinity,
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: 3,
                itemBuilder: (context, index) => Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15)),
                  child: Container(
                    // padding: EdgeInsets.only(top: 10),
                    // margin: EdgeInsets.all(8),
                    height: 80,
                    width: double.infinity,
                    child: Center(
                      child: ListTile(
                        leading: CircleAvatar(
                          radius: 30,
                          child: Image.asset(rate[index]['images']),
                        ),
                        title: Text(
                          rate[index]['title'],
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),
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
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Column(
                  children: [
                    Text(
                      "\nToday's hot menu",
                      textAlign: TextAlign.left,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 275,
                      //width:double.infinity,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context, index) => Container(
                          height: 70,
                          width: double.infinity,
                          child: Center(
                            child: ListTile(
                              leading: CircleAvatar(
                                radius: 25,
                                child: Image.asset(foods[index]['images']),
                              ),
                              title: Text(foods[index]['title']),
                              subtitle: Text(foods[index]['subtitle']),
                              trailing: Text(
                                foods[index]['leading'],
                                style: TextStyle(fontWeight: FontWeight.bold),
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
                onPressed: (){
                  HiveOwnerSignUp().removeOwner();
                },
                child: Text("Remove_Owner's_Register_Data")),

          ],
        ),
      ),
    );
  }
}
