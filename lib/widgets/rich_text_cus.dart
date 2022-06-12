import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/theme/palette.dart';
import '/widgets/dimension.dart';

class RichTextCus extends StatelessWidget {
  final String text1;
  final String text2;
  RichTextCus({
    Key key,
    this.text1,
    this.text2,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: text1,
        style: GoogleFonts.roboto(
            fontWeight: FontWeight.bold,
            fontSize: Dimensions.font16,
            letterSpacing: 1,
            color: Palette.mainBlueTheme),
        children: [
          TextSpan(
            text: " " + text2,
            style: GoogleFonts.roboto(
                fontSize: Dimensions.font14,
                fontWeight: FontWeight.normal,
                color: Palette.textNo,
                letterSpacing: 1),
          )
        ],
      ),
    );
  }
}
