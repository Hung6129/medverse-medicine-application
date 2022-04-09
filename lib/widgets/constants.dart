import 'package:flutter/material.dart';
import '/theme/palette.dart';

final kHintTextStyle = TextStyle(
  color: Colors.white54,
  fontFamily: 'OpenSans',
);

final kLabelStyle = TextStyle(
  color: Colors.white,
  fontWeight: FontWeight.bold,
  fontFamily: 'OpenSans',
);

final black_kLabelStyle = TextStyle(
  fontSize: 30,
  fontWeight: FontWeight.w900,
  fontFamily: 'OpenSans',
);

final kBoxDecorationStyle = BoxDecoration(
  color: Color(0xFF6CA8F1),
  borderRadius: BorderRadius.circular(10.0),
  boxShadow: [
    BoxShadow(
      color: Colors.black12,
      blurRadius: 6.0,
      offset: Offset(0, 2),
    ),
  ],
);

// ---------- Use for BMI Calculator Page ----------
const kBottomContainerHeight = 50.0;
const kActiveCardColour = Palette.activeButton;
const kInactiveCardColour = Palette.mainBlueTheme;
const kBottomContainerColour = Palette.mainBlueTheme;

const kLabelTextStyle = TextStyle(
  fontSize: 18.0,
  color: Palette.p1,
);

const kNumberTextStyle = TextStyle(
  fontSize: 50.0,
  fontWeight: FontWeight.w900,
  color: Palette.p1
);

const kLargeButtonTextStyle = TextStyle(
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
  color: Palette.p1
);

const kTitleTextStyle = TextStyle(
  fontSize: 35.0,
  fontWeight: FontWeight.bold,
);

const kResultTextStyle = TextStyle(
  color: Color(0xFF24D876),
  fontSize: 25.0,
  fontWeight: FontWeight.bold,
);

const kBMITextStyle = TextStyle(
  fontSize: 100.0,
  fontWeight: FontWeight.bold,
  color: Palette.p1
);

const kBodyTextStyle = TextStyle(
  fontSize: 22.0,
  color: Palette.p1
);
