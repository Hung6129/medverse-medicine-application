/*
import '/views/drawer-items/compare_drugs/pages/compare_drug_screen.dart';
*/
import '/widgets/app_text_title.dart';
import '/widgets/dimension.dart';
import '/widgets/typeahead_search_bar.dart';
/*import '../../../drawer-items/check_interaction/pages/interaction_checker.dart';
import '../../../drawer-items/pill_identifier/pages/pill_identifier_screen.dart';*/
import '/widgets/navigation_drawer_widget.dart';
import '/theme/palette.dart';
import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({
    Key key,
  }) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  var imagesIcon = {
    "compare-drugs.png": "So sánh",
    "drugs-az.png": "Tìm kiếm",
    "fda-alerts.png": "FDAcảnh báo",
    "interactions-checker.png": "Tương kị",
    "pill-identifier.png": "Nhận dạng",
    "side-effects.png": "Phản ứng phụ",
  };
  String imagesFav = "16571-0402-50_NLMIMAGE10_903AC856.jpg";

  int selectedIndex = -1;
  int selectedIndexDrugs = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavigationDrawerWidget(),
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Tìm kiếm thuốc',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: Dimensions.height10,
            ),

            // Search bar by drug name
            Container(
              padding: EdgeInsets.only(
                  left: Dimensions.width10, right: Dimensions.width10),
              child: TypeAheadSearchBar(),
            ),

            SizedBox(
              height: Dimensions.height10,
            ),

            // Grid view of funcition
            Container(
              height: 300,
              width: double.maxFinite,
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemCount: imagesIcon.length,
                itemBuilder: (BuildContext ctx, int index) {
                  return Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          switch (index) {
                            case 0:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      null /*const Identifier()*/,
                                ),
                              );
                              break;
                            case 1:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      null /*const CompareDrug()*/,
                                ),
                              );
                              break;
                            case 2:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      null /*const InteractionChecker()*/,
                                ),
                              );
                              break;
                            case 3:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      null /*const Identifier()*/,
                                ),
                              );
                              break;
                            case 4:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      null /*const Identifier()*/,
                                ),
                              );
                              break;
                            case 5:
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) =>
                                      null /*const Identifier()*/,
                                ),
                              );
                              break;
                          }
                        },
                        child: Container(
                          width: 60,
                          height: 60,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            image: DecorationImage(
                              image: AssetImage(
                                "assets/images/" +
                                    imagesIcon.keys.elementAt(index),
                              ),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: AppTextTitle(
                          text: imagesIcon.values.elementAt(index),
                          fontWeight: FontWeight.w400,
                          color: Palette.textNo,
                          size: 18,
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
