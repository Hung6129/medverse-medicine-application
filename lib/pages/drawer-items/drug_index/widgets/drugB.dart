import 'package:flutter/material.dart';
import 'package:medverse_mobile_app/widgets/indicators.dart';
import '/utils/data_dao.dart';
import '/models/drug_model.dart';

class DrugB extends StatefulWidget {
  const DrugB({Key key}) : super(key: key);

  @override
  State<DrugB> createState() => _DrugBState();
}

class _DrugBState extends State<DrugB> {
  bool isLoading = false;
  int count = 0;
  List _listB;

  /// Method call all data from SQLite
  Future<List<DrugModel>> getAllDrugsB(int count) async {
    if (count < 20) {
      _listB = await DataDao().getDrugB(count);
    } else {
      var _newListB = await DataDao().getDrugB(count);
      _listB.addAll(_newListB);
    }
    return _listB;
  }

  /// Loading new data when scrolling down
  Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(
      new Duration(seconds: 2),
    );

    setState(() {
      count = count + 20;
      getAllDrugsB(count);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<DrugModel>>(
        /// Check status if user input available keyword then show the result. If not, show all data
        future: getAllDrugsB(count),
        builder: (context, snapshot) {
          /// Check if already have data
          if (snapshot.hasData) {
            var list = snapshot.data;

            /// Show data
            return NotificationListener<ScrollNotification>(
              onNotification:  (ScrollNotification scrollInfo) {
                if(!isLoading && scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent) {
                  _loadData();

                  /// Start loading data
                  setState(() {
                    isLoading = true;
                  });
                }
                return true;
              },

              child: ListView.builder(
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
              ),
            );

            /// Show message if it have no data
          } else {
            return circularProgress(context);
          }
        },
      ),
    );
  }
}
