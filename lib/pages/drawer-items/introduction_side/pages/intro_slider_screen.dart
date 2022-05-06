import 'package:flutter/material.dart';

import '/utils/app_text_theme.dart';
import '/theme/palette.dart';

class HelpScreen extends StatefulWidget {
  const HelpScreen({Key key}) : super(key: key);

  @override
  State<HelpScreen> createState() => _HelpScreenState();
}

class _HelpScreenState extends State<HelpScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Hướng dẫn sử dụng',
          style: MobileTextTheme().appBarStyle,
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 10),
            /// Introduction title
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đây là hướng dẫn sử dụng cho các phần khác nhau của ứng dụng',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
            SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Đây là hướng dẫn sử dụng cho các phần khác nhau của ứng dụng',
                  style: MobileTextTheme().introContentFont,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
