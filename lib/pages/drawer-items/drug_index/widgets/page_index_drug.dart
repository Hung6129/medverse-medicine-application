import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '/pages/nav-items/home/bloc/home_screen_bloc.dart';
import '/models/drug_model.dart';
import '/utils/data_dao.dart';
import '/widgets/indicators.dart';

class PageIndexDrug extends StatefulWidget {
  final String letterIndex;
  final String inputSearch;
  // bool isSearch;
  PageIndexDrug({
    Key key,
    this.letterIndex,
    // this.isSearch,
    this.inputSearch,
  }) : super(key: key);

  @override
  State<PageIndexDrug> createState() => _DrugBState();
}

class _DrugBState extends State<PageIndexDrug> {
  /// List alphabelt
  bool isLoading = false;
  int count = 0;
  List<DrugModel> _listA;

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

  /// Method call all data from SQLite
  Future<List<DrugModel>> getAllDrugsLetterBySearch(
      int count, String input) async {
    _listA = await DataDao().getPageIndex(
      count,
      widget.letterIndex,
    );
    List<DrugModel> result;
    result = _listA
        .where((element) =>
            element.name.contains(input) || element.labeller.contains(input))
        .toList();
    return result;
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
      future:
          //  widget.isSearch == false
          // ?
          getAllDrugsLetter(count),
      // : getAllDrugsLetterBySearch(count, widget.inputSearch),
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
                        BlocProvider.of<HomeScreenBloc>(context)
                          ..add(
                            OnTapEvent(
                              context: context,
                              navigateData: list[i].product_id.toString(),
                            ),
                          );
                      },
                      child: Container(
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
          return Container(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  circularProgress(context),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
