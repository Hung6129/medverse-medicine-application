import 'package:flutter/material.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import '/theme/palette.dart';
import '/pages/drawer-items/introduction_side/widgets/introduction_pages.dart';

class AnimatedIntroductionSlider extends StatelessWidget {
  const AnimatedIntroductionSlider({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'introduction Slider', //title of app
      theme: ThemeData(
        primarySwatch: Palette.blue,
      ), //ThemeData
      home: Builder(
        builder: (context) => IntroViewsFlutter(
          pages,
          onTapDoneButton: () {},
          pageButtonTextStyles: const TextStyle(
            color: Palette.whiteText,
            fontSize: 10.0,
          ),
        ), //IntroViewsFlutter
      ), //Builder
    ); //Material App
  }
}
