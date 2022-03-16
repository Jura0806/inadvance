import 'package:flutter/material.dart';
import 'package:inadvance/pages/simple_user_screens/user_payment_confirm.dart';
import 'package:inadvance/utils/colors.dart';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

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
<<<<<<< HEAD
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
=======
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 40),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
        child: Column(

          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Karta raqami",
<<<<<<< HEAD
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
=======
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
                ),
               const SizedBox(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
<<<<<<< HEAD
=======
                      border: InputBorder.none,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                SizedBox(height: 30,),
                Text(
                  "To'lov Summasi",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
=======
               const  SizedBox(height: 30,),
                Text(
                  "To'lov Summasi",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 17.sp),
                ),
                const SizedBox(
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
<<<<<<< HEAD
=======
                      border: InputBorder.none,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                SizedBox(height: 10,),
=======
               const SizedBox(height: 10,),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                Row(
                  children: [
                    InkWell(
                      onTap: (){
                        setState(() {
                          sendSms = !sendSms;
                        });
                      },
                      child: Container(
<<<<<<< HEAD
                        height: 17,
                        width: 17,
=======
                        height: 17.h,
                        width: 17.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: sendSms? MainColors.greenColor : Colors.grey.withOpacity(.2),
                            border: Border.all(
                              width: 1,
                              color: sendSms? MainColors.greenColor : Colors.grey,
                            )
                        ),
<<<<<<< HEAD
                        child: Icon(Icons.ac_unit, size: 10, color: sendSms ? MainColors.whiteColor : Colors.transparent,),
                      ),
                    ),
                    SizedBox(width: 10,),
                    Text("Qabul qiluvchiga SMS yuborish", style: TextStyle(color: sendSms? MainColors.greenColor : Colors.grey),),
                  ],
                ),
                SizedBox(height: 30,),
                Text(
                  "Sharh",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                SizedBox(
=======
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
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                  height: 15,
                ),
                TextField(
                  decoration: InputDecoration(
<<<<<<< HEAD
=======
                    border: InputBorder.none,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                height: 55,
=======
                height: 45.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.greenColor,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    "Davom etish",
                    style: TextStyle(
<<<<<<< HEAD
                        color: MainColors.whiteColor, fontSize: 20),
=======
                        color: MainColors.whiteColor, fontSize: 17.sp),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
