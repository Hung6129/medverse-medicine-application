import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/models/drug_bank_db/product_model.dart';
import 'package:medverse_mobile_app/pages/drawer-items/test_image_from_sqlite/widgets/search_dao.dart';
import '/utils/app_text_theme.dart';
import '/theme/palette.dart';
import '/models/dictionary_model.dart';
import '/pages/drawer-items/medicine_dictionary/widgets/WordsDao.dart';

class LoadDrug extends StatefulWidget {
  const LoadDrug({Key key}) : super(key: key);

  @override
  State<LoadDrug> createState() => _MedicineDictionaryState();
}

class _MedicineDictionaryState extends State<LoadDrug> {
  bool isSearching = false;
  String searchWord = "";

  /// Method call all data from SQLite
  Future<List<ProductModel>> getAllWord() async {
    var list = await SearchDao().allWords();
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
        'Test load hình thuốc',
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
    body: FutureBuilder<List<ProductModel>>(
      /// Check status if user input available keyword then show the result. If not, show all data
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
                            word.drugDescription,
                            style: MobileTextTheme().healthProfileNoDataTextStyle,
                          ),
                        ),
                        SizedBox(
                          width: 50,
                        ),
                        Flexible(
                          child: Text(
                            word.drugName,
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
