// import 'package:flutter/material.dart';
// import 'package:inadvance/utils/colors.dart';
//
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// Widget bottomSheetAdd(BuildContext context) {
//   String foodDescription =
//       "A persistent bottom sheet shows information that supplements the primary content of the app.";
//   int foodCount = 1;
//   return StatefulBuilder(
//     builder: (BuildContext context, StateSetter myState) {
//       return Container(
//         height: (140 + foodDescription.length / 1.5).h,
//         child: Padding(
//           padding: EdgeInsets.all(20),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: [
//               Column(
//                 children: [
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Text(
//                         "Grechiski salat",
//                         style: TextStyle(
//                             fontWeight: FontWeight.w600, fontSize: 17.sp),
//                       ),
//                       Text(
//                         "23 000 so'm",
//                         style: TextStyle(
//                             color: MainColors.greenColor, fontSize: 17.sp),
//                       )
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 5,
//                   ),
//                   Text(
//                     foodDescription,
//                     style: TextStyle(fontSize: 13.sp),
//                   ),
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   GestureDetector(
//                     onTap: () {
//                       Navigator.of(context).pop();
//                       setState(() {
//                         isAddedFood = true;
//                       });
//                     },
//                     child: Container(
//                       height: 40.h,
//                       width: 150.w,
//                       decoration: BoxDecoration(
//                         color: MainColors.greenColor,
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                       child: Center(
//                           child: Text(
//                             "Qo'shish",
//                             style: TextStyle(
//                                 color: MainColors.whiteColor, fontSize: 15.sp),
//                           )),
//                     ),
//                   ),
//                   Container(
//                     height: 40.h,
//                     width: 165.w,
//                     decoration: BoxDecoration(
//                       color: MainColors.greenColor.withOpacity(.2),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         GestureDetector(
//                           onTap: () {
//                             if (foodCount > 1) {
//                               myState(() {
//                                 foodCount--;
//                               });
//                             }
//                           },
//                           child: Container(
//                             height: 30.h,
//                             width: 30.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Align(
//                                 alignment: Alignment.topCenter,
//                                 child: Text(
//                                   "-",
//                                   style: TextStyle(fontSize: 25.sp),
//                                 )),
//                           ),
//                         ),
//                         Text(
//                           "$foodCount",
//                           style: TextStyle(
//                               fontSize: 20.sp, fontWeight: FontWeight.bold),
//                         ),
//                         GestureDetector(
//                           onTap: () {
//                             myState(() {
//                               foodCount++;
//                             });
//                           },
//                           child: Container(
//                             height: 30.h,
//                             width: 30.w,
//                             decoration: BoxDecoration(
//                               color: Colors.white,
//                               borderRadius: BorderRadius.circular(5),
//                             ),
//                             child: Align(
//                                 alignment: Alignment.topCenter,
//                                 child: Text(
//                                   "+",
//                                   style: TextStyle(fontSize: 23.sp),
//                                 )),
//                           ),
//                         ),
//                       ],
//                     ),
//                   )
//                 ],
//               ),
//               const SizedBox(
//                 height: 5,
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
