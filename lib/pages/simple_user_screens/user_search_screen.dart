import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inadvance/services/hive_db_user_service.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);
  static final String id = "user_searching_screen";

  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  late YandexMapController _mapController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: (YandexMapController yandexMapController) async {
              _mapController = yandexMapController;
              final cameraPosition =
                  await _mapController.getCameraPosition().then(
                (value) async {
                  await _mapController.moveCamera(
                      CameraUpdate.newCameraPosition(const CameraPosition(
                          target: Point(latitude: 41.2995, longitude: 69.2401),
                          zoom: 12.0)));
                },
              );
            },
          ),
          Padding(
            padding: EdgeInsets.only(left: 15, right: 15, top: 45, bottom: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: double.infinity,
                  padding: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.white,
                      border: Border.all(
                          width: 0.5,
                          color: MainColors.greenColor
                      )
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.location_on),
                      const SizedBox(
                        width: 10,
                      ),
                      Text(
                        "Chilonzor",
                        style: TextStyle(color: Colors.grey.shade700),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 230,
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.white,
                        border: Border.all(
                          width: 0.5,
                          color: MainColors.greenColor
                        )
                      ),
                      child: TextField(
                        decoration: InputDecoration(
                            hintText: "searchRestWithName".tr(),
                            border: InputBorder.none),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: MainColors.greenColor,
                      ),
                      child: Center(
                        child: TextButton(
                          onPressed: (){
                            print( Hive.box("ClientSignIn").isEmpty);
                            print(HiveClientSignIn().loadClient().login);
                            print(HiveClientSignIn().loadClient().login);
                           // print(HiveToken().loadToken());
                          },
                          child: Text("search",
                          style: TextStyle(color: MainColors.whiteColor),
                        ).tr()),
                      ),
                    )
                  ],
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: Container(
        margin: EdgeInsets.only(bottom: 45),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.max,
          children: [
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '+',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25.sp,
                ),
              ),
              style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.white,
                  fixedSize: Size(48.w, 48.w),
                  minimumSize: Size(0, 0)),
            ),
            SizedBox(height: 15.h),
            ElevatedButton(
              onPressed: () {},
              child: Text(
                '–',
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 25.sp,
                ),
              ),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.white,
                fixedSize: Size(48.w, 48.w),
                minimumSize: Size(0, 0),
                elevation: 0.0,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
