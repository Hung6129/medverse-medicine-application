import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/theme/palette.dart';
import 'package:medverse_mobile_app/utils/app_text_theme.dart';

class TabBarWidget extends StatelessWidget {
  final String title;
  final List<Tab> tabs;
  final List<Widget> children;

  const TabBarWidget({
    Key key,
    this.title,
    this.tabs,
    this.children,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) => DefaultTabController(
        length: tabs.length,
        child: Scaffold(
          appBar: AppBar(
            title: Text(
              title,
              style: MobileTextTheme().appBarStyle,
            ),
            centerTitle: true,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Palette.mainBlueTheme,
                    Palette.mainBlueTheme,
                  ],
                  begin: Alignment.bottomRight,
                  end: Alignment.topLeft,
                ),
              ),
            ),
            bottom: TabBar(
              isScrollable: true,
              indicatorColor: Palette.whiteText,
              indicatorWeight: 5,
              tabs: tabs,
              labelStyle: MobileTextTheme().tabBarStyle,
            ),
            elevation: 20,
            titleSpacing: 20,
          ),
          body: TabBarView(children: children),
        ),
      );
}
