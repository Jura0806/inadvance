import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:inadvance/pages/register_pages/who_are_you_register_page.dart';
import 'package:inadvance/utils/colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class IntroPage extends StatefulWidget {
  static final String id = 'intro_page';

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  late PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    _pageController = PageController(
      initialPage: 0,
    );
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          PageView(
            onPageChanged: (int page) {
              setState(() {
                _currentIndex = page;
              });
            },
            controller: _pageController,
            children: [
              makePage(
                title: "Learn from expert",
                content: "Select from top instructors around the world",
                image: "assets/images/sign_in_vector.svg",
              ),
              makePage(
                title: "Go at your own pace",
                content:
                    "Enjoy lifetime  access to courses on PDP's website  and app",
                image: "assets/images/sign_up_vector.svg",
              ),
              makePage(
                title: "Find video courses",
                content:
                    "Build your library for your carer and personal  growth",
                image: "assets/images/sign_in_vector.svg",
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(bottom: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: _skipButton(),
          )
        ],
      ),
    );
  }

  Widget makePage({title, content, image}) {
    return Container(
      padding: const EdgeInsets.only(left: 50, right: 50, bottom: 50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
                color: MainColors.greenColor,
                fontSize: 25.sp,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            content,
            style: TextStyle(color: Colors.grey, fontSize: 17.sp),
            textAlign: TextAlign.center,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: SvgPicture.asset(image),
          ),
        ],
      ),
    );
  }

  Widget _indicator(bool isActive) {
    return AnimatedContainer(
      margin: EdgeInsets.only(right: 5),
      duration: Duration(milliseconds: 300),
      height: 6,
      width: isActive ? 30 : 6,
      decoration: BoxDecoration(
        color: MainColors.greenColor,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }

  List<Widget> _buildIndicator() {
    List<Widget> indicators = [];

    for (int i = 0; i < 3; i++) {
      if (_currentIndex == i) {
        indicators.add(_indicator(true));
      } else {
        indicators.add(_indicator(false));
      }
    }
    return indicators;
  }

  Widget _button() {
    return Container(
      padding: const EdgeInsets.only(bottom: 70, left: 320),
      child: GestureDetector(
        onTap: () {
          Navigator.pushReplacementNamed(context, FirstRegister.id);
        },
        child: Text(
          'Skip',
          style: TextStyle(
              color: MainColors.greenColor,
              fontSize: 17.sp,
              fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  List<Widget> _skipButton() {
    List<Widget> listButton = [];

    if (_currentIndex == 2) {
      listButton.add(_button());
    }
    return listButton;
  }
}
