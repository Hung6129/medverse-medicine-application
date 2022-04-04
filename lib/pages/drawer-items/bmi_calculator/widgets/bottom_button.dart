import 'package:flutter/material.dart';
import '/widgets/constants.dart';

class BottomButton extends StatelessWidget {
  final Function() onTap;
  final String buttonTitle;

  BottomButton({
    this.onTap,
    this.buttonTitle,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: kBottomContainerColour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Text(
            buttonTitle,
            style: kLargeButtonTextStyle,
          ),
        ),
        margin: EdgeInsets.all(15),
        width: double.infinity,
        height: kBottomContainerHeight,
      ),
    );
  }
}
