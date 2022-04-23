import 'dart:async';

import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/theme/palette.dart';

class WellcomeScreen extends StatefulWidget {
  const WellcomeScreen({Key key}) : super(key: key);

  @override
  _WellcomeScreenState createState() => _WellcomeScreenState();
}

class _WellcomeScreenState extends State<WellcomeScreen>
    with TickerProviderStateMixin {
  String images = "assets/images/splash/Medverse.png";
  Animation<double> animation;
  AnimationController controller;
  @override
  void initState() {
    super.initState();
    controller =
        new AnimationController(vsync: this, duration: Duration(seconds: 2))
          ..forward();
    animation = new CurvedAnimation(parent: controller, curve: Curves.linear);
    Timer(
      Duration(seconds: 3),
      () {
        Navigator.pushNamed(context, "/home");
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.p1,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ScaleTransition(
            scale: animation,
            child: Center(
              child: Image.asset(
                images,
                width: 300,
              ),
            ),
          ),
          // Center(
          //   child: Image.asset(
          //     "assets/image/logo part 2.png",
          //     width: Dimensions.splashImg,
          //   ),
          // )
        ],
      ),
    );
  }
}
