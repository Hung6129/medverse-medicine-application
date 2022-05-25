import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// ignore: must_be_immutable
class AppText extends StatelessWidget {
  String text;
  Color color;
  FontWeight fontWeight;
  double size;

  AppText({
    Key key,
    this.text,
    this.color,
    this.fontWeight,
    this.size = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Text(
      text,
      style: GoogleFonts.roboto(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
