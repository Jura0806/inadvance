import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_table_screen.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawScheme extends StatefulWidget {
  const DrawScheme({Key? key}) : super(key: key);

  @override
  _DrawSchemeState createState() => _DrawSchemeState();
}

class _DrawSchemeState extends State<DrawScheme> {
  List<String> floors = ["1 - floor", "2 - floor", "3 - floor"];
  List<String> persons = [
    "2 person",
    "4 person",
    "6 person",
    "8 person",
    "16 person"
  ];
  String dropdownValue = "1 - floor";
  String personValue = "2 person";

  String numberFloor = "1 - floor";
  int personTable = 2;
  var _costTableController = TextEditingController();
  var _startTableController = TextEditingController();
  var _endTableController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add tables"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Text(
              "Select floor",
              style: TextStyle(color: MainColors.blackColor, fontSize: 15.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            selectFloor(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Necha kishilik stol",
              style: TextStyle(color: MainColors.blackColor, fontSize: 15.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            personTables(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Stol narxini kiriting",
              style: TextStyle(color: MainColors.blackColor, fontSize: 15.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            costsTable(),
            SizedBox(
              height: 30.h,
            ),
            Text(
              "Stollar tartibini kiriting",
              style: TextStyle(fontSize: 15.sp),
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                tables(
                    tableNumber: "Start table",
                    controller: _startTableController),
                tables(
                    tableNumber: "End table", controller: _endTableController),
              ],
            ),
            Spacer(),
            InkWell(
              onTap: () {
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (BuildContext context) => OwnerTableScreen(
                        floor: numberFloor,
                        numberTable: personTable,
                        costTable:
                            int.parse(_costTableController.text.toString()),
                        startTable: _startTableController.text.toString(),
                        endTable: _endTableController.text.toString(),
                        isDrawTables: true,
                      ),
                    ),
                    (route) => false);
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            OwnerNavigationBar()),
                    (route) => false);
              },
              child: Container(
                height: 45.h,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: MainColors.greenColor,
                  borderRadius: BorderRadius.circular(8.w),
                ),
                child: Center(
                  child: Text(
                    "Add tables",
                    style:
                        TextStyle(color: MainColors.whiteColor, fontSize: 17.sp),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 40.h,
            )
          ],
        ),
      ),
    );
  }

  Widget selectFloor() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(
            width: 1.w,
            color: MainColors.greenColor,
          )),
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        elevation: 16,
        isExpanded: true,
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            dropdownValue = newValue!;
            this.numberFloor = dropdownValue;
          });
          //print(numberFloor);
        },
        items: floors.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget personTables() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(
            width: 1.w,
            color: MainColors.greenColor,
          )),
      child: DropdownButton<String>(
        value: personValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        elevation: 16,
        isExpanded: true,
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            personValue = newValue!;
            personTable = int.parse(personValue[0]);
          });
          print(personTable);
        },
        items: persons.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }

  Widget costsTable() {
    return Container(
      height: 50.h,
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.w),
          border: Border.all(
            width: 1.w,
            color: MainColors.greenColor,
          )),
      child: TextField(
        controller: _costTableController,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
            border: InputBorder.none,
            suffixText: "UZS",
            hintText: "Stol narxini kiriting!"),
      ),
    );
  }

  Widget tables(
      {required String tableNumber,
      required TextEditingController controller}) {
    return Container(
      height: 40.h,
      margin: EdgeInsets.only(top: 5.h),
      width:  170.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.w),
        color: MainColors.greenColor.withOpacity(.3),
      ),
      child: TextFormField(
        controller: controller,
        validator: (input) {
          if (input!.isEmpty) {
            return "Iltimos ma'lumotlarni to'liq kiriting!";
          }
        },
        // controller: controller,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: tableNumber,
            contentPadding: EdgeInsets.only(left: 20.w, top: 7.w),
            suffixIcon: InkWell(
                onTap: () {},
                child: Icon(
                  Icons.navigate_next_sharp,
                  color: Colors.black,
                ))),
      ),
    );
  }
}
