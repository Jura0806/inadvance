import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inadvance/models/restaurant_profile_model.dart';
import 'package:inadvance/pages/location_page/location_page.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'dart:io';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RestProfilePage extends StatefulWidget {
  const RestProfilePage({Key? key}) : super(key: key);

  @override
  _RestProfilePageState createState() => _RestProfilePageState();
}

class _RestProfilePageState extends State<RestProfilePage> {
  late final _formKey = GlobalKey<FormState>();
  File? imageRest;
  bool isLoading = false;

  var nameController = TextEditingController();
  var phoneController = TextEditingController();
  var locationController = TextEditingController();
  var bankNumberController = TextEditingController();
  var openTimeController = TextEditingController();
  var closeTimeController = TextEditingController();
  var mapInController = TextEditingController();
  var mapItController = TextEditingController();

  void _createProfile() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      var profile = RestaurantProfileModel(
          name: nameController.text,
          image_path: imageRest!,
          bank_number: bankNumberController.text,
          phone: phoneController.text,
          open_time: openTimeController.text,
          close_time: closeTimeController.text,
          map_In: mapInController.text,
          map_It: mapItController.text);
      setState(() {
        isLoading = true;
      });
      var response = await OwnerNetwork.ownerProfile1(
          OwnerNetwork.Api_Restaurant_Profile,
          OwnerNetwork.paramsOwnerProfile(profile));
      setState(() {
        if (response != null) {
          _doSaveHive();
        }
        isLoading = false;
      });
      print("New User Restaurant => $response");
    }
  }

  void _doSaveHive() {
    Navigator.pushNamedAndRemoveUntil(
        context, OwnerNavigationBar.id, (route) => false);
  }

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
      setState(() => this.imageRest = imageTemporary);
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              _createProfile();
            },
            icon: SvgPicture.asset(
              "assets/images/vector_ok.svg",
              height: 22.5.h,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
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
                            child: imageRest == null
                                ? Image.asset(
                                    "assets/images/default_image.png",
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  )
                                : Image.file(
                                    imageRest!,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  )),
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
                    left: SizeConfig.screenWidth! / 2.5,
                    top: 145.h,
                    child: Container(
                      height: 95.h,
                      width: 95.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MainColors.dimRedColor,
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "https://scontent.ftas2-2.fna.fbcdn.net/v/t1.6435-1/147758135_2883057468590967_3283438224948433812_n.jpg?stp=dst-jpg_p720x720&_nc_cat=105&ccb=1-5&_nc_sid=1eb0c7&_nc_ohc=GzSj92nGIEAAX-EF1pd&_nc_ht=scontent.ftas2-2.fna&oh=00_AT_v--ZR3tfNgI1omykU60HmU2ULGmGL9NRF7z9fFT6jXQ&oe=6232FF9A")),
                          border: Border.all(
                              width: 3, color: MainColors.greenColor)),
                    ),
                  ),
                  Positioned(
                    top: 145.h,
                    left: SizeConfig.screenWidth! / 1.15,
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
                    left: SizeConfig.screenWidth! / 1.8,
                    child: Container(
                      height: 40.h,
                      width: 40.w,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: MainColors.whiteColor,
                          border: Border.all(
                            width: 3,
                            color: MainColors.greenColor,
                          )),
                      child: Center(
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.camera_alt_outlined,
                            color: MainColors.greenColor,
                            size: 20.w,
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
              textField(labelText: "Restoran nomi", controller: nameController),
              textField(labelText: "Admin raqami", controller: phoneController),
              textField(
                  labelText: "Shahar va lokatsiya",
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
                  controller: locationController),
              SizedBox(
                height: 15.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  timeInput(
                      isOpen: "Ochiladi",
                      time: "8:00",
                      controller: openTimeController),
                  timeInput(
                      isOpen: "Yopiladi",
                      time: "21:00",
                      controller: closeTimeController),
                ],
              ),
              SizedBox(
                height: 15.h,
              ),
              textField(
                  labelText: "Restoran hisob raqami",
                  controller: bankNumberController)
            ],
          ),
        ),
      ),
    );
  }

  Widget textField(
      {required String labelText,
      Widget? suffixIcon,
      required TextEditingController controller}) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
      child: TextFormField(
          validator: (input) {
            if (input!.isEmpty) {
              return "Iltimos ma'lumotlarni to'liq kiriting!";
            }
          },
          controller: controller,
          decoration: InputDecoration(
              labelText: labelText,
              alignLabelWithHint: true,
              suffixIcon: suffixIcon,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(
                    color: MainColors.greenColor,
                    width: 1,
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
                borderSide: BorderSide(
                    color: MainColors.textFieldColor,
                    width: 1,
                    style: BorderStyle.solid),
              ))),
    );
  }

  Widget timeInput(
      {required String isOpen,
      required String time,
      required TextEditingController controller}) {
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
          width: SizeConfig.screenWidth! / 2.3,
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
            controller: controller,
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
}
