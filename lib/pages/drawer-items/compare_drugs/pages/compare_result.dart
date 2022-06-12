// import 'dart:convert';

// import 'package:medverse_mobile_app/models/drug_bank_db/compare_drug_model.dart';
// import '../../../../utils/constants.dart';
// import '/widgets/indicators.dart';
// import '/theme/palette.dart';
// import '/widgets/app_text.dart';
// import 'package:flutter/material.dart';

// class CompareResult extends StatefulWidget {
//   final String query1;

//   const CompareResult({
//     Key key,
//     this.query1,
//   }) : super(key: key);

//   @override
//   State<CompareResult> createState() => _CompareResultState();
// }

// class _CompareResultState extends State<CompareResult> {
//   /// set list
//   List<CompareDrugModel> dataList;

//   /// get list
//   Future<List<CompareDrugModel>> fetchDetailData() async {
//     final response = await http.get(Uri.parse(
//         Constants.BASE_URL + Constants.DRUG_ID_SEARCH + widget.query1));
//     if (response.statusCode == 200) {
//       return CompareDrugModel.fromJson(jsonDecode(response.body));
//     } else {
//       throw Exception('Failed to load data');
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     Widget __table() {
//       return FutureBuilder<List<CompareDrugModel>>(
//         future: _getAll(),
//         builder: (ctx, snapshot) {
//           var data = snapshot.data;
//           if (snapshot.hasData) {
//             // show table

//           }
//           if (snapshot.hasError || snapshot.data == null) {
//             return AppText(
//               text: "Có lỗi gì đó đã xảy ra",
//             );
//           } else {
//             return circularProgress(context);
//           }
//         },
//       );
//     }

//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         backgroundColor: Palette.mainBlueTheme,
//         title: Text(
//           'So sánh',
//           style: TextStyle(fontWeight: FontWeight.w900),
//         ),
//         centerTitle: true,
//       ),
//       body: SingleChildScrollView(
//         child: __table(),
//       ),
//     );
//   }
// }
