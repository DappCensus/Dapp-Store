import 'package:flutter/material.dart';
import 'package:hstore/utils/constants.dart';

import 'package:intro_slider/intro_slider.dart';
import 'package:intro_slider/slide_object.dart';
import 'package:intro_slider/dot_animation_enum.dart';

import '../../home.dart';

class IntroSliderPage extends StatefulWidget {
  const IntroSliderPage({Key? key}) : super(key: key);

  @override
  State<IntroSliderPage> createState() => _IntroSliderPageState();
}

class _IntroSliderPageState extends State<IntroSliderPage> {
  List<Slide> slides = [];

  @override
  void initState() {
    super.initState();
    slides.add(
      new Slide(
        title: "Welcome to hStore!",
        description:
            "A new way to Access, Design and Build DApps, CApps and WApps",
        pathImage: "assets/images/onboardImg0.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Welcome to hStore!",
        description:
            "Interoperability between Decentralized & Centralized Modules",
        pathImage: "assets/images/onboardImg1.png",
      ),
    );
    slides.add(
      new Slide(
        title: "Welcome to hStore!",
        description: "The most trusted way to build the future",
        pathImage: "assets/images/onboardImg2.png",
      ),
    );
  }

  ButtonStyle myButtonStyle() {
    return ButtonStyle(
      shape: MaterialStateProperty.all<OutlinedBorder>(StadiumBorder()),
      backgroundColor: MaterialStateProperty.all<Color>(PRIMARAY),
      overlayColor: MaterialStateProperty.all<Color>(Color(0x33ffcc5c)),
    );
  }

  List<Widget> renderListCustomTabs() {
    List<Widget> tabs = [];
    for (int i = 0; i < slides.length; i++) {
      Slide currentSlide = slides[i];
      tabs.add(
        Container(
          width: double.infinity,
          height: double.infinity,
          child: Container(
            margin: EdgeInsets.only(bottom: 160, top: 60),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: PRIMARAY,
                  ),
                  child: Image.asset(
                    currentSlide.pathImage!,
                    matchTextDirection: true,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20),
                  child: Text(
                    currentSlide.title!,
                    style: TextStyle(
                        color: PRIMARAY,
                        fontFamily: 'Open',
                        fontWeight: FontWeight.bold,
                        fontSize: 25),
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 30,
                  ),
                  child: Text(
                    currentSlide.description!,
                    style: TextStyle(
                        color: PRIMARAY,
                        fontSize: 14,
                        height: 1.5,
                        fontFamily: 'Open'),
                    maxLines: 3,
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                  ),
                  margin: EdgeInsets.only(
                    top: 15,
                    left: 20,
                    right: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    }
    return tabs;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return IntroSlider(
      backgroundColorAllSlides: WHITE,
      renderSkipBtn: Text("Skip",
          style: TextStyle(
            color: PRIMARAY,
            fontFamily: 'Open',
          )),
      renderNextBtn: Text(
        "Next",
        style: TextStyle(
          color: PRIMARAY,
          fontFamily: 'Open',
        ),
      ),
      renderDoneBtn: Text(
        "Done",
        style: TextStyle(
          color: WHITE,
          fontFamily: 'Open',
        ),
      ),
      doneButtonStyle: myButtonStyle(),
      colorActiveDot: PRIMARAY,
      colorDot: PRIMARAY,
      sizeDot: 6.0,
      typeDotAnimation: dotSliderAnimation.SIZE_TRANSITION,
      listCustomTabs: this.renderListCustomTabs(),
      scrollPhysics: BouncingScrollPhysics(),
      hideStatusBar: false,
      onDonePress: () => Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => Home(),
        ),
      ),
    );
  }
}
