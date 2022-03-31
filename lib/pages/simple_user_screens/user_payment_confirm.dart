import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_payment_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class UserPaymentConfirm extends StatelessWidget {
  const UserPaymentConfirm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("confirmTransfer").tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              children: [
                paymentInfo(title: "date", body: "02.04.2022"),
                const SizedBox(height: 3,),
                paymentInfo(title: "userCard", body: "8600 00****3123"),
                const SizedBox(height: 3,),
                paymentInfo(title: "RestCard", body: "8600 00****8987"),
                const SizedBox(height: 3,),
                paymentInfo(title: "CardName", body: "Feruza Ergasheva"),
                const SizedBox(height: 3,),
                paymentInfo(title: "transferSumma", body: "200000 UZS"),
                const SizedBox(height: 3,),
                Divider(height: 30,thickness: 2,),
                paymentInfo(title: "total", body: "200000 UZS"),
              ],
            ),
            InkWell(
              onTap: () {
               
              },
              child: Container(
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.greenColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "confirm",
                    style: TextStyle(
                        color: MainColors.whiteColor, fontSize: 17.sp),
                  ).tr(),
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
        Text(title, style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),).tr(),
        Text(body, style: TextStyle(fontSize: 14.sp, color: Colors.grey[700]),)
      ],
    );
  }
}
