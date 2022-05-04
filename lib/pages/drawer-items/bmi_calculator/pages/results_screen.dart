import 'package:flutter/material.dart';
import '/utils/app_text_theme.dart';
import '/theme/palette.dart';
import '/pages/drawer-items/bmi_calculator/widgets/reusable_card.dart';
import '/pages/drawer-items/bmi_calculator/widgets/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;

  ResultsPage({
    this.interpretation,
    this.bmiResult,
    this.resultText,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Palette.mainBlueTheme,
          title: Text(
            'Tính chỉ số BMI',
            style: MobileTextTheme().appBarStyle,
          ),
          centerTitle: true,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
              child: Container(
                padding: EdgeInsets.only(top: 15.0, left: 15.0, right: 15.0),
                alignment: Alignment.center,
                child: Text(
                  'Kết quả của bạn',
                  style: MobileTextTheme().kTitleTextStyle,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: MobileTextTheme().kInactiveCardColour,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: MobileTextTheme().kResultTextStyle,
                    ),
                    Text(
                      bmiResult,
                      style: MobileTextTheme().kBMITextStyle,
                    ),
                    Text(
                      interpretation,
                      textAlign: TextAlign.center,
                      style: MobileTextTheme().kBodyTextStyle,
                    ),
                  ],
                ),
              ),
            ),
            BottomButton(
              buttonTitle: 'Tính lại',
              onTap: () {
                Navigator.pop(context);
              },
            )
          ],
        ),
      ),
    );
  }
}
