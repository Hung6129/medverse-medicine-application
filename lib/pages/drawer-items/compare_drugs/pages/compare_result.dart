// import 'package:flutter/material.dart';
// import 'package:medverse_mobile_app/widgets/app_text.dart';
// import '../../../../models/drug_bank_db/compare_drug_model.dart';
// import '../../../../services/service_data.dart';
// import '../../../../theme/palette.dart';
// import '../../../../utils/app_text_theme.dart';
// import '../../../../widgets/indicators.dart';

// class CompareResult extends StatefulWidget {
//   final String id1;
//   final String id2;
//   const CompareResult({Key key, this.id1, this.id2}) : super(key: key);

//   @override
//   State<CompareResult> createState() => _CompareResultState();
// }

// class _CompareResultState extends State<CompareResult> {
//   /// Table
//   Widget _buildBox(
//     String title,
//     double height,
//   ) {
//     return Container(
//       decoration: BoxDecoration(
//         color: Colors.white,
//         border: Border(
//             top: BorderSide(color: Colors.black),
//             left: BorderSide(color: Colors.black)),
//       ),
//       height: height,
//       child: Text(
//         title,
//         style: TextStyle(fontSize: 20, color: Colors.black),
//       ),
//     );
//   }

//   /// set list
//   List<CompareDrugModel> dataList;

//   /// get list
//   Future<List<CompareDrugModel>> _getAll() async {
//     print(dataList.length);
//     dataList =
//         await DrugCompareResult().getDrugByCompare(widget.id1, widget.id2);
//     return dataList;
//   }

//   @override
//   Widget build(BuildContext context) {
//     double maxHeight = MediaQuery.of(context).size.height;
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Palette.mainBlueTheme,
//         title: Text(
//           'Kết quả + ${widget.id1}',
//           style: MobileTextTheme().appBarStyle,
//         ),
//         centerTitle: true,
//       ),
//       body: FutureBuilder<List<CompareDrugModel>>(
//         future: _getAll(),
//         builder: (ctx, snapshot) {
//           if (snapshot.hasData) {
//             return SingleChildScrollView(
//               child: ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (ctx, index) {
//                   return AppText(
//                     text: snapshot.data[index].product_name,
//                   );
//                   //     Column(
//                   //       children: [
//                   //         SizedBox(
//                   //           height: Dimensions.height10,
//                   //         ),
//                   //         Table(
//                   //           columnWidths: {
//                   //             0: FlexColumnWidth(),
//                   //             1: FlexColumnWidth(0.01),
//                   //             2: FlexColumnWidth(),
//                   //           },
//                   //           children: [
//                   //             TableRow(
//                   //               children: [
//                   //                 _buildBox(snapshot.data[index].product_name, 50),
//                   //                 SizedBox(),
//                   //                 _buildBox(snapshot.data[index].product_name, 50),
//                   //               ],
//                   //             ),
//                   //             TableRow(
//                   //               children: [
//                   //                 _buildBox(snapshot.data[index].drug_description,
//                   //                     maxHeight),
//                   //                 SizedBox(),
//                   //                 _buildBox(snapshot.data[index].drug_description,
//                   //                     maxHeight)
//                   //               ],
//                   //             ),
//                   //           ],
//                   //         ),
//                   //       ],
//                   //     );
//                   //   },
//                   // ),
//                 },
//               ),
//             );
//           } else {
//             return circularProgress(context);
//           }
//         },
//       ),
//     );
//   }
// }
import 'package:medverse_mobile_app/models/drug_bank_db/compare_drug_model.dart';
import '/widgets/indicators.dart';
import '../../../../services/service_data.dart';
import '/theme/palette.dart';
import '/widgets/app_text.dart';
import '/widgets/dimension.dart';
import 'package:flutter/material.dart';

class CompareResult extends StatefulWidget {
  final String query1;
  final String query2;

  const CompareResult({
    Key key,
    this.query1,
    this.query2,
  }) : super(key: key);

  @override
  State<CompareResult> createState() => _CompareResultState();
}

class _CompareResultState extends State<CompareResult> {
  /// set list
  List<CompareDrugModel> dataList;

  /// get list
  Future<List<CompareDrugModel>> _getAll() async {
    dataList = await DrugCompareResult().getDrugByCompare(
      widget.query1,
      widget.query2,
    );
    return dataList;
  }

  @override
  Widget build(BuildContext context) {
    /// Title
    Widget __title() {
      return Container(
        padding: EdgeInsets.all(Dimensions.height10),
        child: AppText(
            color: Palette.textNo,
            size: Dimensions.font18,
            fontWeight: FontWeight.normal,
            text: "Kết quả ${widget.query1} ${widget.query2} "),
      );
    }

    /// Queried list data
    Widget __listData() {
      return FutureBuilder<List<CompareDrugModel>>(
          future: _getAll(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: snapshot.data.length,
                itemBuilder: (context, index) => Container(
                  width: 200,
                  color: Palette.grey300,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppText(
                        text: snapshot.data[index].clearance,
                        color: Palette.textNo,
                        size: Dimensions.font16,
                        fontWeight: FontWeight.normal,
                      ),
                      AppText(
                        text: snapshot.data[index].drug_state,
                        color: Palette.textNo,
                        size: Dimensions.font14,
                        fontWeight: FontWeight.normal,
                      ),
                    ],
                  ),
                ),
              );
            }
            if (snapshot.hasError) {
              return AppText(
                text: "Có lỗi gì đó đã xảy ra",
              );
            } else {
              return circularProgress(context);
            }
          });
    }

    Widget _buildBoxTitle(String title, double height) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black)),
        ),
        height: height,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        ),
      );
    }

    Widget _buildBoxData(String title, double height) {
      return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border(
              top: BorderSide(color: Colors.black),
              left: BorderSide(color: Colors.black)),
        ),
        height: height,
        child: Center(
          child: Text(
            title,
            style: TextStyle(fontSize: 15, color: Colors.black),
          ),
        ),
      );
    }

    Widget __table() {
      return SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(children: [
          SizedBox(
            height: Dimensions.height10,
          ),
          Table(
            columnWidths: {
              0: FlexColumnWidth(),
              1: FlexColumnWidth(0.01),
              2: FlexColumnWidth(),
            },
            children: [
              TableRow(
                children: [
                  _buildBoxTitle("Heyy", 50),
                  _buildBoxTitle("Hello", 50),
                ],
              ),
              TableRow(
                children: [
                  _buildBoxTitle("Data1", 50),
                  _buildBoxTitle("Data2", 50)
                ],
              ),
              TableRow(
                children: [
                  _buildBoxData("Data1", 200),
                  _buildBoxData("Data2", 200)
                ],
              ),
              TableRow(
                children: [
                  _buildBoxData("Data1", 200),
                  _buildBoxData("Data2", 200)
                ],
              ),
              TableRow(
                children: [
                  _buildBoxData("Data1", 200),
                  _buildBoxData("Data2", 200)
                ],
              ),
            ],
          )
        ]),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'Tìm kiếm nâng cao',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [__title(), __listData(), __table()],
        ),
      ),
    );
  }
}
