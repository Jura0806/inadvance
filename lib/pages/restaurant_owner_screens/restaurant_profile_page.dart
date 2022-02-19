import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:inadvance/utils/responsive_size.dart';

class RestProfilePage extends StatefulWidget {
  const RestProfilePage({Key? key}) : super(key: key);

  @override
  _RestProfilePageState createState() => _RestProfilePageState();
}

class _RestProfilePageState extends State<RestProfilePage> {
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              "assets/images/vector_ok.svg",
              height: 22.5,
            ),
          ),
          // SizedBox(
          //   width: 10,
          // ),
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 200,
                margin: EdgeInsets.only(bottom: 50),
                width: double.infinity,
                decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(8),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://upload.wikimedia.org/wikipedia/commons/thumb/6/62/Barbieri_-_ViaSophia25668.jpg/1200px-Barbieri_-_ViaSophia25668.jpg"))),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    gradient: LinearGradient(colors: [
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.4),
                      Colors.black.withOpacity(.4),
                    ],
                    ),
                  ),
                ),
              ),
              Positioned(
                left: SizeConfig.screenWidth! / 2.5,
                top: 150,
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: MainColors.dimRedColor,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              "https://scontent.ftas2-2.fna.fbcdn.net/v/t1.6435-1/147758135_2883057468590967_3283438224948433812_n.jpg?stp=dst-jpg_p720x720&_nc_cat=105&ccb=1-5&_nc_sid=1eb0c7&_nc_ohc=GzSj92nGIEAAX-EF1pd&_nc_ht=scontent.ftas2-2.fna&oh=00_AT_v--ZR3tfNgI1omykU60HmU2ULGmGL9NRF7z9fFT6jXQ&oe=6232FF9A")),
                      border:
                          Border.all(width: 3, color: MainColors.greenColor)),
                ),
              ),
              Positioned(
                top: 150,
                left: SizeConfig.screenWidth! / 1.15,
                child: Container(
                  height: 45,
                  width: 45,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(colors: [
                      Colors.white.withOpacity(.3),
                      Colors.white.withOpacity(.3),
                      Colors.white.withOpacity(.3)
                    ]),
                  ),
                  child: IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 150,
                left: SizeConfig.screenWidth! / 1.8,
                child: Container(
                  height: 40,
                  width: 40,
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
                        size: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          textfield(labelText: "Restoran nomi"),
          textfield(labelText: "Admin raqami"),
          textfield(labelText: "Shahar va lokatsiya", icon: Icons.location_on),
          SizedBox(
            height: 15,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              timeInput(isOpen: "Ochiladi", time: "6:00"),
              timeInput(isOpen: "Yopiladi", time: "21:00"),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          textfield(labelText: "Restoran hisob raqami")
        ],
      ),
    );
  }

  Widget textfield({required String labelText, IconData? icon}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
          decoration: InputDecoration(
              labelText: labelText,
              suffixIcon: Icon(
                icon,
                color: MainColors.greenColor,
              ),
              // labelStyle: TextStyle(color: MainColors.greenColor),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: MainColors.greenColor,
                    width: 1,
                    style: BorderStyle.solid),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(
                    color: MainColors.textFieldColor,
                    width: 1,
                    style: BorderStyle.solid),
              ))),
    );
  }
  Widget timeInput({required String isOpen, required String time}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          isOpen,
          style: TextStyle(fontSize: 17),
        ),
        Container(
          height: 40,
          margin: EdgeInsets.only(top: 5),
          width: SizeConfig.screenWidth! / 2.3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: MainColors.greenColor.withOpacity(.3),
          ),
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: time,
                contentPadding: EdgeInsets.only(left: 20, top: 5),
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
