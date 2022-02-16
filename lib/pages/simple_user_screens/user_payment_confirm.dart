import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_payment_page.dart';
import 'package:inadvance/utils/colors.dart';

class UserPaymentConfirm extends StatelessWidget {
  const UserPaymentConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tasdiq"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                paymentInfo(title: "Sana", body: "02.04.2022"),
                paymentInfo(title: "Jo'natuvchining kartasi", body: "8600 00****3123"),
                paymentInfo(title: "Qabul qiluchining kartasi", body: "8600 00****8987"),
                paymentInfo(title: "Yuboruvchi ismi", body: "Feruza Ergasheva"),
                paymentInfo(title: "O'tkazma summasi", body: "200000 UZS"),
                Divider(height: 30,thickness: 2,),
                paymentInfo(title: "Jami", body: "200000 UZS"),
              ],
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
                    "Tasdiqlash",
                    style: TextStyle(
                        color: MainColors.whiteColor, fontSize: 20),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget paymentInfo({required String title, required String body}){
    return  Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: TextStyle(fontSize: 17, color: Colors.grey[700]),),
        Text(body, style: TextStyle(fontSize: 17, color: Colors.grey[700]),)
      ],
    );
  }
}
