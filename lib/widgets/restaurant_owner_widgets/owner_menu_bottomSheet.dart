import 'package:flutter/material.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';

void showModelSheet(
  BuildContext context, {
  required void Function()? onSave,
  required TextEditingController controller,
}) {
  showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: MediaQuery.of(context).viewInsets,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
            ),
            padding: EdgeInsets.only(top: 25, left: 15, right: 15, bottom: 25),
            height: 220,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Add new category",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
                ),
                TextFormField(
                  controller: controller,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                      borderSide: BorderSide(
                        color: MainColors.greenColor,
                      ),
                    ),
                    contentPadding: EdgeInsets.only(
                      top: 38.0,
                      left: 25.0,
                      right: 20.0,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
                      borderSide: BorderSide(
                        color: Colors.grey,
                      ),
                    ),
                    filled: true,
                    fillColor: Color(0xFFFFFFFF),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.0),
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
                        primary: MainColors.dimRedColor,
                        minimumSize: Size(175, 40),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        "Rad etish",
                        style: TextStyle(color: Colors.red[800]),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.green,
                        minimumSize: Size(175, 40),
                        elevation: 4,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: onSave,
                      child: Text(
                        "Saqlash",
                        style: TextStyle(color: Colors.white),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      });
}

// ListView(
//   // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   // crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
//     Text('\tFast Foods',
//       style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 24,
//           color: MainColors.greenColor
//       ),
//     ),
//     CarouselSlider(
//       options: CarouselOptions(
//         height: 260,
//         autoPlay: false,
//         disableCenter: true,
//       ),
//       items: foods.map((item) =>
//           InkWell(
//             onTap: () {},
//             child: Container(
//               margin: EdgeInsets.all(6),
//               child: Card(
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//                 elevation: 4,
//                 child: Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: Column(
//                     children: [
//                       Container(
//                           width: MediaQuery.of(context).size.width * .6,
//                           child:Image.asset(item['images'])
//                       ),
//                       Text(
//                         item["title"],
//                         maxLines: 2,
//                         textAlign: TextAlign.start,
//                         style: TextStyle(
//                             fontSize: 17,
//                             height: 1.3,
//                             fontWeight: FontWeight.bold
//                         ),
//                       ),
//                       Expanded(
//                         child: Text(
//                           item["subtitle"],
//                           maxLines: 10,
//                           textAlign: TextAlign.justify,
//                           style: TextStyle(
//                             fontSize: 15,
//                             height: 1.3,
//                           ),
//                         ),
//                       ),
//
//                     ],
//                   ),
//                 ),
//               ),
//             ),
//           )
//       ).toList(),
//     ),
//
//     Text('\tSalads',
//       style: TextStyle(
//           fontWeight: FontWeight.bold,
//           fontSize: 24,
//           color: Colors.green
//       ),
//     ),
//     CarouselSlider(
//       options: CarouselOptions(
//         height: 260,
//         autoPlay: false,
//         disableCenter: true,
//       ),
//       items: gowo.map((item) =>
//           Card(
//             margin: EdgeInsets.all(6),
//             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
//             elevation: 4,
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Column(
//                 children: [
//                   Stack(
//                     clipBehavior: Clip.none,
//                     children: [
//                       Container(
//                           width: MediaQuery.of(context).size.width * .6,
//                           //height: MediaQuery.of(context).size.height*.7,
//                           child:Image.asset(item['images2'],
//                               fit: BoxFit.contain)
//                       ),
//                       Positioned(
//                         right: -5,
//                         child: IconButton(
//                           onPressed: (){},
//                           icon: Icon(Icons.edit),
//                           color: Colors.green,
//                         ),
//                       ),
//                     ],
//                   ),
//                   Expanded(
//                     child: Text(
//                       item["title"],
//                       maxLines: 2,
//                       textAlign: TextAlign.start,
//                       style: TextStyle(
//                           fontSize: 17,
//                           height: 1.3,
//                           fontWeight: FontWeight.bold
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Text(
//                       item["subtitle"],
//                       maxLines: 10,
//                       textAlign: TextAlign.justify,
//                       style: TextStyle(
//                         fontSize: 15,
//                         height: 1.3,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//           )
//       ).toList(),
//     ),
//   ],
// ),
