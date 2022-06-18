import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medverse_mobile_app/theme/palette.dart';

abstract class AppTextTheme {
  /// Using for app bar in only home UI
  TextStyle get homeAppBarStyle;

  /// Using for all app bar in UI
  TextStyle get appBarStyle;

  /// Using for all app bar action button
  TextStyle get appBarActionButton;

  /// Using for all tab bar in UI
  TextStyle get tabBarStyle;

  TextStyle get navigationDrawerStyle;

  TextStyle get drawerHeader;

  TextStyle get drawerHeaderTextStyle;

  /// Using for login UI
  TextStyle get welcomeBack;

  TextStyle get loginToContinue;

  TextStyle get registerText;

  TextStyle get registerIntroText;

  TextStyle get forgotPassword;

  TextStyle get loginButton;

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

  /// Using for profile
  TextStyle get profileUserName;
  TextStyle get profileLocation;
  TextStyle get profileMail;

  // Using for interaction result
  TextStyle get interactionResult;

  static final oswaldTextStyle = GoogleFonts.roboto(
    color: Palette.textNo,
  );
}

class MobileTextTheme implements AppTextTheme {
  /// Using for app bar in only home UI
  @override
  final homeAppBarStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w900,
    color: Palette.pastel1
  );

  /// Using for all app bar in UI
  @override
  final appBarStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.normal,
  );

  /// Using for all app bar action button
  @override
  final appBarActionButton = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 10.0,
    color: Palette.whiteText,
  );

  /// Using for all tab bar in UI
  @override
  final tabBarStyle = GoogleFonts.roboto();

  /// Using for all choose picture box
  @override
  final choosePictureRequired = GoogleFonts.roboto(
    color: Palette.mainBlueTheme,
  );

  @override
  final navigationDrawerStyle = GoogleFonts.roboto(
    color: Palette.whiteText,
  );

  @override
  final drawerHeader = GoogleFonts.roboto(
    fontSize: 20,
    color: Palette.whiteText,
  );

  @override
  final drawerHeaderTextStyle = GoogleFonts.roboto(
    color: Palette.p1,
    fontWeight: FontWeight.w500,
  );

  /// Using for login UI
  @override
  final welcomeBack = GoogleFonts.roboto(
    fontSize: 23.0,
    fontWeight: FontWeight.w900,
    color: Palette.textNo,
  );

  @override
  final loginToContinue = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.w300,
    color: Palette.textNo,
  );

  @override
  final registerText = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    color: Palette.mainBlueTheme,
  );

  @override
  final registerIntroText = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 18.0,
  );

  @override
  final forgotPassword = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    color: Palette.textNo,
  );

  @override
  final loginButton = GoogleFonts.roboto(
    fontSize: 12.0,
    fontWeight: FontWeight.w600,
    color: Palette.whiteText,
  );

  /// Using for all current user name title
  @override
  final currentUsernameTitle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
  );

  /// Using for all current email title
  @override
  final currentEmailTitle = GoogleFonts.roboto();

  @override
  final inputDescriptionAndLocationTitle = GoogleFonts.roboto(
    fontSize: 15.0,
    fontWeight: FontWeight.w600,
  );

  @override
  final inputDescriptionAndLocation = GoogleFonts.roboto();

  /// Using for choose image choice UI
  @override
  final chooseImageTitle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
  );

  @override
  final selectCamera = GoogleFonts.roboto();

  @override
  final selectGallery = GoogleFonts.roboto();

  /// Using for BMI calculator UI
  final kBottomContainerHeight = 50.0;

  final kActiveCardColour = Palette.activeButton;

  final kInactiveCardColour = Palette.mainBlueTheme;

  final kBottomContainerColour = Palette.mainBlueTheme;

  @override
  final blackKLabelStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Palette.textNo,
  );

  @override
  final kLabelTextStyle = GoogleFonts.roboto(
    fontSize: 18.0,
    color: Palette.p1,
  );

  @override
  final kNumberTextStyle = GoogleFonts.roboto(
    fontSize: 50.0,
    fontWeight: FontWeight.w900,
    color: Palette.p1,
  );

  @override
  final paragraph18 = GoogleFonts.roboto(
    fontSize: 18,
    fontWeight: FontWeight.normal,
  );

  @override
  final subheadAllCaps = GoogleFonts.roboto(
    fontSize: 14,
    fontWeight: FontWeight.normal,
    letterSpacing: 2.5,
  );

  @override
  final kLargeButtonTextStyle = GoogleFonts.roboto(
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
    color: Palette.p1,
  );

  @override
  final kTitleTextStyle = GoogleFonts.roboto(
    fontSize: 35.0,
    fontWeight: FontWeight.bold,
  );

  @override
  final kResultTextStyle = GoogleFonts.roboto(
    color: Color(0xFF24D876),
    fontSize: 25.0,
    fontWeight: FontWeight.bold,
  );

  @override
  final kBMITextStyle = GoogleFonts.roboto(
    fontSize: 100.0,
    fontWeight: FontWeight.bold,
    color: Palette.p1,
  );

  @override
  final kBodyTextStyle = GoogleFonts.roboto(
    fontSize: 22.0,
    color: Palette.p1,
  );

  @override
  final introContentFont = GoogleFonts.roboto(
    fontSize: 15,
    color: Palette.textNo,
  );

  @override
  final introTitleFont = GoogleFonts.roboto(
    fontSize: 20,
    color: Palette.textNo,
    fontWeight: FontWeight.bold,
  );

  /// Using for health profile UI
  @override
  final healthProfileDataTextFont = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    color: Palette.textNo,
    fontSize: 20,
  );

  @override
  final healthProfileUnitTextStyle = GoogleFonts.roboto(
    fontSize: 15,
    color: Palette.textNo,
  );

  @override
  final healthProfileNoDataTextStyle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    color: Palette.textNo,
  );

  /// Using for account information UI
  @override
  final accountInformationDataTextStyle = GoogleFonts.roboto(
    color: Palette.textNo,
    fontSize: 15,
  );

  /// Using for post card in social UI
  @override
  final postDescription = GoogleFonts.roboto(
    color: Palette.textNo,
    fontSize: 15,
  );

  @override
  final timePost = GoogleFonts.roboto(
    fontSize: 10,
  );

  @override
  final likesCount = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    fontSize: 10.0,
  );

  @override
  final commentCount = GoogleFonts.roboto(
    fontSize: 8.5,
    fontWeight: FontWeight.bold,
  );

  @override
  final postUserNameTitle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    color: Palette.greyBlack,
  );

  @override
  final postLocationTitle = GoogleFonts.roboto(
    fontSize: 10.0,
    color: Palette.greyBlack,
  );

  /// Using for post details UI
  @override
  final postDetailsUsernameTitle = GoogleFonts.roboto(
    fontWeight: FontWeight.w800,
  );

  @override
  final postDetailsTimePostTitle = GoogleFonts.roboto();

  /// Using for fab container UI
  final fabContainerTitle = GoogleFonts.roboto(
    fontWeight: FontWeight.bold,
    color: Palette.mainBlueTheme,
  );

  @override
  final fabContainerContent = GoogleFonts.roboto();

  @override
  final profileUserName = GoogleFonts.roboto(
    fontSize: 15,
    fontWeight: FontWeight.w900,
  );

  @override
  final profileLocation = GoogleFonts.roboto(
    fontSize: 12,
    fontWeight: FontWeight.w600,
  );

  @override
  final profileMail = GoogleFonts.roboto(
    fontSize: 10,
  );

  @override
  final interactionResult = GoogleFonts.roboto(
    color: Palette.red,
    fontSize: 15,
  );
}
