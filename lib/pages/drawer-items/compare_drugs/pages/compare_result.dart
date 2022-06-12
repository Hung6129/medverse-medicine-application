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
    Widget __table() {
      return FutureBuilder<List<CompareDrugModel>>(
          future: _getAll(),
          builder: (ctx, snapshot) {
            var data = snapshot.data;
            if (snapshot.hasData) {
              // show table
            }
            if (snapshot.hasError || snapshot.data == null) {
              return AppText(
                text: "Có lỗi gì đó đã xảy ra",
              );
            } else {
              return circularProgress(context);
            }
          });
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Palette.mainBlueTheme,
        title: Text(
          'So sánh',
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: __table(),
      ),
    );
  }
}
