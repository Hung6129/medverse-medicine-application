import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/models/drug_model.dart';
import 'package:medverse_mobile_app/widgets/icon_badge.dart';
import '../../../../utils/data_dao.dart';
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

  /// Set search word
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

  /// Method search keyword in SQLite
  Future<List<DrugModel>> search(String search) async {
    var list = await DataDao().searchDrugs(search);
    return list;
  }

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
          children: List.generate(
            alpha.length,
            (index) => PageIndexDrug(
              letterIndex: alpha[index],
            ),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: isSearching
            ? TextField(
                decoration: InputDecoration(
                  hintText: "Mời bạn nhập từ khóa",
                  hintStyle: MobileTextTheme().introContentFont,
                ),
                onChanged: (searchResult) {
                  setState(() {
                    searchWord = searchResult;
                  });
                },
                style: MobileTextTheme().kBodyTextStyle,
              )
            : Text(
                'Danh sách chỉ mục thuốc',
                style: MobileTextTheme().appBarStyle,
              ),
        centerTitle: true,
        actions: [
          isSearching
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = false;
                    });
                  },
                  icon: Icon(Icons.cancel))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearching = true;
                    });
                  },
                  icon: Icon(Icons.search),
                ),
        ],
      ),
      body: isSearching
          ? FutureBuilder<List<DrugModel>>(
              /// Check status if user input available keyword then show the result. If not, show all data
              future: search(searchWord),
              builder: (context, snapshot) {
                /// Check if already have data
                if (snapshot.hasData) {
                  var list = snapshot.data;

                  /// Show data
                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (context, i) {
                      var word = list[i];
                      return GestureDetector(
                        onTap: () {
                          /*Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(list[i])));*/
                        },
                        child: SizedBox(
                          height: 100,
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SizedBox(
                                  width: 20,
                                ),
                                Flexible(
                                  child: Text(
                                    word.name,
                                    style: MobileTextTheme()
                                        .healthProfileNoDataTextStyle,
                                  ),
                                ),
                                SizedBox(
                                  width: 50,
                                ),
                                Flexible(
                                  child: Text(
                                    word.labeller,
                                    textAlign: TextAlign.start,
                                    style: MobileTextTheme().tabBarStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );

                  /// Show message if it have no data
                } else {
                  return Center(
                    child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                  "assets/icons/NoData.png",
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 10, right: 10),
                          child: Text(
                            "Không tìm thấy dữ liệu",
                            style: TextStyle(
                              color: Palette.red,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        SizedBox(height: 100),
                      ],
                    ),
                  );
                }
              },
            )
          : SingleChildScrollView(
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
