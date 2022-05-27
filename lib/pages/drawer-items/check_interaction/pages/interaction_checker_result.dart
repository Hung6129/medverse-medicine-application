import 'package:flutter/material.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';

import '../../../../theme/palette.dart';

class InteractionCheckerResult extends StatefulWidget {
  final String name1;
  final String name2;
  InteractionCheckerResult({
    Key key,
    this.name1,
    this.name2,
  }) : super(key: key);

  @override
  State<InteractionCheckerResult> createState() =>
      _InteractionCheckerResultState();
}

class _InteractionCheckerResultState extends State<InteractionCheckerResult> {
  /// Interaction descriptions
  String text =
      "Some people use this as an herbal remedy to help with digestion, and others use it to flavor foods. But glycyrrhizin, a chemical in licorice, can weaken the effect of some drugs, including cyclosporine, used to keep people who’ve had transplants from rejecting their new organs.";

  /// Products need to check
  Widget __get2ProductName(String data1, String data2) {
    return Container(
      padding: EdgeInsets.only(
          top: Dimensions.height10,
          left: Dimensions.height20,
          right: Dimensions.height20),
      child: AppText(
        text: "Tương kỵ của thuốc $data1 và $data2 ",
        size: Dimensions.font24,
        color: Palette.mainBlueTheme,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Kết quả',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          __get2ProductName(widget.name1, widget.name2),
          Divider(
            endIndent: Dimensions.height10,
            indent: Dimensions.height10,
            thickness: 3,
          ),
          Container(
            padding: EdgeInsets.all(Dimensions.height10),
            child: AppText(
              text: text,
              size: Dimensions.font24,
            ),
          )
        ],
      ),
    );
  }
}
