import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inadvance/models/restaurant_ables_model.dart';
import 'package:inadvance/models/restaurant_tables_model.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawScheme extends StatefulWidget {
  String floor;
  String? index;
  String? price;
  String setNum;
  int? id;

  DrawScheme(
      {Key? key, required this.floor, this.index, this.price, required this.setNum, this.id})
      : super(key: key);

  @override
  _DrawSchemeState createState() => _DrawSchemeState();
}

class _DrawSchemeState extends State<DrawScheme> {
  late final _formKey = GlobalKey<FormState>();

  List<String> floors = ["1", "2", "3"];
  List<String> persons = ["2", "4", "6", "8", "16"];
  String floorValue = "1";
  String personValue = "2";
  var isLoading = true;

  var _costTableController = TextEditingController();
  var _countTableController = TextEditingController();

  void _createTables() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var tableData = TablesData(
          restaurantId: "6",
          setNum: personValue,
          price: _costTableController.text.toString().trim(),
          floor: floorValue,
          index: _countTableController.text.toString().trim());

      var response = await OwnerNetwork.ownersTable(
          OwnerNetwork.Api_Restaurant_Table,
          OwnerNetwork.paramsOwnerTable(tableData));
      setState(() {
        if (response != null) {
          print("New Restaurant tables => $response");
        }
        isLoading = false;
      });
      print("New Restaurant tables => $response");
    }
  }

  void _updateTable() async {
    var table = TableInfos(
      setNum: personValue,
      price: _costTableController.text,
      floor: floorValue,
      index: _countTableController.text,
    );
    var response = await OwnerNetwork.updateTableInfo(
        widget.id.toString(), OwnerNetwork.paramsUpdateTable(table));
    if (response != null) {
      setState(() {
        isLoading = false;
        Navigator.of(context).pop();
      });
    }
    print(" Updated table => $response");
  }

  void _deleteTable() async {
    var response = await OwnerNetwork.deleteTable(widget.id.toString());
    if (response != null) {
      setState(() {
        isLoading = false;
        Navigator.of(context).pop();
      });
    }
    print(" deleted table => $response");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.id == null ? "Add tables" : "Update table ${widget.index}",
        ),
        actions: [
          widget.id == null
              ? Container()
              : IconButton(
                  onPressed: () {
                    _deleteTable();
                  },
                  icon: Icon(
                    Icons.delete,
                    color: MainColors.redColor,
                  ))
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Form(
          key: _formKey,
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
              textField(
                  suffixText: "UZS",
                  controller: _costTableController,
                  hintText: "10000",
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Iltimos narxni yozing! Agar narx mavjud bo'lmasa 0 kiriting";
                    }
                  },
                  initialText: widget.price ?? ""),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Stollar sonini kiriting",
                style: TextStyle(fontSize: 15.sp),
              ),
              SizedBox(
                height: 5.h,
              ),
              textField(
                  controller: _countTableController,
                  hintText: "10",
                  validator: (input) {
                    if (input!.isEmpty) {
                      return "Iltimos stollar sonini kiriting!";
                    }
                  },
                  initialText: widget.index ?? ""),
              Spacer(),
              isLoading
                  ? InkWell(
                      onTap: () {
                        widget.id == null ? _createTables() : _updateTable();
                        isLoading? Navigator.of(context).pop(): SizedBox.shrink();
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
                            widget.id == null ? "Add tables" : "Update",
                            style: TextStyle(
                                color: MainColors.whiteColor, fontSize: 17.sp),
                          ),
                        ),
                      ),
                    )
                  : Center(
                      child: CircularProgressIndicator(
                        color: MainColors.greenColor,
                      ),
                    ),
              SizedBox(
                height: 40.h,
              )
            ],
          ),
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
        value:
            widget.floor == null ? floorValue = widget.floor  : floorValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        elevation: 16,
        isExpanded: true,
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            floorValue = newValue!;
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
        value:
            widget.setNum == null ? personValue = widget.setNum : personValue,
        icon: const Icon(Icons.keyboard_arrow_down),
        elevation: 16,
        isExpanded: true,
        underline: SizedBox(),
        onChanged: (String? newValue) {
          setState(() {
            personValue = newValue!;
          });
          //print(personTable);
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

  Widget textField({
    String? suffixText,
    required TextEditingController controller,
    required String hintText,
    required var validator,
    required String initialText,
  }) {
    return TextFormField(
      validator: validator,
      controller: controller..text = initialText,
      onChanged: (text) {
        text = controller.text;
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: MainColors.greyColor,
                width: 1,
                style: BorderStyle.solid),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
                color: MainColors.greenColor,
                width: 1,
                style: BorderStyle.solid),
          ),
          border: InputBorder.none,
          suffixText: suffixText,
          hintText: hintText),
    );
  }
}
