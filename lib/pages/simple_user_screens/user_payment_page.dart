import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_payment_confirm.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserPaymentPage extends StatefulWidget {
  const UserPaymentPage({Key? key}) : super(key: key);

  @override
  _UserPaymentPageState createState() => _UserPaymentPageState();
}

class _UserPaymentPageState extends State<UserPaymentPage> {

  bool sendSms = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To'lov"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Karta raqami",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
                ),
               const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "8600 0000 0000 0000",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MainColors.greenColor,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MainColors.textFieldColor,
                            width: 1,
                            style: BorderStyle.solid),
                      )),
                ),
               const  SizedBox(height: 30,),
                Text(
                  "To'lov Summasi",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "109000",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MainColors.greenColor,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MainColors.textFieldColor,
                            width: 1,
                            style: BorderStyle.solid),
                      )),
                ),
               const SizedBox(height: 10,),
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          sendSms = !sendSms;
                        });
                      },
                      child: Container(
                        height: 17.h,
                        width: 17.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: sendSms? MainColors.greenColor : Colors.grey.withOpacity(.2),
                            border: Border.all(
                              width: 1,
                              color: sendSms? MainColors.greenColor : Colors.grey,
                            )
                        ),
                        child: Icon(Icons.ac_unit, size: 10.w, color: sendSms ? MainColors.whiteColor : Colors.transparent,),
                      ),
                    ),
                   const SizedBox(width: 10,),
                    Text("Qabul qiluvchiga SMS yuborish", style: TextStyle(color: sendSms? MainColors.greenColor : Colors.grey),),
                  ],
                ),
                const SizedBox(height: 30,),
                Text(
                  "Sharh",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17.sp),
                ),
              const  SizedBox(
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                      hintText: "Izoh kiritish...",
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MainColors.greenColor,
                            width: 1,
                            style: BorderStyle.solid),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide(
                            color: MainColors.textFieldColor,
                            width: 1,
                            style: BorderStyle.solid),
                      )),
                ),
              ],
            ),

            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (BuildContext context) => UserPaymentConfirm()));
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
                    "Davom etish",
                    style: TextStyle(
                        color: MainColors.whiteColor, fontSize: 17.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
