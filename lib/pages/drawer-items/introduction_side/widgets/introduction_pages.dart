import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intro_views_flutter/intro_views_flutter.dart';
import 'package:medverse_mobile_app/theme/palette.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';
import '/pages/drawer-items/introduction_side/widgets/introduction_string.dart';

final pages = [
  PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      //  bubble: CachedNetworkImage(imageUrl: firstImageIcon),
      title: Text(
        firstIntrTitleText,
        style: MobileTextTheme().introTitleFont,
      ),
      iconImageAssetPath: 'assets/images/one.png',
      body: Text(
        firstIntrContentText,
        style: MobileTextTheme().introContentFont,
        textAlign: TextAlign.center,
      ),
      mainImage: Image.asset(
        'assets/images/one.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),
  PageViewModel(
    pageColor: const Color(0xFF8BC34A),
    // bubble: CachedNetworkImage(imageUrl: secondImageIcon),
    iconImageAssetPath: 'assets/images/two.png',

    body: const Text(secondIntrContentText),
    title: const Text(secondIntrTitleText),
    mainImage: Image.asset(
      'assets/images/two.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
  PageViewModel(
    pageColor: const Color(0xFF607D8B),
    //bubble: CachedNetworkImage(imageUrl: thirdImageIcon),
    iconImageAssetPath: 'assets/images/three.png',
    body: const Text(thirdIntrContentText),
    title: const Text(thirdIntrTitleTextt),
    mainImage: Image.asset(
      'assets/images/three.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
  PageViewModel(
      pageColor: const Color(0xFF03A9F4),
      //  bubble: CachedNetworkImage(imageUrl: firstImageIcon),
      iconImageAssetPath: 'assets/images/one.png',
      body: const Text(firstIntrContentText),
      title: const Text(
        firstIntrTitleText,
      ),
      textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
      mainImage: Image.asset(
        'assets/images/one.png',
        height: 285.0,
        width: 285.0,
        alignment: Alignment.center,
      )),
  PageViewModel(
    pageColor: const Color(0xFF8BC34A),
    // bubble: CachedNetworkImage(imageUrl: secondImageIcon),
    iconImageAssetPath: 'assets/images/two.png',

    body: const Text(secondIntrContentText),
    title: const Text(secondIntrTitleText),
    mainImage: Image.asset(
      'assets/images/two.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
  PageViewModel(
    pageColor: Palette.red,
    //bubble: CachedNetworkImage(imageUrl: thirdImageIcon),
    iconImageAssetPath: 'assets/images/three.png',
    body: const Text(warningIntrContentText),
    title: const Text(warningIntrTitleText),
    mainImage: Image.asset(
      'assets/images/three.png',
      height: 285.0,
      width: 285.0,
      alignment: Alignment.center,
    ),
    textStyle: const TextStyle(fontFamily: 'MyFont', color: Colors.white),
  ),
];
