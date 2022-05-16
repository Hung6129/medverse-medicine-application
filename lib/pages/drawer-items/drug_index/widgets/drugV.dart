import 'package:flutter/material.dart';

import '../../../../models/drug_model.dart';
import '../../../../utils/data_dao.dart';
import '../../../../widgets/indicators.dart';

class DrugV extends StatefulWidget {
  const DrugV({Key key}) : super(key: key);

  @override
  State<DrugV> createState() => _DrugVState();
}

class _DrugVState extends State<DrugV> {
  bool isLoading = false;
  int count = 0;
  List _listV;

  /// Method call all data from SQLite
  Future<List<DrugModel>> getAllDrugsV(int count) async {
    if (count < 20) {
      _listV = await DataDao().getDrugV(count);
    } else {
      var _newListV = await DataDao().getDrugV(count);
      _listV.addAll(_newListV);
    }
    return _listV;
  }

  /// Loading new data when scrolling down
  Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(
      new Duration(seconds: 2),
    );

    setState(() {
      count = count + 20;
      getAllDrugsV(count);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DrugModel>>(
      /// Check status if user input available keyword then show the result. If not, show all data
      future: getAllDrugsV(count),
      builder: (context, snapshot) {
        /// Check if already have data
        if (snapshot.hasData) {
          var list = snapshot.data;

          /// Show data
          return NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              if (!isLoading &&
                  scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent) {
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
                          child: new Text(word.name + ' - ' + word.labeller),
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
    );
  }
}
