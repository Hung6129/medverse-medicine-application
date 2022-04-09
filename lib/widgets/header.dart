import 'package:flutter/material.dart';

import '../theme/palette.dart';

AppBar appBarMain({
  String titleText,
}) {
  return AppBar(
    elevation: 0,
    iconTheme: IconThemeData(color: Palette.mainBlueTheme),
    backgroundColor: Colors.white,
    title: Text(
      titleText,
      style:
          TextStyle(fontWeight: FontWeight.w900, color: Palette.mainBlueTheme),
    ),
    centerTitle: true,
  );
}
