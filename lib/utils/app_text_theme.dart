import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medverse_mobile_app/theme/palette.dart';

abstract class AppTextTheme {
  /// Using for all app bar in UI
  TextStyle get appBarStyle;

  /// Using for all app bar action button
  TextStyle get appBarActionButton;

  /// Using for all tab bar in UI
  TextStyle get tabBarStyle;

  TextStyle get navigationDrawerStyle;

  TextStyle get drawerHeader;

  TextStyle get drawerHeaderTextStyle;

  /// Using for all current user name title
  TextStyle get currentUsernameTitle;

  /// Using for all current email title
  TextStyle get currentEmailTitle;

  /// Using for all choose picture box
  TextStyle get choosePictureRequired;

  TextStyle get inputDescriptionAndLocationTitle;

  TextStyle get inputDescriptionAndLocation;

  /// Using for show image choices UI
  TextStyle get chooseImageTitle;

  TextStyle get selectCamera;

  TextStyle get selectGallery;

  TextStyle get paragraph18;

  TextStyle get subheadAllCaps;

  TextStyle get introContentFont;

  TextStyle get introTitleFont;

  TextStyle get blackKLabelStyle;

  /// Using for BMI calculator UI
  TextStyle get kLabelTextStyle;

  TextStyle get kNumberTextStyle;

  TextStyle get kLargeButtonTextStyle;

  TextStyle get kTitleTextStyle;

  TextStyle get kResultTextStyle;

  TextStyle get kBMITextStyle;

  TextStyle get kBodyTextStyle;

  /// Using for health profile UI
  TextStyle get healthProfileDataTextFont;

  TextStyle get healthProfileUnitTextStyle;

  TextStyle get healthProfileNoDataTextStyle;

  /// Using for account information UI
  TextStyle get accountInformationDataTextStyle;

  /// Using for post card in Social UI
  TextStyle get postDescription;

  TextStyle get timePost;

  TextStyle get likesCount;

  TextStyle get commentCount;

  TextStyle get postUserNameTitle;

  TextStyle get postLocationTitle;

  /// Using for post details UI
  TextStyle get postDetailsUsernameTitle;

  TextStyle get postDetailsTimePostTitle;

  /// Using for fab container
  TextStyle get fabContainerTitle;

  TextStyle get fabContainerContent;

  static final latoTextStyle = GoogleFonts.lato();
}

class MobileTextTheme implements AppTextTheme {
  /// Using for all app bar in UI
  @override
  final appBarStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.normal,
  );

  /// Using for all app bar action button
  @override
  final appBarActionButton = GoogleFonts.oswald(
    fontWeight: FontWeight.bold,
    fontSize: 10.0,
    color: Palette.whiteText,
  );

  /// Using for all tab bar in UI
  @override
  final tabBarStyle = GoogleFonts.oswald();

  /// Using for all choose picture box
  @override
  final choosePictureRequired = GoogleFonts.oswald(
    color: Palette.mainBlueTheme,
  );

  @override
  final navigationDrawerStyle = GoogleFonts.oswald(
    color: Palette.whiteText,
  );

  @override
  final drawerHeader = GoogleFonts.oswald(
    fontSize: 20,
    color: Palette.whiteText,
  );

  @override
  final drawerHeaderTextStyle = GoogleFonts.oswald(
    color: Palette.p1,
    fontWeight: FontWeight.w500,
  );

  /// Using for all current user name title
  @override
  final currentUsernameTitle = GoogleFonts.oswald(
    fontWeight: FontWeight.bold,
  );

  /// Using for all current email title
  @override
  final currentEmailTitle = GoogleFonts.oswald();

  @override
  final inputDescriptionAndLocationTitle = GoogleFonts.oswald(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );

  @override
  final inputDescriptionAndLocation = GoogleFonts.oswald();

  /// Using for choose image choice UI
  @override
  final chooseImageTitle = GoogleFonts.oswald(
    fontWeight: FontWeight.bold,
  );

  @override
  final selectCamera = GoogleFonts.oswald();

  @override
  final selectGallery = GoogleFonts.oswald();

  /// Using for BMI calculator UI
  final kBottomContainerHeight = 50.0;

  final kActiveCardColour = Palette.activeButton;

  final kInactiveCardColour = Palette.mainBlueTheme;

  final kBottomContainerColour = Palette.mainBlueTheme;

  @override
  final blackKLabelStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Palette.textNo,
  );

  @override
  final kLabelTextStyle = GoogleFonts.oswald(
    fontSize: 18.0,
    color: Palette.p1,
  );

  @override
  final kNumberTextStyle = GoogleFonts.oswald(
    fontSize: 50.0,
    fontWeight: FontWeight.w900,
    color: Palette.p1,
  );

  @override
  final paragraph18 = GoogleFonts.lato(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  @override
  final subheadAllCaps = GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 2.5);

  @override
  final kLargeButtonTextStyle = GoogleFonts.oswald(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: Palette.p1,
  );

  @override
  final kTitleTextStyle = GoogleFonts.oswald(
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
  );

  @override
  final kResultTextStyle = GoogleFonts.oswald(
    color: Color(0xFF24D876),
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );

  @override
  final kBMITextStyle = GoogleFonts.oswald(
      fontSize: 100.0, fontWeight: FontWeight.bold, color: Palette.p1);

  @override
  final kBodyTextStyle = GoogleFonts.oswald(fontSize: 22.0, color: Palette.p1);

  @override
  final introContentFont = GoogleFonts.oswald(
    fontSize: 15,
    color: Palette.whiteText,
  );

  @override
  final introTitleFont = GoogleFonts.oswald(
    fontSize: 30,
    color: Palette.whiteText,
  );

  /// Using for health profile UI
  @override
  final healthProfileDataTextFont = GoogleFonts.oswald(
    fontWeight: FontWeight.bold,
    color: Palette.textNo,
    fontSize: 20,
  );

  @override
  final healthProfileUnitTextStyle = GoogleFonts.oswald(
    fontSize: 15,
    color: Palette.textNo,
  );

  @override
  final healthProfileNoDataTextStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.bold,
    color: Palette.textNo,
  );

  /// Using for account information UI
  @override
  final accountInformationDataTextStyle = GoogleFonts.oswald(
    color: Palette.textNo,
    fontSize: 15,
  );

  /// Using for post card in social UI
  @override
  final postDescription = GoogleFonts.oswald(
    color: Palette.textNo,
    fontSize: 15,
  );

  @override
  final timePost = GoogleFonts.oswald(
    fontSize: 10,
  );

  @override
  final likesCount = GoogleFonts.oswald(
    fontWeight: FontWeight.bold,
    fontSize: 10.0,
  );

  @override
  final commentCount = GoogleFonts.oswald(
    fontSize: 8.5,
    fontWeight: FontWeight.bold,
  );

  @override
  final postUserNameTitle = GoogleFonts.oswald(
    fontWeight: FontWeight.bold,
    color: Palette.greyBlack,
  );

  @override
  final postLocationTitle = GoogleFonts.oswald(
    fontSize: 10.0,
    color: Palette.greyBlack,
  );

  /// Using for post details UI
  @override
  final postDetailsUsernameTitle = GoogleFonts.oswald(
    fontWeight: FontWeight.w800,
  );

  @override
  final postDetailsTimePostTitle = GoogleFonts.oswald();

  /// Using for fab container UI
  final fabContainerTitle = GoogleFonts.oswald(
    fontWeight: FontWeight.bold,
    color: Palette.mainBlueTheme,
  );

  @override
  final fabContainerContent = GoogleFonts.oswald();
}
