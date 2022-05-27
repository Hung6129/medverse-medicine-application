import 'package:flutter/material.dart';
import '/utils/app_text_theme.dart';
import '/theme/palette.dart';
import '/models/dictionary_model.dart';
import '/utils/data_dao.dart';

class MedicineDictionary extends StatefulWidget {
  const MedicineDictionary({Key key}) : super(key: key);

  @override
  State<MedicineDictionary> createState() => _MedicineDictionaryState();
}

class _MedicineDictionaryState extends State<MedicineDictionary> {
  bool isSearching = false;
  String searchWord = "";

  /// Method call all data from SQLite
  Future<List<Dictionary>> getAllWord() async {
    var list = await DataDao().allWords();
    return list;
  }

  /// Method search keyword in SQLite
  Future<List<Dictionary>> search(String search) async {
    var list = await DataDao().searchWord(search);
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
                  'Từ điển y học',
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
        body: FutureBuilder<List<Dictionary>>(
          /// Check status if user input available keyword then show the result. If not, show all data
          future: isSearching ? search(searchWord) : getAllWord(),
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
                                word.eng,
                                style: MobileTextTheme().healthProfileNoDataTextStyle,
                              ),
                            ),
                            SizedBox(
                              width: 50,
                            ),
                            Flexible(
                              child: Text(
                                word.tur,
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
        ),
      );
}
