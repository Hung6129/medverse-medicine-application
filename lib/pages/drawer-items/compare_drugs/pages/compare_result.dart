import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/widgets/dimension.dart';
import '../../../../theme/palette.dart';
import '../../../../utils/app_text_theme.dart';

class CompareResult extends StatelessWidget {
  const CompareResult({Key key}) : super(key: key);

  Widget _buildBox(
    String title,
    double height,
  ) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.blue,
        border: Border(top: BorderSide(color: Colors.black)),
      ),
      height: height,
      child: Text(
        title,
        style: TextStyle(fontSize: 20, color: Colors.white),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double maxHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Kết quả',
          style: MobileTextTheme().appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(),
            SizedBox(
              height: Dimensions.height10,
            ),
            Table(
              columnWidths: {
                0: FlexColumnWidth(),
                1: FlexColumnWidth(0.01),
                2: FlexColumnWidth(),
              },
              children: [
                TableRow(children: [
                  _buildBox("Penicillin", 50),
                  SizedBox(),
                  _buildBox("Morphin", 50)
                ]),
                TableRow(
                  children: [
                    _buildBox("Penicillin is flexible", maxHeight),
                    SizedBox(),
                    _buildBox("Morphin isn't", maxHeight)
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
