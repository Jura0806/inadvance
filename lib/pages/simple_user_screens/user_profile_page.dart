import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inadvance/models/sign_in_model.dart';
import 'package:inadvance/models/user_profile_model.dart';
import 'package:inadvance/services/hive_db_user_service.dart';
import 'package:inadvance/services/network_client_http.dart';
import 'package:inadvance/services/network_owner_http.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:io';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  _UserProfilePageState createState() => _UserProfilePageState();
}

class _UserProfilePageState extends State<UserProfilePage> {
  var fullNameController = TextEditingController();
  var phoneController = TextEditingController();

  File? imageUser;
  bool isLoading = true;
  int checkImg = 0;

  void _updateProfile() async {
    var userProfile = UserProfile(
        fullName: fullNameController.text,
        phone: phoneController.text,
        imagePath: imageUser!.path);

    var response = await NetworkClient.updateUserProfile(
        NetworkClient.Api_User_Profile,
        NetworkClient.paramsUpdateUser(userProfile));

    if (response != null) {
      setState(() {
        isLoading = false;
      });
      Navigator.of(context).pop();
    }

    print("Profile => $response");
  }

  Map<String, dynamic> data = {};

  void getProfile() async {
    var ownerSignIn = SignIn(
        login: HiveClientSignIn().loadClient().login,
        password: HiveClientSignIn().loadClient().password);
    var response = await OwnerNetwork.ownerRegister(
        OwnerNetwork.Api_LogIn, OwnerNetwork.paramsSignIn(ownerSignIn));

    if (response != null) {
      setState(() {
        data = jsonDecode(response)["user"];
      });
    }
    print(response);
  }

  Future getImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      setState(() {
        // checkRestImg = 1;
        final imageTemporary = File(image.path);
        this.imageUser = imageTemporary;
      });
    } on PlatformException catch (e) {
      print("Failed to pick image: $e");
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getProfile();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profil"),
      ),
      body: Stack(
        children: [
          Column(
            children: [
              const Spacer(
                flex: 1,
              ),
              Center(
                child: Stack(
                  children: [
                    InkWell(
                      onTap: () => getProfile(),
                      child: Container(
                        height: 105.h,
                        width: 105.w,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: CachedNetworkImageProvider(
                            "https://in-advance.bingo99.uz${data["image_path"]}",
                          ),
                            fit: BoxFit.cover
                          ),
                          color: Colors.grey,
                          shape: BoxShape.circle,
                          border: Border.all(
                              width: 2.5, color: MainColors.greenColor),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 70.w,
                      child: GestureDetector(
                        onTap: () => getImage(),
                        child: Container(
                          height: 30.h,
                          width: 30.w,
                          child: Center(
                            child: Icon(
                              Icons.camera_alt_outlined,
                              color: MainColors.greenColor,
                              size: 17.sp,
                            ),
                          ),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: MainColors.whiteColor,
                              border: Border.all(
                                  width: 2, color: MainColors.greenColor)),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const Spacer(
                flex: 5,
              ),
              userInfo(
                  info: "FullName",
                  controller: fullNameController,
                  initialText: data["full_name"] ?? ""),
              userInfo(
                info: "Phone Number",
                controller: phoneController,
                prefixText: "+998",
                initialText: data["phone"] ?? "",
              ),
              const Spacer(
                flex: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor:
                            MaterialStateProperty.all(MainColors.dimRedColor),
                      ),
                      child: Center(
                        child: Text(
                          "Rad etish",
                          style: TextStyle(
                              color: Colors.red.shade900, fontSize: 15.sp),
                        ),
                      ),
                    ),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        _updateProfile();
                      },
                      style: ButtonStyle(
                        padding: MaterialStateProperty.all(
                            EdgeInsets.symmetric(horizontal: 50, vertical: 15)),
                        elevation: MaterialStateProperty.all(0),
                        backgroundColor: MaterialStateProperty.all(
                          MainColors.greenColor,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          "Saqlash",
                          style: TextStyle(
                              color: MainColors.whiteColor, fontSize: 15.sp),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(
                flex: 5,
              )
            ],
          ),
          isLoading != true
              ? Center(
                  child: CircularProgressIndicator(
                    color: MainColors.greenColor,
                  ),
                )
              : SizedBox.shrink(),
        ],
      ),
    );
  }

  Widget userInfo(
      {required String info,
      required TextEditingController controller,
      String? prefixText,
      required String initialText}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        children: [
          TextFormField(
              controller: controller..text = initialText,
              cursorColor: MainColors.greenColor,
              onChanged: (text) {
                controller.text = text;
              },
              decoration: InputDecoration(
                  prefixText: prefixText,
                  prefixStyle: TextStyle(color: Colors.black, fontSize: 15.sp),
                  labelText: info,
                  // labelStyle: TextStyle(color: MainColors.greenColor),
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
                  ))),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }
}
