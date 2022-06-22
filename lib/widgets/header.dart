import 'package:flutter/material.dart';
import '/utils/app_text_theme.dart';
import '/theme/palette.dart';

AppBar appBarMain({
  String titleText,
}) {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: Palette.mainBlueThemesec),
    backgroundColor: Palette.whiteText,
    title: Text(
      titleText,
      style: MobileTextTheme().homeAppBarStyle,
    ),
    centerTitle: true,
  );
}
