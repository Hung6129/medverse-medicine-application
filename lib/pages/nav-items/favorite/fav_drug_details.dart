// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';

// import '/theme/palette.dart';
// import '/widgets/app_text_title.dart';
// import '/widgets/dimension.dart';
// import '/widgets/rich_text_cus.dart';

// class FavDrugDetail extends StatelessWidget {
//   final FavDrugModel drugData;

//   // var _box = Hive.box<FavDrugModel>("fav-list");

//   FavDrugDetail({
//     Key key,
//     this.drugData,
//   }) : super(key: key);

// // Test images
//   String imagesFav = "assets/images/drugs_pill/300.jpg";

//   // // Icon checker setup
//   // Widget getIcons(String id) {
//   //   if (_box.containsKey(id)) {
//   //     return Icon(CupertinoIcons.heart_fill, color: Colors.red);
//   //   } else {
//   //     return Icon(CupertinoIcons.heart);
//   //   }
//   // }

//   // // Show Dialog
//   // showAlertDialog(BuildContext context, String id) {
//   //   // set up the buttons
//   //   Widget cancelButton = TextButton(
//   //     child: Text("Huỷ"),
//   //     onPressed: () {},
//   //   );
//   //   Widget continueButton = TextButton(
//   //     child: Text("Bỏ lưu"),
//   //     onPressed: () {
//   //       _box.delete(id);
//   //     },
//   //   );

//   //   // set up the AlertDialog
//   //   AlertDialog alert = AlertDialog(
//   //     title: Text(""),
//   //     content: Text("Bạn có chắc muốn bỏ lưu thuốc này ?"),
//   //     actions: [
//   //       cancelButton,
//   //       continueButton,
//   //     ],
//   //   );

//   //   // show the dialog
//   //   showDialog(
//   //     context: context,
//   //     builder: (BuildContext context) {
//   //       return alert;
//   //     },
//   //   );
//   // }

//   // // Heart on tap evnent
//   // onFavoriteTap(String id) {
//   //   if (_box.containsKey(id)) {
//   //     showAlertDialog(this.context, id);
//   //   } else {
//   //     var info = drugData;
//   //     FavDrugModel data = FavDrugModel(
//   //       productName: info.productName,
//   //       approved: info.approved,
//   //       country: info.country,
//   //       drugbankID: info.drugbankID,
//   //       generic: info.generic,
//   //       otc: info.otc,
//   //       productCode: info.productCode,
//   //       productID: info.productID,
//   //       productLabeller: info.productLabeller,
//   //       productRoute: info.productRoute,
//   //       productStrength: info.productStrength,
//   //       productdosage: info.productdosage,
//   //       productImage: info.productImage,
//   //       drugClearance: info.drugClearance,
//   //       drugDescription: info.drugDescription,
//   //       drugElimination: info.drugElimination,
//   //       drugHalflife: info.drugHalflife,
//   //       drugIndication: info.drugIndication,
//   //       drugMechan: info.drugMechan,
//   //       drugMetabolism: info.drugMetabolism,
//   //       drugName: info.drugName,
//   //       drugPharmaco: info.drugPharmaco,
//   //       drugState: info.drugState,
//   //       drugToxicity: info.drugToxicity,
//   //     );
//   //     _box.put(info.productID, data);
//   //     Fluttertoast.showToast(
//   //       msg: 'Lưu thành công',
//   //       backgroundColor: Palette.activeButton,
//   //     );
//   //   }
//   // }

//   @override
//   Widget build(BuildContext context) {
//     var info = drugData;
//     return Scaffold(
//       body: CustomScrollView(
//         slivers: [
//           SliverAppBar(
//             toolbarHeight: Dimensions.height60,
//             // title: Icon(CupertinoIcons.arrow_left_circle_fill),
//             bottom: PreferredSize(
//               preferredSize: Size.fromHeight(20),
//               child: Container(
//                 decoration: BoxDecoration(
//                   color: Palette.whiteText,
//                   borderRadius: BorderRadius.only(
//                     topLeft: Radius.circular(Dimensions.radius20),
//                     topRight: Radius.circular(Dimensions.radius20),
//                   ),
//                 ),
//                 padding: EdgeInsets.only(
//                   left: Dimensions.height10,
//                   right: Dimensions.height10,
//                 ),
//                 child: Center(
//                   child: AppTextTitle(
//                     text: info.productName,
//                     color: Palette.mainBlueTheme,
//                     size: Dimensions.font24,
//                     fontWeight: FontWeight.w500,
//                   ),
//                 ),
//                 width: double.maxFinite,
//               ),
//             ),
//             pinned: true,
//             backgroundColor: Palette.mainBlueTheme,
//             expandedHeight: Dimensions.imagesViewHeight,
//             flexibleSpace: FlexibleSpaceBar(
//               background: Image.asset(
//                 imagesFav,
//                 fit: BoxFit.cover,
//                 width: double.maxFinite,
//               ),
//             ),
//           ),
//           SliverToBoxAdapter(
//               child: Container(
//             padding: EdgeInsets.only(
//               left: Dimensions.width10,
//               right: Dimensions.width10,
//               top: Dimensions.height10,
//             ),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 // Product
//                 RichTextCus(
//                     text1: "Hãng đóng gói:",
//                     text2: info.productLabeller ?? "bruh"),
//                 RichTextCus(text1: "Đường hấp thụ:", text2: info.productRoute),
//                 RichTextCus(text1: "Liều lượng:", text2: info.productdosage),
//                 RichTextCus(text1: "Độ mạnh:", text2: info.productStrength),
//                 RichTextCus(text1: "Xuất xứ:", text2: info.country),
//                 RichTextCus(text1: "Tên chất thuốc:", text2: info.productCode),
//                 RichTextCus(text1: "Tên chất thuốc:", text2: info.productRoute),
//                 RichTextCus(text1: "Tên chất thuốc:", text2: info.approved),
//                 RichTextCus(text1: "Tên chất thuốc:", text2: info.country),
//                 Divider(
//                   endIndent: Dimensions.width10,
//                   indent: Dimensions.width10,
//                   thickness: 3,
//                 ),
//                 // Drug
//                 RichTextCus(text1: "Công dụng:", text2: info.drugClearance),
//                 RichTextCus(text1: "Trạng thái:", text2: info.drugDescription),
//                 RichTextCus(text1: "Chỉ định:", text2: info.drugElimination),
//                 RichTextCus(text1: "Dược lực:", text2: info.drugHalflife),
//                 RichTextCus(text1: "Cơ chế:", text2: info.drugIndication),
//                 RichTextCus(text1: "Độc tính:", text2: info.drugMechan),
//                 RichTextCus(text1: "Chuyển hoá:", text2: info.drugMetabolism),
//                 RichTextCus(text1: "Thời gian bán huỷ:", text2: info.drugName),
//                 RichTextCus(text1: "Đào thải:", text2: info.drugPharmaco),
//                 RichTextCus(text1: "Thanh thải:", text2: info.drugState),
//                 RichTextCus(text1: "Thanh thải:", text2: info.drugToxicity),
//               ],
//             ),
//           )),
//         ],
//       ),
//       // bottomNavigationBar: BottomAppBar(
//       //   child: Container(
//       //     decoration: BoxDecoration(
//       //       border: Border(
//       //         top: BorderSide(
//       //           width: 0.5,
//       //           color: Palette.textNo.withOpacity(0.3),
//       //         ),
//       //       ),
//       //     ),
//       //     child: Row(
//       //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       //       children: [
//       //         ValueListenableBuilder(
//       //           valueListenable: _box.listenable(),
//       //           builder: (context, Box<FavDrugModel> box, _) {
//       //             return IconButton(
//       //               onPressed: () => onFavoriteTap(info.productID),
//       //               icon: getIcons(info.productID),
//       //             );
//       //           },
//       //         ),
//       //         IconButton(
//       //           onPressed: () {
//       //             print("tapped x2");
//       //           },
//       //           icon: Icon(
//       //             CupertinoIcons.share,
//       //             size: Dimensions.icon28,
//       //             color: Palette.mainBlueTheme,
//       //           ),
//       //         ),
//       //         IconButton(
//       //           onPressed: () {
//       //             print("tapped x3");
//       //           },
//       //           icon: Icon(
//       //             CupertinoIcons.exclamationmark_bubble_fill,
//       //             size: Dimensions.icon28,
//       //             color: Palette.starRating,
//       //           ),
//       //         ),
//       //       ],
//       //     ),
//       //   ),
//       // ),
//     );
//   }
// }
