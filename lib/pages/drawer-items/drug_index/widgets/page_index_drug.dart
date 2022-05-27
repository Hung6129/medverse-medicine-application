import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../nav-items/home/bloc/home_screen_bloc.dart';
import '/widgets/indicators.dart';
import '/utils/data_dao.dart';
import '/models/drug_model.dart';

class PageIndexDrug extends StatefulWidget {
  final String letterIndex;
  const PageIndexDrug({Key key, this.letterIndex}) : super(key: key);

  @override
  State<PageIndexDrug> createState() => _DrugBState();
}

class _DrugBState extends State<PageIndexDrug> {
  /// List alphabelt
  bool isLoading = false;
  int count = 0;
  List _listA;

  /// Method call all data from SQLite
  Future<List<DrugModel>> getAllDrugsLetter(int count) async {
    if (count < 20) {
      _listA = await DataDao().getPageIndex(
        count,
        widget.letterIndex,
      );
    } else {
      var _newListA = await DataDao().getPageIndex(count, widget.letterIndex);
      _listA.addAll(_newListA);
    }
    return _listA;
  }

  /// Loading new data when scrolling down
  Future _loadData() async {
    // perform fetching data delay
    await new Future.delayed(
      new Duration(seconds: 2),
    );

    setState(() {
      count = count + 20;
      getAllDrugsLetter(count);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<DrugModel>>(
      /// Check status if user input available keyword then show the result. If not, show all data
      future: getAllDrugsLetter(count),
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
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        print("tapped");
                        print(word.product_id);
                        print(word.name);
                        BlocProvider.of<HomeScreenBloc>(context)
                          ..add(
                            OnTapEvent(
                              context: context,
                              navigateData: list[i].product_id.toString(),
                            ),
                          );
                      },
                      child: Container(
                        //color: Colors.pink[200],
                        child: Padding(
                          padding: EdgeInsets.only(
                            left: 5,
                            right: 5,
                          ),
                          child: new Text(word.name + ' - ' + word.labeller),
                        ),
                      ),
                    ),
                    Divider(),
                  ],
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