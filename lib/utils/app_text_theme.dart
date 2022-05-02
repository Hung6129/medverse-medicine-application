import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medverse_mobile_app/pages/drawer-items/health_profile/widgets/main_screen_health_profile.dart';
import 'package:medverse_mobile_app/theme/palette.dart';

abstract class AppTextTheme {
  /// Using for all app bar in UI
  TextStyle get appBarStyle;

  TextStyle get tabBarStyle;

  TextStyle get navigationDrawerStyle;

  TextStyle get drawerHeader;

  TextStyle get drawerHeaderTextStyle;

  TextStyle get h1;

  TextStyle get h2;

  TextStyle get h3;

  TextStyle get h4;

  TextStyle get h5;

  TextStyle get h6;

  TextStyle get subtitle1;

  TextStyle get subtitle2;

  TextStyle get paragraph20;

  TextStyle get paragraph18;

  TextStyle get body;

  TextStyle get subhead;

  TextStyle get subheadAllCaps;

  TextStyle get button;

  TextStyle get footnote;

  TextStyle get footnoteAllCaps;

  TextStyle get introContentFont;

  TextStyle get introTitleFont;

  TextStyle get blackKLabelStyle;

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

  static final latoTextStyle = GoogleFonts.lato();
}

class MobileTextTheme implements AppTextTheme {
  @override
  final appBarStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.normal,
  );

  @override
  final tabBarStyle = GoogleFonts.oswald();

  @override
  final navigationDrawerStyle = GoogleFonts.oswald(
    color: Palette.whiteText,
  );

  @override
  final drawerHeader =
      GoogleFonts.oswald(fontSize: 20, color: Palette.whiteText);

  @override
  final drawerHeaderTextStyle = GoogleFonts.oswald(
    color: Palette.p1,
    fontWeight: FontWeight.w500,
  );

  @override
  final h1 = GoogleFonts.lato(fontSize: 54, fontWeight: FontWeight.w900);
  @override
  final h2 = GoogleFonts.lato(fontSize: 40, fontWeight: FontWeight.w900);
  @override
  final h3 = GoogleFonts.lato(fontSize: 36, fontWeight: FontWeight.w900);
  @override
  final h4 = GoogleFonts.lato(fontSize: 27, fontWeight: FontWeight.bold);
  @override
  final h5 = GoogleFonts.lato(fontSize: 24, fontWeight: FontWeight.bold);
  @override
  final h6 = GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.w900);

  @override
  final subtitle1 = GoogleFonts.lato(fontSize: 16, fontWeight: FontWeight.bold);
  @override
  final subtitle2 = GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  final paragraph20 =
      GoogleFonts.lato(fontSize: 20, fontWeight: FontWeight.normal);
  @override
  final paragraph18 =
      GoogleFonts.lato(fontSize: 18, fontWeight: FontWeight.normal);

  @override
  final body = GoogleFonts.lato(
      fontSize: 16, fontWeight: FontWeight.normal, height: 1.5);

  @override
  final subhead = GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.normal);
  @override
  final subheadAllCaps = GoogleFonts.lato(
      fontSize: 14, fontWeight: FontWeight.normal, letterSpacing: 2.5);

  @override
  final button = GoogleFonts.lato(fontSize: 14, fontWeight: FontWeight.bold);

  @override
  final footnote = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.normal,
  );

  @override
  final footnoteAllCaps = GoogleFonts.lato(
    fontSize: 12,
    fontWeight: FontWeight.normal,
    letterSpacing: 2.5,
  );

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

  @override
  final blackKLabelStyle = GoogleFonts.oswald(
    fontWeight: FontWeight.w700,
    fontSize: 15,
    color: Palette.textNo,
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
}
