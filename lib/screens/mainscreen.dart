import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/theme/palette.dart';
import 'package:medverse_mobile_app/widgets/dimension.dart';
import '/pages/nav-items/favorite/favorite_drugs_list_nav.dart';
import '/widgets/navigation_drawer_widget.dart';
import '/pages/nav-items/notification/pages/notification.dart';
import '/pages/nav-items/home/pages/home_screen.dart';
import '/pages/nav-items/feeds/pages/feeds.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _page = 0;

  List pages = [
    {
      'title': 'Trang chủ',
      'icon': CupertinoIcons.house_alt_fill,
      'page': HomeScreen(),
      'index': 0,
    },
    {
      'title': 'Đã lưu',
      'icon': CupertinoIcons.square_favorites_alt_fill,
      'page': FavoriteDrugsListScreenNav(),
      'index': 1,
    },
    {
      'title': 'Thông báo',
      'icon': CupertinoIcons.bell_solid,
      'page': Activities(),
      'index': 2,
    },
    {
      'title': 'Mạng xã hội',
      'icon': CupertinoIcons.news_solid,
      'page': Timeline(),
      'index': 3,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      body: PageTransitionSwitcher(
        transitionBuilder: (
          Widget child,
          Animation<double> animation,
          Animation<double> secondaryAnimation,
        ) {
          return FadeThroughTransition(
            animation: animation,
            secondaryAnimation: secondaryAnimation,
            child: child,
          );
        },
        child: pages[_page]['page'],
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(width: 5),
            for (Map item in pages)
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: IconButton(
                  icon: Icon(
                    item['icon'],
                    color: item['index'] != _page
                        ? Palette.mainBlueTheme.withOpacity(0.2)
                        : Palette.mainBlueTheme,
                    size: Dimensions.icon24,
                  ),
                  onPressed: () {
                    navigationTapped(item['index']);
                  },
                ),
              ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }

  void navigationTapped(int page) {
    setState(
      () {
        _page = page;
      },
    );
  }
}
