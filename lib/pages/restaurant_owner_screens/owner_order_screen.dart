import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/client_profile_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/client_story_profile_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
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
      "fullName": "Zulfizar Abdug'aniyeva",
      "atTheTime": "15:00"
    },
    {
      "image":
          "https://static.vecteezy.com/system/resources/previews/003/450/410/original/muslim-girl-wearing-hijab-illustration-vector.jpg",
      "fullName": "Hurmatoy Abdunabiyeva",
      "atTheTime": "19:20"
    },
    {
      "image":
          "https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500",
      "fullName": "Quvonchbek Rojiboyev",
      "atTheTime": "13:30"
    },
    {
      "image":
          "https://images.unsplash.com/photo-1633332755192-727a05c4013d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8dXNlcnxlbnwwfHwwfHw%3D&w=1000&q=80",
      "fullName": "Shodiyorbek Nuraliyev",
      "atTheTime": "19:00"
    },
    {
      "image":
          "https://qph.fs.quoracdn.net/main-qimg-bc847cf82072a3e6083f036214ade670-lq",
      "fullName": "Zuxra Makhmudova",
      "atTheTime": "17:00"
    },
    {
      "image":
          "https://live.staticflickr.com/7224/26267591894_396a916ac3_z.jpg",
      "fullName": "Mahliyo Abdug'aniyeva",
      "atTheTime": "18:30"
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
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            child: Stack(
              children: [
                Container(
                  height: 40.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade200,
                    borderRadius: BorderRadius.circular(8.w),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    categoryOrders(categoryName: "today", x: 1),
                    categoryOrders(categoryName: "story", x: 2),
                  ],
                ),
              ],
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(8.w),
          child: isNowOrder == 1
              ? clients.isEmpty
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 50.w,
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
                              builder: (BuildContext context) =>
                                  ClientProfilePage(
                                    item: i,
                                    name: clients[i]["fullName"],
                                    image: clients[i]["image"],
                                  )));
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15.w)),
                          child: Container(
                            height: 80.h,
                            width: double.infinity,
                            child: Center(
                              child: ListTile(
                                leading: Hero(
                                  transitionOnUserGestures: true,
                                  tag: i,
                                  child: Container(
                                    height: 55.h,
                                    width: 55.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2.w,
                                          color: MainColors.greenColor,
                                        ),
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                clients[i]["image"]),
                                            fit: BoxFit.cover)),
                                  ),
                                ),
                                title: Text(
                                  clients[i]['fullName'],
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
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
                          horizontal: 50.w,
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
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  ClientStoryPage(
                                    item: i,
                                  )));
                        },
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Container(
                            height: 80.h,
                            width: double.infinity,
                            child: Center(
                              child: ListTile(
                                leading: Hero(
                                  transitionOnUserGestures: true,
                                  tag: i,
                                  child: Container(
                                    height: 55.h,
                                    width: 55.w,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          width: 2.w,
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15.sp),
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
        height: 40.h,
        width: SizeConfig.screenWidth! / 2 - 30,
        decoration: BoxDecoration(
            color:
                isNowOrder == x ? MainColors.greenColor : Colors.grey.shade200,
            borderRadius: BorderRadius.circular(8.w)),
        child: Center(
          child: Text(
            categoryName,
            style: TextStyle(
                color: isNowOrder == x
                    ? MainColors.whiteColor
                    : MainColors.blackColor,
                fontSize: 15.sp),
          ).tr(),
        ),
      ),
    );
  }
}
