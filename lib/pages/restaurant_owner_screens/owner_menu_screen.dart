import 'package:flutter/material.dart';

class OwnerMenuScreen extends StatefulWidget {
  const OwnerMenuScreen({Key? key}) : super(key: key);

  @override
  _OwnerMenuScreenState createState() => _OwnerMenuScreenState();
}

class _OwnerMenuScreenState extends State<OwnerMenuScreen> {
  List<Map<String,dynamic>> foods = [
    {
      "images": 'assets/images/Rectangle 686.png',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
      "leading":"15 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 709.png',
      "title":'Freelow',
      "subtitle": "Fast food",
      "leading":"30 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 686.png',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
      "leading":"15 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 708.png',
      "title":'Burger',
      "subtitle": "Fast food",
      "leading":"21 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 709.png',
      "title":'Freelow',
      "subtitle": "Fast food",
      "leading":"30 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 708.png',
      "title":'Burger',
      "subtitle": "Fast food",
      "leading":"21 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 686.png',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
      "leading":"15 000 UZS"
    },
    {
      "images": 'assets/images/Rectangle 709.png',
      "title":'Freelow',
      "subtitle": "Fast food",
      "leading":"30 000 UZS"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        actions: [
          CircleAvatar(
            radius: 15,
            backgroundColor: Colors.green,
            child: IconButton(
              onPressed: (){},
              icon: Icon(Icons.add,
              size: 16,),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width:double.infinity,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Column(
                  children: [
                    Text("\nSalads",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 230,
                      //width:double.infinity,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context,index)=>Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Container(
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
                                trailing: Text(foods[index]['leading'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
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

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 6,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft:  Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: Column(
                  children: [
                    Text("\Fast Foods",
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold
                      ),
                    ),
                    Divider(
                      thickness: 2,
                      color: Colors.grey,
                    ),
                    Container(
                      height: 230,
                      //width:double.infinity,
                      child: ListView.builder(
                        itemCount: 5,
                        itemBuilder: (context,index)=>Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          child: Container(
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
                                trailing: Text(foods[index]['leading'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold
                                  ),),
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
          ],
        ),
      ),
    );
  }
}
