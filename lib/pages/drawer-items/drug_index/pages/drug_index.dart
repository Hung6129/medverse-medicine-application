import 'package:flutter/material.dart';

import '../widgets/page_index_drug.dart';
import '/theme/palette.dart';
import '/utils/app_text_theme.dart';

class DrugIndex extends StatefulWidget {
  const DrugIndex({Key key}) : super(key: key);

  @override
  State<DrugIndex> createState() => _MedicineDictionaryState();
}

class _MedicineDictionaryState extends State<DrugIndex> {
  bool isSearching = false;
  String searchWord = "";

  /// List alphabelt
  List alpha = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
    'I',
    'J',
    'K',
    'L',
    'M',
    'N',
    'O',
    'P',
    'Q',
    'R',
    'S',
    'T',
    'U',
    'V',
    'W',
    'X',
    'Y',
    'Z'
  ];
  @override
  Widget build(BuildContext context) {
    /// Tab bar
    Widget __tabBar() {
      return Container(
        child: TabBar(
          isScrollable: true,
          labelColor: Colors.green,
          unselectedLabelColor: Colors.black,
          labelPadding: EdgeInsets.symmetric(horizontal: 15),
          tabs: List.generate(
            alpha.length,
            (index) => Tab(
              text: alpha[index],
            ),
          ),
        ),
      );
    }

    /// Tab bar view
    Widget __tabBarView() {
      return Container(
        padding: EdgeInsets.only(top: 10),
        height: MediaQuery.of(context).size.height, //height of TabBarView
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(color: Colors.grey, width: 0.5),
          ),
        ),
        child: TabBarView(
          children: List.generate(alpha.length, (index) {
            // if (isSearching == true) {
            //   return PageIndexDrug(
            //     isSearch: true,
            //     inputSearch: searchWord,
            //     letterIndex: alpha[index],
            //   );
            // } else {
            return PageIndexDrug(
              // isSearch: false,
              letterIndex: alpha[index],
            );
            // }
          }),
        ),
      );
    }

    /// App bar
    Widget __appBar() {
      return AppBar(
        centerTitle: true,
        backgroundColor: Palette.mainBlueTheme,
        title: isSearching
            ? TextField(
                decoration: InputDecoration(
                  hintText: "Mời bạn nhập từ khóa",
                  hintStyle: MobileTextTheme().introContentFont,
                ),
                onChanged: (searchResult) {
                  setState(
                    () {
                      searchWord = searchResult;
                    },
                  );
                },
                style: MobileTextTheme().kBodyTextStyle,
              )
            : Text(
                'Danh sách mục thuốc',
                style: MobileTextTheme().appBarStyle,
              ),
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                  },
                  icon: Icon(Icons.cancel),
                )
              : IconButton(
                  onPressed: () {
                    setState(
                      () {
                        isSearching = true;
                      },
                    );
                  },
                  icon: Icon(Icons.search),
                ),
        ],
      );
    }

    return Scaffold(
      appBar: __appBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(height: 1.0),
            DefaultTabController(
              length: 26, // length of tabs
              initialIndex: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  __tabBar(),
                  SizedBox(height: 20),
                  __tabBarView(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
