import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_menu_screen/add_menu.dart';
class OwnerMenuScreen extends StatefulWidget {
  const OwnerMenuScreen({Key? key}) : super(key: key);

  @override
  _OwnerMenuScreenState createState() => _OwnerMenuScreenState();
}
class _OwnerMenuScreenState extends State<OwnerMenuScreen> {
  List<Map<String,dynamic>> foods = [
    {
      "images": 'assets/images/cola.jpg',
      "images2":'assets/images/salat1.jpg',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
      "leading":"15 000 UZS"
    },
    {
      "images": 'assets/images/sekn.jpg',
      "images2":'assets/images/salat2.jpg',
      "title":'Freelow',
      "subtitle": "Fast food",
      "leading":"30 000 UZS"
    },
    {
      "images": 'assets/images/cola.jpg',
      "images2":'assets/images/salat3.jpg',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
      "leading":"15 000 UZS"
    },
    {
      "images": 'assets/images/sekn.jpg',
      "images2":'assets/images/salat1.jpg',
      "title":'Burger',
      "subtitle": "Fast food",
      "leading":"21 000 UZS"
    },
    {
      "images": 'assets/images/fastfood.jpg',
      "images2":'assets/images/salat3.jpg',
      "title":'Freelow',
      "subtitle": "Fast food",
      "leading":"30 000 UZS"
    },
    {
      "images": 'assets/images/sekn.jpg',
      "images2":'assets/images/salat1.jpg',
      "title":'Burger',
      "subtitle": "Fast food",
      "leading":"21 000 UZS"
    },
    {
      "images": 'assets/images/cola.jpg',
      "images2":'assets/images/salat2.jpg',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
      "leading":"15 000 UZS"
    },
    {
      "images": 'assets/images/fastfood.jpg',
      "images2":'assets/images/salat3.jpg',
      "title":'Freelow',
      "subtitle": "Fast food",
      "leading":"30 000 UZS"
    },
  ];
  List<Map<String,dynamic>> gowo = [
    {
      "images2":'assets/images/salat2.jpg',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
    },
    {
      "images2":'assets/images/salat2.jpg',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
    },
    {
      "images2":'assets/images/salat2.jpg',
      "title":'Murskoy Kapris',
      "subtitle": "salat",
    }
  ];
void showModelSheet(){
showModalBottomSheet(
    context: context,
    builder:(BuildContext context) {
      return Container(
        decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
         topLeft: Radius.circular(30),
         topRight: Radius.circular(30),
        ),
      ),padding: EdgeInsets.only(top: 25,left: 10,right: 10,bottom: 15),
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Text("Add new category",
             style: TextStyle(
               fontWeight: FontWeight.bold,
               fontSize: 22
             ),),
             TextFormField(
               autovalidateMode: AutovalidateMode.onUserInteraction,
                   decoration: InputDecoration(
                   border: OutlineInputBorder(
                   borderRadius:
                   BorderRadius.circular(15.0),
                   borderSide: BorderSide(
                     color:  Colors.grey,
                   ),
                 ),
                 contentPadding: EdgeInsets.only(
                   top: 38.0,
                   left: 25.0,
                   right: 20.0,
                 ),
                 enabledBorder: OutlineInputBorder(
                   borderRadius:
                   BorderRadius.circular(12.0),
                   borderSide: BorderSide(
                     color:  Colors.grey,
                   ),
                 ),
                 filled: true,
                 fillColor: Color(0xFFFFFFFF),
                 focusedBorder: OutlineInputBorder(
                   borderRadius:
                   BorderRadius.circular(12.0),
                   borderSide: BorderSide(color: Colors.grey),
                 ),
                 errorBorder: OutlineInputBorder(
                   borderSide: BorderSide(
                     style: BorderStyle.solid,
                     color: Colors.red,
                   ),
                 ),
                 hintText: "Title",
                 hintStyle: TextStyle(
                   fontSize: 16.0,
                   color: Color(0xFF677294),
                 ),
               ),
               obscureText: false,
               keyboardType: TextInputType.text,
               cursorColor: Color(0xFF000000),
               style: TextStyle(
                 fontSize: 16.0,
                 fontFamily: "Poppins",
                 fontWeight: FontWeight.w400,
                 fontStyle: FontStyle.normal,
                 //color: HexColor('#3C3C43'),
               ),
               expands: false,
             ),
             Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.red[200],
                     minimumSize: Size(175, 40),
                     elevation: 4,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(8)
                     ),
                   ),
                     onPressed: (){},
                     child: Text("Cancel",
                     style: TextStyle(
                       color: Colors.red[800]
                     ),),
                 ),
                 ElevatedButton(
                   style: ElevatedButton.styleFrom(
                     primary: Colors.green,
                     minimumSize: Size(175, 40),
                     elevation: 4,
                     shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(8)
                     ),
                   ),
                     onPressed: (){},
                     child: Text("Confirm",
                     style: TextStyle(
                       color: Colors.white
                     ),),
                 )
               ],
             )
         ],
      ),
      );
    });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Menu"),
        actions: [
          InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => AddMenu()));
              },
              child: Image.asset('assets/images/Vector.png')),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('\tFast Foods',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                  fontSize: 24,
                color: Colors.green
              ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 260,
              autoPlay: false,
              disableCenter: true,
            ),
            items: foods.map((item) =>
                InkWell(
                  onTap: () {},
                  child: Container(
                    margin: EdgeInsets.all(6),
                    child: Card(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      elevation: 4,
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              child:Image.asset(item['images'])
                            ),
                            Text(
                              item["title"],
                              maxLines: 2,
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 17,
                                  height: 1.3,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            Expanded(
                              child: Text(
                                item["subtitle"],
                                maxLines: 10,
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                  fontSize: 15,
                                  height: 1.3,
                                ),
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                )
            ).toList(),
          ),

          Text('\tSalads',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24,
                color: Colors.green
            ),
          ),
          CarouselSlider(
            options: CarouselOptions(
              height: 260,
              autoPlay: false,
              disableCenter: true,
            ),
            items: gowo.map((item) =>
                Card(
                  margin: EdgeInsets.all(6),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  elevation: 4,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                                width: MediaQuery.of(context).size.width * .7,
                                //height: MediaQuery.of(context).size.height*.7,
                                child:Image.asset(item['images2'],
                                    fit: BoxFit.contain)
                            ),
                            Positioned(
                              right: -5,
                                child: IconButton(
                                  onPressed: (){},
                                  icon: Icon(Icons.edit),
                                  color: Colors.green,
                            ),
                            ),
                          ],
                        ),
                        Expanded(
                          child: Text(
                            item["title"],
                            maxLines: 2,
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 17,
                                height: 1.3,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        Expanded(
                          child: Text(
                            item["subtitle"],
                            maxLines: 10,
                            textAlign: TextAlign.justify,
                            style: TextStyle(
                              fontSize: 15,
                              height: 1.3,
                            ),
                          ),
                        ),

                      ],
                    ),
                  ),
                )
            ).toList(),
          ),

          Center(
            child: ElevatedButton(

              style: ElevatedButton.styleFrom(
                primary: Colors.green,
                minimumSize: Size(350, 40),
                elevation: 4,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                ),
              ),
                onPressed: (){
                showModelSheet();
                },
                child: Text("Add category",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white
                ),)),
          )
        ],
      ),
    );
  }
}