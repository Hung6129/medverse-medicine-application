import 'package:flutter/material.dart';

import '../../../../theme/palette.dart';

class InteractionCheckerResult extends StatefulWidget {
  InteractionCheckerResult({Key key}) : super(key: key);

  @override
  State<InteractionCheckerResult> createState() =>
      _InteractionCheckerResultState();
}

class _InteractionCheckerResultState extends State<InteractionCheckerResult> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Kiểm tra tương kỵ',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
    );
  }
}
