import 'package:flutter/material.dart';
import '/utils/app_text_theme.dart';
import '/theme/palette.dart';

class IconContent extends StatelessWidget {
  IconContent({
    this.icon,
    this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
          color: Palette.p1,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          label,
          style: MobileTextTheme().kLabelTextStyle,
        )
      ],
    );
  }
}
