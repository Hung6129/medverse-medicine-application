import 'package:flutter/material.dart';

// ignore: must_be_immutable
class AppTextTitle extends StatelessWidget {
  String text;
  Color color;
  FontWeight fontWeight;
  double size;
  final TextOverflow overflow;

  AppTextTitle({
    Key key,
    this.text,
    this.color,
    this.size,
    this.fontWeight,
    this.overflow = TextOverflow.ellipsis,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
    );
  }
}
