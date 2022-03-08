import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/client_profile_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/client_story_profile_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';

import 'client_story_profile_page.dart';

class OwnerOrderScreen extends StatefulWidget {
  const OwnerOrderScreen({Key? key}) : super(key: key);

  @override
  _OwnerOrderScreenState createState() => _OwnerOrderScreenState();
}

class _OwnerOrderScreenState extends State<OwnerOrderScreen> {
  List<Map<String, dynamic>> clients = [
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0aZ_qZ41uKX9HA5EQsxP6tdrUUZBA1auZQ&usqp=CAU",
      "fullName": "Rayhon Safarova",
      "atTheTime": "19:00"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0aZ_qZ41uKX9HA5EQsxP6tdrUUZBA1auZQ&usqp=CAU",
      "fullName": "Rayhon Safarova",
      "atTheTime": "19:00"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0aZ_qZ41uKX9HA5EQsxP6tdrUUZBA1auZQ&usqp=CAU",
      "fullName": "Rayhon Safarova",
      "atTheTime": "19:00"
    },
    {
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-0aZ_qZ41uKX9HA5EQsxP6tdrUUZBA1auZQ&usqp=CAU",
      "fullName": "Rayhon Safarova",
      "atTheTime": "19:00"
    },
  ];
  List<Map<String, dynamic>> storyClients = [
    {
      "image":
          "https://1.bp.blogspot.com/-34OVFeumu1A/YUgU7sm4yLI/AAAAAAAAN8M/lk6xkZKO7CYUMYKBFCz9FL3o05eOu7ydwCLcBGAsYHQ/s720/DP%2BFor%2BGirls%2B%252813%2529.jpg",
      "fullName": "Zulfizar Abdug'aniyev",
      "atTheTime": "8:00"
    },
    {
      "image":
          "https://1.bp.blogspot.com/-34OVFeumu1A/YUgU7sm4yLI/AAAAAAAAN8M/lk6xkZKO7CYUMYKBFCz9FL3o05eOu7ydwCLcBGAsYHQ/s720/DP%2BFor%2BGirls%2B%252813%2529.jpg",
      "fullName": "Zulfizar Abdug'aniyev",
      "atTheTime": "8:00"
    },
    {
      "image":
          "https://1.bp.blogspot.com/-34OVFeumu1A/YUgU7sm4yLI/AAAAAAAAN8M/lk6xkZKO7CYUMYKBFCz9FL3o05eOu7ydwCLcBGAsYHQ/s720/DP%2BFor%2BGirls%2B%252813%2529.jpg",
      "fullName": "Zulfizar Abdug'aniyev",
      "atTheTime": "8:00"
    },
    {
      "image":
          "https://1.bp.blogspot.com/-34OVFeumu1A/YUgU7sm4yLI/AAAAAAAAN8M/lk6xkZKO7CYUMYKBFCz9FL3o05eOu7ydwCLcBGAsYHQ/s720/DP%2BFor%2BGirls%2B%252813%2529.jpg",
      "fullName": "Zulfizar Abdug'aniyev",
      "atTheTime": "8:00",
    },
  ];

  int isNowOrder = 1;

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
                  height: 40,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryOrders(categoryName: "Bugungi", x: 1),
                    categoryOrders(categoryName: "Tarix", x: 2),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: isNowOrder == 1
              ? clients.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: SizeConfig.screenWidth! / 1.5),
                      child: Text(
                        "Sizda aktiv holatdagi buyurtmalar yo'q!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.screenWidth! / 20,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: clients.length,
                      itemBuilder: (context, i) => GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) => ClientProfilePage(item: i,)));
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            height: 90,
                            width: double.infinity,
                            child: Center(
                              child: ListTile(
                                leading: Hero(
                                  transitionOnUserGestures: true,
                                  tag: i,
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: MainColors.greenColor,
                                        ),
                                        image: DecorationImage(
                                          image:
                                              NetworkImage(clients[i]["image"]),
                                        )),
                                  ),
                                ),
                                title: Text(
                                  clients[i]['fullName'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ),
                                subtitle: Text(
                                  clients[i]['atTheTime'],
                                  style:
                                      TextStyle(color: MainColors.greenColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    )
              : storyClients.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50,
                          vertical: SizeConfig.screenWidth! / 1.5),
                      child: Text(
                        "Tarixda buyurtmalar mavjud emas!",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: SizeConfig.screenWidth! / 20,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: storyClients.length,
                      itemBuilder: (context, i) => GestureDetector(
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => ClientStoryPage(item: i,)));
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            height: 90,
                            width: double.infinity,
                            child: Center(
                              child: ListTile(
                                leading: Hero(
                                  transitionOnUserGestures: true,
                                  tag: i,
                                  child: Container(
                                    height: 55,
                                    width: 55,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2,
                                          color: MainColors.redColor,
                                        ),
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              storyClients[i]["image"]),
                                        )),
                                  ),
                                ),
                                title: Text(
                                  storyClients[i]['fullName'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold, fontSize: 18),
                                ),
                                subtitle: Text(
                                  storyClients[i]['atTheTime'],
                                  style: TextStyle(color: MainColors.redColor),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
        ));
  }

  Widget categoryOrders({required String categoryName, required int x}) {
    return InkWell(
      onTap: () {
        setState(() {
          isNowOrder = x;
        });
      },
      child: Container(
        height: 40,
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
                fontSize: 17),
          ),
        ),
      ),
    );
  }
}
