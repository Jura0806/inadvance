import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_payment_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';

class UserShopScreen extends StatefulWidget {
  const UserShopScreen({Key? key}) : super(key: key);
  static final String id = "user_shop_screen";

  @override
  _UserShopScreenState createState() => _UserShopScreenState();
}

class _UserShopScreenState extends State<UserShopScreen> {
  int foodCount = 1;
  final int i = 1;

  List? data = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Savatcha"),
        actions: [
          Icon(
            Icons.delete,
            color: Colors.redAccent,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
      body: data == null
          ? Center(
              child: Text(
                "Savatcha bo'sh",
                style: TextStyle(fontSize: 20),
              ),
            )
          : ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              children: [
                Text(
                  "Rayhon",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                const SizedBox(
                  height: 25,
                ),
                foods(),
                foods(),
                foods(),
                foods(),
                SizedBox(height: SizeConfig.screenWidth! * 1.1 - 3 * 95),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Jami summa",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "94 000 UZS",
                      style:
                          TextStyle(fontSize: 20, color: MainColors.greenColor),
                    )
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (BuildContext context) => UserPaymentPage()));
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
                        "Davom etish",
                        style: TextStyle(
                            color: MainColors.whiteColor, fontSize: 20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
    );
  }

  Widget foods() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Grechiski",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "23 000 UZS",
              style: TextStyle(fontSize: 17, color: Colors.grey[700]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 45,
              width: 180,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.2),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        if (foodCount >= 1) {
                          setState(() {
                            foodCount--;
                          });
                        }
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        child: Center(
                          child: Text(
                            "-",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 25),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: MainColors.whiteColor,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    ),
                    Text(
                      "$foodCount",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                    ),
                    InkWell(
                      onTap: () {
                        setState(() {
                          foodCount++;
                        });
                      },
                      child: Container(
                        height: 35,
                        width: 35,
                        child: Center(
                          child: Text(
                            "+",
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                        ),
                        decoration: BoxDecoration(
                            color: MainColors.whiteColor,
                            borderRadius: BorderRadius.circular(8)),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        )
      ],
    );
  }
}
