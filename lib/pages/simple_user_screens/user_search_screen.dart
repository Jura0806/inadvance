import 'dart:async';

import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:inadvance/services/hive_db_user_service.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../models/restaurant_model.dart';
import '../../models/restaurants_model.dart';
import 'restaurant_infos_page.dart';

class UserSearchScreen extends StatefulWidget {
  const UserSearchScreen({Key? key}) : super(key: key);
  static final String id = "user_searching_screen";

  @override
  _UserSearchScreenState createState() => _UserSearchScreenState();
}

class _UserSearchScreenState extends State<UserSearchScreen> {
  late YandexMapController _mapController;
  Completer<YandexMapController> _completer = Completer();
  final animation =
      const MapAnimation(type: MapAnimationType.smooth, duration: 2.0);

  final List<MapObject> mapObjects = [];
  final MapObjectId clusterizedPlacemarkCollectionId =
      MapObjectId('clusterized_placemark_collection');
  List<Restaurant> fakeRestaurants = [
    Restaurant(
        id: 1,
        name: "Rayhon",
        phone: "+998991238484",
        imagePath:
            "https://media-cdn.tripadvisor.com/media/photo-s/1a/18/3a/cb/restaurant-le-47.jpg",
        type: "Foreign cuisine"),
    Restaurant(
        phone: "+998991238484",
        id: 2,
        name: "TheFork",
        imagePath:
            "https://media.blogto.com/articles/20211009-1Hotel-15.jpg?w=2048&cmd=resize_then_crop&height=1365&quality=70",
        type: "National Food"),
    Restaurant(
        phone: "+998991238484",
        id: 3,
        name: "FoodTime",
        imagePath:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSR-y5DHzl80LUYbmm-ZqEReSxL2D9hKB6vf6_HPTxmGi5bEIW4-5K0cYHkOT5gkwdR7YM&usqp=CAU",
        type: "Foreign cuisine"),
    Restaurant(
        phone: "+998991238484",
        id: 4,
        name: "Mosse",
        imagePath:
            "https://media-cdn.tripadvisor.com/media/photo-s/12/74/2e/25/about-our-lovely-place.jpg",
        type: "Foreign cuisine"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          YandexMap(
            onMapCreated: _onMapCreated,
            mapObjects: mapObjects,
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
                      border:
                          Border.all(width: 0.5, color: MainColors.greenColor)),
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
                              width: 0.5, color: MainColors.greenColor)),
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
                            onPressed: () {
                              print(Hive.box("ClientSignIn").isEmpty);
                              print(HiveClientSignIn().loadClient().login);
                              print(HiveClientSignIn().loadClient().login);
                              // print(HiveToken().loadToken());
                            },
                            child: Text(
                              "search",
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
              onPressed: () async {
                await _mapController.moveCamera(CameraUpdate.zoomIn(),
                    animation: animation);
              },
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
              onPressed: () async {
                await _mapController.moveCamera(CameraUpdate.zoomOut(),
                    animation: animation);
              },
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

  void _onMapCreated(YandexMapController controller) async {
    _mapController = controller;
    _completer.complete(controller);

    final cameraPosition = await _mapController.getCameraPosition().then(
      (value) async {
        moveCameraToPoint(Point(latitude: 41.2995, longitude: 69.2401));
      },
    );

    drawPlaceMark();
  }

  void moveCameraToPoint(Point point) async {
    await _mapController.moveCamera(CameraUpdate.newCameraPosition(
      CameraPosition(target: point, zoom: 12.0),
    ));
  }

  void drawPlaceMark() async {
    if (mapObjects.any((el) => el.mapId == clusterizedPlacemarkCollectionId)) {
      return;
    }

    final clusterizedPlacemarkCollection = ClusterizedPlacemarkCollection(
      mapId: clusterizedPlacemarkCollectionId,
      radius: 30,
      minZoom: 15,
      onClusterAdded:
          (ClusterizedPlacemarkCollection self, Cluster cluster) async {
        return cluster.copyWith(
            appearance: cluster.appearance.copyWith(
                icon: PlacemarkIcon.single(PlacemarkIconStyle(
                    image: BitmapDescriptor.fromAssetImage(
                        'assets/images/ic_marker.png'),
                    scale: 1))));
      },
      onClusterTap: (ClusterizedPlacemarkCollection self, Cluster cluster) {
        print('Tapped cluster');
      },
      placemarks: [
        Placemark(
            mapId: MapObjectId('placemark_1'),
            point: Point(latitude: 41.285509, longitude: 69.205329),
            consumeTapEvents: true,
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[0]),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
        Placemark(
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[1]),
            mapId: MapObjectId('placemark_2'),
            point: Point(latitude: 41.292461, longitude: 69.224921),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
        Placemark(
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[2]),
            mapId: MapObjectId('placemark_3'),
            point: Point(latitude: 41.31481, longitude: 69.321858),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
        Placemark(
            // les ailes
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[3]),
            mapId: MapObjectId('placemark_4'),
            point: Point(latitude: 41.298201, longitude: 69.273938),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
        Placemark(
            // ugolok
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[0]),
            mapId: MapObjectId('placemark_5'),
            point: Point(latitude: 41.313564, longitude: 69.278563),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
        Placemark(
            // Banquette Hall
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[1]),
            mapId: MapObjectId('placemark_6'),
            point: Point(latitude: 41.342868, longitude: 69.212680),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
        Placemark(
            // Osmanli
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[2]),
            mapId: MapObjectId('placemark_7'),
            point: Point(latitude: 41.310485, longitude: 69.239798),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
        Placemark(
            // Osmanli
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[3]),
            mapId: MapObjectId('placemark_8'),
            point: Point(latitude: 41.310485, longitude: 69.239798),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
        Placemark(
            // Khan Chapan
            onTap: (Placemark self, Point point) =>
                showPlaceInfo(fakeRestaurants[0]),
            mapId: MapObjectId('placemark_8'),
            point: Point(latitude: 41.338034, longitude: 69.258108),
            icon: PlacemarkIcon.single(PlacemarkIconStyle(
                image: BitmapDescriptor.fromAssetImage(
                    'assets/images/ic_marker.png'),
                scale: 1))),
      ],
      onTap: (ClusterizedPlacemarkCollection self, Point point) =>
          print('Tapped me at $point'),
    );

    setState(() {
      mapObjects.add(clusterizedPlacemarkCollection);
    });
  }

  void showPlaceInfo(Restaurant fakeRestaurant) {
    showModalBottomSheet(
        context: context,
        builder: (context) => bottomSheetPlaceInfo(fakeRestaurant));
  }

  Widget bottomSheetPlaceInfo(Restaurant restaurant) {
    return StatefulBuilder(
      builder: (BuildContext context, StateSetter myState) {
        return Container(
          height: 180,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          restaurant.name!,
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 17.sp),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      restaurant.type!,
                      style: TextStyle(fontSize: 13.sp),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (BuildContext context) =>
                                RestaurantInfosPage(
                                  restId: restaurant.id.toString(),
                                  restName: restaurant.name,
                                  phone: restaurant.phone,
                                  openTime: restaurant.openTime,
                                  closeTime: restaurant.closeTime,
                                  image: NetworkImage(
                                      'https://in-advance.bingo99.uz${restaurant.imagePath}'),
                                )));
                      },
                      child: Container(
                        height: 40.h,
                        width: 150.w,
                        decoration: BoxDecoration(
                          color: MainColors.greenColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                            child: Text(
                          "More",
                          style: TextStyle(
                              color: MainColors.whiteColor, fontSize: 15.sp),
                        ).tr()),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
