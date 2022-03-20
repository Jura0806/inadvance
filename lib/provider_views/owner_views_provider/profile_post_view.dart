import 'dart:convert';

import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:inadvance/models/restaurant_profile_model.dart';
import 'package:inadvance/services/network_owner_http.dart';

// class CreateProfile extends ChangeNotifier {
//   late final formKey = GlobalKey<FormState>();
//   File? imageRest;
//   bool isLoading = false;
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
//           bankNumber: bankNumberController.text.toString(),
//           phone: phoneController.text,
//           openTime: openTimeController.text.toString(),
//           closeTime: closeTimeController.text.toString(),
//           mapLn: mapInController.text.toString(),
//           mapLt: mapItController.text.toString());
//
//       isLoading = true;
//       notifyListeners();
//
//       var response = await OwnerNetwork.ownerProfile(
//           OwnerNetwork.Api_Restaurant_Profile,
//           OwnerNetwork.paramsOwnerProfile(profile));
//
//       if (response != null) {
//         _doSaveHive(context);
//       }
//       isLoading = false;
//       notifyListeners();
//
//       print("New User Restaurant => $response");
//     }
//   }
//
//   void _doSaveHive(BuildContext context) {
//     Navigator.pushNamedAndRemoveUntil(
//         context, OwnerNavigationBar.id, (route) => false);
//   }
//
//   Future getImage() async {
//     try {
//       final image = await ImagePicker().pickImage(source: ImageSource.gallery);
//       if (image == null) return;
//
//       final imageTemporary = File(image.path);
//
//       this.imageRest = imageTemporary;
//       notifyListeners();
//     } on PlatformException catch (e) {
//       print("Failed to pick image: $e");
//     }
//   }
//
//   //Map<String, dynamic> profileResponse = {};
//   bool isLoadingGet = true;
//   RestaurantProfileModel? restaurantProfileModel;
//
//   Future getProfile() async {
//
//
//     var response = await OwnerNetwork.ownerProfileGet(OwnerNetwork.Api_Restaurant_Profile);
//
//
//     if (response != null) {
//      RestaurantProfileModel restaurantProfileModel = OwnerNetwork.profileParse(response);
//       isLoadingGet= false;
//       notifyListeners();
//     //   profileResponse = jsonDecode(response);
//     //   isLoadingGet = false;
//     //   notifyListeners();
//     //   //print(response);
//     }
//     // print(profileResponse["data"]["name"]);
//     // print(restaurantProfileModel!.bankNumber);
//     // print(restaurantProfileModel!.name);
//     // print(restaurantProfileModel!.imagePath);
//     //print(restaurantProfileModel!.bankNumber);
//    // print(response);
//   }
// }
