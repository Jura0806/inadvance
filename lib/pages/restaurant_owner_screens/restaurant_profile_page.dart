import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inadvance/models/restaurant_profile_model.dart';
import 'package:inadvance/pages/location_page/location_page.dart';
import 'package:inadvance/services/hive_db_user_service.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'dart:io';

class RestProfilePage extends StatefulWidget {
  const RestProfilePage({Key? key}) : super(key: key);

  @override
  _RestProfilePageState createState() => _RestProfilePageState();
}

class _RestProfilePageState extends State<RestProfilePage> {
  //CreateRestProfile createProfile = new CreateRestProfile();

  late final formKey = GlobalKey<FormState>();
  File? imageRest;
  File? imageLogo;
  bool isLoading = false;
  var getResponse;
  int checkRestImg = 0;
  int checkRestLogo = 0;
  bool isLoadingGet = true;
  int categoryName = 0;
  var categories = [
    "Milliy taomlar",
    "Chetel Taomlar",
    "Milliy va Chetel Taomlari"
  ];
  Map<String, dynamic> profile = {
    "data": {
      "name": "",
      "phone": "",
      "map_ln": "",
      "map_lt": "",
      "open_time": "",
      "close_time": "",
      "bank_number": "",
    }
  };

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var bankNumberController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();
  var mapInController = TextEditingController();
  var mapItController = TextEditingController();

  Future createProfile() async {
    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      var profile = RestaurantProfileModel(
          name: nameController.text.toString(),
          imagePath: imageRest!.path,
          logo: imageLogo!.path,
          bankNumber: bankNumberController.text.toString(),
          phone: phoneController.text,
          openTime: openTimeController.text.toString(),
          closeTime: closeTimeController.text.toString(),
          mapLn: mapInController.text.toString(),
          mapLt: mapItController.text.toString(),
          type: categoryName);
      setState(() {
        isLoading = true;
      });
      var response =
      Hive.box("Restaurant_id").isEmpty && Hive.box("OwnerSignIn").isEmpty
          ? await OwnerNetwork.ownerProfilePost(
          OwnerNetwork.Api_Restaurant_Profile,
          OwnerNetwork.paramsOwnerProfile(profile))
          : await OwnerNetwork.ownerProfilePut(
          OwnerNetwork.Api_Restaurant_Profile,
          OwnerNetwork.paramsOwnerProfilePut(profile));

      if (response != null) {
        setState(() {
          isLoading = false;
        });
        Navigator.of(context).pop();
        Hive.box("Restaurant_id").isEmpty
            ? HiveRestId().storeId(jsonDecode(response)["data"]["id"])
            : SizedBox();
      }

      print("New User Restaurant => $response");
    }
  }

  Future getProfile() async {
    var response =
        await OwnerNetwork.ownerProfileGet(OwnerNetwork.Api_Restaurant_Profile);

    if (response != null) {
      setState(() {
        getResponse = response;
        profile = jsonDecode(response);
        isLoadingGet = false;
        categoryName = jsonDecode(response)["data"]["type"]??0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    getProfile();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("profile").tr(),
        actions: [
          IconButton(
            onPressed: () {
              print(
                  " gggg ${Hive.box("Restaurant_id").isEmpty && Hive.box("OwnerSignIn").isEmpty}");
              createProfile();
            },
            icon: SvgPicture.asset(
              "assets/images/vector_ok.svg",
              height: 22.5.h,
            ),
          ),
        ],
      ),
      body: Hive.box("Restaurant_id").isEmpty && Hive.box("OwnerSignIn").isEmpty
          ? profileBody()
          : isLoadingGet
              ? Center(
                  child: CircularProgressIndicator(
                    color: MainColors.greenColor,
                  ),
                )
              : profileBody(),
    );
  }

  Widget profileBody() {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 190.h,
                      margin: EdgeInsets.only(
                        bottom: 50.h,
                      ),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.w),
                      ),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8.w),
                            child: checkRestImg == 1
                                ? imgPicker()
                                : Hive.box("Restaurant_id").isEmpty &&
                                        Hive.box("OwnerSignIn").isEmpty
                                    ? defaultImg()
                                    : networkGetImg(),
                          ),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8.w),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.black.withOpacity(.2),
                                  Colors.black.withOpacity(.2),
                                  Colors.black.withOpacity(.2),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Positioned(
                      left: 140.w,
                      top: 145.h,
                      child: Container(
                        height: 95.h,
                        width: 95.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MainColors.dimRedColor,
                            image: checkRestLogo == 1
                                ? imagePicker()
                                : Hive.box("Restaurant_id").isEmpty &&
                                        Hive.box("OwnerSignIn").isEmpty
                                    ? defaultLogo()
                                    : getLogoNetwork(),
                            border: Border.all(
                                width: 3, color: MainColors.greenColor)),
                      ),
                    ),
                    Positioned(
                      top: 145.h,
                      left: 330.w,
                      child: GestureDetector(
                        onTap: () => getImage(),
                        child: Container(
                          height: 40.h,
                          width: 40.w,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: LinearGradient(colors: [
                              Colors.white.withOpacity(.3),
                              Colors.white.withOpacity(.3),
                              Colors.white.withOpacity(.3)
                            ]),
                          ),
                          child: Icon(
                            Icons.camera_alt_outlined,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 145.h,
                      left: 200.w,
                      child: Container(
                        height: 35.h,
                        width: 35.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: MainColors.whiteColor,
                            border: Border.all(
                              width: 3,
                              color: MainColors.greenColor,
                            )),
                        child: Center(
                          child: IconButton(
                            onPressed: () {
                              getImgLogo();
                            },
                            icon: Center(
                              child: Icon(
                                Icons.camera_alt_outlined,
                                color: MainColors.greenColor,
                                size: 16.w,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                textField(
                    labelText: "restaurantName".tr(),
                    controller: nameController,
                    initialValue: profile["data"]["name"] ?? ""),
                textField(
                    labelText: "adminNumber".tr(),
                    controller: phoneController,
                    prefixText: "+998",
                    initialValue: profile["data"]["phone"] ?? ""),
                textField(
                    labelText: "location".tr(),
                    suffixIcon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LocationPage(),
                          ),
                        );
                      },
                      icon: Icon(
                        Icons.location_on,
                        color: MainColors.greenColor,
                      ),
                    ),
                    controller: locationController,
                    initialValue: "112.23, 233.2333"),
                SizedBox(
                  height: 15.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    timeInput(
                        isOpen: "openTime".tr(),
                        time: "8:00",
                        controller: openTimeController,
                        initialValue: profile["data"]["open_time"] ?? ""),
                    timeInput(
                        isOpen: "closeTime".tr(),
                        time: "21:00",
                        controller: closeTimeController,
                        initialValue: profile["data"]["close_time"] ?? ""),
                  ],
                ),
                SizedBox(
                  height: 15.h,
                ),
                textField(
                    labelText: "bunkNumber",
                    controller: bankNumberController,
                    initialValue: profile["data"]["bank_number"] ?? ""),
                SizedBox(
                  height: 15.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Text(
                    "Restoraningizda qanday taomlar mavjud?",
                    style: TextStyle(fontSize: 15.sp),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border:
                          Border.all(width: 1, color: MainColors.greenColor)),
                  child: Column(children: [
                    chooseCategory(category: 0),
                    chooseCategory(category: 1),
                    chooseCategory(category: 2),
                  ]),
                ),
                SizedBox(
                  height: 40,
                ),
              ],
            ),
          ),
        ),
        isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: MainColors.greenColor,
                ),
              )
            : SizedBox(),
      ],
    );
  }

  Widget textField(
      {required String labelText,
      Widget? suffixIcon,
      String? prefixText,
      required TextEditingController controller,
      required String? initialValue}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: TextFormField(
          validator: (input) {
            if (input!.isEmpty) {
              return "Iltimos ma'lumotlarni to'liq kiriting!";
            }
          },
          controller: controller..text = initialValue!,
          onChanged: (text) {
            if (text.isNotEmpty) {
              text = controller.toString();
            }
          },
          cursorColor: MainColors.greenColor,
          decoration: InputDecoration(
              prefixText: prefixText,
              prefixStyle:
                  TextStyle(color: MainColors.blackColor, fontSize: 15.sp),
              labelText: labelText.tr(),
              alignLabelWithHint: true,
              suffixIcon: suffixIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(
                    color: MainColors.greyColor,
                    width: 1,
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(
                    color: MainColors.greenColor,
                    width: 1,
                    style: BorderStyle.solid),
              ))),
    );
  }

  Widget timeInput(
      {required String isOpen,
      required String time,
      required TextEditingController controller,
      required String? initialValue}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isOpen,
          style: TextStyle(fontSize: 15.sp),
        ),
        Container(
          height: 40.h,
          margin: EdgeInsets.only(top: 5),
          width: 165.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MainColors.greenColor.withOpacity(.3),
          ),
          child: TextFormField(
            validator: (input) {
              if (input!.isEmpty) {
                return "Iltimos ma'lumotlarni to'liq kiriting!";
              }
            },
            controller: controller..text = initialValue!,
            onChanged: (text) {
              if (text != null || text.isNotEmpty) {
                text = controller.toString();
              }
            },
            cursorColor: MainColors.greenColor,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: time,
                contentPadding: EdgeInsets.only(left: 20.w, top: 10.h),
                suffixIcon: InkWell(
                    onTap: () {},
                    child: Icon(
                      Icons.navigate_next_sharp,
                      color: Colors.black,
                    ))),
          ),
        )
      ],
    );
  }

  Widget chooseCategory({required int category}) {
    return InkWell(
      onTap: () {
        setState(() {
          categoryName = category;
        });
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            height: 45,
            width: double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: categoryName == category
                    ? MainColors.greenColor
                    : MainColors.whiteColor),
            child: Text(
              categories[category],
              style: TextStyle(
                  fontSize: 17,
                  color: categoryName == category
                      ? MainColors.whiteColor
                      : MainColors.blackColor),
            ),
          ),
          categories.length == 3
              ? Divider(
                  color: MainColors.greenColor,
                  height: 0,
                  thickness: 0.3,
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      setState(() {
        checkRestImg = 1;
        final imageTemporary = File(image.path);
        this.imageRest = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  Image defaultImg() {
    return Image.asset(
      "assets/images/default_image.png",
      fit: BoxFit.fill,
      width: double.infinity,
    );
  }

  Image imgPicker() {
    return Image.file(
      imageRest!,
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }

  Image networkGetImg() {
    return Image.network(
      "https://in-advance.bingo99.uz${profile["data"]["image_path"]}",
      fit: BoxFit.cover,
      width: double.infinity,
    );
  }

  Future getImgLogo() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      setState(() {
        checkRestLogo = 1;
        final imageTemporary = File(image.path);
        this.imageLogo = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }


  DecorationImage getLogoNetwork() {
    return DecorationImage(
        image: CachedNetworkImageProvider(
            "https://in-advance.bingo99.uz${profile["data"]["logo_path"]}"),
        fit: BoxFit.cover);
  }

  DecorationImage defaultLogo() {
    return DecorationImage(
        image: AssetImage("assets/images/default_image.png"),
        fit: BoxFit.cover);
  }

  DecorationImage imagePicker() {
    return DecorationImage(image: FileImage(imageLogo!), fit: BoxFit.cover);
  }
}
