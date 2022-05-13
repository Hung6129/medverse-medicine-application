import 'package:flutter/material.dart';
import '/models/drug_model.dart';
import '/utils/data_dao.dart';
import '/utils/app_text_theme.dart';
import '/theme/palette.dart';

class DrugIndex extends StatefulWidget {
  const DrugIndex({Key key}) : super(key: key);

  @override
  State<DrugIndex> createState() => _MedicineDictionaryState();
}

class _MedicineDictionaryState extends State<DrugIndex> {
  bool isSearching = false;
  String searchWord = "";

  /// Method call all data from SQLite
  Future<List<DrugModel>> getAllDrugs() async {
    var list = await DataDao().getDrugs();
    return list;
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
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
                  'Danh sách thuốc',
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
        ),
        body: FutureBuilder<List<DrugModel>>(
          /// Check status if user input available keyword then show the result. If not, show all data
          future: getAllDrugs(),
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          //color: Colors.pink[200],
                          child: Padding(
                            padding: EdgeInsets.only(
                              left: 5,
                              right: 5,
                            ),
                            child: new Text(word.name),
                          ),
                        ),
                        Divider(),
                      ],
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
        ),
      );
}
