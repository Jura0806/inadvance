import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/foundation.dart';
// import 'package:flutter/services.dart';
// import 'package:hive/hive.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:inadvance/models/restaurant_profile_model.dart';
// import 'package:inadvance/services/hive_db_user_service.dart';
// import 'package:inadvance/services/network_owner_http.dart';
// import 'dart:io';
//
// import 'package:inadvance/utils/colors.dart';
//
// class CreateRestProfile extends ChangeNotifier {
//   late final formKey = GlobalKey<FormState>();
//   File? imageRest;
//   File? imageLogo;
//   bool isLoading = false;
//   var getResponse;
//   int checkRestImg = 0;
//   int checkRestLogo = 0;
//   bool isLoadingGet = true;
//   int categoryName = 0;
//   var categories = [
//     "Milliy taomlar",
//     "Chetel Taomlar",
//     "Milliy va Chetel Taomlari"
//   ];
//   Map<String, dynamic> profile = {
//     "data": {
//       "name": "",
//       "phone": "",
//       "map_ln": "",
//       "map_lt": "",
//       "open_time": "",
//       "close_time": "",
//       "bank_number": "",
//     }
//   };
//
//   var nameController = TextEditingController();
//   var phoneController = TextEditingController();
//   var locationController = TextEditingController();
//   var bankNumberController = TextEditingController();
//   var openTimeController = TextEditingController();
//   var closeTimeController = TextEditingController();
//   var mapInController = TextEditingController();
//   var mapItController = TextEditingController();
//
//   Future createProfile(BuildContext context) async {
//     if (formKey.currentState!.validate()) {
//       formKey.currentState!.save();
//       var profile = RestaurantProfileModel(
//           name: nameController.text.toString(),
//           imagePath: imageRest!.path,
//           logo: imageLogo!.path,
//           bankNumber: bankNumberController.text.toString(),
//           phone: phoneController.text,
//           openTime: openTimeController.text.toString(),
//           closeTime: closeTimeController.text.toString(),
//           mapLn: mapInController.text.toString(),
//           mapLt: mapItController.text.toString(),
//           type: categoryName);
//
//       isLoading = true;
//       notifyListeners();
//       var response =
//           Hive.box("Restaurant_id").isEmpty && Hive.box("OwnerSignIn").isEmpty
//               ? await OwnerNetwork.ownerProfilePost(
//                   OwnerNetwork.Api_Restaurant_Profile,
//                   OwnerNetwork.paramsOwnerProfile(profile))
//               : await OwnerNetwork.ownerProfilePut(
//                   OwnerNetwork.Api_Restaurant_Profile,
//                   OwnerNetwork.paramsOwnerProfilePut(profile));
//
//       if (response != null) {
//         isLoading = false;
//         notifyListeners();
//         Navigator.of(context).pop();
//         Hive.box("Restaurant_id").isEmpty
//             ? HiveRestId().storeId(jsonDecode(response)["data"]["id"])
//             : SizedBox();
//       }
//
//       print("New User Restaurant => $response");
//     }
//   }
//
//   Future getImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//
//       checkRestImg = 1;
//       final imageTemporary = File(image.path);
//       this.imageRest = imageTemporary;
//       notifyListeners();
//     } on PlatformException catch (e) {
//       print("Failed to pick image: $e");
//     }
//   }
//
//   Image defaultImg() {
//     return Image.asset(
//       "assets/images/default_image.png",
//       fit: BoxFit.fill,
//       width: double.infinity,
//     );
//   }
//
//   Image imgPicker() {
//     return Image.file(
//       imageRest!,
//       fit: BoxFit.cover,
//       width: double.infinity,
//     );
//   }
//
//   Image networkGetImg() {
//     return Image.network(
//       "https://in-advance.bingo99.uz${profile["data"]["image_path"]}",
//       fit: BoxFit.cover,
//       width: double.infinity,
//     );
//   }
//
//   Future getImgLogo() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//
//       checkRestLogo = 1;
//       final imageTemporary = File(image.path);
//       this.imageLogo = imageTemporary;
//       notifyListeners();
//     } on PlatformException catch (e) {
//       print("Failed to pick image: $e");
//     }
//   }
//
//   Future getProfile() async {
//     var response =
//         await OwnerNetwork.ownerProfileGet(OwnerNetwork.Api_Restaurant_Profile);
//
//     if (response != null) {
//       getResponse = response;
//       profile = jsonDecode(response);
//       isLoadingGet = false;
//       notifyListeners();
//     }
//   }
//
//   DecorationImage getLogoNetwork() {
//     return DecorationImage(
//         image: CachedNetworkImageProvider(
//             "https://in-advance.bingo99.uz${profile["data"]["logo_path"]}"),
//         fit: BoxFit.cover);
//   }
//
//   DecorationImage defaultLogo() {
//     return DecorationImage(
//         image: AssetImage("assets/images/default_image.png"),
//         fit: BoxFit.cover);
//   }
//
//   DecorationImage imagePicker() {
//     return DecorationImage(image: FileImage(imageLogo!), fit: BoxFit.cover);
//   }
//
//   Widget chooseCategory({required int category}) {
//     return InkWell(
//       onTap: () {
//         categoryName = category;
//         notifyListeners();
//       },
//       child: Column(
//         children: [
//           Container(
//             padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//             height: 45,
//             width: double.infinity,
//             decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(8),
//                 color: categoryName == category
//                     ? MainColors.greenColor
//                     : MainColors.whiteColor),
//             child: Text(
//               categories[category],
//               style: TextStyle(
//                   fontSize: 17,
//                   color: categoryName == category
//                       ? MainColors.whiteColor
//                       : MainColors.blackColor),
//             ),
//           ),
//           categories.length == 3
//               ? Divider(
//                   color: MainColors.greenColor,
//                   height: 0,
//                   thickness: 0.3,
//                 )
//               : SizedBox.shrink(),
//         ],
//       ),
//     );
//   }
// }
// Widget chooseCategory({required int category}) {
//   return InkWell(
//     onTap: () {
//       setState(() {
//         categoryName = category;
//       });
//     },
//     child: Column(
//       children: [
//         Container(
//           padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
//           height: 45,
//           width: double.infinity,
//           decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(8),
//               color: categoryName == category
//                   ? MainColors.greenColor
//                   : MainColors.whiteColor),
//           child: Text(
//             categories[category],
//             style: TextStyle(
//                 fontSize: 17,
//                 color: categoryName == category
//                     ? MainColors.whiteColor
//                     : MainColors.blackColor),
//           ),
//         ),
//         categories.length == 3
//             ? Divider(
//           color: MainColors.greenColor,
//           height: 0,
//           thickness: 0.3,
//         )
//             : SizedBox.shrink(),
//       ],
//     ),
//   );
// }
//SizedBox(
//                   height: 15.h,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15.0),
//                   child: Text(
//                     "Restoraningizda qanday taomlar mavjud?",
//                     style: TextStyle(fontSize: 15.sp),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 5.h,
//                 ),
//                 Container(
//                   margin: EdgeInsets.symmetric(horizontal: 15),
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(8),
//                       border:
//                       Border.all(width: 1, color: MainColors.greenColor)),
//                   child: Column(children: [
//                     chooseCategory(category: 0),
//                     chooseCategory(category: 1),
//                     chooseCategory(category: 2),
//                   ]),
//                 ),
//                 SizedBox(
//                   height: 40,
//                 ),