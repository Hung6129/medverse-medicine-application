import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter/material.dart';
import '/theme/palette.dart';
import 'app_text.dart';

Center circularProgress(context) {
  return Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SpinKitFadingCircle(
          size: 40.0,
          color: Palette.mainBlueTheme,
        ),
        SizedBox(height: 10),
        AppText(
          text: "Đang tải dữ liệu",
          color: Palette.mainBlueTheme,
        ),
      ],
    )
  );
}

Container linearProgress(context) {
  return Container(
    child: LinearProgressIndicator(
      valueColor: AlwaysStoppedAnimation(Palette.mainBlueTheme),
    ),
  );
}
