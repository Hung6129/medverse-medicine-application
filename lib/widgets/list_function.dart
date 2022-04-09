import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/widgets/app_text.dart';
import 'package:medverse_mobile_app/widgets/dimension.dart';

import '../theme/palette.dart';

class ListIconFunction extends StatefulWidget {
  ListIconFunction({Key key}) : super(key: key);

  @override
  State<ListIconFunction> createState() => _ListIconFunctionState();
}

class _ListIconFunctionState extends State<ListIconFunction> {
  var imagesIcon = {
    Icon(
      CupertinoIcons.doc_text_search,
      size: Dimensions.icon24,
    ): "Tìm kiếm",
    Icon(
      CupertinoIcons.command,
      size: Dimensions.icon24,
      color: Palette.textNo,
    ): "So sánh",
    Icon(CupertinoIcons.drop_triangle_fill,
        size: Dimensions.icon24, color: Palette.textNo): "Tương kị",
    Icon(CupertinoIcons.profile_circled,
        size: Dimensions.icon24, color: Palette.textNo): "Hồ sơ",
  };
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: Dimensions.height30),
      child: Container(
        width: double.maxFinite,
        height: 120,
        margin: EdgeInsets.only(
          left: 20,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imagesIcon.keys.length,
          itemBuilder: (_, index) {
            return Center(
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(Dimensions.radius20),
                  boxShadow: [
                    BoxShadow(
                      color: Palette.grey300.withOpacity(0.5),
                      blurRadius: 5.0,
                      offset: Offset(0, 5),
                    ),
                    BoxShadow(
                      color: Palette.grey300.withOpacity(0.5),
                      offset: Offset(5, 5),
                    ),
                    BoxShadow(
                      color: Palette.grey300.withOpacity(0.5),
                      offset: Offset(-5, 5),
                    ),
                    // BoxShadow(
                    //   color: Colors.white,
                    //   offset: Offset(5, 0),
                    // ),
                  ],
                ),
                margin: EdgeInsets.only(right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: imagesIcon.keys.elementAt(index),
                    ),
                    Container(
                      child: AppText(
                        text: imagesIcon.values.elementAt(index),
                        fontWeight: FontWeight.w400,
                        size: Dimensions.font14,
                        color: Palette.textNo,
                      ),
                    )
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
