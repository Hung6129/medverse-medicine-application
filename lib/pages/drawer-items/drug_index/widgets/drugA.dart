import 'package:flutter/material.dart';
import '/utils/data_dao.dart';
import '/models/drug_model.dart';
import '/theme/palette.dart';

class DrugA extends StatefulWidget {
  const DrugA({Key key}) : super(key: key);

  @override
  State<DrugA> createState() => _DrugBState();
}

class _DrugBState extends State<DrugA> {
  /// Method call all data from SQLite
  Future<List<DrugModel>> getAllDrugsA() async {
    var list = await DataDao().getDrugA();
    return list;
  }

  /// Method search keyword in SQLite
  Future<List<DrugModel>> search(String search) async {
    var list = await DataDao().searchIndexDrugs(search);
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DrugModel>>(
        /// Check status if user input available keyword then show the result. If not, show all data
        future: getAllDrugsA(),
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
}
