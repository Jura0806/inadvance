
import 'package:flutter/material.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LocationPage extends StatefulWidget {
  const LocationPage({Key? key}) : super(key: key);

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  late YandexMapController _mapController;
  final List<MapObject> mapObjects = [];
  final MapObjectId placemarkId = MapObjectId('normal_icon_placemark');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: YandexMap(
              tiltGesturesEnabled: true,
              zoomGesturesEnabled: true,
              rotateGesturesEnabled: true,
              scrollGesturesEnabled: true,
              modelsEnabled: true,
              nightModeEnabled: false,
              indoorEnabled: false,
              liteModeEnabled: false,
              mapObjects: mapObjects,
              onMapTap: (Point point) {
                marker(
                    latitude: point.latitude.toDouble(),
                    longitude: point.longitude.toDouble());
              },
              onMapCreated: (YandexMapController yandexMapController) async {
                _mapController = yandexMapController;
                final cameraPosition =
                    await _mapController.getCameraPosition().then(
                  (value) async {
                    await _mapController.moveCamera(
                        CameraUpdate.newCameraPosition(const CameraPosition(
                            target:
                                Point(latitude: 41.2995, longitude: 69.2401),
                            zoom: 12.0)));
                  },
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: Column(
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
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  marker({latitude, longitude}) {
    if (mapObjects.isEmpty) {
      if (mapObjects.any((element) => element.mapId == placemarkId)) {
        return;
      }

      final placemark = Placemark(
        mapId: placemarkId,
        point: Point(latitude: latitude, longitude: longitude),
        onTap: (Placemark self, Point point) {
          print('Tapped me at $point');
        },
        direction: 0,
        opacity: 1,
        isDraggable: true,
        onDragStart: (_) => print('Drag start'),
        onDrag: (_, Point point) => print('Drag at point $point'),
        onDragEnd: (_) => print('Drag end'),
        icon: PlacemarkIcon.single(PlacemarkIconStyle(
            scale: 2.4,
            image:
                BitmapDescriptor.fromAssetImage('assets/images/location.png'),
            rotationType: RotationType.noRotation)),
      );

      setState(() {
        mapObjects.add(placemark);
      });
    } else if (mapObjects.isNotEmpty) {
      if (!mapObjects.any((element) => element.mapId == placemarkId)) {
        return;
      }

      final placemarkUpdate =
          mapObjects.firstWhere((el) => el.mapId == placemarkId) as Placemark;
      setState(() {
        mapObjects[mapObjects.indexOf(placemarkUpdate)] =
            placemarkUpdate.copyWith(
          point: Point(latitude: latitude, longitude: longitude),
        );
      });
    }
  }
}
