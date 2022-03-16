import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
<<<<<<< HEAD
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inadvance/models/restaurant_profile_model.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_setting_screen.dart';
import 'package:inadvance/services/hive_db_owner_service.dart';
=======
import 'package:image_picker/image_picker.dart';
import 'package:inadvance/models/restaurant_profile_model.dart';
import 'package:inadvance/pages/restaurant_owner_screens/owner_navigation_bar.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';
import 'dart:io';
<<<<<<< HEAD
=======
import 'package:flutter_screenutil/flutter_screenutil.dart';
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1

class RestProfilePage extends StatefulWidget {
  const RestProfilePage({Key? key}) : super(key: key);

  @override
  _RestProfilePageState createState() => _RestProfilePageState();
}

class _RestProfilePageState extends State<RestProfilePage> {
  late final _formKey = GlobalKey<FormState>();
<<<<<<< HEAD
  File? _imageRest;
=======
  File? imageRest;
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
          image_path: _imageRest!,
=======
          image_path: imageRest!,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          bank_number: bankNumberController.text,
          phone: phoneController.text,
          open_time: openTimeController.text,
          close_time: closeTimeController.text,
          map_In: mapInController.text,
          map_It: mapItController.text);
      setState(() {
        isLoading = true;
      });
<<<<<<< HEAD
      var response = await OwnerNetwork.ownerProfile(
          OwnerNetwork.Api_Restaurant_Profile,
          Hive.box("OwnerProfile").isEmpty?
          OwnerNetwork.paramsOwnerProfile(profile): OwnerNetwork.paramsOwnerProfilePut(profile));
=======
      var response = await OwnerNetwork.ownerProfile1(
          OwnerNetwork.Api_Restaurant_Profile,
          OwnerNetwork.paramsOwnerProfile(profile));
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      setState(() {
        if(response != null ){
          _doSaveHive();
        }
        isLoading = false;
      });
      print("New User Restaurant => $response");
    }
  }

  void _doSaveHive(){
<<<<<<< HEAD
    var profile = RestaurantProfileModel(
        name: nameController.text,
        image_path: _imageRest!,
        bank_number: bankNumberController.text,
        phone: phoneController.text,
        open_time: openTimeController.text,
        close_time: closeTimeController.text,
        map_In: mapInController.text,
        map_It: mapItController.text);

    OwnerProfile().storeProfile(profile);
    var profileLocal = OwnerProfile().loadProfile();
    setState(() {
      _imageRest = profileLocal.image_path;
    });
=======

>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
    Navigator.pushNamedAndRemoveUntil(
        context, OwnerNavigationBar.id, (route) => false);
  }

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;

      final imageTemporary = File(image.path);
<<<<<<< HEAD
      setState(() => this._imageRest = imageTemporary);
=======
      setState(() => this.imageRest = imageTemporary);
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
              height: 22.5,
=======
              height: 22.5.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                    height: 200,
                    margin: EdgeInsets.only(
                      bottom: 50,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
=======
                    height: 190.h,
                    margin: EdgeInsets.only(
                      bottom: 50.h,
                    ),
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.w),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    ),
                    child: Stack(
                      children: [
                        ClipRRect(
<<<<<<< HEAD
                            borderRadius: BorderRadius.circular(8),
                            child: _imageRest == null
=======
                            borderRadius: BorderRadius.circular(8.w),
                            child: imageRest == null
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                ? Image.asset(
                                    "assets/images/default_image.png",
                                    fit: BoxFit.fill,
                                    width: double.infinity,
                                  )
                                : Image.file(
<<<<<<< HEAD
                                    _imageRest!,
=======
                                    imageRest!,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  )),
                        Container(
                          decoration: BoxDecoration(
<<<<<<< HEAD
                            borderRadius: BorderRadius.circular(8),
=======
                            borderRadius: BorderRadius.circular(8.w),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                    top: 150,
                    child: Container(
                      height: 100,
                      width: 100,
=======
                    top: 145.h,
                    child: Container(
                      height: 95.h,
                      width: 95.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                    top: 150,
=======
                    top: 145.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                    left: SizeConfig.screenWidth! / 1.15,
                    child: GestureDetector(
                      onTap: () => getImage(),
                      child: Container(
<<<<<<< HEAD
                        height: 45,
                        width: 45,
=======
                        height: 40.h,
                        width: 40.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                    top: 150,
                    left: SizeConfig.screenWidth! / 1.8,
                    child: Container(
                      height: 40,
                      width: 40,
=======
                    top: 145.h,
                    left: SizeConfig.screenWidth! / 1.8,
                    child: Container(
                      height: 40.h,
                      width: 40.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                            size: 20,
=======
                            size: 20.w,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
<<<<<<< HEAD
                height: 15,
=======
                height: 15.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              ),
              textField(labelText: "Restoran nomi", controller: nameController),
              textField(labelText: "Admin raqami", controller: phoneController),
              textField(
                  labelText: "Shahar va lokatsiya",
                  icon: Icons.location_on,
                  controller: locationController),
              SizedBox(
<<<<<<< HEAD
                height: 15,
=======
                height: 15.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
                height: 15,
=======
                height: 15.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
      IconData? icon,
      required TextEditingController controller}) {
    return Padding(
<<<<<<< HEAD
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
=======
      padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
      child: TextFormField(
          validator: (input) {
            if (input!.isEmpty) {
              return "Iltimos ma'lumotlarni to'liq kiriting!";
            }
          },
          controller: controller,
          decoration: InputDecoration(
              labelText: labelText,
<<<<<<< HEAD
              //floatingLabelBehavior: Hive.box("OwnerProfile").isEmpty?  FloatingLabelBehavior.always: FloatingLabelBehavior.never,
=======
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
              alignLabelWithHint: true,
              suffixIcon: Icon(
                icon,
                color: MainColors.greenColor,
              ),
<<<<<<< HEAD
              // labelStyle: TextStyle(color: MainColors.greenColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
=======
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.w),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
                borderSide: BorderSide(
                    color: MainColors.greenColor,
                    width: 1,
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
<<<<<<< HEAD
                borderRadius: BorderRadius.circular(8),
=======
                borderRadius: BorderRadius.circular(8.w),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
<<<<<<< HEAD
          style: TextStyle(fontSize: 17),
        ),
        Container(
          height: 40,
=======
          style: TextStyle(fontSize: 15.sp),
        ),
        Container(
          height: 40.h,
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
          margin: EdgeInsets.only(top: 5),
          width: SizeConfig.screenWidth! / 2.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MainColors.greenColor.withOpacity(.3),
          ),
          child: TextFormField(
<<<<<<< HEAD

=======
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
            validator: (input) {
              if (input!.isEmpty) {
                return "Iltimos ma'lumotlarni to'liq kiriting!";
              }
            },
            controller: controller,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: time,
<<<<<<< HEAD
                contentPadding: EdgeInsets.only(left: 20, top: 5),
=======
                contentPadding: EdgeInsets.only(left: 20.w, top: 10.h),
>>>>>>> 2be8253e065da0f756269568305e32588bacb7e1
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
