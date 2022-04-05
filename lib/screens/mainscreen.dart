import 'package:animations/animations.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icons/flutter_icons.dart';
import '/pages/nav-items/favorite/favorite_drugs_list_nav.dart';
import '/pages/nav-items/search/pages/search_screen.dart';
import '/controller/cubit/drugs_data/drugs_data_cubit.dart';
import '/widgets/navigation_drawer_widget.dart';
import '/components/fab_container.dart';
import '/pages/notification.dart';
import '/pages/nav-items/home/pages/home_screen.dart';
import '/pages/search.dart';
import '/pages/feeds.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  int _page = 0;

  List pages = [
    {
      'title': 'Trang chủ',
      'icon': Feather.home,
      'page': BlocProvider(
        create: (BuildContext context) => DrugsDataCubit(),
        child: HomeScreen(),
      ),
      'index': 0,
    },
    {
      'title': 'Tìm kiếm người dùng',
      'icon': Icons.people,
      'page': Search(),
      'index': 1,
    },
    {
      'title': 'Tìm kiếm thuốc',
      'icon': Icons.search,
      'page': SearchScreen(),
      'index': 2,
    },
    {
      'title': 'Tạo bài viết',
      'icon': Feather.plus_circle,
      'page': Text('nes'),
      'index': 3,
    },
    {
      'title': 'Đã lưu',
      'icon': Icons.bookmark,
      'page': FavoriteDrugsListScreenNav(),
      'index': 4,
    },
    {
      'title': 'Thông báo',
      'icon': CupertinoIcons.bell_solid,
      'page': Activities(),
      'index': 5,
    },
    {
      'title': 'Mạng xã hội',
      'icon': Icons.podcasts,
      'page': Timeline(),
      'index': 6,
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
              item['index'] == 3
                  ? buildFab()
                  : Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: IconButton(
                        icon: Icon(
                          item['icon'],
                          color: item['index'] != _page
                              ? Colors.grey
                              : Theme.of(context).accentColor,
                          size: 20.0,
                        ),
                        onPressed: () => navigationTapped(item['index']),
                      ),
                    ),
            SizedBox(width: 5),
          ],
        ),
      ),
    );
  }

  buildFab() {
    return Container(
      height: 45.0,
      width: 45.0,
      // ignore: missing_required_param
      child: FabContainer(
        icon: Feather.plus,
        mini: true,
      ),
    );
  }

  void navigationTapped(int page) {
    setState(() {
      _page = page;
    });
  }
}
