import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/pages/drawer-items/health_profile/widgets/main_screen_health_profile.dart';
import 'package:medverse_mobile_app/widgets/app_text.dart';
import 'package:medverse_mobile_app/widgets/dimension.dart';

import '../pages/drawer-items/check_interaction/pages/interaction_checker.dart';
import '../pages/drawer-items/compare_drugs/pages/compare_drug_screen.dart';
import '../pages/drawer-items/pill_identifier/pages/pill_identifier_screen.dart';
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
          left: Dimensions.height10,
        ),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: imagesIcon.keys.length,
          itemBuilder: (_, index) {
            return Center(
              child: GestureDetector(
                onTap: () {
                  switch (index) {
                    case 0:
                      Navigator.pushNamed(context, "/pill-identifier");
                      break;
                    case 1:
                      Navigator.pushNamed(context, "/compare-drug");
                      break;
                    case 2:
                      Navigator.pushNamed(context, "/interaction-checker");
                      break;
                    case 3:
                      Navigator.pushNamed(context, "/health-profile");
                      break;
                  }
                },
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
                    ],
                  ),
                  margin: EdgeInsets.only(right: 20, left: 10),
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
              ),
            );
          },
        ),
      ),
    );
  }
}
